import sys, pathlib
d_root = pathlib.Path(__file__).parent.absolute().parent.parent.parent
sys.path.append(str(d_root))

from utility import printIn, barrett
from mod_q.ntt.utility_ntt import q, qinv, gen_basemul_wpad_16b_2x2

_n = 2
per_bytes = 2
coeffi_num = 2
r_wapd = "r10"
r_r0_end = "lr"
r_w = "r9"
tmp = "r8"

def get_w():
    printIn("ldr.w %s, [%s], #4" % (r_w, r_wapd))

def poly_2x2_2():
    f = ["r3", "r4"]
    g = ["r5", "r6"]
    h0 = ["r7", f[0]]
    h1 = [g[0], f[1]]
    printIn("ldr.w r4, [r1, #4]")
    printIn("ldr.w r3, [r1], #8")
    printIn("ldr.w r6, [r2, #4]")
    printIn("ldr.w r5, [r2], #8")
    
    # h0
    printIn("smultt %s, %s, %s" % (h0[0], f[0], g[0]))
    mul_w(h0[0], tmp, "b")
    printIn("smlabb %s, %s, %s, %s" % (h0[0], f[0], g[0], h0[0]))
    printIn("smuadx %s, %s, %s" % (h0[1], f[0], g[0]))
    
    # h1
    printIn("smultt %s, %s, %s" % (h1[0], f[1], g[1]))
    mul_w(h1[0], tmp, "t")
    printIn("smlabb %s, %s, %s, %s" % (h1[0], f[1], g[1], h1[0]))
    printIn("smuadx %s, %s, %s" % (h1[1], f[1], g[1]))

    return h0+h1

def mul_w(b, tmp, w_pos): # bw
    barrett(b,q,qinv,tmp)
    printIn("smul%sb %s, %s, %s" % (w_pos, b, r_w, b))

def combine_two_coeffi(rd, a, b, tmp):
    barrett(a,q,qinv,tmp)
    barrett(b,q,qinv,tmp)
    printIn("pkhbt %s, %s, %s, lsl #16" % (rd, a, b))

def poly_4x4_mod4():
    label = "start_%d" % (0)
    coeffi = ["r3", "r4"]
    per_round = 4

    print(label + str(":"))

    # for i in range(per_round):
    get_w()
    poly_2_2 = poly_2x2_2()
    
    for i in range(len(coeffi)):
        combine_two_coeffi(coeffi[i], poly_2_2[2*i], poly_2_2[2*i+1], tmp)

    for i in range(1, len(coeffi)):
        printIn("str.w %s, [r0, #%d]" % (coeffi[i], per_bytes*coeffi_num*i))
    printIn("str.w %s, [r0], #%d" % (coeffi[0], per_bytes*coeffi_num*len(coeffi)))

    printIn("cmp.w r0, %s" % (r_r0_end))
    printIn("bne.w %s" % (label))

def prologue(p, n, w):
    print(".p2align 2,,3")
    print(".syntax unified")
    print(".text")

    gen_basemul_wpad_16b_2x2(p, n, w)

    print("// void basemul%d_16bit_%dx%d (int *h, int *f, int *g);" % (n, _n, _n))
    print(".global basemul%d_16bit_%dx%d" % (n, _n, _n))
    print(".type basemul%d_16bit_%dx%d, %%function" % (n, _n, _n))
    print("basemul%d_16bit_%dx%d:" % (n, _n, _n))
    printIn("push {r4-r11, lr}")
    printIn("adr.w %s, wpad" % (r_wapd))
    printIn("ldm %s!, {%s-%s}" % (r_wapd, q, qinv))
    printIn("add.w %s, r0, #%d" % (r_r0_end, n * per_bytes))

def epilogue():
    printIn("pop {r4-r11, pc}")
    
def basemul(p, n, w, layer):
    prologue(p, n, w)
    poly_4x4_mod4()
    epilogue()

p = int(sys.argv[1])
n = int(sys.argv[2])
w = int(sys.argv[3])
layer = int(sys.argv[4]) # 2^layer = n
basemul(p, n, w, layer)