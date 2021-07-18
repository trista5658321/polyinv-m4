import sys, pathlib

ROOT_PATH = str(pathlib.Path(__file__).parent.parent.absolute().parent.parent)
sys.path.append(ROOT_PATH)

from utility import LENGTH, printIn, set_stack, bl_polymul
from NTRU.const import bytes_per_coeffi, bits_per_coeffi

coeffi = LENGTH//2 # n x n
m_offset = int(coeffi * bytes_per_coeffi) # unit: bytes
mul_result_bytes = 2 * coeffi * bytes_per_coeffi

STACK_SPACE = mul_result_bytes * 4 + 4

__polymul_name = "__polymul_" + str(coeffi) + "x" + str(coeffi) + "_mod2"

M = "r0"
M1 = "r1"
M2 = "r2"
s_M = "s0"

# for add_str
r_sp = "r1"
a = ["r2", "r3", "r4", "r5"]
b = ["r6", "r7", "r8", "r9"]
pre_coeffi = ["r10", "r11", "r12", "lr"]
r_flag = a[0]
s_flag = "s1"

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
    if elem == "u":
        return 0
    elif elem == "v":
        return m_offset
    elif elem == "r":
        return m_offset*2
    elif elem == "s":
        return m_offset*3
    return -1

def polymul(m2_elem, m1_elem, cur_m21_offset):
    m2_offset = get_m_offset(m2_elem)
    m1_offset = get_m_offset(m1_elem)
    m2_offset_correct = m2_offset - cur_m21_offset[0]
    m1_offset_correct = m1_offset - cur_m21_offset[1]

    if m2_offset_correct != 0:
        printIn("add.w %s, #%d" % (M2, m2_offset_correct))
    if m1_offset_correct != 0:
        printIn("add.w %s, #%d" % (M1, m1_offset_correct))

    bl_polymul(__polymul_name)
    
    return [m2_offset, m1_offset]

def add_str(): # a*x + b
    reg_amount = 4
    diff_mul_result_distance = mul_result_bytes # offset between uux (#1) and uvx (#3)
    mul_result_distance = 4 * mul_result_bytes # offset between uux (#1) and vr (#2)

    for idx in range(reg_amount):
        _idx = (idx + 1) % 4 # #3 -> #5 -> #7 -> #1
        printIn("//" + str(_idx))
        # mul two
        for i in range(reg_amount):
            printIn("ldr.w %s, [%s, #%d]" % (b[i], r_sp, diff_mul_result_distance*_idx + mul_result_distance + 4*i))

        # mul one
        start_ldr = 0
        if _idx == 0:
            start_ldr = 1
        for i in range(start_ldr, reg_amount):
            printIn("ldr.w %s, [%s, #%d]" % (a[i], r_sp, diff_mul_result_distance*_idx + 4*i))
        if _idx == 0:
            printIn("ldr.w %s, [%s], #%d" % (a[0], r_sp, reg_amount * 4))

        printIn("eor.w %s, %s, %s" %(b[0], b[0], pre_coeffi[_idx])) # pre a3

        for i in range(reg_amount):
            printIn("eor.w %s, %s, %s, LSL #%d" %(b[i], b[i], a[i], bits_per_coeffi)) # a0-a2
        for i in range(reg_amount-1):
            printIn("eor.w %s, %s, %s, LSR #%d" %(b[i+1], b[i+1], a[i], 32 - bits_per_coeffi)) # a3

        printIn("ubfx.w %s, %s, #28, #1" % (pre_coeffi[_idx], a[3]))

        if _idx == 0:
            for i in range(1, len(b)):
                printIn("str %s, [%s, #%d]" % (b[i], M, 4*i))
            printIn("str %s, [%s], #%d" % (b[0], M, 4*len(b)))
        else:
            for i in range(len(b)):
                printIn("str %s, [%s, #%d]" % (b[i], M, diff_mul_result_distance*_idx + 4*i))

def main():
    f_name = "__gf_polymul_" + str(coeffi) + "x" + str(coeffi) + "_2x2_x_2x2_mod2"
    f_params = "(int *M,int *M1,int *M2)"
    f_regs = "r4-r11"
    prologue_mod2(f_name, f_params, f_regs)
    printIn("vmov.w %s, %s" % (s_M, M))

    cur_m21_offset = [0, 0]
    
    # stack initial
    set_stack(STACK_SPACE)
    printIn("mov.w r0, sp")

    #1
    cur_m21_offset = polymul("u", "u", cur_m21_offset)
    #3
    cur_m21_offset = polymul("u", "v", cur_m21_offset)
    #5
    cur_m21_offset = polymul("r", "u", cur_m21_offset)
    #7
    cur_m21_offset = polymul("r", "v", cur_m21_offset)
    # 2, 4, 6, 8
    cur_m21_offset = polymul("v", "r", cur_m21_offset)
    cur_m21_offset = polymul("v", "s", cur_m21_offset)
    cur_m21_offset = polymul("s", "r", cur_m21_offset)
    cur_m21_offset = polymul("s", "s", cur_m21_offset)

    # add
    flag_bytes = mul_result_bytes
    printIn("mov.w %s, sp" % (r_sp))
    printIn("vmov.w %s, %s" % (M, s_M))
    printIn("add.w %s, %s, #%d" % (r_flag, M, flag_bytes))
    printIn("vmov.w %s, %s" % (s_flag, r_flag))
    for i in range(len(pre_coeffi)):
        printIn("movw.w %s, #0" % (pre_coeffi[i]))

    add_loop = "add_loop_2x2_%d" % (coeffi)
    print(add_loop + ":")

    add_str()

    printIn("vmov.w %s, %s" % (r_flag, s_flag))
    printIn("cmp.w %s, %s" % (M, r_flag))
    printIn("bne.w " + add_loop)
    set_stack(STACK_SPACE, "end")
    epilogue_mod2(f_regs)

# main()