from utility_polymul import BASE, _P, max_V_coeffi as max_coeffi, _P_ZERO_coeffi
from func_composite import mul_full, mul_jump_head_4_4, mul_jump_head_4_0
from polymul_N1xN_sch3_componemt import SCH_polymul_N1xN_mod3_jump_end, polymul
    

def gen_mul_without_over_P():
    mul_jump_head = mul_jump_head_4_4
    if _P_ZERO_coeffi < 4:
        mul_jump_head = mul_jump_head_4_0

    polymul(BASE, max_coeffi, _P)
    
    # for update_fg
    mul_jump_head(_P)
    for i in range(0, _P//BASE-1):
        first_coeffi = BASE - (_P % BASE)
        mul_jump_head(_P - first_coeffi - BASE * i) 
    
    # for update_VS
    for i in range(1, _P//BASE+1):
        coeffi = BASE * i
        mul_full(coeffi)

    # for update_VS
    __polymul_name = "__polymul_" + str(BASE) + "x" + str(_P)
    print(".p2align 2,,3")
    print(".syntax unified")
    print(".text")
    print(".global " + __polymul_name + "")
    print(".type  " + __polymul_name + ", %function")
    print(__polymul_name + ":")
    SCH_polymul_N1xN_mod3_jump_end(BASE, _P)

def gen_mul():
    mul_jump_head = mul_jump_head_4_4
    if _P_ZERO_coeffi < 4:
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
    __polymul_name = "__polymul_" + str(BASE) + "x" + str(_P)
    print(".p2align 2,,3")
    print(".syntax unified")
    print(".text")
    print(".global " + __polymul_name + "")
    print(".type  " + __polymul_name + ", %function")
    print(__polymul_name + ":")
    SCH_polymul_N1xN_mod3_jump_end(BASE, _P)

if (2 * _P) % BASE == 0:
    gen_mul()
# elif (2 * _P) % BASE == BASE // 2:
else:
    gen_mul_without_over_P()
