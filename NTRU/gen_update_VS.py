import sys, pathlib
sys.path.append(str(pathlib.Path(__file__).parent.absolute().parent))
from NTRU.utility_mod2 import BASE, _P, max_V_coeffi, _N_max_2, bytes_per_coeffi
from utility import printIn, set_stack
import utility as u

V = "r0"
S = "r1"
M = "r2"

s_V = "s0"
s_S = "s1"
s_M = "s2"

sp = "r10"
flag = "lr"
h1 = [ "r%d" % (x) for x in range(2,6)]
h2 = [ "r%d" % (x) for x in range(6,10)]

uV_pre_coeffi = "r11"
rV_pre_coeffi = "r12"
uV_last_coeffi = "r0"
rV_last_coeffi = "r1"

def add_two_mul(diff_mul_result_distance, mul_result_distance, reg_amount = 4):
    for count in range(2): # 0: S, 1: V
        str_target = V
        if count == 0:
            str_target = S
            # first mul
            for i in range(reg_amount):
                printIn("ldr.w %s, [%s, #%d]" % (h1[i], sp, i*4 + diff_mul_result_distance))
            # second mul
            for i in range(reg_amount):
                printIn("ldr.w %s, [%s, #%d]" % (h2[i], sp, i*4 + mul_result_distance + diff_mul_result_distance))
        else:
            # second mul
            for i in range(reg_amount):
                printIn("ldr.w %s, [%s, #%d]" % (h2[i], sp, i*4 + mul_result_distance))
            # first mul
            for i in range(1, reg_amount):
                printIn("ldr.w %s, [%s, #%d]" % (h1[i], sp, i*4))
            printIn("ldr.w %s, [%s], #%d" % (h1[0], sp, reg_amount*4))

        # h1: * x
        printIn("vmov.w %s, %s, %s, %s" % (s_V, s_S, V, S))
        for i in range(reg_amount):
            start_reg_set = [[rV_pre_coeffi, rV_last_coeffi], [uV_pre_coeffi, uV_last_coeffi]][count]
            end_reg_set = [[rV_last_coeffi, rV_pre_coeffi], [uV_last_coeffi, uV_pre_coeffi]][count]
            start_value_tmp = start_reg_set[ i & 1 ]
            end_value_tmp = end_reg_set[ i & 1 ]
            printIn("ubfx.w %s, %s, #28, #1" % (end_value_tmp, h1[i]))
            printIn("eor.w %s, %s, %s, LSL #4" % (h1[i], start_value_tmp, h1[i]))
        printIn("vmov.w %s, %s, %s, %s" % (V, S, s_V, s_S))

        # add
        for i in range(reg_amount):
            printIn("eor.w %s, %s" % (h1[i], h2[i]))

        # store
        tmp_arr = h1[:reg_amount]
        str_back(tmp_arr, str_target)

def str_back(rs, target = V):
    for i in range(1, len(rs)):
        printIn("str.w %s, [%s, #%d]" % (rs[i], target, 4*i))
    printIn("str.w %s, [%s], #%d" % (rs[0], target, 4*len(rs)))

def main(base, LENGTH, result_coeffi, loop_name_postfix=""):
    base_coeffi = base # jump N divsteps
    base_bytes = int(base * bytes_per_coeffi)
    coeffi = LENGTH # BASE x n
    __polymul_name = "__polymul_" + str(base_coeffi) + "x" + str(coeffi) + "_mod2"
    STACK_SPACE = result_coeffi * bytes_per_coeffi * 4 + 4

    f_name = "__update_VS_" + str(base_coeffi) + "x" + str(coeffi) + "_mod2"
    f_params = "(int *V, int *S, int *M1)"
    f_regs = "r3-r12"
    u.prologue_mod3(f_name, f_params, f_regs)
    printIn("vmov.w %s, %s, %s, %s" % (s_V, s_S, V, S))
    printIn("vmov.w %s, %s" % (s_M, M))

    # stack initial
    set_stack(STACK_SPACE)
    
    printIn("mov.w r0, sp")

    # 1
    printIn("vmov.w %s, %s" % ("r1", s_M))
    printIn("vmov.w %s, %s" % ("r2", s_V))
    u.bl_polymul(__polymul_name) # uV
    # 3
    printIn("vmov.w %s, %s" % ("r1", s_M))
    printIn("vmov.w %s, %s" % ("r2", s_V))
    printIn("add.w %s, #%d" % ("r1", base_bytes*2))
    u.bl_polymul(__polymul_name) # rV
    # 2
    printIn("vmov.w %s, %s" % ("r1", s_M))
    printIn("vmov.w %s, %s" % ("r2", s_S))
    printIn("add.w %s, #%d" % ("r1", base_bytes))
    u.bl_polymul(__polymul_name) # vS
    # 4
    printIn("vmov.w %s, %s" % ("r1", s_M))
    printIn("vmov.w %s, %s" % ("r2", s_S))
    printIn("add.w %s, #%d" % ("r1", base_bytes*3))
    u.bl_polymul(__polymul_name) # sS

    # add
    printIn("mov.w %s, sp" % (sp))
    printIn("vmov.w %s, %s, %s, %s" % (V, S, s_V, s_S))

    # uVx, rVx
    printIn("movw.w %s, #0" % (uV_pre_coeffi))
    printIn("movw.w %s, #0" % (rV_pre_coeffi))

    str_coeffi = result_coeffi
    if str_coeffi > _P: str_coeffi = _P
    if coeffi == max_V_coeffi: str_coeffi = max_V_coeffi
    str_bytes = int(str_coeffi * bytes_per_coeffi)

    done_bytes_per_loop = 16
    loop_last_bytes = (str_bytes % done_bytes_per_loop)
    flag_bytes = str_bytes - loop_last_bytes
    loop_last = loop_last_bytes // 4 # regs amount

    printIn("add.w %s, %s, #%d" % (flag, V, flag_bytes))
    
    add_loop = "add_loop_vs_%d" % (coeffi)
    if loop_name_postfix:
        add_loop += ("_" + loop_name_postfix)
    print(add_loop + ":")

    diff_mul_result_distance = result_coeffi * bytes_per_coeffi # offset between uVx and rVx
    mul_result_distance = 2 * result_coeffi * bytes_per_coeffi # offset between uVx and vS
    
    add_two_mul(diff_mul_result_distance, mul_result_distance)

    printIn("cmp.w %s, %s" % (V, flag))
    printIn("bne.w " + add_loop)

    if loop_last:
        add_two_mul(diff_mul_result_distance, mul_result_distance, loop_last)

    set_stack(STACK_SPACE, "end")
    u.epilogue_mod3(f_regs)

for i in range(1, _P//BASE+1):
    length = BASE*i
    result_coeffi = BASE + length
    if length != _P:
        main(BASE, BASE*i, result_coeffi)

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

# result coeffi
# 1. mul_coeffi_len < _P: full (BASE + mul_coeffi_len)
# 2. mul_coeffi_len = _P: jump end (_P)

# 3. mul_coeffi_len = max_V_coeffi:
# 3.1 _N_max_2 == 0 & _P != max_V_coeffi: full (BASE + max_V_coeffi)
# 3.2 _N_max_2 !=0: jump end (max_V_coeffi)