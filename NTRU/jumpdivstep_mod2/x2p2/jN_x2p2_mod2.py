import sys, pathlib

ROOT_PATH = str(pathlib.Path(__file__).parent.parent.absolute().parent.parent)
sys.path.append(ROOT_PATH)

from utility import LENGTH, printIn, set_stack, bl_polymul
from NTRU.const import bytes_per_coeffi, bits_per_coeffi

coeffi = LENGTH//2 # n x n
M_offset = int(coeffi * bytes_per_coeffi) # unit: bytes
mul_result_bytes = 2 * coeffi * bytes_per_coeffi

STACK_SPACE = mul_result_bytes * 4 + 4

__polymul_name = "__polymul_" + str(coeffi) + "x" + str(coeffi) + "_mod2"

V = "r0"
M = "r1"
fh = "r2"
gh = "r3"

s_V = "s0"
s_gh = "s1"
# top_coeffi = ["r4", "r5", "r6", "r7"]
# left_coeffi = ["r8"]
# result = ["r9", "r10", "r11", "r12", "lr"]
# s_result_1 = ["s" + str(x) for x in range(0,8)]
# s_result_2 = ["s" + str(x) for x in range(8,16)]

# for add_str
r_sp = "lr"
r_flag = "r3"

a = ["r4", "r5", "r6", "r7"]
b = ["r8", "r9", "r10", "r11"]
pre_coeffi = ["r12"]

def prologue_mod2(name, params, regs, s_regs = ""):
    print("// void %s %s;" % (name, params))
    print(".p2align 2,,3")
    print(".syntax unified")
    print(".text")
    print(".global %s" % (name))
    print(".type %s, %%function" % (name))
    print("%s:" % (name))
    printIn("push.w {%s,lr}" % (regs))
    if s_regs:
        printIn("vpush.w {%s}" % (s_regs))

def epilogue_mod2(regs, s_regs = "") :
    if s_regs:
        printIn("vpop.w {%s}" % (s_regs))
    printIn("pop.w {%s,pc}" % (regs))

def get_m_offset(elem):
    if elem == "f":
        return 0
    elif elem == "g":
        return M_offset
    elif elem == "u":
        return M_offset*2
    elif elem == "v":
        return M_offset*3
    elif elem == "r":
        return M_offset*4
    elif elem == "s":
        return M_offset*5
    return -1

def polymul(poly_high, M_elem, cur_m_offset): # s_result = poly_high * M_elem
    m_offset = get_m_offset(M_elem)
    m_offset_correct = m_offset - cur_m_offset
    if m_offset_correct != 0:
        printIn("add.w %s, #%d" % (M, m_offset_correct))
    if poly_high == gh:
        printIn("vmov.w r2, %s" % (s_gh))

    bl_polymul(__polymul_name)

    return m_offset

def str_back(rs, offset = 0):
    start_str = 1
    if offset:
        start_str = 0

    for i in range(start_str, len(rs)):
        printIn("str %s, [%s, #%d]" % (rs[i], V, 4*i + offset))
    
    if not offset:
        printIn("str %s, [%s], #%d" % (rs[0], V, 4*len(rs)))


def uf_vg_x(part_id):
    if part_id == 0:
        # ldr f'
        for i in range(1, len(b)):
            printIn("ldr.w %s, [%s, #%d]" % (b[i], M, i*4))
        printIn("ldr.w %s, [%s], #%d" % (b[0], M, len(b)*4))
        
        # add f'
        for i in range(len(b)):
            printIn("eor.w %s, %s, %s, LSL #%d" %(b[i], b[i], a[i], bits_per_coeffi))
            if i == 0:
                printIn("eor.w %s, %s" % (b[i], pre_coeffi[0]))
            else:
                printIn("eor.w %s, %s, %s, LSR #%d" %(b[i], b[i], a[i-1], 32 - bits_per_coeffi))
        
        printIn("ubfx.w %s, %s, #28, #1" % (pre_coeffi[0], a[3]))

    else:
        for i in range(len(a)):
            printIn("eor.w %s, %s, %s, LSL #%d" % (b[i], pre_coeffi[0], a[i], bits_per_coeffi))
            printIn("ubfx.w %s, %s, #%d, #%d" % (pre_coeffi[0], a[i], 32 - bits_per_coeffi, bits_per_coeffi)) # get the coeffi with the highest degree

    str_back(b)

