import sys, pathlib
d_root = pathlib.Path(__file__).parent.absolute().parent.parent
sys.path.append(str(d_root))

from mod_q.ntt.utility_ntt import get_power
from mod_q.gen_jumpdivsteps.gen_main import head_full, gen_main_full
from mod_q.gen_jumpdivsteps.gen_x2p2 import gen_x2p2_v2
from mod_q.gen_jumpdivsteps.gen_2x2 import gen_2x2_full

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

head_full(n, q, qR2inv)
gen_2x2_full(n, basemul_base, v_spacing_16, v_spacing_32, r_spacing_16, r_spacing_32, s_spacing_16, s_spacing_32)
gen_x2p2_v2(n, basemul_base)
gen_main_full(n, v_spacing_16, v_spacing_32, r_spacing_16, r_spacing_32, s_spacing_16, s_spacing_32)