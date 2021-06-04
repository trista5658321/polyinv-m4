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
tmp = "r7"

def get_w():
    printIn("ldr.w %s, [%s], #4" % (r_w, r_wapd))

def combine_two_coeffi(rd, a, b, tmp):
    barrett(a,q,qinv,tmp)
    barrett(b,q,qinv,tmp)
    printIn("pkhbt %s, %s, %s, lsl #16" % (rd, a, b))

def poly_2xX():
    poly_4 = ["r"+str(x) for x in range(1,5)]
    get_w()
    printIn("ldrsh.w r2, [r0, #2]")
    printIn("ldrsh.w r3, [r0, #4]")
    printIn("ldrsh.w r4, [r0, #6]")
    printIn("ldrsh.w r1, [r0]")

    poly_2_2 = ["r5", "r6"]

    # 2 -> 0
    printIn("smulbb %s, %s, %s" % (poly_2_2[0], r_w, poly_4[1]))
    printIn("smultb %s, %s, %s" % (poly_2_2[1], r_w, poly_4[3]))
    combine_two_coeffi(poly_2_2[0], poly_2_2[0], poly_4[0], tmp)
    combine_two_coeffi(poly_2_2[1], poly_2_2[1], poly_4[2], tmp)

    for i in range(1, len(poly_2_2)):
        printIn("str.w %s, [r0, #%d]" % (poly_2_2[i], per_bytes*coeffi_num*i))
    printIn("str.w %s, [r0], #%d" % (poly_2_2[0], per_bytes*coeffi_num*len(poly_2_2)))

def poly_4x4_mod4():
    label = "start_%d" % (0)
    per_round = 4

    print(label + str(":"))

    for i in range(per_round):
        poly_2xX()

    printIn("cmp.w r0, %s" % (r_r0_end))
    printIn("bne.w %s" % (label))

def prologue(p, n, w, w_power):
    print(".p2align 2,,3")
    print(".syntax unified")
    print(".text")

    gen_basemul_wpad_16b_2x2(p, n, w, w_power)

    print("// void basemul_x_%d_16bit_%dx%d (int *h);" % (n, _n, _n))
    print(".global basemul_x_%d_16bit_%dx%d" % (n, _n, _n))
    print(".type basemul_x_%d_16bit_%dx%d, %%function" % (n, _n, _n))
    print("basemul_x_%d_16bit_%dx%d:" % (n, _n, _n))
    printIn("push {r4-r11, lr}")
    printIn("adr.w %s, wpad" % (r_wapd))
    printIn("ldm %s!, {%s-%s}" % (r_wapd, q, qinv))
    printIn("add.w %s, r0, #%d" % (r_r0_end, n * per_bytes))

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