import sys, pathlib
d_root = pathlib.Path(__file__).parent.absolute().parent.parent.parent
sys.path.append(str(d_root))

from utility import printIn, montgomery
from mod_q.ntt.utility_ntt import q, qinv, gen_basemul_wpad_32b

_n = 2
per_bytes = 4
coeffi_num = 1

r_h = "r0"
r_f = "r1"
r_g = "r2"
r_wapd = "r10"
r_r0_end = "lr"
r_w = "r9"
tmp = "r8"

s_r0_end = "s1"

coeffi_f = ["r" + str(x) for x in range(3,5)]
coeffi_g = ["r" + str(x) for x in range(5,7)]

ans_64 = ["r7", "r8"]
tmp = "lr"

def get_w():
    printIn("ldr.w %s, [%s], #4" % (r_w, r_wapd))

def load_coeffi(rd, rs):
    for i in range(1, len(rd)):
        printIn("ldr.w %s, [%s, #%d]" % (rd[i], rs, i*per_bytes*coeffi_num))
    printIn("ldr.w %s, [%s], #%d" % (rd[0], rs, len(rd)*per_bytes*coeffi_num))

def poly_2x2_mod2():
    load_coeffi(coeffi_f, r_f)
    load_coeffi(coeffi_g, r_g)

    # h0
    printIn("smull %s, %s, %s, %s @ 01" % (ans_64[0], ans_64[1], coeffi_f[0], coeffi_g[1]))
    printIn("smlal %s, %s, %s, %s @ + 10" % (ans_64[0], ans_64[1], coeffi_f[1], coeffi_g[0]))
    montgomery(ans_64[0], ans_64[1], tmp, q, qinv)
    
    # h1
    ans_64_2 = [coeffi_g[1], ans_64[0]]
    printIn("smull %s, %s, %s, %s @ 11" % (ans_64_2[0], ans_64_2[1], coeffi_f[1], coeffi_g[1]))
    montgomery(ans_64_2[0], ans_64_2[1], tmp, q, qinv)
    printIn("smull %s, %s, %s, %s @ = 11 * (2**32 * w)" % (ans_64_2[0], ans_64_2[1], r_w, ans_64_2[1]))
    printIn("smlal %s, %s, %s, %s @ + 00" % (ans_64_2[0], ans_64_2[1], coeffi_f[0], coeffi_g[0]))
    montgomery(ans_64_2[0], ans_64_2[1], tmp, q, qinv)

    poly_2 = [ans_64_2[1], ans_64[1]]

    for i in range(1, len(poly_2)):
        printIn("str.w %s, [r0, #%d]" % (poly_2[i], per_bytes*coeffi_num*i))
    printIn("str.w %s, [r0], #%d" % (poly_2[0], per_bytes*coeffi_num*len(poly_2)))

def poly2x2_loop():
    label = "start"
    per_round = 4
    print(label + str(":"))
    
    for i in range(per_round):
        get_w()
        poly_2x2_mod2()


    printIn("vmov %s, %s" % (r_r0_end, s_r0_end))
    printIn("cmp.w r0, %s" % (r_r0_end))
    printIn("bne.w %s" % (label))

def prologue(p, n, w):
    print(".p2align 2,,3")
    print(".syntax unified")
    print(".text")

    gen_basemul_wpad_32b(p, n, w)

    print("// void basemul%d_32bit_%dx%d (int *h, int *f, int *g);" % (n, _n, _n))
    print(".global basemul%d_32bit_%dx%d" % (n, _n, _n))
    print(".type basemul%d_32bit_%dx%d, %%function" % (n, _n, _n))
    print("basemul%d_32bit_%dx%d:" % (n, _n, _n))
    printIn("push {r4-r11, lr}")
    printIn("adr.w %s, wpad" % (r_wapd))
    printIn("ldm %s!, {%s-%s}" % (r_wapd, q, qinv))
    printIn("add.w %s, r0, #%d" % (r_r0_end, n * per_bytes))
    printIn("vmov %s, %s" % (s_r0_end, r_r0_end))

def epilogue():
    printIn("pop {r4-r11, pc}")
    
def basemul(p, n, w, layer):
    prologue(p, n, w)
    poly2x2_loop()
    epilogue()

p = int(sys.argv[1])
n = int(sys.argv[2])
w = int(sys.argv[3])
layer = int(sys.argv[4]) # 2^layer = n
basemul(p, n, w, layer)