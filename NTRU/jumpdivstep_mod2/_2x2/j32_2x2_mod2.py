coeffi = 16 # n x n
coeffi_per_byte = 0.5
bits_per_coeffi = int(coeffi_per_byte * 8)
m_offset = int(coeffi * coeffi_per_byte) # unit: bytes

M = "r0"
M1 = "r1"
M2 = "r2"

s_M = "s0"

h1 = ["r3", "r4", "r5", "r6"]
h2 = ["r7", "r8", "r9", "r10"]
tmp = ["r11", "r12", "lr", "r0"]

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

def ldr_m_elem(rd, rs, offset):
    if not offset:
        printIn("ldr.w %s, [%s]" % (rd, rs))
    else:
        printIn("ldr.w %s, [%s, #%d]" % (rd, rs, offset))

def polymul_16x16(h, tmp, m2_elem, m1_elem):
    m2_offset = get_m_offset(m2_elem)
    m1_offset = get_m_offset(m1_elem)

    ldr_m_elem(tmp[0], M2, m2_offset)
    ldr_m_elem(tmp[1], M2, m2_offset+4)
    ldr_m_elem(tmp[2], M1, m1_offset)
    ldr_m_elem(tmp[3], M1, m1_offset+4)

    printIn("umull.w %s, %s, %s, %s" % (h[0], h[1], tmp[0], tmp[2]))
    printIn("umull.w %s, %s, %s, %s" % (h[2], h[3], tmp[1], tmp[3]))
    printIn("umlal.w %s, %s, %s, %s" % (h[1], h[2], tmp[1], tmp[2]))
    printIn("and.w %s, %s, #0x11111111" % (h[1], h[1]))
    printIn("and.w %s, %s, #0x11111111" % (h[2], h[2]))
    printIn("umlal.w %s, %s, %s, %s" % (h[1], h[2], tmp[0], tmp[3]))
    printIn("and.w %s, %s, #0x11111111" % (h[0], h[0]))
    printIn("and.w %s, %s, #0x11111111" % (h[1], h[1]))
    printIn("and.w %s, %s, #0x11111111" % (h[2], h[2]))
    printIn("and.w %s, %s, #0x11111111" % (h[3], h[3]))

def add_str(a, b): # a*x + b
    for i in range(len(a)):
        printIn("eor.w %s, %s, %s, LSL #%d" %(b[i], b[i], a[i], bits_per_coeffi)) # a0-a2
    for i in range(len(a)-1):
        printIn("eor.w %s, %s, %s, LSR #%d" %(b[i+1], b[i+1], a[i], 32 - bits_per_coeffi)) # a3

    printIn("vmov.w %s, %s" % (M, s_M))

    for i in range(1, len(b)):
        printIn("str %s, [%s, #%d]" % (b[i], M, 4*i))
    printIn("str %s, [%s], #%d" % (b[0], M, 4*len(b)))

def main():
    f_name = "__gf_polymul_" + str(coeffi) + "x" + str(coeffi) + "_2x2_x_2x2_mod2"
    f_params = "(int *M,int *M1,int *M2)"
    f_regs = "r4-r11"
    prologue_mod2(f_name, f_params, f_regs)
    printIn("vmov.w %s, %s" % (s_M, M))

    #1
    polymul_16x16(h1, h2, "u", "u")
    polymul_16x16(h2, tmp, "v", "r")
    add_str(h1,h2)

    #2
    polymul_16x16(h1, h2, "u", "v")
    polymul_16x16(h2, tmp, "v", "s")
    add_str(h1,h2)

    #3
    polymul_16x16(h1, h2, "r", "u")
    polymul_16x16(h2, tmp, "s", "r")
    add_str(h1,h2)

    #4
    polymul_16x16(h1, h2, "r", "v")
    polymul_16x16(h2, tmp, "s", "s")
    add_str(h1,h2)

    epilogue_mod2(f_regs)

# main()