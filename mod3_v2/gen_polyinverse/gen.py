import sys, pathlib, math
sys.path.append(str(pathlib.Path(__file__).parent.parent.absolute().parent))

from utility import printIn
from mod3_v2.utility_mod3 import BASE, _P, max_V_coeffi

V_space = max_V_coeffi // 4
round_half = _P // BASE

def f_proto():
    print("extern int jump%ddivsteps_mod3(int minusdelta, uint32_t *M1, uint32_t *f, uint32_t *g);" % (BASE))
    print("int jump%ddivsteps_mod3_%d(int minusdelta, uint32_t *M, uint32_t *f, uint32_t *g);\n" % (_P*2, BASE))
    print("extern void __update_fg_%dx%d(uint32_t *f, uint32_t *g, uint32_t *M1);" % (BASE, _P))
    for i in range(1, round_half):
        print("extern void __update_VS_%dx%d(uint32_t *V, uint32_t *S, uint32_t *M1);" % (BASE, BASE*i))
    
    #2
    if BASE * round_half != _P:
        print("extern void __update_VS_%dx%d(uint32_t *V, uint32_t *S, uint32_t *M1);" % (BASE, BASE*round_half))

    #3
    _N_max = _P - BASE + (_P % BASE)
    round_half_2 = _N_max // BASE

    # Phase 3:
    print("extern void __update_VS_%dx%d(uint32_t *V, uint32_t *S, uint32_t *M1);" % (BASE, _P))
    if _N_max % BASE == 0:
            print("extern void __update_VS_%dx%d(uint32_t *V, uint32_t *S, uint32_t *M1);" % (BASE, max_V_coeffi))
    for i in range(round_half_2):
        print("extern void __update_fg_%dx%d(uint32_t *f, uint32_t *g, uint32_t *M1);" % (BASE, _N_max - BASE*i))
    
    # Phase 4:
    _N_max_2 = _N_max % BASE
    base = BASE
    while(base > _N_max_2):
        base //= 2

    while(_N_max_2 != 0):
        print("extern int jump%ddivsteps_mod3(int minusdelta, uint32_t *M1, uint32_t *f, uint32_t *g);" % (base))
        print("extern void __update_fg_%dx%d(uint32_t *f, uint32_t *g, uint32_t *M1);" % (base, _N_max_2))
        if _N_max_2 - base == 0:
            print("extern void __update_VS_%dx%d(uint32_t *V, uint32_t *S, uint32_t *M1);" % (base, max_V_coeffi))
        else:
            print("extern void __update_VS_%dx%d(uint32_t *V, uint32_t *S, uint32_t *M1);" % (base, _P))
        
        _N_max_2 -= base
        base //= 2
    
    print("")

print("#include <inttypes.h>\n")

f_proto()

print("int jump%ddivsteps_mod3_%d(int minusdelta, uint32_t *M, uint32_t *f, uint32_t *g){" % (_P*2, BASE))
printIn("uint32_t V[%d];" % V_space)
printIn("uint32_t S[%d];" % V_space)
printIn("uint32_t M1[%d]; // %d coefficients * 6" % ((BASE*6)//4, BASE))
printIn("uint32_t *ptr = M;")

printIn("for(int i = 0; i < %d; i++){" % V_space)
printIn("    V[i] = 0;")
printIn("    S[i] = 0;")
printIn("}")

# printIn("uint8_t * p_S = (uint8_t *)S;")
printIn("*(S) = 1;")

uvrs_pos = (BASE//4)*2

# Phase 1:
printIn("// 1: %d" % (round_half))
for i in range(round_half):
    printIn("minusdelta = jump%ddivsteps_mod3(minusdelta,M1,f,g);" % (BASE))
    printIn("__update_fg_%dx%d(f, g, M1+%d);" % (BASE, _P, uvrs_pos))
    if i == 0:
        printIn("__update_VS_%dx%d(V, S, M1+%d);" % (BASE, BASE, uvrs_pos))
    else:
        printIn("__update_VS_%dx%d(V, S, M1+%d);" % (BASE, BASE*i, uvrs_pos))

# Phase 2:
printIn("// 2")
printIn("minusdelta = jump%ddivsteps_mod3(minusdelta,M1,f,g);" % (BASE))
printIn("__update_fg_%dx%d(f, g, M1+%d);" % (BASE, _P, uvrs_pos))
printIn("__update_VS_%dx%d(V, S, M1+%d);" % (BASE, BASE*round_half, uvrs_pos))

_N_max = _P - BASE + (_P % BASE)
round_half_2 = _N_max // BASE

# Phase 3:
printIn("// 3")
for i in range(round_half_2):
    printIn("minusdelta = jump%ddivsteps_mod3(minusdelta,M1,f,g);" % (BASE))
    printIn("__update_fg_%dx%d(f, g, M1+%d);" % (BASE, _N_max - BASE*i, uvrs_pos))
    if i == round_half_2 - 1 and _N_max % BASE == 0:
        printIn("__update_VS_%dx%d(V, S, M1+%d);" % (BASE, max_V_coeffi, uvrs_pos))
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
    printIn("minusdelta = jump%ddivsteps_mod3(minusdelta,M1,f,g);" % (base))
    printIn("__update_fg_%dx%d(f, g, M1+%d);" % (base, _N_max_2, _uvrs_pos))
    if _N_max_2 - base == 0:
        printIn("__update_VS_%dx%d(V, S, M1+%d);" % (base, max_V_coeffi, _uvrs_pos))
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