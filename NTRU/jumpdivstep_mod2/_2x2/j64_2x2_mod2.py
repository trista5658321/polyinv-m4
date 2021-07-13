coeffi = 32 # n x n
coeffi_per_byte = 0.5
bits_per_coeffi = int(coeffi_per_byte * 8)
m_offset = int(coeffi * coeffi_per_byte) # unit: bytes

M = "r0"
M1 = "r1"
M2 = "r2"

top_coeffi = ["r3", "r4", "r5", "r6"]
left_coeffi = ["r7"]
result = ["r8", "r9", "r10", "r11", "r12"]
s_result_1 = ["s" + str(x) for x in range(0,8)]
s_result_2 = ["s" + str(x) for x in range(8,16)]

# for add_str
a = ["r3", "r4", "r5", "r6"]
b = ["r7", "r8", "r9", "r10"]
tmp = ["r11", "r12", "lr"]

def printIn(asm):
    print("\t" + asm)

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

def result_reg(i, id):
    return result[(id+i) % len(result)]

def ldr_m_elem(rd, rs, offset):
    if not offset:
        printIn("ldr.w %s, [%s]" % (rd, rs))
    else:
        printIn("ldr.w %s, [%s, #%d]" % (rd, rs, offset))

def polymul_32x32(s_result, m2_elem, m1_elem):
    m2_offset = get_m_offset(m2_elem)
    m1_offset = get_m_offset(m1_elem)

    printIn("mov.w %s, #0" % (result_reg(0,0)))

    for i in range(4):
        ldr_m_elem(top_coeffi[i], M1, m1_offset+4*i)

    for i in range(4):
        ldr_m_elem(left_coeffi[0], M2, m2_offset+4*i)

        printIn("umull %s, %s, %s, %s" % (result_reg(i,1), result_reg(i,2), top_coeffi[1], left_coeffi[0]))
        printIn("umull %s, %s, %s, %s" % (result_reg(i,3), result_reg(i,4), top_coeffi[3], left_coeffi[0]))
        printIn("umlal %s, %s, %s, %s" % (result_reg(i,0), result_reg(i,1), top_coeffi[0], left_coeffi[0]))
        printIn("umlal %s, %s, %s, %s" % (result_reg(i,2), result_reg(i,3), top_coeffi[2], left_coeffi[0]))

        for id in range(5):
            printIn("and.w %s, %s, #0x11111111" % (result_reg(i,id), result_reg(i,id)))
        
        printIn("vmov.w %s, %s" % (s_result[i], result_reg(i,0)))

    for i in range(2):
        printIn("vmov.w %s, %s, %s, %s" % (s_result[4+2*i], s_result[4+2*i+1], result_reg(3,2*i+1), result_reg(3,2*i+2)))


def add_str(s_a, s_b): # a*x + b
    for times in range(2):
        for i in range(2):
            printIn("vmov.w %s, %s, %s, %s" % (a[2*i], a[2*i+1], s_a[2*i + 4*times], s_a[2*i+1 + 4*times]))
        for i in range(2):
            printIn("vmov.w %s, %s, %s, %s" % (b[2*i], b[2*i+1], s_b[2*i + 4*times], s_b[2*i+1 + 4*times]))

        for i in range(len(a)):
            printIn("eor.w %s, %s, %s, LSL #%d" %(b[i], b[i], a[i], bits_per_coeffi)) # a0-a2
        for i in range(len(a)-1):
            printIn("eor.w %s, %s, %s, LSR #%d" %(b[i+1], b[i+1], a[i], 32 - bits_per_coeffi)) # a3

        if times == 0:
            printIn("ubfx.w %s, %s, #28, #1" % (tmp[0], a[3]))
        else:
            printIn("eor.w %s, %s, %s" %(b[0], b[0], tmp[0])) # a3

        for i in range(1, len(b)):
            printIn("str %s, [%s, #%d]" % (b[i], M, 4*i))
        printIn("str %s, [%s], #%d" % (b[0], M, 4*len(b)))

def main():
    f_name = "__gf_polymul_" + str(coeffi) + "x" + str(coeffi) + "_2x2_x_2x2_mod2"
    f_params = "(int *M,int *M1,int *M2)"
    f_regs = "r4-r11"
    prologue_mod2(f_name, f_params, f_regs)

    #1
    polymul_32x32(s_result_1, "u", "u")
    polymul_32x32(s_result_2, "v", "r")
    add_str(s_result_1, s_result_2)

    #2
    polymul_32x32(s_result_1, "u", "v")
    polymul_32x32(s_result_2, "v", "s")
    add_str(s_result_1, s_result_2)

    #3
    polymul_32x32(s_result_1, "r", "u")
    polymul_32x32(s_result_2, "s", "r")
    add_str(s_result_1, s_result_2)

    #4
    polymul_32x32(s_result_1, "r", "v")
    polymul_32x32(s_result_2, "s", "s")
    add_str(s_result_1, s_result_2)

    epilogue_mod2(f_regs)

# main()