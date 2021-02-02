from utility import printIn, LENGTH_1, LENGTH_2
import utility as u

import gen_x2p2_add

MUL_PARAM_INVERSE = False
if LENGTH_1 > LENGTH_2:
    MUL_PARAM_INVERSE = True

polymul_path = "parse_polymul_NxN.polymul_" + str(LENGTH_1) + "x" + str(LENGTH_2)
if MUL_PARAM_INVERSE:
    polymul_path = "parse_polymul_NxN.polymul_" + str(LENGTH_2) + "x" + str(LENGTH_1)
_tmp = __import__(polymul_path, globals(), locals(), ['polymul'], 0)
polymul = _tmp.polymul

UNROLL = False
NEW_LENGTH = LENGTH_1 + LENGTH_2 # result coefficients (M)

V = "s5" # r0
M = "s6" # r1
v_f_offset = 0
v_g_offset = NEW_LENGTH * 2

M_f1_offset = 0
M_g1_offset = LENGTH_1 * 1 * 2
M_u_offset = LENGTH_1 * 2 * 2
M_v_offset = LENGTH_1 * 3 * 2
M_r_offset = LENGTH_1 * 4 * 2
M_s_offset = LENGTH_1 * 5 * 2
S_FH = "s7" # r2
S_GH = "s8" # r3

STACK_INTERVAL_SPACE = (NEW_LENGTH // 2) * 4
STACK_SPACE = str(STACK_INTERVAL_SPACE * 4)

__polymul_name = "__polymul_" + str(LENGTH_1) + "x" + str(LENGTH_2)
if MUL_PARAM_INVERSE:
    __polymul_name = "__polymul_" + str(LENGTH_2) + "x" + str(LENGTH_1)
__polyadd_name = "__polyadd_x2p2_" + str(LENGTH_1) + "_" + str(NEW_LENGTH)

def data_config():
    print(".text")
    print("Toom4Table_4591:")
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

def get_gh_addr(rd):
    printIn("vmov.w " + rd + ", " + S_GH)

def main(merge = False):
    if not UNROLL:
        if not merge:
            u._func_head(__polymul_name, polymul)
        u._func_head(__polyadd_name, gen_x2p2_add.main)

    f_name = "__gf_polymul_" + str(LENGTH_1) + "x" + str(LENGTH_2) + "_2x2_x2p2"
    f_params = "(int *V,int *M,int *fh,int *gh)"

    if not merge:
        u.head(f_name, f_params, data_config)
    else:
        u.head(f_name, f_params)

    printIn("vpush.w { s16-s27 }")
    printIn("adr lr, Toom4Table_4591")
    printIn("vldm lr, {s10-s25}")

    # 存 r0-r3 function input
    tmp = ["r7", "r8", "r9", "r10", "r11", "r12", "lr"]
    printIn("vmov.w " + V + ", " + M + ", r0, r1")
    printIn("vmov.w " + S_FH + ", " + S_GH + ", r2, r3")
    u.get_qR2inv(tmp[0], True)
    printIn("movw.w " + tmp[4] + ", #0")

    # stack initial
    printIn("sub.w sp, #" + str(STACK_SPACE))
    printIn("mov.w r0, sp")
    printIn("str.w " + tmp[4] + ", [r0]")

    # === 1 ===
    # reset r0: sp+2, r1: M(u), r2: fh
    printIn("add.w r0, #2")
    if not MUL_PARAM_INVERSE:
        printIn("add.w r1, " + "#" + str(M_u_offset))
    else:
        printIn("vmov.w " + "r2, r1, " + M + ", " + S_FH)
        printIn("add.w r2, " + "#" + str(M_u_offset))

    # mul
    if not UNROLL:
        u.bl_polymul(__polymul_name)
    else:
        polymul()

    # for test
    # printIn("vmov.w r0, " + V)
    # printIn("mov.w r1, sp")

    # for i in range(384):
    #     printIn("ldr.w " + tmp[0] + ", [r1, #" + str(i*4) + "]")
    #     printIn("str.w " + tmp[0] + ", [r0, #" + str(i*4) + "]")


    # reset r0: sp (one+2), r1: M(v), r2: gh
    if not MUL_PARAM_INVERSE:
        printIn("vmov.w " + "r1, " + M)
        printIn("add.w r1, #" + str(M_v_offset))
        get_gh_addr("r2")
    else:
        printIn("vmov.w " + "r2, " + M)
        printIn("add.w r2, #" + str(M_v_offset))
        get_gh_addr("r1")

    # mul
    if not UNROLL:
        u.bl_polymul(__polymul_name)
    else:
        polymul()

    # for test
    # printIn("vmov.w r0, " + V)
    # printIn("mov.w r1, sp")
    # printIn("add.w r2, r1, #" + str(STACK_INTERVAL_SPACE))
    # for i in range(384):
    #     printIn("ldr.w " + tmp[0] + ", [r1, #" + str(i*4) + "]")
    #     printIn("ldr.w " + tmp[1] + ", [r2, #" + str(i*4) + "]")
    #     printIn("sadd16 " + tmp[0] + ", " + tmp[0] + ", " + tmp[1])
    #     printIn("str.w " + tmp[0] + ", [r0, #" + str(i*4) + "]")

    # === 2 ===
    # mul
    # reset r0: sp(two), r1: M(r), r2: fh
    printIn("sub.w r0, r0, #2")
    if not MUL_PARAM_INVERSE:
        printIn("vmov.w " + "r1, r2, " + M + ", " + S_FH)
        printIn("add.w r1, #" + str(M_r_offset))
    else:
        printIn("vmov.w " + "r2, r1, " + M + ", " + S_FH)
        printIn("add.w r2, #" + str(M_r_offset))

    if not UNROLL:
        u.bl_polymul(__polymul_name)
    else:
        polymul()
    
    # mul
    ## reset r0: sp(three), r1: M(s), r2: gh
    if not MUL_PARAM_INVERSE:
        printIn("vmov.w " + "r1, " + M)
        printIn("add.w r1, #" + str(M_s_offset))
        get_gh_addr("r2")
    else:
        printIn("vmov.w " + "r2, " + M)
        printIn("add.w r2, #" + str(M_s_offset))
        get_gh_addr("r1")
    if not UNROLL:
        u.bl_polymul(__polymul_name)
    else:
        polymul()

    # add # 1
    q = "r10"
    qR2inv = "r11"
    _2P15 = "r12"
    u.get_q(q)
    u.get_2P15(_2P15)
    printIn("vmov.w " + "r0, r2, " + V + ", " + M)
    printIn("mov.w r1, sp")
    u.get_qR2inv(qR2inv)
    if not UNROLL:
        u.bl_polyadd(__polyadd_name)
    else:
        gen_x2p2_add.main()
    
    # add # 2
    printIn("vmov.w " + "r2, " + M)
    printIn("add.w r1, #" + str(NEW_LENGTH*2))
    printIn("add.w r2, #" + str(M_g1_offset))
    if not UNROLL:
        u.bl_polyadd(__polyadd_name)
    else:
        gen_x2p2_add.main()

    printIn("add.w sp, #" + str(STACK_SPACE))
    printIn("vpop.w { s16-s27 }")
    u.end()

# main()