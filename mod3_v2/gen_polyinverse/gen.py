import sys, pathlib, math
sys.path.append(str(pathlib.Path(__file__).parent.parent.absolute().parent))

from utility import printIn
from mod3_v2.utility_mod3 import _P, max_V_coeffi

V_space = max_V_coeffi // 4
round_half = _P // 64

print("#include <inttypes.h>\n")
print("int jump%ddivsteps_mod3_64(int minusdelta, int32_t *M, int32_t *f, int32_t *g){" % (_P*2))
printIn("uint32_t V[%d];" % V_space)
printIn("uint32_t S[%d];" % V_space)
printIn("uint32_t M1[96]; // 64 coefficients * 6")
printIn("uint32_t *ptr = M;")

printIn("for(int i = 0; i < %d; i++){" % V_space)
printIn("    V[i] = 0;")
printIn("    S[i] = 0;")
printIn("}")

printIn("uint8_t * p_S = (uint8_t *)S;")
printIn("*(S) = 1;")


# Phase 1:
printIn("// 1: %d" % (round_half))
for i in range(round_half):
    printIn("minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);")
    printIn("__update_fg_64x%d(f, g, M1+32);" % (_P))
    if i == 0:
        printIn("__update_VS_64x%d(V, S, M1+32);" % (64))
    else:
        printIn("__update_VS_64x%d(V, S, M1+32);" % (64*i))

# Phase 2:
printIn("// 2")
printIn("minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);")
printIn("__update_fg_64x%d(f, g, M1+32);" % (_P))
printIn("__update_VS_64x%d(V, S, M1+32);" % (64*round_half))

_N_max = _P - 64 + (_P % 64)
round_half_2 = _N_max // 64

# Phase 3:
printIn("// 3")
for i in range(round_half_2):
    printIn("minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);")
    printIn("__update_fg_64x%d(f, g, M1+32);" % (_N_max - 64*i))
    if i == round_half_2 - 1 and _N_max % 64 == 0:
        printIn("__update_VS_64x%d(V, S, M1+32);" % (max_V_coeffi))
    else:
        printIn("__update_VS_64x%d(V, S, M1+32);" % (_P))

# Phase 4:
if _N_max % 64 != 0:
    _N_max_2 = _N_max % 64 
    printIn("// 4")
    if _N_max_2 <= 32:
        printIn("minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);")
        printIn("__update_fg_32x%d(f, g, M1+16);" % (_N_max_2))
        printIn("__update_VS_32x%d(V, S, M1+16);" % (max_V_coeffi))

printIn("\n")
printIn("for (int i = 0; i < %d; i++)" % (V_space))
printIn("{")
printIn("    *ptr++ = V[i];")
printIn("}")

printIn("return minusdelta;")
print("}")