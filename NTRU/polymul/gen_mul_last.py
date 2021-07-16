from utility_polymul import BASE, _P, max_V_coeffi as max_coeffi, do_jump_head_4_0
from func_composite import mul_jump_head_4_4, mul_jump_head_4_0
from polymul_N1xN_sch_mod2 import SCH_polymul_N1xN_mod2_jump_end, polymul


mul_jump_head = mul_jump_head_4_4
if do_jump_head_4_0:
    mul_jump_head = mul_jump_head_4_0

polymul(BASE, BASE, BASE)
mul_jump_head(BASE, BASE)

__polymul_name = "__polymul_" + str(BASE) + "x" + str(max_coeffi) + "_mod2"
print(".p2align 2,,3")
print(".syntax unified")
print(".text")
print(".global " + __polymul_name + "")
print(".type  " + __polymul_name + ", %function")
print(__polymul_name + ":")
SCH_polymul_N1xN_mod2_jump_end(BASE, max_coeffi)