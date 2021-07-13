coeffi = 32 # n x n
coeffi_per_byte = 0.5
bits_per_coeffi = int(coeffi_per_byte * 8)
M_offset = int(coeffi * coeffi_per_byte) # unit: bytes

V = "r0"
M = "r1"
fh = "r2"
gh = "r3"

top_coeffi = ["r4", "r5", "r6", "r7"]
left_coeffi = ["r8"]
result = ["r9", "r10", "r11", "r12", "lr"]
s_result_1 = ["s" + str(x) for x in range(0,8)]
s_result_2 = ["s" + str(x) for x in range(8,16)]

# for add_str
a = ["r4", "r5", "r6", "r7"]
b = ["r8", "r9", "r10", "r11"]
tmp = ["r12", "lr"]

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
        return M_offset
    elif elem == "r":
        return M_offset*2
    elif elem == "s":
        return M_offset*3
    return -1

def result_reg(i, id):
    return result[(id+i) % len(result)]

def ldr_m_elem(rd, rs, offset):
    if not offset:
        printIn("ldr.w %s, [%s]" % (rd, rs))
    else:
        printIn("ldr.w %s, [%s, #%d]" % (rd, rs, offset))

def polymul_32x32(s_result, poly_high, M_elem): # s_result = poly_high * M_elem
    m_offset = get_m_offset(M_elem)

    printIn("mov.w %s, #0" % (result_reg(0,0)))

    for i in range(4):
        ldr_m_elem(top_coeffi[i], M, m_offset+4*i)

    for i in range(4):
        ldr_m_elem(left_coeffi[0], poly_high, 4*i)

        printIn("umull %s, %s, %s, %s" % (result_reg(i,1), result_reg(i,2), top_coeffi[1], left_coeffi[0]))
        printIn("umull %s, %s, %s, %s" % (result_reg(i,3), result_reg(i,4), top_coeffi[3], left_coeffi[0]))
        printIn("umlal %s, %s, %s, %s" % (result_reg(i,0), result_reg(i,1), top_coeffi[0], left_coeffi[0]))
        printIn("umlal %s, %s, %s, %s" % (result_reg(i,2), result_reg(i,3), top_coeffi[2], left_coeffi[0]))

        for id in range(5):
            printIn("and.w %s, %s, #0x11111111" % (result_reg(i,id), result_reg(i,id)))
        
        printIn("vmov.w %s, %s" % (s_result[i], result_reg(i,0)))

    for i in range(2):
        printIn("vmov.w %s, %s, %s, %s" % (s_result[4+2*i], s_result[4+2*i+1], result_reg(3,2*i+1), result_reg(3,2*i+2)))

def str_back(rs):
    for i in range(1, len(rs)):
        printIn("str %s, [%s, #%d]" % (rs[i], V, 4*i))
    printIn("str %s, [%s], #%d" % (rs[0], V, 4*len(rs)))

def uf_vg_x(s_a, s_b):
    for times in range(2):
        for i in range(2):
            printIn("vmov.w %s, %s, %s, %s" % (a[2*i], a[2*i+1], s_a[2*i + 4*times], s_a[2*i+1 + 4*times]))
        for i in range(2):
            printIn("vmov.w %s, %s, %s, %s" % (b[2*i], b[2*i+1], s_b[2*i + 4*times], s_b[2*i+1 + 4*times]))

        for i in range(len(a)):
            printIn("eor.w %s, %s" % (a[i], b[i]))
        
        if times == 0:
            # ldr f'
            for i in range(len(b)):
                printIn("ldr.w %s, [%s, #-%d]" % (b[i], M, M_offset*2 - i*4))
            
            # add f'
            printIn("eor.w %s, %s, %s, LSL #%d" % (b[0], b[0], a[0], bits_per_coeffi))

            for i in range(1, len(b)):
                printIn("eor.w %s, %s, %s, LSL #%d" %(b[i], b[i], a[i], bits_per_coeffi))
                printIn("eor.w %s, %s, %s, LSR #%d" %(b[i], b[i], a[i-1], 32 - bits_per_coeffi))
            
            printIn("ubfx.w %s, %s, #28, #1" % (tmp[0], a[3]))

        else:
            for i in range(len(a)):
                if i != 0:
                    printIn("ubfx.w %s, %s, #%d, #%d" % (tmp[0], a[i-1], 32 - bits_per_coeffi, bits_per_coeffi)) # get the coeffi with the highest degree
                printIn("eor.w %s, %s, %s, LSL #%d" % (b[i], tmp[0], a[i], bits_per_coeffi))

        str_back(b)

def rf_sg(s_a, s_b):
    for times in range(2):
        for i in range(2):
            printIn("vmov.w %s, %s, %s, %s" % (a[2*i], a[2*i+1], s_a[2*i + 4*times], s_a[2*i+1 + 4*times]))
        for i in range(2):
            printIn("vmov.w %s, %s, %s, %s" % (b[2*i], b[2*i+1], s_b[2*i + 4*times], s_b[2*i+1 + 4*times]))

        for i in range(len(a)):
            printIn("eor.w %s, %s" % (a[i], b[i]))

        if times == 0:
            # ldr g'
            for i in range(len(b)):
                printIn("ldr.w %s, [%s, #-%d]" % (b[i], M, M_offset - i*4))

            # add g'
            for i in range(len(a)):
                printIn("eor.w %s, %s" % (a[i], b[i]))

        str_back(a)

def main():
    f_name = "__gf_polymul_" + str(coeffi) + "x" + str(coeffi) + "_2x2_x2p2_mod2"
    f_params = "(int *V, int *M, int *fh, int *gh)"
    f_regs = "r4-r11"
    prologue_mod2(f_name, f_params, f_regs)

    # 1
    printIn("add.w %s, #%d" % (M, M_offset*2))
    polymul_32x32(s_result_1, fh, "u")
    polymul_32x32(s_result_2, gh, "v")
    
    uf_vg_x(s_result_1, s_result_2)

    # 2
    polymul_32x32(s_result_1, fh, "r")
    polymul_32x32(s_result_2, gh, "s")

    rf_sg(s_result_1, s_result_2)

    epilogue_mod2(f_regs)

# main()