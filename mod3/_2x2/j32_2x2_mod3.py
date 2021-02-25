import sys, pathlib
sys.path.append(str(pathlib.Path(__file__).parent.parent.absolute().parent))

from utility import printIn, prologue_mod3
import utility as u

coeffi = 16 # n x n

polymul_path = "polymul.polymul_" + str(coeffi) + "x" + str(coeffi)
_tmp = __import__(polymul_path, globals(), locals(), ['polymul'], 0)
polymul = _tmp.polymul

M = "r0"
M1 = "r1"
s_M1 = "s0"
M2 = "r2"
s_M2 = "s1"


h1 = ["r1", "r2", "r4", "r5"]
h2 = ["r6", "r7", "r8", "r9"]
tmp = ["r10", "r11", "r12", "lr"]

r03 = "r3"
# s_r03 = "s1"
scr = "r2"

s_1_b = ["s" + str(x) for x in range(2,6)]
s_1_t = ["s" + str(x) for x in range(6,10)]
s_2_b = ["s" + str(x + 8) for x in range(2,6)]
s_2_t = ["s" + str(x + 8) for x in range(6,10)]

def ldr_from_s(r, s):
    printIn("vmov.w %s, %s, %s, %s" % (r[0], r[1], s[0], s[1]))
    printIn("vmov.w %s, %s, %s, %s" % (r[2], r[3], s[2], s[3]))

def add_reduce_str(): # h1*x + h2
    ldr_from_s(h1, s_1_t)
    ldr_from_s(h2, s_2_t)
    for i in range(len(h1)):
        printIn("add.w %s, %s, %s, LSL #8" %(tmp[i], h2[i], h1[i]))
    for i in range(len(h1)-1):
        printIn("add.w %s, %s, %s, LSR #24" %(tmp[i+1], tmp[i+1], h1[i]))

    ldr_from_s(h1, s_1_b)
    ldr_from_s(h2, s_2_b)

    printIn("add.w %s, %s, %s, LSR #24" %(tmp[0], tmp[0], h1[3]))

    for i in range(len(h1)):
        printIn("add.w %s, %s, %s, LSL #8" %(h2[i], h2[i], h1[i]))
    for i in range(len(h1)-1):
        printIn("add.w %s, %s, %s, LSR #24" %(h2[i+1], h2[i+1], h1[i]))

    rs = h2 + tmp
    for i in range(len(rs)):
        if i == 0 or i == len(rs)-1:
            u.reduce_mod3_32(rs[i], scr, r03)
        else:
            u.reduce_mod3_full(rs[i], scr, r03)

    for i in range(1, len(rs)):
        printIn("str %s, [%s, #%d]" % (rs[i], M, 4*i))
    printIn("str %s, [%s], #%d" % (rs[0], M, 4*len(rs)))

def reduce_str(rs):
    printIn("mov.w %s, #0x03030303" % (r03))
    for i in range(len(rs)):
        u.reduce_mod3_full(rs[i], scr, r03)

    for i in range(1, len(rs)):
        printIn("str %s, [%s, #%d]" % (rs[i], M, 4*i))
    printIn("str %s, [%s], #%d" % (rs[0], M, 4*4))

def main():
    f_name = "__gf_polymul_" + str(coeffi) + "x" + str(coeffi) + "_2x2_x_2x2_mod3"
    f_params = "(int *M,int *M1,int *M2)"
    f_regs = "r3-r12"
    s_regs = "s16-s17"
    u.prologue_mod3(f_name, f_params, f_regs, s_regs)
    printIn("mov.w %s, #0x03030303" % (r03))
    printIn("vmov.w %s, %s, %s, %s" % (s_M1, s_M2, M1, M2))

    #1
    polymul(0, M2, M1)
    polymul(1, M2, M1)
    add_reduce_str()

    #2
    printIn("vmov.w %s, %s, %s, %s" % (M1, M2, s_M1, s_M2))
    printIn("add.w %s, #%d" % (M1, coeffi*1))
    polymul(0, M2, M1)
    polymul(1, M2, M1)
    add_reduce_str()

    #3
    printIn("vmov.w %s, %s, %s, %s" % (M1, M2, s_M1, s_M2))
    printIn("add.w %s, #%d" % (M2, coeffi*2))
    polymul(0, M2, M1)
    polymul(1, M2, M1)
    add_reduce_str()

    #4
    printIn("vmov.w %s, %s, %s, %s" % (M1, M2, s_M1, s_M2))
    printIn("add.w %s, #%d" % (M1, coeffi))
    printIn("add.w %s, #%d" % (M2, coeffi*2))
    polymul(0, M2, M1)
    polymul(1, M2, M1)
    add_reduce_str()

    u.epilogue_mod3(f_regs, s_regs)

# main()