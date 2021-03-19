import sys, pathlib
sys.path.append(str(pathlib.Path(__file__).parent.parent.absolute().parent))

from utility import printIn
import utility as u

C1 = 14
C2 = 14

f = "r0"
g = "r1"
M = "r2"

s_f = "s0"
s_g = "s1"
s_M = "s2"

r03 = "r11"
scr = "r12"

def reduce_str(rs, target = f):
    for i in range(len(rs)):
        u.reduce_mod3_full(rs[i], scr, r03)

    for i in range(1, len(rs)):
        printIn("str.w %s, [%s, #%d]" % (rs[i], target, 4*i))
    printIn("str.w %s, [%s], #%d" % (rs[0], target, 4*len(rs)))

def main(LENGTH):
    base_coeffi = 32 # jump N divsteps
    coeffi = LENGTH # 32 x n
    result_coeffi = base_coeffi + coeffi
    __polymul_name = "__polymul_32x" + str(coeffi)
    STACK_SPACE = result_coeffi * 4 + 4

    f_name = "__update_fg_32x" + str(coeffi)
    f_params = "(int *f, int*g, int *M1)"
    f_regs = "r3-r12"
    u.prologue_mod3(f_name, f_params, f_regs)
    printIn("ldr r11, =0x03030303")
    printIn("vmov.w %s, %s, %s, %s" % (s_f, s_g, f, g))
    printIn("vmov.w %s, %s" % (s_M, M))

    # stack initial
    printIn("sub.w sp, #%d" % (STACK_SPACE))
    printIn("mov.w r0, sp")
    printIn("movw.w lr, #0")
    printIn("str.w lr, [r0], #1")

    # 1
    printIn("vmov.w %s, %s" % ("r1", s_M))
    printIn("vmov.w %s, %s" % ("r2", s_f))
    u.bl_polymul(__polymul_name)
    # 2
    printIn("vmov.w %s, %s" % ("r1", s_M))
    printIn("vmov.w %s, %s" % ("r2", s_g))
    printIn("add.w %s, #%d" % ("r1", base_coeffi))
    u.bl_polymul(__polymul_name)
    # 3
    printIn("vmov.w %s, %s" % ("r1", s_M))
    printIn("vmov.w %s, %s" % ("r2", s_f))
    printIn("add.w %s, #%d" % ("r1", base_coeffi*2))
    printIn("sub.w r0, #1")
    u.bl_polymul(__polymul_name)
    # 4
    printIn("vmov.w %s, %s" % ("r1", s_M))
    printIn("vmov.w %s, %s" % ("r2", s_g))
    printIn("add.w %s, #%d" % ("r1", base_coeffi*3))
    u.bl_polymul(__polymul_name)

    # add
    sp = "r10"
    flag = "lr"
    h1 = [ "r%d" % (x) for x in range(2,6)]
    h2 = [ "r%d" % (x) for x in range(6,10)]

    printIn("mov.w %s, sp" % (sp))
    printIn("vmov.w %s, %s, %s, %s" % (f, g, s_f, s_g))
    
    printIn("add.w %s, #%d" % (sp, base_coeffi))
    
    printIn("add.w %s, %s, #%d" % (flag, f, coeffi))
    add_loop = "add_loop_%d" % (coeffi)
    print(add_loop + ":")

    g_to_f_distance = result_coeffi * 2
    for count in range(2): # 0: g, 1: f
        str_target = f
        if count == 0:
            str_target = g
            # first mul
            for i in range(len(h1)):
                printIn("ldr.w %s, [%s, #%d]" % (h1[i], sp, i*4 + g_to_f_distance))
            # second mul
            for i in range(len(h2)):
                printIn("ldr.w %s, [%s, #%d]" % (h2[i], sp, i*4 + result_coeffi + g_to_f_distance))
        else:
            # second mul
            for i in range(len(h2)):
                printIn("ldr.w %s, [%s, #%d]" % (h2[i], sp, i*4 + result_coeffi))
            # first mul
            for i in range(1, len(h1)):
                printIn("ldr.w %s, [%s, #%d]" % (h1[i], sp, i*4))
            printIn("ldr.w %s, [%s], #16" % (h1[0], sp))

        # add
        for i in range(len(h1)):
            u.reduce_mod3_5(h1[i], scr, r03)
        for i in range(len(h1)):
            printIn("add.w %s, %s" % (h1[i], h2[i]))
        # store
        reduce_str(h1,str_target)
    
    printIn("cmp.w %s, %s" % (f, flag))
    printIn("bne.w " + add_loop)

    printIn("add.w sp, #%d" % (STACK_SPACE))
    u.epilogue_mod3(f_regs)

for i in range(1, 25):
    main(32*i)