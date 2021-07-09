coeffi = 8 # n x n
coeffi_per_byte = 0.5
bits_per_coeffi = int(coeffi_per_byte * 8)
M_offset = int(coeffi * coeffi_per_byte) # unit: bytes

V = "r0"
M = "r1"
fh = "r2"
gh = "r3"

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

def polymul_8x8(h, g, tmp): # h = g * tmp
    printIn("ldr.w %s, [%s]" % (tmp[0], g))
    printIn("ldr.w %s, [%s], #4" % (tmp[1], M))
    printIn("umull.w %s, %s, %s, %s" % (h[0], h[1], tmp[0], tmp[1]))
    printIn("and.w %s, %s, #0x11111111" % (h[0], h[0]))
    printIn("and.w %s, %s, #0x11111111" % (h[1], h[1]))

def str_back(rs):
    for i in range(1, len(rs)):
        printIn("str %s, [%s, #%d]" % (rs[i], V, 4*i))
    printIn("str %s, [%s], #%d" % (rs[0], V, 4*len(rs)))

def main():
    f_name = "__gf_polymul_" + str(coeffi) + "x" + str(coeffi) + "_2x2_x2p2_mod2"
    f_params = "(int *V, int *M, int *fh, int *gh)"
    f_regs = "r4-r11"
    prologue_mod2(f_name, f_params, f_regs)

    # 1
    printIn("add.w %s, #%d" % (M, M_offset*2))
    polymul_8x8(h1, fh, h2)
    polymul_8x8(h2, gh, tmp)
    
    for i in range(len(h1)):
        printIn("eor.w %s, %s" % (h1[i], h2[i]))

    ## M at r
    printIn("ldr.w %s, [%s, #-%d]" % (h2[0], M, M_offset*4)) # f1

    ## add f1
    printIn("eor.w %s, %s, %s, LSL #%d" % (h2[0], h2[0], h1[0], bits_per_coeffi))

    for i in range(len(h1)//2, len(h1)):
        printIn("ubfx.w %s, %s, #%d, #%d" % (tmp[0], h1[i-1], 32 - bits_per_coeffi, bits_per_coeffi)) # get the coeffi with the highest degree
        printIn("eor.w %s, %s, %s, LSL #%d" % (h2[i], tmp[0], h1[i], bits_per_coeffi))
    
    str_back(h2)

    # 2
    polymul_8x8(h1, fh, h2)
    polymul_8x8(h2, gh, tmp)

    for i in range(len(h1)):
        printIn("eor.w %s, %s" % (h1[i], h2[i]))

    ## M at end
    printIn("ldr.w %s, [%s, #-%d]" % (h2[0], M, M_offset*5)) # g1

    for i in range(len(h1)//2):
        printIn("eor.w %s, %s" % (h1[i], h2[i]))

    str_back(h1)    

    epilogue_mod2(f_regs)

# main()