from utility_polymul import BASE, _P, max_V_coeffi as max_coeffi, do_jump_head_4_0
from func_composite import mul_full, mul_jump_head_4_4, mul_jump_head_4_0
from polymul_N1xN_sch_mod2 import SCH_polymul_N1xN_mod2_jump_end, polymul
    

def gen_mul_without_over_P():
    mul_jump_head = mul_jump_head_4_4
    if do_jump_head_4_0:
        mul_jump_head = mul_jump_head_4_0

    polymul(BASE, max_coeffi, _P)
    
    # for update_fg
    mul_jump_head(_P)

    _N_max = _P - BASE + (_P % BASE)
    round_half_2 = _N_max // BASE
    for i in range(0, round_half_2):
        mul_jump_head(_N_max - BASE * i) 
    
    # for update_VS
    for i in range(1, _P//BASE+1):
        coeffi = BASE * i
        mul_full(coeffi)

    # for update_VS
    __polymul_name = "__polymul_" + str(BASE) + "x" + str(_P) + "_mod2"
    print(".p2align 2,,3")
    print(".syntax unified")
    print(".text")
    print(".global " + __polymul_name + "")
    print(".type  " + __polymul_name + ", %function")
    print(__polymul_name + ":")
    SCH_polymul_N1xN_mod2_jump_end(BASE, _P)

def gen_mul():
    mul_jump_head = mul_jump_head_4_4
    if do_jump_head_4_0:
        mul_jump_head = mul_jump_head_4_0

    polymul(BASE, max_coeffi, _P)

    for i in range(1, _P//BASE+1):
        coeffi = BASE * i
        mul_jump_head(coeffi) # for update_fg
        if coeffi != _P: # for update_VS
            mul_full(coeffi)
    
    if _P % BASE != 0: # for update_fg
        mul_jump_head(_P)
    
    if max_coeffi != _P:
        mul_full(max_coeffi)
    
    # for update_VS
    __polymul_name = "__polymul_" + str(BASE) + "x" + str(_P) + "_mod2"
    print(".p2align 2,,3")
    print(".syntax unified")
    print(".text")
    print(".global " + __polymul_name + "")
    print(".type  " + __polymul_name + ", %function")
    print(__polymul_name + ":")
    SCH_polymul_N1xN_mod2_jump_end(BASE, _P)

if (2 * _P) % BASE == 0:
    gen_mul()
else:
    gen_mul_without_over_P()
