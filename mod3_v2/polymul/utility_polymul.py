import sys, pathlib
sys.path.append(str(pathlib.Path(__file__).parent.parent.absolute().parent))

from utility import printIn, reduce_mod3_32, reduce_mod3_lazy
from mod3_v2.utility_mod3 import BASE, P, _P, over_divsteps, max_V_coeffi, _P_ZERO_coeffi

C1 = 14
C2 = 18
MAX1 = 15
MAX2 = 21

r_f = "r1"
r_g = "r2"

r_12 = "r1"
r_14 = "r2"

MUL_LABEL_HAED_LAST = "mul_head_last"

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

def do_reduction_continue(j):
    block_counts = j+1
    # 第一次需 lazy (63 adds // 4 = 15) & 後續需 lazy (56 adds // 4 = 14)
    if block_counts >= MAX1 and (block_counts - MAX1) % C1 == 0: 
        return True
    return False

def do_reduction_continue_id4(j): # ac(i, 4)
    block_counts = j+1
    # 第一次需 lazy (63 adds // 3 = 21) & 後續需 lazy (56 adds // 3 = 18)
    if block_counts >= MAX2 and (block_counts - MAX2) % C2 == 0: 
        return True
    return False

def do_reduction_before_add_pre_id4(j):
    block_counts = j+1 
    top_bound_value = 255 - MAX1*4
    
    if pre_id4_lazy(j): # lazy
        block_counts -= MAX2
        block_counts %= C2
        top_bound_value -= 30
    
    adds_bound = top_bound_value // 4
    blocks_bound = adds_bound // 3
    if block_counts > blocks_bound:
        return True
    return False

def do_reduction_end(j, no_mid_reduction = False):
    block_counts = j+1
    if do_reduction_continue(j):
        return True
    # lazy + lazy: 2*(30 + 24 adds) = 252 <= 255 (max 6 blocks)
    if block_counts > 7 and block_counts < MAX1:
        # e.g. for N1 == 32 (only need to do -3 one side before additions)
        if no_mid_reduction: return False
        return True
    if block_counts >= MAX1 and (block_counts - MAX1) % C1 > 6: 
        return True
    return False

def pre_id4_lazy(j):
    block_counts = j+1
    if block_counts >= MAX2:
        return True
    return False