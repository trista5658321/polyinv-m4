import sys, pathlib
d_root = pathlib.Path(__file__).parent.absolute().parent.parent
sys.path.append(str(d_root))

# from utility import printIn
def printIn(asm):
    print("  " + asm)

def file_head():
    print("#include <stdint.h>")
    print("#include \"cmsis.h\"")
    print("#include <stdio.h>")
    print("")

def reduction_meta(q, qR2inv):
    print("#define q %d" % (q))
    print("#define qR2inv %d // round(2^32/q)" % (qR2inv))
    print("#define _2P15 (1 << 15)")
    print("")
    print("#if 1")
    print("// result range: +- %d (note: 3 loads for _2P15 and the longer qR2inv)" % (q//2))
    print("static inline int barrett_16x2i(int X) {")
    print("  int32_t QL = __SMLAWB(qR2inv,X,_2P15);")
    print("  int32_t QH = __SMLAWT(qR2inv,X,_2P15);")
    print("  int32_t SL = __SMULBT(q,QL);")
    print("  int32_t SH = __SMULBT(q,QH);")
    print("  return(__SSUB16(X,__PKHBT(SL,SH,16)));")
    print("}")
    print("")
    print("#else ")
    print("#define barrett_16x2i(A) (A)")
    print("#endif")
    print("")

def jumpdivstep_common(n):
    print("extern int jump%ddivsteps(int minusdelta, int *M, int *f, int *g);" % (n//2))
    print("void __gf_polymul_%dx%d_2x2_x2p2 (int *V, int *M_16, int *M_32, int *fh, int *gh, int *M);" % (n//2, n//2))

def head_full(n, q, qR2inv):
    file_head()
    jumpdivstep_common(n)
    print("void __gf_polymul_%dx%d_2x2_x_2x2 (int * M, int * M1_16, int * M1_32, int * M2_16, int * M2_32);" % (n//2, n//2))
    print("int jump%ddivsteps(int minusdelta, int *M, int *f, int *g);" % (n))
    print("")
    reduction_meta(q, qR2inv)

def head_custom(n, q, qR2inv, custom):
    file_head()
    jumpdivstep_common(n)
    custom()
    print("")
    reduction_meta(q, qR2inv)

def gen_main_common(n, v_spacing_16, v_spacing_32, r_spacing_16, r_spacing_32, s_spacing_16, s_spacing_32, postfix = ""):
    print("int jump%ddivsteps%s(int minusdelta, int *M, int *f, int *g){" % (n, postfix))
    printIn("int M1[%d], M2[%d], fg[%d];" % (n//2*3, n//2*3, n))
    printIn("int M1_16[%d]={0}, M1_32[%d];" % (n*4//2, n*4))
    printIn("int M2_16[%d]={0}, M2_32[%d];" % (n*4//2, n*4))
    print("")
    printIn("minusdelta = jump%ddivsteps(minusdelta, M1, f, g);" % (n//2))
    print("")
    #   // step: 512/2, 256/2
    M_spacing = n//4
    M_u = M_spacing*2
    M_v = M_spacing*3
    M_r = M_spacing*4
    M_s = M_spacing*5
    printIn("ntt%d_16bit(M1_16, M1+%d); // u1" % (n, M_u))
    printIn("ntt%d_16bit(M1_16+%d, M1+%d); // v1" % (n, v_spacing_16, M_v))
    printIn("ntt%d_16bit(M1_16+%d, M1+%d); // r1" % (n, r_spacing_16, M_r))
    printIn("ntt%d_16bit(M1_16+%d, M1+%d); // s1" % (n, s_spacing_16, M_s))
    print("")
    #   // step: 512, 256/2
    printIn("ntt%d_32bit(M1_32, M1+%d); // u1" % (n, M_u))
    printIn("ntt%d_32bit(M1_32+%d, M1+%d); // v1" % (n, v_spacing_32, M_v))
    printIn("ntt%d_32bit(M1_32+%d, M1+%d); // r1" % (n, r_spacing_32, M_r))
    printIn("ntt%d_32bit(M1_32+%d, M1+%d); // s1" % (n, s_spacing_32, M_s))
    print("")
    printIn("__gf_polymul_%dx%d_2x2_x2p2(fg, M1_16, M1_32, f+%d, g+%d, M1);" % (n//2, n//2, n//4, n//4))
    print("")
    printIn("minusdelta = jump%ddivsteps(minusdelta, M2, fg, fg+%d);" % (n//2, n//2))
    print("")
    printIn("ntt%d_16bit(M2_16, M2+%d); // u2" % (n, M_u))
    printIn("ntt%d_16bit(M2_16+%d, M2+%d); // v2" % (n, v_spacing_16, M_v))
    printIn("ntt%d_16bit(M2_16+%d, M2+%d); // r2" % (n, r_spacing_16, M_r))
    printIn("ntt%d_16bit(M2_16+%d, M2+%d); // s2" % (n, s_spacing_16, M_s))
    print("")
    printIn("ntt%d_32bit(M2_32, M2+%d); // u2" % (n, M_u))
    printIn("ntt%d_32bit(M2_32+%d, M2+%d); // v2" % (n, v_spacing_32, M_v))
    printIn("ntt%d_32bit(M2_32+%d, M2+%d); // r2" % (n, r_spacing_32, M_r))
    printIn("ntt%d_32bit(M2_32+%d, M2+%d); // s2" % (n, s_spacing_32, M_s))
    print("")

def gen_main_full(n, v_spacing_16, v_spacing_32, r_spacing_16, r_spacing_32, s_spacing_16, s_spacing_32):
    gen_main_common(n, v_spacing_16, v_spacing_32, r_spacing_16, r_spacing_32, s_spacing_16, s_spacing_32)
    printIn("__gf_polymul_%dx%d_2x2_x_2x2(M+%d, M1_16, M1_32, M2_16, M2_32);" % (n//2, n//2, n))
    fg_g = n//2
    h = n//4
    printIn("__gf_polymul_%dx%d_2x2_x2p2(M, M2_16, M2_32, fg+%d, fg+%d, M2);" % (n//2, n//2, h, fg_g+h))
    print("")
    printIn("return(minusdelta);")
    print("}")

def gen_main_onlyvs(n, v_spacing_16, v_spacing_32, r_spacing_16, r_spacing_32, s_spacing_16, s_spacing_32, postfix):
    gen_main_common(n, v_spacing_16, v_spacing_32, r_spacing_16, r_spacing_32, s_spacing_16, s_spacing_32, postfix)
    printIn("__gf_polymul_%dx%d_2x2_x_2x2_onlyvs(M+%d, M1_16, M1_32, M2_16, M2_32);" % (n//2, n//2, n))
    fg_g = n//2
    h = n//4
    printIn("__gf_polymul_%dx%d_2x2_x2p2(M, M2_16, M2_32, fg+%d, fg+%d, M2);" % (n//2, n//2, h, fg_g+h))
    print("")
    printIn("return(minusdelta);")
    print("}")

def gen_main_onlyuv(n, v_spacing_16, v_spacing_32, r_spacing_16, r_spacing_32, s_spacing_16, s_spacing_32, postfix):
    gen_main_common(n, v_spacing_16, v_spacing_32, r_spacing_16, r_spacing_32, s_spacing_16, s_spacing_32, postfix)
    printIn("__gf_polymul_%dx%d_2x2_x_2x2_onlyuv(M+%d, M1_16, M1_32, M2_16, M2_32);" % (n//2, n//2, n))
    print("")
    printIn("for(int i=0;i<%d;i++)M[i]=M2[i];" % (n//2))
    print("")
    printIn("return(minusdelta);")
    print("}")