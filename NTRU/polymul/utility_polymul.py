import sys, math

BASE = int(sys.argv[1]) # jump N divsteps
P = int(sys.argv[2])
_P = int(sys.argv[3])
_P_ZERO_coeffi = _P - P
over_divsteps = 2*(_P - P) + 1
polymul_constraint = 32 # N x N1, N % constraint == 0 and N1 % constraint == 0
max_V_coeffi = math.ceil((over_divsteps + P) / polymul_constraint) * polymul_constraint
_N_max_2 = (2 * _P) % BASE

do_jump_head_4_0 = _P_ZERO_coeffi < 15

coeffi_per_strip = 32
coeffi_per_block = 8
bytes_per_block = 4

r_f = "r1"
r_g = "r2"

r_12 = "r1"
r_14 = "r2"

MUL_LABEL_HAED_LAST = "mul_head_last"

def printIn(asm):
    print("\t" + asm)

# rotating holder for array elements
def ar (i,j,k) : # five registers
    num = 1 + (4*i+k-j) % 5
    if num == 1:
        num = 12
    if num == 2:
        num = 14
    return('r' + str(num))

# rotating accumulator k during round i
def ac (i,k) : # five registers
    return('r' + str(6+(4*i+k) % 5))

def reduce_mod2 (rd, rs):
    print("	and.w	%s, %s, #0x11111111" % (rd, rs))