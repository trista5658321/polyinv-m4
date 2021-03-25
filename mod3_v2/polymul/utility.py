C1 = 14
C2 = 18
MAX1 = 15
MAX2 = 21

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