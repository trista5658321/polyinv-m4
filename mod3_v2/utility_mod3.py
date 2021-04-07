import sys, math

BASE = int(sys.argv[1]) # jump N divsteps
N = int(sys.argv[2])
_N = int(sys.argv[3])
over_divsteps = 2*(_N - N) + 1
max_V_coeffi = math.ceil((over_divsteps + N) / 16) * 16

def get_BASE():
    return BASE
