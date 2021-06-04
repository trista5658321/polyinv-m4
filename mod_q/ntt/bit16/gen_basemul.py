import sys, pathlib
d_root = pathlib.Path(__file__).parent.absolute().parent.parent.parent
sys.path.append(str(d_root))

from utility import printIn, barrett
from mod_q.ntt.utility_ntt import q, qinv, gen_basemul_wpad_16b

_n = 4
per_bytes = 2
coeffi_num = 2
r_wapd = "r3"
r_r0_end = "r4"
s_wapd = "s3"
s_r0_end = "s4"
r_w = "r10"

def get_w():
    printIn("ldr.w %s, [%s], #4" % (r_w, r_wapd))

def poly_4x4():
    poly_8 = ["r3", "lr", "r9", "r6", "r8", "r4", "r7"]
    printIn("ldr.w r5, [r1, #4]")
    printIn("ldr.w r4, [r1], #8")
    printIn("ldr.w r7, [r2, #4]")
    printIn("ldr.w r8, [r2, #2]")
    printIn("ldr.w r6, [r2], #8")
    # str wpad
    printIn("vmov.w %s, %s" % (s_wapd, r_wapd))
    # 0
    printIn("smulbb r3, r4, r6")
    # 1
    printIn("smuadx lr, r4, r6")
    # 2
    printIn("smulbb r9, r5, r6")
    printIn("smladx r9, r4, r8, r9")
    # 4
    printIn("smuadx r8, r5, r8")
    printIn("smlatt r8, r4, r7, r8")
    # 3
    printIn("smuadx r6, r5, r6")
    printIn("smladx r6, r4, r7, r6")
    # 5
    printIn("smuadx r4, r5, r7")
    # 6
    printIn("smultt r7, r5, r7")
    
    return poly_8

def mul_w(a, b, tmp): # a+bw
    barrett(b,q,qinv,tmp)
    printIn("smlabb %s, %s, %s, %s" % (a, r_w, b, a))

def combine_two_coeffi(rd, a, b, tmp):
    barrett(a,q,qinv,tmp)
    barrett(b,q,qinv,tmp)
    printIn("pkhbt %s, %s, %s, lsl #16" % (rd, a, b))


def poly_4x4_mod4():
    label = "start_%d" % (0)
    tmp = "r5"
    coeffi = ["r3", "r4"]
    per_round = 4

    print(label + str(":"))

    for i in range(per_round):
        if i != 0:
            printIn("vmov.w %s, %s" % (r_wapd, s_wapd))

        get_w()
        poly_8 = poly_4x4()
        for i in range(_n-1):
            mul_w(poly_8[i], poly_8[4+i], tmp)
        
        for i in range(_n//2):
            combine_two_coeffi(coeffi[i], poly_8[2*i], poly_8[2*i+1], tmp)

        for i in range(1, len(coeffi)):
            printIn("str.w %s, [r0, #%d]" % (coeffi[i], per_bytes*coeffi_num*i))
        printIn("str.w %s, [r0], #%d" % (coeffi[0], per_bytes*coeffi_num*len(coeffi)))

    printIn("vmov %s, %s, %s, %s" % (r_wapd, r_r0_end, s_wapd, s_r0_end))
    printIn("cmp.w r0, %s" % (r_r0_end))
    printIn("bne.w %s" % (label))

def prologue(p, n, w, w_power):
    print(".p2align 2,,3")
    print(".syntax unified")
    print(".text")

    gen_basemul_wpad_16b(p, n, w, w_power)

    print("// void basemul%d_16bit_%dx%d (int *h, int *f, int *g);" % (n, _n, _n))
    print(".global basemul%d_16bit_%dx%d" % (n, _n, _n))
    print(".type basemul%d_16bit_%dx%d, %%function" % (n, _n, _n))
    print("basemul%d_16bit_%dx%d:" % (n, _n, _n))
    printIn("push {r4-r11, lr}")
    printIn("adr.w %s, wpad" % (r_wapd))
    printIn("ldm %s!, {%s-%s}" % (r_wapd, q, qinv))
    printIn("add.w %s, r0, #%d" % (r_r0_end, n * per_bytes))
    printIn("vmov %s, %s, %s, %s" % (s_wapd, s_r0_end, r_wapd, r_r0_end))

def epilogue():
    printIn("pop {r4-r11, pc}")
    
def basemul(p, n, w, layer, w_power):
    prologue(p, n, w, w_power)
    poly_4x4_mod4()
    epilogue()

p = int(sys.argv[1])
n = int(sys.argv[2])
w = int(sys.argv[3])
layer = int(sys.argv[4]) # 2^layer = n
w_power = int(sys.argv[5]) # w^w_power = 1
basemul(p, n, w, layer, w_power)