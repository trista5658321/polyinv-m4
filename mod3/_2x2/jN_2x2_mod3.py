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
STACK_SPACE = result_coeffi * 8 + 4

__polymul_name = "__polymul_" + str(coeffi) + "x" + str(coeffi)

M = "r0"
M1 = "r1"
M2 = "r2"

s_M = "s0"
s_M1 = "s1"
s_M2 = "s2"

r03 = "r11"
scr = "r12"

def mul():
    if not UNROLL:
        u.bl_polymul(__polymul_name)
    else:
        polymul(coeffi, C1, C2)

def reset_args():
    printIn("vmov.w %s, %s, %s, %s" % (M1, M2, s_M1, s_M2))

def get_M12_elem(m, e):
    offset = 0
    if e == "v":
        offset = 1
    elif e == "r":
        offset = 2
    elif e == "s":
        offset = 3
    printIn("add.w %s, #%d" % (m, coeffi * offset))

def reduce_str(rs):
    for i in range(len(rs)):
        u.reduce_mod3_full(rs[i], scr, r03)

    for i in range(1, len(rs)):
        printIn("str.w %s, [%s, #%d]" % (rs[i], M, 4*i))
    printIn("str.w %s, [%s], #%d" % (rs[0], M, 4*len(rs)))

def main(merge = False):
    if not UNROLL:
        if not merge:
            u._func_head(__polymul_name, polymul, coeffi, C1, C2)

    f_name = "__gf_polymul_" + str(coeffi) + "x" + str(coeffi) + "_2x2_x_2x2_mod3"
    f_params = "(int *M, int *M1, int *M2)"
    f_regs = "r3-r12"
    u.prologue_mod3(f_name, f_params, f_regs)

    printIn("vmov.w %s, %s, %s, %s" % (s_M, s_M1, M, M1))
    printIn("vmov.w %s, %s" % (s_M2, M2))

    # stack initial
    if coeffi == 256:
        printIn("movw.w r12, #%d" % (STACK_SPACE))
        printIn("movt.w r12, #0")
        printIn("sub.w sp, r12")
    else:
        printIn("sub.w sp, #%d" % (STACK_SPACE))
    printIn("mov.w r0, sp")
    printIn("movw.w lr, #0")
    printIn("str.w lr, [r0], #1")

    # 1
    mul()
    # 2
    reset_args()
    get_M12_elem(M1, "v")
    mul()
    # 3
    reset_args()
    get_M12_elem(M2, "r")
    mul()
    # 4
    reset_args()
    get_M12_elem(M2, "r")
    get_M12_elem(M1, "v")
    mul()

    printIn("sub.w r0, #1")

    # 5
    reset_args()
    get_M12_elem(M2, "v")
    get_M12_elem(M1, "r")
    mul()
    # 6
    reset_args()
    get_M12_elem(M2, "v")
    get_M12_elem(M1, "s")
    mul()
    # 7
    reset_args()
    get_M12_elem(M2, "s")
    get_M12_elem(M1, "r")
    mul()
    # 8
    reset_args()
    get_M12_elem(M2, "s")
    get_M12_elem(M1, "s")
    mul()

    # add
    sp = "r1"
    flag = "lr"
    h1 = [ "r%d" % (x) for x in range(2,7)]
    h2 = [ "r%d" % (x) for x in range(7,11)] + ["r12"]
    remainder = (result_coeffi) % len(h1)
    printIn("vmov.w r0, %s" % (s_M))
    printIn("mov.w %s, sp" % (sp))
    printIn("add.w %s, %s, #%d" % (flag, M, result_coeffi*4 - remainder*4))
    add_loop = "add_loop_2x2_%d" % (coeffi)
    print(add_loop + ":")

    for i in range(len(h2)):
        printIn("ldr.w %s, [%s, #%d]" % (h2[i], sp, i*4 + result_coeffi*4))
    for i in range(1, len(h1)):
        printIn("ldr.w %s, [%s, #%d]" % (h1[i], sp, i*4))
    printIn("ldr.w %s, [%s], #%d" % (h1[0], sp, 4*len(h1)))

    for i in range(len(h1)):
        printIn("add.w %s, %s" % (h1[i], h2[i]))

    reduce_str(h1)

    printIn("cmp.w %s, %s" % (M, flag))
    printIn("bne.w " + add_loop)

    if remainder > 0:
        for i in range(remainder):
            printIn("ldr.w %s, [%s, #%d]" % (h2[i], sp, i*4 + result_coeffi*4))
        for i in range(1, remainder):
            printIn("ldr.w %s, [%s, #%d]" % (h1[i], sp, i*4))
        printIn("ldr.w %s, [%s], #%d" % (h1[0], sp, 4*remainder))
        for i in range(remainder):
            printIn("add.w %s, %s" % (h1[i], h2[i]))
        tmp_arr = h1[:remainder]
        reduce_str(tmp_arr)
    
    if coeffi == 256:
        printIn("movw.w r12, #%d" % (STACK_SPACE))
        printIn("movt.w r12, #0")
        printIn("add.w sp, r12")
    else:
        printIn("add.w sp, #%d" % (STACK_SPACE))
    u.epilogue_mod3(f_regs)