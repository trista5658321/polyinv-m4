from utility import printIn, LENGTH, Q, set_stack
import utility as u

import gen_2x2_add

polymul_path = "parse_polymul_NxN.polymul_" + str(LENGTH) + "x" + str(LENGTH)
_tmp = __import__(polymul_path, globals(), locals(), ['polymul'], 0)
polymul = _tmp.polymul

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

BUFFER_SPACE = (LENGTH * 2) * 2 + 4 # (coefficients * bytes_per_coefficients)
STACK_SPACE = BUFFER_SPACE

def data_config():
    print(".text")

    if LENGTH >= 128:
        assert(Q == 4591)
        print("Toom4Table_4591_2x2:")
        printIn(".word 4194697214 @ s1")
        printIn(".word 66848888   @ s2^")
        printIn(".word 145489918  @ s3^")
        printIn(".word 4219667963 @ s4^")
        printIn(".word 87754235   @ s5")
        printIn(".word 263483     @ s6")
        printIn(".word 4144690955 @ s7")
        printIn(".word 16713465   @ s8")
        printIn(".word 4144758733 @ s9#")
        printIn(".word 75236093   @ s10^")
        printIn(".word 4207215357 @ s11")
        printIn(".word 4294703813 @ s12")
        printIn(".word 100272375  @ s13")
        printIn(".word 4261546104 @ s14^")
        printIn(".word 4149545207 @ s15^")
        printIn(".word 16777012   @ s16#")

def get_b1_addr(rd, label = False):
    if label:
        printIn("mov.w " + rd + ", sp")
    else:
        printIn("vmov.w " + rd + ", " + s_b1_addr)
def get_bb1_addr(rd, label = False):
    if label:
        printIn("add.w " + rd + ", sp, #2")
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
        # u._func_head(__polymul_name, polymul)
        u._func_head(__polyadd_name, gen_2x2_add.main)

    f_name = "__gf_polymul_" + str(LENGTH) + "x" + str(LENGTH) + "_2x2_x_2x2"
    f_params = "(int *M,int *S_M1,int *fh,int *gh)"
    u.head(f_name, f_params, data_config)

    if LENGTH >= 128:
        printIn("vpush.w { s16-s25 }")
        printIn("adr lr, Toom4Table_4591_2x2")
        printIn("vldm lr, {s10-s25}")

    set_stack(STACK_SPACE)

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
        polymul()

    # reset r0: M , r1: M1+32(r), r2: M2+16(v)
    get_M_addr("r0", "M")
    get_M_addr("r1", "M1")

    if LENGTH >= 128:
        get_M_addr("r2", "M2")

    get_M_elem("next2", "r1")
    
    if LENGTH >= 128:
        get_M_elem("next", "r2")
    
    # mul
    if not UNROLL:
        bl_polymul()
    else:
        polymul()

    # reset r0: M, r1: B_1
    if LENGTH >= 128:
        get_M_addr("r0", "M")
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
        polymul()

    # reset r0: M(v), r1: M1(s), r2: M2(v)
    get_M_addr("r0", "M")
    get_M_addr("r1", "M1")

    if LENGTH >= 128:
        get_M_addr("r2", "M2")

    get_new_M_elem("v", "r0")
    get_M_elem("s", "r1")
    
    if LENGTH >= 128:
        get_M_elem("v", "r2")

    # mul
    if not UNROLL:
        bl_polymul()
    else:
        polymul()

    # reset r0: M(v), r1: B_1
    get_b1_addr("r1")
    if LENGTH >= 128:
        get_M_addr("r0", "M")
        get_new_M_elem("v", "r0")
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
        polymul()

    # reset r0: M(r), r1: M1(r), r2: M2(s)
    get_M_addr("r0", "M")
    get_M_addr("r1", "M1")
    if LENGTH >= 128:
        get_M_addr("r2", "M2")

    get_new_M_elem("r", "r0")
    if LENGTH >= 128:
        get_M_elem("s", "r2")
    get_M_elem("r", "r1")

    # mul
    if not UNROLL:
        bl_polymul()
    else:
        polymul()

    # reset r0: M(r), r1: B_1
    get_b1_addr("r1")
    if LENGTH >= 128:
        get_M_addr("r0", "M")
        get_new_M_elem("r", "r0")
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
        polymul()

    # reset r0: M(s), r1: M1(s), r2: M2(s)
    get_M_addr("r0", "M")
    get_M_addr("r1", "M1")
    if LENGTH >= 128:
        get_M_addr("r2", "M2")
    get_new_M_elem("s", "r0")
    get_M_elem("s", "r1")
    if LENGTH >= 128:
        get_M_elem("s", "r2")

    # mul
    if not UNROLL:
        bl_polymul()
    else:
        polymul()

    # reset r0: M(s), r1: B_1
    get_b1_addr("r1")
    if LENGTH >= 128:
        get_M_addr("r0", "M")
        get_new_M_elem("s", "r0")
    # add
    if not UNROLL:
        bl_polyadd()
    else:
        gen_2x2_add.main()
    
    set_stack(STACK_SPACE, "end")

    if LENGTH >= 128:
        printIn("vpop.w { s16-s25 }")
    u.end()

# main()