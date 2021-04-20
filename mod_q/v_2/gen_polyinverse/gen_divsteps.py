import sys, pathlib, math

root = pathlib.Path(__file__).absolute().parent.parent.parent.parent
sys.path.append(str(root))

from mod_q.utility_mod_q import printIn, BASE, _P, MAX_COEFFI, gen_divsteps_base

V_space = MAX_COEFFI // 4
round_half = _P // BASE

print("#include <inttypes.h>\n")
print("int jump%ddivsteps_%d(int minusdelta, int32_t *M, int32_t *f, int32_t *g){" % (_P*2, BASE))
printIn("uint32_t V[%d];" % V_space)
printIn("uint32_t S[%d];" % V_space)
printIn("uint32_t M1[%d]; // %d coefficients * 6" % ((BASE*6)//4, BASE))
printIn("uint32_t *ptr = M;")

printIn("for(int i = 0; i < %d; i++){" % V_space)
printIn("    V[i] = 0;")
printIn("    S[i] = 0;")
printIn("}")

printIn("uint8_t * p_S = (uint8_t *)S;")
printIn("*(S) = 1;")

uvrs_pos = (BASE//4)*2

# Phase 1:
printIn("// 1: %d" % (round_half))
for i in range(round_half):
    gen_divsteps_base()
    printIn("__update_fg_%dx%d(f, g, M1+%d);" % (BASE, _P, uvrs_pos))
    if i == 0:
        printIn("__update_VS_%dx%d(V, S, M1+%d);" % (BASE, BASE, uvrs_pos))
    else:
        printIn("__update_VS_%dx%d(V, S, M1+%d);" % (BASE, BASE*i, uvrs_pos))

# Phase 2:
printIn("// 2")
gen_divsteps_base()
printIn("__update_fg_%dx%d(f, g, M1+%d);" % (BASE, _P, uvrs_pos))
printIn("__update_VS_%dx%d(V, S, M1+%d);" % (BASE, BASE*round_half, uvrs_pos))

_N_max = _P - BASE + (_P % BASE)
round_half_2 = _N_max // BASE

# Phase 3:
printIn("// 3")
for i in range(round_half_2):
    gen_divsteps_base()
    printIn("__update_fg_%dx%d(f, g, M1+%d);" % (BASE, _N_max - BASE*i, uvrs_pos))
    if i == round_half_2 - 1 and _N_max % BASE == 0:
        printIn("__update_VS_%dx%d(V, S, M1+%d);" % (BASE, MAX_COEFFI, uvrs_pos))
    else:
        printIn("__update_VS_%dx%d(V, S, M1+%d);" % (BASE, _P, uvrs_pos))

# Phase 4:
_N_max_2 = _N_max % BASE
base = BASE
while(base > _N_max_2):
    base //= 2

while(_N_max_2 != 0):
    printIn("// 4")
    _uvrs_pos = (base//4)*2
    gen_divsteps_base(base)
    printIn("__update_fg_%dx%d(f, g, M1+%d);" % (base, _N_max_2, _uvrs_pos))
    if _N_max_2 - base == 0:
        printIn("__update_VS_%dx%d(V, S, M1+%d);" % (base, MAX_COEFFI, _uvrs_pos))
    else:
        printIn("__update_VS_%dx%d(V, S, M1+%d);" % (base, _P, _uvrs_pos))
    
    _N_max_2 -= base
    base //= 2

printIn("\n")
printIn("for (int i = 0; i < %d; i++)" % (V_space))
printIn("{")
printIn("    *ptr++ = V[i];")
printIn("}")

printIn("return minusdelta;")
print("}")