def rf_sg(part_id):
    if part_id == 0:
        # ldr g'
        for i in range(len(b)):
            printIn("ldr.w %s, [%s, #%d]" % (b[i], M, M_offset + i*4))

        # add g'
        for i in range(len(a)):
            printIn("eor.w %s, %s" % (a[i], b[i]))

    str_back(a, mul_result_bytes)

def loop_struc(part_id): # 0: add f', g'
    reg_amount = 4
    flag_bytes = mul_result_bytes/2
    assert(flag_bytes % 16 == 0)
    diff_mul_result_distance = mul_result_bytes # offset between uf (#1) and rf (#3)
    mul_result_distance = 2 * mul_result_bytes # offset between uf (#1) and vg (#2)
    
    printIn("add.w %s, %s, #%d" % (r_flag, V, flag_bytes))
    add_loop = "add_loop_x2p2_%d_%d" % (coeffi, part_id)
    print(add_loop + ":")

    # ldr coeffi
    for idx in range(2):
        _idx = (idx+1) % 2 # #3 -> #1
        ## mul two
        for i in range(reg_amount):
            printIn("ldr.w %s, [%s, #%d]" % (b[i], r_sp, diff_mul_result_distance*_idx + mul_result_distance + 4*i))

        ## mul one
        start_ldr = 0
        if _idx == 0:
            start_ldr = 1
        for i in range(start_ldr, reg_amount):
            printIn("ldr.w %s, [%s, #%d]" % (a[i], r_sp, diff_mul_result_distance*_idx + 4*i))
        if _idx == 0:
            printIn("ldr.w %s, [%s], #%d" % (a[0], r_sp, reg_amount * 4))

        # add mul
        for i in range(len(a)):
            printIn("eor.w %s, %s" % (a[i], b[i]))

        if _idx == 0:
            uf_vg_x(part_id)
        else:
            rf_sg(part_id)

    printIn("cmp.w %s, %s" % (V, r_flag))
    printIn("bne.w " + add_loop)

def main():
    f_name = "__gf_polymul_" + str(coeffi) + "x" + str(coeffi) + "_2x2_x2p2_mod2"
    f_params = "(int *V, int *M, int *fh, int *gh)"
    f_regs = "r4-r11"
    prologue_mod2(f_name, f_params, f_regs)
    printIn("vmov.w %s, %s, %s, %s" % (s_V, s_gh, V, gh))

    # stack initial
    set_stack(STACK_SPACE)
    printIn("mov.w r0, sp")

    cur_m_offset = 0

    # #1, #3, #2, #4
    cur_m_offset = polymul(fh, "u", cur_m_offset)
    cur_m_offset = polymul(fh, "r", cur_m_offset)
    cur_m_offset = polymul(gh, "v", cur_m_offset)
    cur_m_offset = polymul(gh, "s", cur_m_offset)
    
    printIn("mov.w %s, sp" % (r_sp))
    printIn("vmov.w %s, %s" % (V, s_V))

    # reset M
    f_offset = get_m_offset("f")
    printIn("add.w %s, #%d" % (M, f_offset-cur_m_offset))

    # pre_coeffi init
    printIn("movw.w %s, #0" % (pre_coeffi[0]))

    loop_struc(0)
    loop_struc(1)
    # uf_vg_x(s_result_1, s_result_2)
    # rf_sg(s_result_1, s_result_2)

    set_stack(STACK_SPACE, "end")
    epilogue_mod2(f_regs)

# main()