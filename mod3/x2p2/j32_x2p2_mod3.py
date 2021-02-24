import sys, pathlib
sys.path.append(str(pathlib.Path(__file__).parent.parent.absolute().parent))

from utility import printIn, prologue_mod3
import utility as u

coeffi = 16 # n x n

polymul_path = "polymul.polymul_" + str(coeffi) + "x" + str(coeffi)
_tmp = __import__(polymul_path, globals(), locals(), ['polymul'], 0)
polymul = _tmp.polymul

V = "r0"
M = "r1"
fh = "r2"
gh = "r3"
s_fh = "s0"
s_gh = "s1"

h1 = ["r2", "r3", "r4", "r5"]
h2 = ["r6", "r7", "r8", "r9"]
tmp = ["r10", "r11", "r12", "lr"]

s_1_b = ["s" + str(x) for x in range(2,6)]
s_1_t = ["s" + str(x) for x in range(6,10)]
s_2_b = ["s" + str(x + 8) for x in range(2,6)]
s_2_t = ["s" + str(x + 8) for x in range(6,10)]

r03 = "r4"
scr = "r5"

def str_to_s(r, s):
    printIn("vmov.w %s, %s, %s, %s" % (s[0], s[1], r[0], r[1]))
    printIn("vmov.w %s, %s, %s, %s" % (s[2], s[3], r[2], r[3]))

def ldr_from_s(r, s):
    printIn("vmov.w %s, %s, %s, %s" % (r[0], r[1], s[0], s[1]))
    printIn("vmov.w %s, %s, %s, %s" % (r[2], r[3], s[2], s[3]))

def reduce_str(a, b = []):
    rs = a + b
    printIn("mov.w %s, #0x03030303" % (r03))
    for i in range(len(rs)):
        # if i != 2:
        #     u.reduce_mod3_32(rs[i], scr, r03)
        # else:
        #     u.reduce_mod3_full(rs[i], scr, r03)
        u.reduce_mod3_full(rs[i], scr, r03)

    for i in range(1, len(rs)):
        printIn("str.w %s, [%s, #%d]" % (rs[i], V, 4*i))
    printIn("str.w %s, [%s], #%d" % (rs[0], V, 4*len(rs)))

def main():
    f_name = "__gf_polymul_" + str(coeffi) + "x" + str(coeffi) + "_2x2_x2p2_mod3"
    f_params = "(int *V, int *M, int *fh, int *gh)"
    f_regs = "r4-r12"
    s_regs = "s16-s17"
    u.prologue_mod3(f_name, f_params, f_regs, s_regs)
    printIn("vmov.w %s, %s, %s, %s" % (s_fh, s_gh, fh, gh))

    # 1
    printIn("add.w %s, #%d" % (M, coeffi*2))
    polymul(0)
    printIn("mov.w %s, %s" % ("r2", gh))
    polymul(1)

    # ===
    # ldr_from_s(h1, s_1_b)
    # ldr_from_s(h2, s_2_b)
    # for i in range(len(h2)):
    #     printIn("add.w %s, %s" % (h2[i], h1[i]))
    # reduce_str(h2)
    # ldr_from_s(h1, s_1_t)
    # ldr_from_s(h2, s_2_t)
    # for i in range(len(h2)):
    #     printIn("add.w %s, %s" % (h2[i], h1[i]))
    # reduce_str(h2)
    # ===

    # Top (store in tmp[])
    ldr_from_s(h1, s_1_t)
    ldr_from_s(h2, s_2_t)
    for i in range(len(h2)):
        printIn("add.w %s, %s, %s" % (tmp[i], h2[i], h1[i]))
    tmp_r = h1[0]
    for i in range(len(h2)-1, 0, -1):
        prev = tmp[i-1]
        printIn("ubfx.w %s, %s, #24, #8" % (tmp_r, prev))
        printIn("add.w %s, %s, %s, LSL #8" %(tmp[i], tmp_r, tmp[i]))

    # Bottom
    ldr_from_s(h1, s_1_b)
    ldr_from_s(h2, s_2_b)
    for i in range(len(h2)):
        printIn("add.w %s, %s" % (h1[i], h2[i]))
    tmp_r = h2[0]

    # top: first
    prev = h1[3]
    printIn("ubfx.w %s, %s, #24, #8" % (tmp_r, prev))
    printIn("add.w %s, %s, %s, LSL #8" %(tmp[0], tmp_r, tmp[0]))

    for i in range(len(h1)):
        printIn("ldr.w %s, [%s, #-%d]" % (h2[i], M, coeffi*4 - i*4))

    ## add f1 (store in h2[])
    printIn("add.w %s, %s, %s, LSL #8" %(h2[0], h2[0], h1[0]))
    for i in range(1,4):
        printIn("add.w %s, %s, %s, LSL #8" %(h2[i], h2[i], h1[i]))
        printIn("add.w %s, %s, %s, LSR #24" %(h2[i], h2[i], h1[i-1]))

    reduce_str(h2, tmp)

    # 2
    printIn("vmov.w %s, %s, %s, %s" % (fh, gh, s_fh, s_gh))
    polymul(0)
    printIn("mov.w %s, %s" % ("r2", gh))
    polymul(1)

    # Top
    ldr_from_s(h1, s_1_t)
    ldr_from_s(h2, s_2_t)
    for i in range(len(h2)):
        printIn("add.w %s, %s, %s" % (tmp[i], h2[i], h1[i]))

    # Bottom
    ldr_from_s(h1, s_1_b)
    ldr_from_s(h2, s_2_b)
    for i in range(len(h2)):
        printIn("add.w %s, %s, %s" % (h2[i], h2[i], h1[i]))
    
    ## add g1
    for i in range(len(h1)):
        printIn("ldr.w %s, [%s, #-%d]" % (h1[i], M, coeffi*5 - i*4))

    for i in range(len(h1)):
        printIn("add.w %s, %s" % (h2[i], h1[i]))

    reduce_str(h2, tmp)

    u.epilogue_mod3(f_regs, s_regs)

# main()