import sys, pathlib
d_root = pathlib.Path(__file__).parent.absolute().parent.parent.parent
sys.path.append(str(d_root))

from mod_q.ntt.utility_ntt import gen_wpad

def printIn(asm):
    print("\t" + asm)

def prologue(p, n, w):
    print(".p2align 2,,3")
    print(".syntax unified")
    print(".text")

    gen_wpad(p, n, w)

    print("// void intt%d_32bit (int *v);" % (n))
    print(".global intt%d_32bit" % (n))
    print(".type intt%d_32bit, %%function" % (n))
    print("intt%d_32bit:" % (n))

    printIn("push {r4-r11, lr}")
    # printIn("adr.w r1, wpad")
    # printIn("ldm r1!, {%s-%s}" % (q, qinv))
    # # s0: r0 start, s1: w_pad
    # printIn("vmov.w s0, s1, r0, r1")

    # printIn("add.w lr, r0, #%d" % (n * 4))
    # printIn("vmov %s, lr @ lr: flag(r0-end)" % (s_r0_end))

def epilogue():
    printIn("pop {r4-r11, pc}")

def ntt(p, n, w, layer, jump = 2):
    prologue(p, n, w)
    # ini_layer = layer - jump # jump 2
    # for i in range(ini_layer-1, 0, -1):
    #     if not i & 1:
    #         degree = n // (2 ** (i+1))
    #         # print((i, degree))
    #         if i == 2:
    #             i_layer_012(i, degree)
    #         else:
    #             i_2_layer(i, degree)
    epilogue()

p = int(sys.argv[1])
n = int(sys.argv[2])
w = int(sys.argv[3])
layer = int(sys.argv[4]) # 2^layer = n
ntt(p, n, w, layer)