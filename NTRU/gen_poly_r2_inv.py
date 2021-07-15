import sys, pathlib
sys.path.append(str(pathlib.Path(__file__).parent.absolute().parent))

from utility import printIn
from NTRU.utility_mod2 import BASE, P, _P, over_divsteps, max_V_coeffi

def func_name(P):
    if P == 508:
        return "PQCLEAN_NTRUHPS2048509_CLEAN_poly_R2_inv_jumpdivsteps"
    elif P == 676:
        return "PQCLEAN_NTRUHPS2048677_CLEAN_poly_R2_inv_jumpdivsteps"
    elif P == 700:
        return "PQCLEAN_NTRUHRSS701_CLEAN_poly_R2_inv_jumpdivsteps"
    elif P == 820:
        return "PQCLEAN_NTRUHPS4096821_CLEAN_poly_R2_inv_jumpdivsteps"
    return ("poly_R2_inv_jumpdivsteps_%d" % (P))


print("// #include <stdint.h>")
print("#include \"poly.h\"")
print("")
print("#define p %d" % P)
print("#define p_minus_1 %d" % (P-1))
print("#define _p %d // for jumpdivsteps" % (_P))
print("#define _p_space_4bit %d" % (_P//8))
print("#define _v_space_16bit %d" % (max_V_coeffi))
print("#define _v_space_4bit %d" % (max_V_coeffi//8))
print("#define reverse_head %d" % (P-1+over_divsteps))
print("")
print("extern void convert_bit_to_4_%d(uint32_t *f, uint16_t *_f);" % (_P))
print("extern void convert_bit_to_16_%d(uint16_t *_M, uint32_t *M);" % (max_V_coeffi))
print("extern int jump%ddivsteps_mod2_%d(int minusdelta, uint32_t *M, uint32_t *f, uint32_t *g);" % (2*_P, BASE))
print("")
print("void %s(poly *r, const poly *a){" % (func_name(P)))
printIn("uint16_t _f[_p]={0}, _g[_p]={0}, _M[_v_space_16bit]={0};")
printIn("int i;")
printIn("int minusdelta=1;")
print("")
printIn("for(i=0; i<=p; i++) _f[i]=1;")
printIn("for(i=0;i<p;i++) _g[i]= (a->coeffs[p_minus_1-i] & 1) ^ (a->coeffs[p] & 1);")
print("")
printIn("uint32_t f[_p_space_4bit], g[_p_space_4bit], M[_v_space_4bit];")
printIn("convert_bit_to_4_%d(f, _f);" % (_P))
printIn("convert_bit_to_4_%d(g, _g);" % (_P))
print("")
printIn("minusdelta = jump%ddivsteps_mod2_%d(minusdelta, M, f, g);" % (2*_P, BASE))
printIn("convert_bit_to_16_%d(_M, M);" % (max_V_coeffi))
print("")
printIn("for(i=0;i<p;i++){")
printIn("    r->coeffs[i] = _M[reverse_head-i];")
printIn("}")
printIn("r->coeffs[p] = 0;")
print("}")