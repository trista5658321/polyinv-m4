import sys, math, pathlib

ROOT_PATH = str(pathlib.Path(__file__).parent.absolute().parent)
sys.path.append(ROOT_PATH)

from NTRU.const import *
from NTRU.polymul.utility_polymul import do_jump_head_4_0

BASE = int(sys.argv[1]) # jump N divsteps
P = int(sys.argv[2])
_P = int(sys.argv[3])
_P_ZERO_coeffi = _P - P
over_divsteps = 2*(_P - P) + 1
polymul_constraint = 32 # N x N1, N % constraint == 0 and N1 % constraint == 0
max_V_coeffi = math.ceil((over_divsteps + P) / polymul_constraint) * polymul_constraint
_N_max_2 = (2 * _P) % BASE