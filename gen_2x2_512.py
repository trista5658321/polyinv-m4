from utility import printIn, LENGTH_1, LENGTH_2
import utility as u

import gen_2x2_add_new

NEW_LENGTH = LENGTH_2 + LENGTH_1 # result coefficients (M)

polymul_path = "parse_polymul_NxN.polymul_" + str(LENGTH_1) + "x" + str(LENGTH_2) # M2 * M1
_tmp = __import__(polymul_path, globals(), locals(), ['polymul'], 0)
polymul = _tmp.polymul

UNROLL = False
ONLY_UV = False

S_M = "s0" # r0
S_M1 = "s5" # r1
S_M2 = "s6" # r2

new_M_offset = NEW_LENGTH * 2

M1_one_elem_offset = LENGTH_2 * 1 * 2
M1_two_elem_offset = LENGTH_2 * 2 * 2
M1_u_offset = 0
M1_v_offset = LENGTH_2 * 1 * 2
M1_r_offset = LENGTH_2 * 2 * 2
M1_s_offset = LENGTH_2 * 3 * 2

M2_one_elem_offset = LENGTH_1 * 1 * 2
M2_two_elem_offset = LENGTH_1 * 2 * 2
M2_u_offset = 0
M2_v_offset = LENGTH_1 * 1 * 2
M2_r_offset = LENGTH_1 * 2 * 2
M2_s_offset = LENGTH_1 * 3 * 2


s_b1_addr = "s7"
s_bb1_addr = "s8"

__polymul_name = "__polymul_" + str(LENGTH_1) + "x" + str(LENGTH_2)
__polyadd_name = "__polyadd_" + str(NEW_LENGTH)

def data_config():
    buffer_len = NEW_LENGTH # coefficients
    buffer_bytes = buffer_len * 2 + 4
    buffer1 = "b" + str(buffer_len) + "_1_2x2"

    print(".data")
    print(buffer1 + ": .space " + str(buffer_bytes))
    print(".text")
    print("b1_addr_2x2:")
    printIn(".word " + buffer1)
    printIn(".word " + buffer1 + "+2")

    if LENGTH_1 >= 128:
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

def get_M2_M1(rs_M2, rs_M1):
    printIn("vmov.w " + rs_M1 + ", " + rs_M2 + ", " + S_M1 + ", " + S_M2)

def get_M_elem(elem, M_base, m_id = "M1"):
    offset = ""
    if elem == "next":
        offset = [M1_one_elem_offset, M2_one_elem_offset]["M2" == m_id]
    if elem == "next2":
        offset = [M1_two_elem_offset, M2_two_elem_offset]["M2" == m_id]
    elif elem == "v":
        offset = [M1_v_offset, M2_v_offset]["M2" == m_id]
    elif elem == "r":
        offset = [M1_r_offset, M2_r_offset]["M2" == m_id]
    elif elem == "s":
        offset = [M1_s_offset, M2_s_offset]["M2" == m_id]
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

def block34():
    # === 3 ===
    # reset r0: BB64_1, r1: M2(r), r2: M1(u)
    get_bb1_addr("r0")
    get_M2_M1("r1", "r2")
    get_M_elem("r", "r1", "M2")

    # mul
    if not UNROLL:
        bl_polymul()
    else:
        polymul()

    # reset r0: M(r), r1: M2(s), r2: M1(r)
    get_M_addr("r0", "M")
    get_M2_M1("r1", "r2")
    get_new_M_elem("r", "r0")
    get_M_elem("s", "r1", "M2")
    get_M_elem("r", "r2")

    # mul
    if not UNROLL:
        bl_polymul()
    else:
        polymul()

    # reset r0: M(r), r1: B_1
    get_b1_addr("r1")
    get_M_addr("r0", "M")
    get_new_M_elem("r", "r0")

    # add
    if not UNROLL:
        bl_polyadd()
    else:
        gen_2x2_add_new.main()

    # === 4 ===
    # reset r0: BB64_1, r1: M2(r), r2: M1(v)
    get_bb1_addr("r0")
    get_M2_M1("r1", "r2")
    get_M_elem("r", "r1", "M2")
    get_M_elem("v", "r2")

    # mul
    if not UNROLL:
        bl_polymul()
    else:
        polymul()

    # reset r0: M(s), r1: M2(s), r2: M1(s)
    get_M_addr("r0", "M")
    get_M2_M1("r1", "r2")
    get_new_M_elem("s", "r0")
    get_M_elem("s", "r1", "M2")
    get_M_elem("s", "r2")

    # mul
    if not UNROLL:
        bl_polymul()
    else:
        polymul()

    # reset r0: M(s), r1: B_1
    get_b1_addr("r1")
    get_M_addr("r0", "M")
    get_new_M_elem("s", "r0")

    # add
    if not UNROLL:
        bl_polyadd()
    else:
        gen_2x2_add_new.main()

