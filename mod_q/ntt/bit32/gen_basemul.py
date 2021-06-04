import sys, pathlib
d_root = pathlib.Path(__file__).parent.absolute().parent.parent.parent
sys.path.append(str(d_root))

from utility import printIn, montgomery
from mod_q.ntt.utility_ntt import q, qinv, gen_basemul_wpad_32b

_n = 4
per_bytes = 4
coeffi_num = 1

r_h = "r0"
r_f = "r1"
r_g = "r2"
s_h = "s0"
s_f = "s1"
s_g = "s2"

r_wapd = "lr"
s_wapd = "s3"

r_r0_end = "r10"
s_r0_end = "s4"

r_w = "r10"

coeffi_f = ["r" + str(x) for x in range(2,6)]
coeffi_g = ["r" + str(x) for x in range(6,10)]

ans_64 = ["r0", "r1"]
tmp = "lr"

def get_w():
    printIn("ldr.w %s, [%s], #4" % (r_w, r_wapd))

def load_coeffi(rd, rs):
    for i in range(1, len(rd)):
        printIn("ldr.w %s, [%s, #%d]" % (rd[i], rs, i*per_bytes*coeffi_num))
    printIn("ldr.w %s, [%s], #%d" % (rd[0], rs, len(rd)*per_bytes*coeffi_num))

def poly_0():
    printIn("smull %s, %s, %s, %s @ 13" % (ans_64[0], ans_64[1], coeffi_f[1], coeffi_g[3]))
    printIn("smlal %s, %s, %s, %s @ + 22" % (ans_64[0], ans_64[1], coeffi_f[2], coeffi_g[2]))
    printIn("smlal %s, %s, %s, %s @ + 31" % (ans_64[0], ans_64[1], coeffi_f[3], coeffi_g[1]))
    montgomery(ans_64[0], ans_64[1], tmp, q, qinv)
    
    printIn("smull %s, %s, %s, %s @ = r1 * (2**32 * w)" % (ans_64[0], ans_64[1], r_w, ans_64[1]))
    printIn("smlal %s, %s, %s, %s @ + 00" % (ans_64[0], ans_64[1], coeffi_f[0], coeffi_g[0]))

    montgomery(ans_64[0], ans_64[1], tmp, q, qinv)
    
    printIn("vmov %s, %s" % (r_h, s_h))
    printIn("str.w %s, [%s], #16" % (ans_64[1], r_h))

def poly_1():
    printIn("smull %s, %s, %s, %s @ 23" % (ans_64[0], ans_64[1], coeffi_f[2], coeffi_g[3]))
    printIn("smlal %s, %s, %s, %s @ + 32" % (ans_64[0], ans_64[1], coeffi_f[3], coeffi_g[2]))
    montgomery(ans_64[0], ans_64[1], tmp, q, qinv)
    printIn("smull %s, %s, %s, %s @ = r1 * (2**32 * w)" % (ans_64[0], ans_64[1], r_w, ans_64[1]))

    printIn("smlal %s, %s, %s, %s @ + 01" % (ans_64[0], ans_64[1], coeffi_f[0], coeffi_g[1]))
    printIn("smlal %s, %s, %s, %s @ + 10" % (ans_64[0], ans_64[1], coeffi_f[1], coeffi_g[0]))
    
    montgomery(ans_64[0], ans_64[1], tmp, q, qinv)

    printIn("vmov %s, %s" % (r_h, s_h))
    printIn("str.w %s, [%s, #4]" % (ans_64[1], r_h))

def poly_2():
    printIn("smull %s, %s, %s, %s @ 33" % (ans_64[0], ans_64[1], coeffi_f[3], coeffi_g[3]))
    montgomery(ans_64[0], ans_64[1], tmp, q, qinv)
    printIn("smull %s, %s, %s, %s @ 33 * w = r1 * (2**32 * w)" % (ans_64[0], ans_64[1], r_w, ans_64[1]))
    
    printIn("smlal %s, %s, %s, %s @ 33 + 02" % (ans_64[0], ans_64[1], coeffi_f[0], coeffi_g[2]))
    printIn("smlal %s, %s, %s, %s @ + 11" % (ans_64[0], ans_64[1], coeffi_f[1], coeffi_g[1]))
    printIn("smlal %s, %s, %s, %s @ + 20" % (ans_64[0], ans_64[1], coeffi_f[2], coeffi_g[0]))
    montgomery(ans_64[0], ans_64[1], tmp, q, qinv)

    printIn("vmov %s, %s" % (r_h, s_h))
    printIn("str.w %s, [%s, #8]" % (ans_64[1], r_h))

def poly_3():
    printIn("smull %s, %s, %s, %s @ 03" % (ans_64[0], ans_64[1], coeffi_f[0], coeffi_g[3]))
    printIn("smlal %s, %s, %s, %s @ + 12" % (ans_64[0], ans_64[1], coeffi_f[1], coeffi_g[2]))
    printIn("smlal %s, %s, %s, %s @ + 21" % (ans_64[0], ans_64[1], coeffi_f[2], coeffi_g[1]))
    printIn("smlal %s, %s, %s, %s @ + 30" % (ans_64[0], ans_64[1], coeffi_f[3], coeffi_g[0]))
    montgomery(ans_64[0], ans_64[1], tmp, q, qinv)

    printIn("vmov %s, %s" % (r_h, s_h))
    printIn("str.w %s, [%s, #12]" % (ans_64[1], r_h))

def poly_4x4_mod4():
    label = "start"

    print(label + str(":"))
    printIn("vmov %s, %s, %s, %s" % (r_f, r_g, s_f, s_g))
    printIn("vmov %s, %s" % (r_wapd, s_wapd))
    get_w()
    load_coeffi(coeffi_g, r_g)
    printIn("vmov %s, %s" % (s_g, r_g))
    printIn("vmov %s, %s" % (s_wapd, r_wapd))
    load_coeffi(coeffi_f, r_f)
    printIn("vmov %s, %s" % (s_f, r_f))

    poly_2()
    poly_1()
    poly_3()
    poly_0()

    printIn("vmov %s, %s" % (s_h, r_h))
    printIn("vmov %s, %s" % (r_r0_end, s_r0_end))

    printIn("cmp.w r0, %s" % (r_r0_end))
    printIn("bne.w %s" % (label))

def prologue(p, n, w, w_power):
    print(".p2align 2,,3")
    print(".syntax unified")
    print(".text")

    gen_basemul_wpad_32b(p, n, w, w_power)

    print("// void basemul%d_32bit_%dx%d (int *h, int *f, int *g);" % (n, _n, _n))
    print(".global basemul%d_32bit_%dx%d" % (n, _n, _n))
    print(".type basemul%d_32bit_%dx%d, %%function" % (n, _n, _n))
    print("basemul%d_32bit_%dx%d:" % (n, _n, _n))
    printIn("push {r4-r11, lr}")
    printIn("adr.w %s, wpad" % (r_wapd))
    printIn("ldm %s!, {%s-%s}" % (r_wapd, q, qinv))
    printIn("add.w %s, r0, #%d" % (r_r0_end, n * per_bytes))

    printIn("vmov %s, %s" % (s_r0_end, r_r0_end))
    printIn("vmov %s, %s, %s, %s" % (s_h, s_f, r_h, r_f))
    printIn("vmov %s, %s, %s, %s" % (s_g, s_wapd, r_g, r_wapd))
    # printIn("vmov %s, %s, %s, %s" % (s_wapd, s_r0_end, r_wapd, r_r0_end))

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