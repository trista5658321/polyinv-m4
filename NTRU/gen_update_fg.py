import sys, pathlib
sys.path.append(str(pathlib.Path(__file__).parent.absolute().parent))
from NTRU.utility_mod2 import BASE, _P, do_jump_head_4_0, _N_max_2, coeffi_per_block, bytes_per_coeffi
from utility import printIn, set_stack
import utility as u

f = "r0"
g = "r1"
M = "r2"

s_f = "s0"
s_g = "s1"
s_M = "s2"

def str_back(rs, target = f):
    for i in range(1, len(rs)):
        printIn("str.w %s, [%s, #%d]" % (rs[i], target, 4*i))
    printIn("str.w %s, [%s], #%d" % (rs[0], target, 4*len(rs)))

def main(base, LENGTH):
    base_coeffi = base # jump N divsteps
    base_bytes = int(base * bytes_per_coeffi)
    coeffi = LENGTH # base x n
    denominator_x_power = coeffi_per_block # (uf + vg)x / base -> (uf + vg)x / denominator_x_power

    result_coeffi = coeffi # base_coeffi x coeffi[base_coeffi - 8: -8] -> coeffi
    if do_jump_head_4_0:
        result_coeffi += denominator_x_power

    __polymul_name = "__polymul_" + str(base_coeffi) + "x" + str(coeffi) + "_mod2" + "_jump_head"
    STACK_SPACE = result_coeffi * bytes_per_coeffi * 4 + 4

    f_name = "__update_fg_" + str(base_coeffi) + "x" + str(coeffi) + "_mod2"
    f_params = "(int *f, int*g, int *M1)"
    f_regs = "r3-r12"
    u.prologue_mod3(f_name, f_params, f_regs)
    printIn("vmov.w %s, %s, %s, %s" % (s_f, s_g, f, g))
    printIn("vmov.w %s, %s" % (s_M, M))

    # stack initial
    set_stack(STACK_SPACE)
    printIn("mov.w r0, sp")

    # 1
    printIn("vmov.w %s, %s" % ("r1", s_M))
    printIn("vmov.w %s, %s" % ("r2", s_f))
    u.bl_polymul(__polymul_name) # uf
    # 2
    printIn("vmov.w %s, %s" % ("r1", s_M))
    printIn("vmov.w %s, %s" % ("r2", s_g))
    printIn("add.w %s, #%d" % ("r1", base_bytes))
    u.bl_polymul(__polymul_name) # vg
    # 3
    printIn("vmov.w %s, %s" % ("r1", s_M))
    printIn("vmov.w %s, %s" % ("r2", s_f))
    printIn("add.w %s, #%d" % ("r1", base_bytes*2))
    u.bl_polymul(__polymul_name) # rf
    # 4
    printIn("vmov.w %s, %s" % ("r1", s_M))
    printIn("vmov.w %s, %s" % ("r2", s_g))
    printIn("add.w %s, #%d" % ("r1", base_bytes*3))
    u.bl_polymul(__polymul_name) # sg

    # add
    sp = "r10"
    flag = "lr"
    h1 = [ "r%d" % (x) for x in range(2,6)]
    h2 = [ "r%d" % (x) for x in range(6,10)]

    str_coeffi = (result_coeffi - denominator_x_power)
    str_bytes = int(str_coeffi * bytes_per_coeffi)
    
    done_bytes_per_loop = 16
    loop_last_bytes = (str_bytes % done_bytes_per_loop)
    loop_last = loop_last_bytes // 4 # regs amount

    add_mul_result_distance = result_coeffi * bytes_per_coeffi # offset between uf and vg
    diff_mul_result_distance = 2 * result_coeffi * bytes_per_coeffi # offset between uf and rf

    printIn("mov.w %s, sp" % (sp))
    printIn("vmov.w %s, %s, %s, %s" % (f, g, s_f, s_g))
    printIn("add.w %s, %s, #%d" % (flag, f, str_bytes))

    # f = (uf+vg) / denominator_x_power
    # g = (rf+sg) / denominator_x_power
    printIn("add.w %s, #%d" % (sp, denominator_x_power * bytes_per_coeffi))
    

    # (uf+vg)x / denominator_x_power -> (uf+vg) / (denominator_x_power - 1)
    # get the lost coeffi
    uf_pre_coeffi = "r11"
    rf_pre_coeffi = "r12"
    uf_last_coeffi = "r0"
    rf_last_coeffi = "r1"
    printIn("ldr.w %s, [%s, #%d]" % (uf_pre_coeffi, sp, -4))
    printIn("ldr.w %s, [%s, #%d]" % (rf_pre_coeffi, sp, -4 + add_mul_result_distance))
    printIn("ubfx.w %s, %s, #28, #1" % (uf_pre_coeffi, uf_pre_coeffi))
    printIn("ubfx.w %s, %s, #28, #1" % (rf_pre_coeffi, rf_pre_coeffi))

    add_loop = "add_loop_%d" % (coeffi)
    print(add_loop + ":")

    for count in range(2): # 0: g, 1: f
        str_target = f
        if count == 0:
            str_target = g
            # first mul
            for i in range(len(h1)):
                printIn("ldr.w %s, [%s, #%d]" % (h1[i], sp, i*4 + diff_mul_result_distance))
            # second mul
            for i in range(len(h2)):
                printIn("ldr.w %s, [%s, #%d]" % (h2[i], sp, i*4 + add_mul_result_distance + diff_mul_result_distance))
        else:
            # second mul
            for i in range(len(h2)):
                printIn("ldr.w %s, [%s, #%d]" % (h2[i], sp, i*4 + add_mul_result_distance))
            # first mul
            for i in range(1, len(h1)):
                printIn("ldr.w %s, [%s, #%d]" % (h1[i], sp, i*4))
            printIn("ldr.w %s, [%s], #16" % (h1[0], sp))

            printIn("vmov.w %s, %s, %s, %s" % (s_f, s_g, f, g))

            # combine the lost coeffi
            for i in range(len(h1)):
                start_value_tmp = [uf_pre_coeffi, uf_last_coeffi][ i & 1 ]
                end_value_tmp = [uf_last_coeffi, uf_pre_coeffi][ i & 1 ]
                printIn("ubfx.w %s, %s, #28, #1" % (end_value_tmp, h1[i]))
                printIn("eor.w %s, %s, %s, LSL #4" % (h1[i], start_value_tmp, h1[i]))

            for i in range(len(h2)):
                start_value_tmp = [rf_pre_coeffi, rf_last_coeffi][ i & 1 ]
                end_value_tmp = [rf_last_coeffi, rf_pre_coeffi][ i & 1 ]
                printIn("ubfx.w %s, %s, #28, #1" % (end_value_tmp, h2[i]))
                printIn("eor.w %s, %s, %s, LSL #4" % (h2[i], start_value_tmp, h2[i]))
        
            printIn("vmov.w %s, %s, %s, %s" % (f, g, s_f, s_g))
        
        # add
        for i in range(len(h1)):
            printIn("eor.w %s, %s" % (h1[i], h2[i]))
        # store
        str_back(h1,str_target)
    
    printIn("cmp.w %s, %s" % (f, flag))
    printIn("bne.w " + add_loop)

    if loop_last:
        for count in range(2): # 0: g, 1: f
            str_target = f
            if count == 0:
                str_target = g
                # first mul
                for i in range(loop_last):
                    printIn("ldr.w %s, [%s, #%d]" % (h1[i], sp, i*4 + diff_mul_result_distance))
                # second mul
                for i in range(loop_last):
                    printIn("ldr.w %s, [%s, #%d]" % (h2[i], sp, i*4 + add_mul_result_distance + diff_mul_result_distance))
            else:
                # second mul
                for i in range(loop_last):
                    printIn("ldr.w %s, [%s, #%d]" % (h2[i], sp, i*4 + add_mul_result_distance))
                # first mul
                for i in range(1, loop_last):
                    printIn("ldr.w %s, [%s, #%d]" % (h1[i], sp, i*4))
                printIn("ldr.w %s, [%s], #%d" % (h1[0], sp, loop_last * 4))

                printIn("vmov.w %s, %s, %s, %s" % (s_f, s_g, f, g))

                # combine the lost coeffi
                for i in range(loop_last):
                    start_value_tmp = [uf_pre_coeffi, uf_last_coeffi][ i & 1 ]
                    end_value_tmp = [uf_last_coeffi, uf_pre_coeffi][ i & 1 ]
                    printIn("and.w %s, %s, #0x1" % (end_value_tmp, h1[i]))
                    printIn("eor.w %s, %s, %s, LSL #4" % (h1[i], start_value_tmp, h1[i]))

                for i in range(loop_last):
                    start_value_tmp = [rf_pre_coeffi, rf_last_coeffi][ i & 1 ]
                    end_value_tmp = [rf_last_coeffi, rf_pre_coeffi][ i & 1 ]
                    printIn("and.w %s, %s, #0x1" % (end_value_tmp, h2[i]))
                    printIn("eor.w %s, %s, %s, LSL #4" % (h2[i], start_value_tmp, h2[i]))

            printIn("vmov.w %s, %s, %s, %s" % (f, g, s_f, s_g))

            # add
            for i in range(loop_last):
                printIn("eor.w %s, %s" % (h1[i], h2[i]))
            # store
            tmp_arr = h1[:loop_last]
            str_back(tmp_arr,str_target)

    set_stack(STACK_SPACE, "end")
    u.epilogue_mod3(f_regs)

if _N_max_2 == 0:
    for i in range(1, _P//BASE + 1):
        main(BASE, BASE*i)

    if _P % BASE != 0:
        main(BASE, _P)

else:
    main(BASE, _P)
    
    _N_max = _P - BASE + (_P % BASE)
    round_half_2 = _N_max // BASE
    for i in range(0, round_half_2):
        main(BASE, _N_max - BASE * i)

    base = BASE
    while(base > _N_max_2):
        base //= 2
    
    last_deg = _N_max_2
    while(last_deg != 0):
        main(base, last_deg)
        last_deg -= base
        base //= 2