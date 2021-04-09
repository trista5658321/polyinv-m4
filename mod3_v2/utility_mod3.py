import sys, math

BASE = int(sys.argv[1]) # jump N divsteps
P = int(sys.argv[2])
_P = int(sys.argv[3])
_P_ZERO_coeffi = _P - P
over_divsteps = 2*(_P - P) + 1
max_V_coeffi = math.ceil((over_divsteps + P) / 16) * 16