def main():
    if not UNROLL:
        u._func_head(__polymul_name, polymul)
        u._func_head(__polyadd_name, gen_2x2_add_new.main)

    f_name = "__gf_polymul_" + str(LENGTH_1) + "x" + str(LENGTH_2) + "_2x2_x_2x2"
    if ONLY_UV:
        f_name = f_name + "_onlyuv"
    f_params = "(int *M,int *S_M1,int *fh,int *gh)"
    u.head(f_name, f_params, data_config)

    if LENGTH_1 >= 128:
        printIn("vpush.w { s16-s27 }")
        printIn("adr lr, Toom4Table_4591_2x2")
        printIn("vldm lr, {s10-s25}")

    # 存 r0-r3 function input
    tmp = ["r7", "r8", "r9", "r10", "r11", "r12", "lr"]
    printIn("vmov.w " + S_M + ", r0")
    printIn("vmov.w " + S_M1 + ", " + S_M2 + ", r1, r2")
    u.get_qR2inv(tmp[0], True)
    printIn("movw.w " + tmp[4] + ", #0")

    # init data & store data addr
    r_b1_addr = tmp[0]
    r_bb1_addr = "r0"

    get_b1_addr(r_b1_addr, True)
    get_bb1_addr(r_bb1_addr, True)
    set_zero(r_b1_addr, tmp[4]) # done
    printIn("vmov.w " + s_b1_addr + ", " + s_bb1_addr + ", " + r_b1_addr + ", " + r_bb1_addr)

    # reset r0: BB64_1, r1: M2(u), r2: M1(u)
    # mul
    # get_M_addr("r1", "M2")
    # get_M_addr("r2", "M1")
    get_M2_M1("r1", "r2")
    if not UNROLL:
        bl_polymul()
    else:
        polymul()

    # reset r0: M, r1: M2+16(v), r2: M1+32(r)
    get_M_addr("r0", "M")
    get_M2_M1("r1", "r2")

    get_M_elem("next", "r1", "M2")
    get_M_elem("next2", "r2")
    
    # mul
    if not UNROLL:
        bl_polymul()
    else:
        polymul()

    # reset r0: M, r1: B_1
    get_M_addr("r0", "M")
    get_b1_addr("r1")

    # add
    if not UNROLL:
        bl_polyadd()
    else:
        gen_2x2_add_new.main()

    # === 2 ===
    # reset r0: BB64_1, r1: M2(u), r2: M1(v)
    get_bb1_addr("r0")
    get_M2_M1("r1", "r2")
    get_M_elem("v", "r2")

    # mul
    if not UNROLL:
        bl_polymul()
    else:
        polymul()

    # reset r0: M(v), r1: M2(v), r2: M1(s)
    get_M_addr("r0", "M")
    get_M2_M1("r1", "r2")

    get_new_M_elem("v", "r0")
    get_M_elem("v", "r1", "M2")
    get_M_elem("s", "r2")

    # mul
    if not UNROLL:
        bl_polymul()
    else:
        polymul()

    # reset r0: M(v), r1: B_1
    get_b1_addr("r1")
    get_M_addr("r0", "M")
    get_new_M_elem("v", "r0")

    # add
    if not UNROLL:
        bl_polyadd()
    else:
        gen_2x2_add_new.main()

    if not ONLY_UV:
        block34()
    
    printIn("vpop.w { s16-s27 }")
    u.end()

main()