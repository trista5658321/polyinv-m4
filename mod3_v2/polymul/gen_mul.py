from utility_polymul import BASE, _P
from func_composite import mul_jump_head_4_0
from polymul_N1xN_sch3_componemt import gen_mul, SCH_polymul_N1xN_mod3_jump_end, polymul

if BASE == 64:
    gen_mul()
elif BASE == 32:
    polymul(BASE,32,32)
    mul_jump_head_4_0(32, 32)

    __polymul_name = "__polymul_" + str(BASE) + "x" + str(_P)
    print(".p2align 2,,3")
    print(".syntax unified")
    print(".text")
    print(".global " + __polymul_name + "")
    print(".type  " + __polymul_name + ", %function")
    print(__polymul_name + ":")
    SCH_polymul_N1xN_mod3_jump_end(BASE, _P)