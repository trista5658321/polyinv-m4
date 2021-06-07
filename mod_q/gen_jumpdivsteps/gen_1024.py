import sys, pathlib
d_root = pathlib.Path(__file__).parent.absolute().parent.parent
sys.path.append(str(d_root))

from mod_q.ntt.utility_ntt import get_power
from mod_q.gen_jumpdivsteps.gen_main import head_custom, gen_main_onlyuv, gen_main_onlyvs
from mod_q.gen_jumpdivsteps.gen_x2p2 import gen_x2p2
from mod_q.gen_jumpdivsteps.gen_2x2 import gen_2x2_onlyuv, gen_2x2_onlyvs

# from utility import printIn
def printIn(asm):
    print("  " + asm)

n = int(sys.argv[1])
q = int(sys.argv[2])
power = get_power(n)
basemul_base = 4
if not power & 1:
    basemul_base = 2

qR2inv = round(2**32 / q)

spacing_16 = n//2
v_spacing_16 = spacing_16*1
r_spacing_16 = spacing_16*2
s_spacing_16 = spacing_16*3

spacing_32 = n
v_spacing_32 = spacing_32*1
r_spacing_32 = spacing_32*2
s_spacing_32 = spacing_32*3

def custom():
    print("void __gf_polymul_512x512_2x2_x_2x2_onlyuv(int * M, int * M1_16, int * M1_32, int * M2_16, int * M2_32);")
    print("void __gf_polymul_512x512_2x2_x_2x2_onlyvs(int * M, int * M1_16, int * M1_32, int * M2_16, int * M2_32);")
    print("int jump1024divsteps_onlyuv(int minusdelta, int *M, int *f, int *g);")
    print("int jump1024divsteps_onlyvs(int minusdelta, int *M, int *f, int *g);")

head_custom(n, q, qR2inv, custom)
gen_x2p2(n, basemul_base, v_spacing_16, v_spacing_32, r_spacing_16, r_spacing_32, s_spacing_16, s_spacing_32)
gen_2x2_onlyuv(n, basemul_base, v_spacing_16, v_spacing_32, r_spacing_16, r_spacing_32, s_spacing_16, s_spacing_32)
gen_2x2_onlyvs(n, basemul_base, v_spacing_16, v_spacing_32, r_spacing_16, r_spacing_32, s_spacing_16, s_spacing_32)
gen_main_onlyuv(n, v_spacing_16, v_spacing_32, r_spacing_16, r_spacing_32, s_spacing_16, s_spacing_32, "_onlyuv")
gen_main_onlyvs(n, v_spacing_16, v_spacing_32, r_spacing_16, r_spacing_32, s_spacing_16, s_spacing_32, "_onlyvs")