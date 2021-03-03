import sys, pathlib
sys.path.append(str(pathlib.Path(__file__).parent.parent.absolute().parent))

from utility import printIn, prologue_mod3, LENGTH
import utility as u

coeffi = LENGTH # n x n
result_coeffi = 2 * coeffi
C1 = 14
C2 = 14

polymul_path = "polymul.polymul_NxN_sch3"
_tmp = __import__(polymul_path, globals(), locals(), ['polymul'], 0)
polymul = _tmp.polymul

UNROLL = False
STACK_SPACE = result_coeffi * 4 + 4

__polymul_name = "__polymul_" + str(coeffi) + "x" + str(coeffi)

V = "r0"
M = "r1"
fh = "r2"
gh = "r3"
s_V = "s0"
s_M = "s1"
s_fh = "s2"
s_gh = "s3"

r03 = "r11"
scr = "r12"

def reduce_str(rs, base = 0):
    for i in range(len(rs)):
        u.reduce_mod3_full(rs[i], scr, r03)

    if base:
        for i in range(len(rs)):
            printIn("str.w %s, [%s, #%d]" % (rs[i], V, 4*i + base))
    else:
        for i in range(1, len(rs)):
            printIn("str.w %s, [%s, #%d]" % (rs[i], V, 4*i))
        printIn("str.w %s, [%s], #%d" % (rs[0], V, 4*len(rs)))


def main():
    if not UNROLL:
        u._func_head(__polymul_name, polymul, coeffi, C1, C2)

    f_name = "__gf_polymul_" + str(coeffi) + "x" + str(coeffi) + "_2x2_x2p2_mod3"
    f_params = "(int *V, int *M, int *fh, int *gh)"
    f_regs = "r4-r12"
    u.prologue_mod3(f_name, f_params, f_regs)

    printIn("vmov.w %s, %s, %s, %s" % (s_V, s_M, V, M))
    printIn("vmov.w %s, %s, %s, %s" % (s_fh, s_gh, fh, gh))

    # stack initial
    printIn("sub.w sp, #%d" % (STACK_SPACE))
    printIn("mov.w r0, sp")
    printIn("movw.w lr, #0")
    printIn("str.w lr, [r0], #1")

    # 1
    printIn("add.w %s, #%d" % (M, coeffi*2))
    if not UNROLL:
        u.bl_polymul(__polymul_name)
    else:
        polymul(coeffi, C1, C2)
    
    # 2
    printIn("mov.w r1, r12")
    printIn("add.w %s, #%d" % (M, coeffi))
    printIn("vmov.w r2, %s" % (s_gh))
    if not UNROLL:
        u.bl_polymul(__polymul_name)
    else:
        polymul(coeffi, C1, C2)

    # 3
    printIn("sub.w r0, #1")
    printIn("mov.w r1, r12")
    printIn("add.w %s, #%d" % (M, coeffi))
    printIn("vmov.w r2, %s" % (s_fh))
    if not UNROLL:
        u.bl_polymul(__polymul_name)
    else:
        polymul(coeffi, C1, C2)

    # 4
    printIn("vmov.w r2, %s" % (s_gh))
    printIn("mov.w r1, r12")
    printIn("add.w %s, #%d" % (M, coeffi))
    if not UNROLL:
        u.bl_polymul(__polymul_name)
    else:
        polymul(coeffi, C1, C2)


    # add
    sp = "r1"
    flag = "lr"
    _M = "r10"
    h1 = [ "r%d" % (x) for x in range(2,6)]
    h2 = [ "r%d" % (x) for x in range(6,10)]

    printIn("vmov.w r0, %s" % (s_V))
    printIn("vmov.w %s, %s" % (_M, s_M))
    printIn("mov.w %s, sp" % (sp))

    for count in range(2):
        printIn("add.w %s, %s, #%d" % (flag, V, coeffi))
        add_loop = "add_loop_x2p2_%d_%d" % (coeffi, count)
        print(add_loop + ":")
        for g_f in range(2):
            g_to_f_distance = 0
            if g_f == 0:
                g_to_f_distance = result_coeffi * 2
            # second mul
            for i in range(len(h2)):
                printIn("ldr.w %s, [%s, #%d]" % (h2[i], sp, i*4 + result_coeffi + g_to_f_distance))
            
            # first mul
            if g_f == 0:
                for i in range(len(h1)):
                    printIn("ldr.w %s, [%s, #%d]" % (h1[i], sp, i*4 + g_to_f_distance))
            else:
                for i in range(1, len(h1)):
                    printIn("ldr.w %s, [%s, #%d]" % (h1[i], sp, i*4))
                printIn("ldr.w %s, [%s], #16" % (h1[0], sp))

            # add
            for i in range(len(h1)):
                printIn("add.w %s, %s" % (h1[i], h2[i]))
            
            # f1, g1
            if count == 0:
                if g_f == 0:
                    for i in range(len(h2)):
                        printIn("ldr.w %s, [%s, #%d]" % (h2[i], _M, i*4 + coeffi))
                else:
                    for i in range(1, len(h2)):
                        printIn("ldr.w %s, [%s, #%d]" % (h2[i], _M, i*4))
                    printIn("ldr.w %s, [%s], #16" % (h2[0], _M))
                # add
                for i in range(len(h1)):
                    printIn("add.w %s, %s" % (h1[i], h2[i]))

            # store
            if g_f == 0: reduce_str(h1, result_coeffi)
            else: reduce_str(h1)
        printIn("cmp.w %s, %s" % (V, flag))
        printIn("bne.w " + add_loop)


    printIn("add.w sp, #%d" % (STACK_SPACE))
    u.epilogue_mod3(f_regs)