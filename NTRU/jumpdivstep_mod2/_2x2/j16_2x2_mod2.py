coeffi = 8 # n x n
coeffi_per_byte = 0.5
bits_per_coeffi = int(coeffi_per_byte * 8)
m_offset = int(coeffi * coeffi_per_byte) # unit: bytes

M = "r0"
M1 = "r1"
M2 = "r2"

h1 = ["r4", "r5"]
h2 = ["r6", "r7"]
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

def polymul_8x8(h, tmp, m2_elem, m1_elem):
    m2_offset = get_m_offset(m2_elem)
    m1_offset = get_m_offset(m1_elem)

    ldr_m_elem(tmp[0], M2, m2_offset)
    ldr_m_elem(tmp[1], M1, m1_offset)
    printIn("umull.w %s, %s, %s, %s" % (h[0], h[1], tmp[0], tmp[1]))
    printIn("and.w %s, %s, #0x11111111" % (h[0], h[0]))
    printIn("and.w %s, %s, #0x11111111" % (h[1], h[1]))

def add_str(a, b): # a*x + b
    for i in range(len(a)):
        printIn("eor.w %s, %s, %s, LSL #%d" %(b[i], b[i], a[i], bits_per_coeffi)) # a0-a2
    for i in range(len(a)-1):
        printIn("eor.w %s, %s, %s, LSR #%d" %(b[i+1], b[i+1], a[i], 32 - bits_per_coeffi)) # a3

    for i in range(1, len(b)):
        printIn("str %s, [%s, #%d]" % (b[i], M, 4*i))
    printIn("str %s, [%s], #%d" % (b[0], M, 4*len(b)))

def main():
    f_name = "__gf_polymul_" + str(coeffi) + "x" + str(coeffi) + "_2x2_x_2x2_mod2"
    f_params = "(int *M,int *M1,int *M2)"
    f_regs = "r4-r11"
    prologue_mod2(f_name, f_params, f_regs)

    #1
    polymul_8x8(h1, h2, "u", "u")
    polymul_8x8(h2, tmp, "v", "r")
    add_str(h1,h2)

    #2
    polymul_8x8(h1, h2, "u", "v")
    polymul_8x8(h2, tmp, "v", "s")
    add_str(h1,h2)

    #3
    polymul_8x8(h1, h2, "r", "u")
    polymul_8x8(h2, tmp, "s", "r")
    add_str(h1,h2)

    #4
    polymul_8x8(h1, h2, "r", "v")
    polymul_8x8(h2, tmp, "s", "s")
    add_str(h1,h2)

    epilogue_mod2(f_regs)

# main()