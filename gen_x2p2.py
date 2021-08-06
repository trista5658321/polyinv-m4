from utility import printIn, LENGTH, set_stack
import utility as u

import gen_f
import gen_g

polymul_path = "parse_polymul_NxN.polymul_" + str(LENGTH) + "x" + str(LENGTH)
_tmp = __import__(polymul_path, globals(), locals(), ['polymul'], 0)
polymul = _tmp.polymul

UNROLL = False

V = "s0" # r0
M = "s1" # r1
v_f_offset = 0
v_g_offset = LENGTH * 2 * 2
M_f1_offset = 0
M_g1_offset = LENGTH * 1 * 2
M_u_offset = LENGTH * 2 * 2
M_v_offset = LENGTH * 3 * 2
M_r_offset = LENGTH * 4 * 2
M_s_offset = LENGTH * 5 * 2
S_FH = "s4" # r2
S_GH = "s5" # r3

s_b1_addr = "s6"
s_bb1_addr = "s7"
s_b2_addr = "s8"
s_bb2_addr = ""

__polymul_name = "__polymul_" + str(LENGTH) + "x" + str(LENGTH)

BUFFER_SPACE = (LENGTH * 2) * 2 + 4 # (coefficients * bytes_per_coefficients)
STACK_SPACE = BUFFER_SPACE * 2

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
def get_b2_addr(rd, label = False):
    if label:
        printIn("add.w " + rd + ", sp, #" + str(BUFFER_SPACE))
    else:
        printIn("vmov.w " + rd + ", " + s_b2_addr)
def get_bb2_addr(rd, label = False):
    if label:
        printIn("add.w " + rd + ", sp, #" + str(BUFFER_SPACE+2))
    else:
        printIn("vmov.w " + rd + ", " + s_bb2_addr)
def set_zero(r1, r2, r_zero):
    printIn("str.w " + r_zero + ", [" + r1 + "]")
    printIn("str.w " + r_zero + ", [" + r2 + "]")

def get_gh_addr(rd):
    printIn("vmov.w " + rd + ", " + S_GH)

def main():
    if not UNROLL:
        u._func_head(__polymul_name, polymul)

    f_name = "__gf_polymul_" + str(LENGTH) + "x" + str(LENGTH) + "_2x2_x2p2"
    f_params = "(int *V,int *M,int *fh,int *gh)"
    u.head(f_name, f_params)

    set_stack(STACK_SPACE)

    # 存 r0-r3 function input
    tmp = ["r7", "r8", "r9", "r10", "r11", "r12", "lr"]
    printIn("vmov.w " + V + ", " + M + ", r0, r1")
    printIn("vmov.w " + S_FH + ", " + S_GH + ", r2, r3")
    u.get_qR2inv(tmp[0], True)
    printIn("movw.w " + tmp[4] + ", #0")

    # init data & store data addr
    r_b1_addr = tmp[0]
    r_bb1_addr = tmp[1]
    r_b2_addr = tmp[2]
    r_bb2_addr = "r0"

    get_b1_addr(r_b1_addr, True)
    get_bb1_addr(r_bb1_addr, True)
    get_b2_addr(r_b2_addr, True)
    get_bb2_addr(r_bb2_addr, True)
    set_zero(r_b1_addr, r_b2_addr, tmp[4]) # done
    printIn("vmov.w " + s_b1_addr + ", " + s_bb1_addr + ", " + r_b1_addr + ", " + r_bb1_addr)
    printIn("vmov.w " + s_b2_addr + ", " + r_b2_addr)

    # reset r0: BB64_2, r1: M+32, r2: fh
    # printIn("ldr.w " + tmp[0] + ", [r1], #" + str(M_u_offset))
    printIn("movw.w " + tmp[0] + ", #" + str(M_u_offset))
    printIn("add.w r1, " + tmp[0])
    # mul32x32
    if not UNROLL:
        u.bl_polymul(__polymul_name)
    else:
        polymul()

    # reset r0: BB64_1 , r2: gh
    get_bb1_addr("r0")
    get_gh_addr("r2")
    # mul32x32
    if not UNROLL:
        u.bl_polymul(__polymul_name)
    else:
        polymul()
    # reset r0-6
    printIn("vmov.w " + "r0, r3, " + V + ", " + M)
    get_b1_addr("r1")
    get_b2_addr("r2")
    # add_f
    gen_f.main()

    # mul32x32
    ## reset r0: V+32, r1: M+64, r2: fh
    ### V 在 r0, M 在 r3
    printIn("vmov.w r2, " + S_FH)
    printIn("add.w r0, r0, #" + str(v_g_offset))
    printIn("add.w r1, r3, #" + str(M_r_offset))
    if not UNROLL:
        u.bl_polymul(__polymul_name)
    else:
        polymul()
    
    # mul32x32
    get_bb1_addr("r0")
    get_gh_addr("r2")
    if not UNROLL:
        u.bl_polymul(__polymul_name)
    else:
        polymul()
    
    # reset r0-5
    printIn("vmov.w r0, " + V)
    get_bb1_addr("r1")
    printIn("vmov.w r2, " + M)
    # add_g
    gen_g.main()

    set_stack(STACK_SPACE, "end")
    u.end()

# main()