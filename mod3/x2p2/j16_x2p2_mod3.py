import sys, pathlib
sys.path.append(str(pathlib.Path(__file__).parent.parent.absolute().parent))

from utility import printIn, prologue_mod3
import utility as u

coeffi = 8 # n x n

V = "r0"
# s_V = "s0"
M = "r1"
fh = "r2"
gh = "r3"
s_fh = "s1"
s_gh = "s2"

h1 = ["r4", "r5", "r6", "r7"]
h2 = ["r8", "r9", "r10", "r11"]
tmp = ["r2", "r3", "r12", "lr"]

r03 = "r12"
scr = "lr"

def polymul_8x8(h, g, tmp):
    printIn("ldr.w %s, [%s]" % (tmp[2], g))
    printIn("ldr.w %s, [%s, #4]" % (tmp[3], g))
    printIn("ldr.w %s, [%s], #4" % (tmp[0], M))
    printIn("ldr.w %s, [%s], #4" % (tmp[1], M))
    printIn("umull.w %s, %s, %s, %s" % (h[0], h[1], tmp[0], tmp[2]))
    printIn("umull.w %s, %s, %s, %s" % (h[2], h[3], tmp[1], tmp[3]))
    printIn("umlal.w %s, %s, %s, %s" % (h[1], h[2], tmp[1], tmp[2]))
    printIn("umlal.w %s, %s, %s, %s" % (h[1], h[2], tmp[0], tmp[3]))

def main():
    f_name = "__gf_polymul_" + str(coeffi) + "x" + str(coeffi) + "_2x2_x2p2_mod3"
    f_params = "(int *V, int *M, int *fh, int *gh)"
    f_regs = "r4-r12"
    u.prologue_mod3(f_name, f_params, f_regs)
    printIn("vmov.w %s, %s, %s, %s" % (s_fh, s_gh, fh, gh))
    printIn("add.w %s, #16" % (M))
    polymul_8x8(h1, fh, h2)
    polymul_8x8(h2, gh, tmp)
    
    for i in range(len(h1)):
        printIn("add.w %s, %s" % (h1[i], h2[i]))

    printIn("ldr.w %s, [%s, #-32]" % (h2[0], M))
    printIn("ldr.w %s, [%s, #-28]" % (h2[1], M))
    printIn("add.w %s, %s, %s, LSL #8" %(h2[0], h2[0], h1[0]))

    printIn("add.w %s, %s, %s, LSL #8" %(h2[1], h2[1], h1[1]))
    printIn("ubfx.w %s, %s, #24, #8" % (tmp[0], h1[0])) # 3
    printIn("add.w %s, %s" %(h2[1], tmp[0]))

    printIn("ubfx.w %s, %s, #24, #8" % (tmp[0], h1[1])) # 7
    printIn("add.w %s, %s, %s, LSL #8" %(h2[2], tmp[0], h1[2]))

    printIn("ubfx.w %s, %s, #24, #8" % (tmp[0], h1[2])) # 11
    printIn("add.w %s, %s, %s, LSL #8" %(h2[3], tmp[0], h1[3]))
    
    printIn("mov.w %s, #0x03030303" % (r03))

    for i in range(len(h2)):
        if i != 2:
            u.reduce_mod3_32(h2[i], scr, r03)
        else:
            u.reduce_mod3_full(h2[i], scr, r03)

    for i in range(1, len(h2)):
        printIn("str %s, [%s, #%d]" % (h2[i], V, 4*i))
    printIn("str %s, [%s], #%d" % (h2[0], V, 4*4))

    printIn("vmov.w %s, %s, %s, %s" % (fh, gh, s_fh, s_gh))
    polymul_8x8(h1, fh, h2)
    polymul_8x8(h2, gh, tmp)
    for i in range(len(h1)):
        printIn("add.w %s, %s" % (h1[i], h2[i]))
    printIn("ldr.w %s, [%s, #-%d]" % (h2[0], M, coeffi*5))
    printIn("ldr.w %s, [%s, #-%d]" % (h2[1], M, coeffi*5-4))

    for i in range(2):
        printIn("add.w %s, %s" % (h1[i], h2[i]))

    printIn("mov.w %s, #0x03030303" % (r03))

    for i in range(len(h2)):
        if i != 2:
            u.reduce_mod3_32(h1[i], scr, r03)
        else:
            u.reduce_mod3_full(h1[i], scr, r03)

    for i in range(1, len(h1)):
        printIn("str %s, [%s, #%d]" % (h1[i], V, 4*i))
    printIn("str %s, [%s], #%d" % (h1[0], V, 4*4))

    u.epilogue_mod3(f_regs)

# main()