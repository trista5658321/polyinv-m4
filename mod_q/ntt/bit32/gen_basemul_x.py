import sys, pathlib
d_root = pathlib.Path(__file__).parent.absolute().parent.parent.parent
sys.path.append(str(d_root))

from utility import printIn, montgomery
from mod_q.ntt.utility_ntt import q, qinv, gen_basemul_wpad_32b

_n = 4
per_bytes = 4
coeffi_num = 1

r_h = "r0"

r_wapd = "r10"
r_r0_end = "lr"

r_w = "r8"

coeffi_h = ["r" + str(x) for x in range(2,6)]

ans_64 = ["r7", "r1"]
tmp = "r8"

def get_w():
    printIn("ldr.w %s, [%s], #4" % (r_w, r_wapd))

def load_coeffi(rd, rs):
    for i in range(1, len(rd)):
        printIn("ldr.w %s, [%s, #%d]" % (rd[i], rs, i*per_bytes*coeffi_num))
    printIn("ldr.w %s, [%s]" % (rd[0], rs))

def poly_mul_w(rs):
    printIn("smull %s, %s, %s, %s @ * (2**32 * w)" % (ans_64[0], ans_64[1], rs, r_w))
    montgomery(ans_64[0], ans_64[1], tmp, q, qinv)

def poly_4x4_mod4():
    label = "start"

    print(label + str(":"))
    get_w()
    load_coeffi(coeffi_h, r_h)

    poly_mul_w(coeffi_h[len(coeffi_h)-1])

    for i in range(len(coeffi_h)-1):
        printIn("str.w %s, [r0, #%d]" % (coeffi_h[i], per_bytes*(i+1)))
    printIn("str.w %s, [r0], #%d" % (ans_64[1], per_bytes*len(coeffi_h)))

    printIn("cmp.w r0, %s" % (r_r0_end))
    printIn("bne.w %s" % (label))

def prologue(p, n, w):
    print(".p2align 2,,3")
    print(".syntax unified")
    print(".text")

    gen_basemul_wpad_32b(p, n, w)

    print("// void basemul_x_%d_32bit_%dx%d (int *h);" % (n, _n, _n))
    print(".global basemul_x_%d_32bit_%dx%d" % (n, _n, _n))
    print(".type basemul_x_%d_32bit_%dx%d, %%function" % (n, _n, _n))
    print("basemul_x_%d_32bit_%dx%d:" % (n, _n, _n))
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