from utility import printIn, LENGTH
import utility as u

import gen_2x2_add
from parse_polymul_NxN.polymul_32x32 import polymul_32x32

UNROLL = False

S_M = "s0" # r0
S_M1 = "s1" # r1
S_M2 = "s4" # r2

new_M_offset = LENGTH * 2 * 2

M_one_elem_offset = LENGTH * 1 * 2
M_two_elem_offset = LENGTH * 2 * 2
M_u_offset = 0
M_v_offset = LENGTH * 1 * 2
M_r_offset = LENGTH * 2 * 2
M_s_offset = LENGTH * 3 * 2


s_b1_addr = "s5"
s_bb1_addr = "s6"

__polymul_name = "__polymul_" + str(LENGTH) + "x" + str(LENGTH)
__polyadd_name = "__polyadd_" + str(LENGTH*2)

def data_config():
    buffer_len = LENGTH * 2 # coefficients
    buffer_bytes = buffer_len * 2 + 4
    buffer1 = "b" + str(buffer_len) + "_1_2x2"

    print(".data")
    print(buffer1 + ": .space " + str(buffer_bytes))
    print(".text")
    print("b1_addr_2x2:")
    printIn(".word " + buffer1)
    printIn(".word " + buffer1 + "+2")

def get_b1_addr(rd, label = False):
    if label:
        printIn("ldr.w " + rd + ", b1_addr_2x2")
    else:
        printIn("vmov.w " + rd + ", " + s_b1_addr)
def get_bb1_addr(rd, label = False):
    if label:
        printIn("ldr.w " + rd + ", b1_addr_2x2+4")
    else:
        printIn("vmov.w " + rd + ", " + s_bb1_addr)

def set_zero(r1, r_zero):
    printIn("str.w " + r_zero + ", [" + r1 + "]")

def get_M_addr(rd, m_id):
    s = ""
    if m_id == "M":
        s = S_M
    elif m_id == "M1":
        s = S_M1
    elif m_id == "M2":
        s = S_M2
    if s:
        printIn("vmov.w " + rd + ", " + s)

def get_M_elem(elem, M_base):
    offset = ""
    if elem == "next":
        offset = M_one_elem_offset
    if elem == "next2":
        offset = M_two_elem_offset
    elif elem == "v":
        offset = M_v_offset
    elif elem == "r":
        offset = M_r_offset
    elif elem == "s":
        offset = M_s_offset
    if offset:
        printIn("add.w " + M_base + ", #" + str(offset))

def get_new_M_elem(elem, M_base):
    offset = ""
    if elem == "v":
        offset = new_M_offset
    elif elem == "r":
        offset = new_M_offset * 2
    elif elem == "s":
        offset = new_M_offset * 3
    if offset:
        printIn("add.w " + M_base + ", #" + str(offset))

def bl_polymul():
    printIn("bl	" + __polymul_name)

def bl_polyadd():
    printIn("bl	" + __polyadd_name)

def main():
    if not UNROLL:
        # u._func_head(__polymul_name, polymul_32x32)
        u._func_head(__polyadd_name, gen_2x2_add.main)

    f_name = "__gf_polymul_" + str(LENGTH) + "x" + str(LENGTH) + "_2x2_x_2x2"
    f_params = "(int *M,int *S_M1,int *fh,int *gh)"
    u.head(f_name, f_params, data_config)

    # 存 r0-r3 function input
    tmp = ["r7", "r8", "r9", "r10", "r11", "r12", "lr"]
    printIn("vmov.w " + S_M + ", " + S_M1 + ", r0, r1")
    printIn("vmov.w " + S_M2 + ", r2")
    u.get_qR2inv(tmp[0], True)
    printIn("movw.w " + tmp[4] + ", #0")

    # init data & store data addr
    r_b1_addr = tmp[0]
    r_bb1_addr = "r0"

    get_b1_addr(r_b1_addr, True)
    get_bb1_addr(r_bb1_addr, True)
    set_zero(r_b1_addr, tmp[4]) # done
    printIn("vmov.w " + s_b1_addr + ", " + s_bb1_addr + ", " + r_b1_addr + ", " + r_bb1_addr)

    # reset r0: BB64_1, r1: M1(u), r2: M2(u)
    # mul
    if not UNROLL:
        bl_polymul()
    else:
        polymul_32x32()

    # reset r0: M , r1: M1+32(r), r2: M2+16(v)
    get_M_addr("r0", "M")
    get_M_addr("r1", "M1")
    get_M_elem("next2", "r1")
    
    # mul
    if not UNROLL:
        bl_polymul()
    else:
        polymul_32x32()

    # reset r0: M, r1: B_1
    get_b1_addr("r1")
    # add
    if not UNROLL:
        bl_polyadd()
    else:
        gen_2x2_add.main()

    # === 2 ===
    # reset r0: BB64_1, r1: M1(v), r2: M2(u)
    get_bb1_addr("r0")
    get_M_addr("r1", "M1")
    get_M_addr("r2", "M2")
    get_M_elem("v", "r1")

    # mul
    if not UNROLL:
        bl_polymul()
    else:
        polymul_32x32()

    # reset r0: M(v), r1: M1(s), r2: M2(v)
    get_M_addr("r0", "M")
    get_M_addr("r1", "M1")
    # get_M_addr("r2", "M2") #加了反而變快= =
    get_new_M_elem("v", "r0")
    get_M_elem("s", "r1")
    # get_M_elem("v", "r2") #加了反而變快= =

    # mul
    if not UNROLL:
        bl_polymul()
    else:
        polymul_32x32()

    # reset r0: M, r1: B_1
    get_b1_addr("r1")
    # add
    if not UNROLL:
        bl_polyadd()
    else:
        gen_2x2_add.main()

    # === 3 ===
    # reset r0: BB64_1, r1: M1(u), r2: M2(r)
    get_bb1_addr("r0")
    get_M_addr("r1", "M1")
    get_M_addr("r2", "M2")
    get_M_elem("r", "r2")

    # mul
    if not UNROLL:
        bl_polymul()
    else:
        polymul_32x32()

    # reset r0: M(r), r1: M1(r), r2: M2(s)
    get_M_addr("r0", "M")
    get_M_addr("r1", "M1")
    get_new_M_elem("r", "r0")
    get_M_elem("r", "r1")

    # mul
    if not UNROLL:
        bl_polymul()
    else:
        polymul_32x32()

    # reset r0: M, r1: B_1
    get_b1_addr("r1")
    # add
    if not UNROLL:
        bl_polyadd()
    else:
        gen_2x2_add.main()

    # === 4 ===
    # reset r0: BB64_1, r1: M1(v), r2: M2(r)
    get_bb1_addr("r0")
    get_M_addr("r1", "M1")
    get_M_addr("r2", "M2")
    get_M_elem("v", "r1")
    get_M_elem("r", "r2")

    # mul
    if not UNROLL:
        bl_polymul()
    else:
        polymul_32x32()

    # reset r0: M(s), r1: M1(s), r2: M2(s)
    get_M_addr("r0", "M")
    get_M_addr("r1", "M1")
    get_new_M_elem("s", "r0")
    get_M_elem("s", "r1")

    # mul
    if not UNROLL:
        bl_polymul()
    else:
        polymul_32x32()

    # reset r0: M, r1: B_1
    get_b1_addr("r1")
    # add
    if not UNROLL:
        bl_polyadd()
    else:
        gen_2x2_add.main()
    
    u.end()

# main()