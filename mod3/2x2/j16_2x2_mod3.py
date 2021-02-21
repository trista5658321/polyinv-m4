import sys, pathlib
sys.path.append(str(pathlib.Path(__file__).parent.parent.absolute().parent))

from utility import printIn, prologue_mod3
import utility as u

coeffi = 8 # n x n

M = "r0"
M1 = "r1"
M2 = "r2"
s_M2 = "s0"

r03 = "r3"
s_r03 = "s1"

h1 = ["r4", "r5", "r6", "r7"]
h2 = ["r8", "r9", "r10", "r11"]
tmp = ["r2", "r3", "r12", "lr"]

u_tmp = "r12"
scr = "lr"

def polymul_8x8(h, tmp):
    printIn("ldr.w %s, [%s], #%d" % (tmp[2], M2, 4))
    printIn("ldr.w %s, [%s], #%d" % (tmp[3], M2, 4))
    printIn("ldr.w %s, [%s], #%d" % (tmp[0], M1, 4))
    printIn("ldr.w %s, [%s], #%d" % (tmp[1], M1, coeffi*1 + 4))
    printIn("umull.w %s, %s, %s, %s" % (h[0], h[1], tmp[0], tmp[2]))
    printIn("umull.w %s, %s, %s, %s" % (h[2], h[3], tmp[1], tmp[3]))
    printIn("umlal.w %s, %s, %s, %s" % (h[1], h[2], tmp[1], tmp[2]))
    printIn("umlal.w %s, %s, %s, %s" % (h[1], h[2], tmp[0], tmp[3]))

def add_reduce_str(a, b): # a*x + b
    for i in range(len(a)):
        printIn("add.w %s, %s, %s, LSL #8" %(b[i], b[i], a[i]))
    for i in range(len(a)-1):
        printIn("ubfx.w %s, %s, #24, #8" % (u_tmp, a[i]))
        printIn("add.w %s, %s" %(b[i+1], u_tmp))

    for i in range(len(b)):
        if i != 1 and i != 2:
            u.reduce_mod3_32(b[i], scr, r03)
        else:
            u.reduce_mod3_full(b[i], scr, r03)

    for i in range(1, len(b)):
        printIn("str %s, [%s, #%d]" % (b[i], M, 4*i))
    printIn("str %s, [%s], #%d" % (b[0], M, 4*4))

def main():
    f_name = "__gf_polymul_" + str(coeffi) + "x" + str(coeffi) + "_2x2_x_2x2_mod3"
    f_params = "(int *M,int *M1,int *M2)"
    f_regs = "r3-r12"
    u.prologue_mod3(f_name, f_params, f_regs)
    printIn("mov.w %s, #0x03030303" % (r03))
    printIn("vmov.w %s, %s, %s, %s" % (s_M2, s_r03, M2, r03))

    #1
    polymul_8x8(h1, h2)
    polymul_8x8(h2, tmp)
    printIn("vmov.w %s, %s, %s, %s" % (M2, r03, s_M2, s_r03))
    add_reduce_str(h1,h2)

    #2
    printIn("sub.w %s, #%d" % (M1, coeffi*3))
    polymul_8x8(h1, h2)
    polymul_8x8(h2, tmp)
    printIn("vmov.w %s, %s, %s, %s" % (M2, r03, s_M2, s_r03))
    add_reduce_str(h1,h2)

    #3
    printIn("sub.w %s, #%d" % (M1, coeffi*5))
    printIn("add.w %s, #%d" % (M2, coeffi*2))
    polymul_8x8(h1, h2)
    polymul_8x8(h2, tmp)
    printIn("vmov.w %s, %s, %s, %s" % (M2, r03, s_M2, s_r03))
    add_reduce_str(h1,h2)

    #4
    printIn("sub.w %s, #%d" % (M1, coeffi*3))
    printIn("add.w %s, #%d" % (M2, coeffi*2))
    polymul_8x8(h1, h2)
    polymul_8x8(h2, tmp)
    printIn("vmov.w %s, %s, %s, %s" % (M2, r03, s_M2, s_r03))
    add_reduce_str(h1,h2)

    u.epilogue_mod3(f_regs)

main()