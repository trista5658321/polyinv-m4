import sys, pathlib, math

root = pathlib.Path(__file__).absolute().parent.parent
sys.path.append(str(root))

from utility import printIn

def get_q(p):
    if p == 761:
        return 4591


BASE = int(sys.argv[1]) # jump N divsteps
P = int(sys.argv[2])
_P = int(sys.argv[3])
Q = get_q(P)
_P_ZERO_coeffi = _P - P
OVER_DIVSTEPS = 2*(_P - P) + 1
MAX_COEFFI = math.ceil((OVER_DIVSTEPS + P) / 16) * 16
_P_LAST_COEFFI = (2 * _P) % BASE

def gen_divsteps_base(base = BASE, M = "M1", f = "f", g = "g"):
    printIn("minusdelta = jump%ddivsteps(minusdelta,%s,%s,%s);" % (base, M, f, g))
