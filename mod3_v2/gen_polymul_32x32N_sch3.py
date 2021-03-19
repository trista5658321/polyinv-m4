import sys, pathlib
sys.path.append(str(pathlib.Path(__file__).parent.parent.absolute().parent))

from utility import printIn
import utility as u
from polymul_32x32N_sch3 import polymul

C1 = 14
C2 = 14

# __polymul_name = "__polymul_32x" + str(coeffi)

r03 = "r11"
scr = "r12"

def reduce_str(rs, base = 0):
    for i in range(len(rs)):
        u.reduce_mod3_32(rs[i], scr, r03)

    if base:
        for i in range(len(rs)):
            printIn("str.w %s, [%s, #%d]" % (rs[i], "r0", 4*i + base))
    else:
        for i in range(1, len(rs)):
            printIn("str.w %s, [%s, #%d]" % (rs[i], "r0", 4*i))
        printIn("str.w %s, [%s], #%d" % (rs[0], "r0", 4*len(rs)))


def main():
    for i in range(1, 26):
        coeffi = 32 * i
        __polymul_name = "__polymul_32x" + str(coeffi)
        print(".p2align 2,,3")
        print(".syntax unified")
        print(".text")
        print(".global " + __polymul_name + "")
        print(".type  " + __polymul_name + ", %function")
        print(__polymul_name + ":")
        printIn("push.w {lr}")
        loop = False
        # if coeffi < 800:
        #     loop = False
        polymul(coeffi, C1, C2, loop)
        printIn("pop.w {pc}")

    # f_name = "__jump1536_mod3"
    # f_params = "(int minusdelta, int32_t *M, int32_t *f, int32_t *g)"
    # f_regs = "r4-r12"
    # u.prologue_mod3(f_name, f_params, f_regs)

    # coeffi = 800
    # __polymul_name = "__polymul_32x" + str(coeffi)

    # printIn("vmov.w s0, r0")
    # u.bl_polymul(__polymul_name)

    # #
    # printIn("vmov.w r0, s0")
    # printIn("add.w lr, r0, #832")
    # print("reduction3:")
    # rs = ["r" + str(x) for x in range(2,6)]
    # for i in range(len(rs)):
    #     printIn("ldr.w %s, [%s, #%d]" % (rs[i], "r0", 4*i))
    # reduce_str(rs)
    # printIn("cmp.w lr, r0")
    # printIn("bne.w reduction3")

    # u.epilogue_mod3(f_regs)

main()