import sys, pathlib
sys.path.append(str(pathlib.Path(__file__).parent.parent.absolute().parent))
from utility_mod3 import BASE, _P, max_V_coeffi, _N_max_2
from utility import printIn, set_stack
import utility as u

V = "r0"
S = "r1"
M = "r2"

s_V = "s0"
s_S = "s1"
s_M = "s2"

r03 = "r11"
scr = "r12"

def reduce_str(rs, target = V):
    for i in range(len(rs)):
        u.reduce_mod3_full(rs[i], scr, r03)

    for i in range(1, len(rs)):
        printIn("str.w %s, [%s, #%d]" % (rs[i], target, 4*i))
    printIn("str.w %s, [%s], #%d" % (rs[0], target, 4*len(rs)))

def main(base, LENGTH, result_coeffi, loop_name_postfix=""):
    base_coeffi = base # jump N divsteps
    coeffi = LENGTH # BASE x n
    __polymul_name = "__polymul_" + str(base_coeffi) + "x" + str(coeffi)
    STACK_SPACE = result_coeffi * 4 + 4

    f_name = "__update_VS_" + str(base_coeffi) + "x" + str(coeffi)
    f_params = "(int *V, int *S, int *M1)"
    f_regs = "r3-r12"
    u.prologue_mod3(f_name, f_params, f_regs)
    printIn("ldr r11, =0x03030303")
    printIn("vmov.w %s, %s, %s, %s" % (s_V, s_S, V, S))
    printIn("vmov.w %s, %s" % (s_M, M))

    # stack initial
    set_stack(STACK_SPACE)
    
    printIn("mov.w r0, sp")
    printIn("movw.w lr, #0")
    printIn("str.w lr, [r0], #1")

    # 1
    printIn("vmov.w %s, %s" % ("r1", s_M))
    printIn("vmov.w %s, %s" % ("r2", s_V))
    u.bl_polymul(__polymul_name)
    # 3
    printIn("vmov.w %s, %s" % ("r1", s_M))
    printIn("vmov.w %s, %s" % ("r2", s_V))
    printIn("add.w %s, #%d" % ("r1", base_coeffi*2))
    u.bl_polymul(__polymul_name)
    # 2
    printIn("vmov.w %s, %s" % ("r1", s_M))
    printIn("vmov.w %s, %s" % ("r2", s_S))
    printIn("add.w %s, #%d" % ("r1", base_coeffi))
    printIn("sub.w r0, #1")
    u.bl_polymul(__polymul_name)
    # 4
    printIn("vmov.w %s, %s" % ("r1", s_M))
    printIn("vmov.w %s, %s" % ("r2", s_S))
    printIn("add.w %s, #%d" % ("r1", base_coeffi*3))
    u.bl_polymul(__polymul_name)

    # add
    sp = "r10"
    flag = "lr"
    h1 = [ "r%d" % (x) for x in range(2,6)]
    h2 = [ "r%d" % (x) for x in range(6,10)]

    printIn("mov.w %s, sp" % (sp))
    printIn("vmov.w %s, %s, %s, %s" % (V, S, s_V, s_S))
    
    flag_bytes = result_coeffi
    if flag_bytes > _P: flag_bytes = _P
    if coeffi == max_V_coeffi: flag_bytes = max_V_coeffi

    printIn("add.w %s, %s, #%d" % (flag, V, flag_bytes))
    add_loop = "add_loop_vs_%d" % (coeffi)
    if loop_name_postfix:
        add_loop += ("_" + loop_name_postfix)
    print(add_loop + ":")

    g_to_f_distance = result_coeffi
    m0_to_m1_distance = 2 * result_coeffi
    for count in range(2): # 0: S, 1: V
        str_target = V
        if count == 0:
            str_target = S
            # first mul
            for i in range(len(h1)):
                printIn("ldr.w %s, [%s, #%d]" % (h1[i], sp, i*4 + g_to_f_distance))
            # second mul
            for i in range(len(h2)):
                printIn("ldr.w %s, [%s, #%d]" % (h2[i], sp, i*4 + m0_to_m1_distance + g_to_f_distance))
        else:
            # second mul
            for i in range(len(h2)):
                printIn("ldr.w %s, [%s, #%d]" % (h2[i], sp, i*4 + m0_to_m1_distance))
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
    
    printIn("cmp.w %s, %s" % (V, flag))
    printIn("bne.w " + add_loop)

    set_stack(STACK_SPACE, "end")
    u.epilogue_mod3(f_regs)

for i in range(1, _P//BASE+1):
    length = BASE*i
    result_coeffi = BASE + length
    if length == _P:
        result_coeffi = _P
    main(BASE, BASE*i, result_coeffi)

if _P % BASE != 0:
    main(BASE, _P, _P)

if _N_max_2 == 0:
    if _P != max_V_coeffi:
        main(BASE, max_V_coeffi, BASE+max_V_coeffi)
else:
    base = BASE
    while(base > _N_max_2):
        base //= 2
    
    last_deg = _N_max_2
    while(last_deg != 0):
        if last_deg - base == 0:
            main(base, max_V_coeffi, max_V_coeffi)
        else:
            main(base, _P, _P, str(base))
            
        last_deg -= base
        base //= 2
