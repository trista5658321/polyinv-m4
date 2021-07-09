import sys

coeffis = int(sys.argv[1])
assert(coeffis % 16 == 0)

def printIn(asm):
    print("\t" + asm)

def prologue(name, params, regs, s_regs = ""):
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

def epilogue(regs, s_regs = "") :
    if s_regs:
        printIn("vpop.w {%s}" % (s_regs))
    printIn("pop.w {%s,pc}" % (regs))

def main():
    f_name = "convert_bit_to_16_%d" % (coeffis)
    f_params = "(int *h, int *f)"
    f_regs = "r4-r11"
    prologue(f_name, f_params, f_regs)
    bit_16 = [ "r" + str(x) for x in range(2,10)]
    bit_4 = ["r10", "r11"]
    tmp = ["r12", "lr"]
    for i in range(coeffis // 16):
        for j in range(1, len(bit_4)):
            printIn("ldr.w %s, [r1, #%d]" % (bit_4[j], 4*j))
        printIn("ldr.w %s, [r1], #%d" % (bit_4[0], 4*len(bit_4)))

        for j in range(len(bit_16)//2):
            # end bit
            if j == 0:
                printIn("and.w %s, %s, #0x1" % (bit_16[j], bit_4[0]))
                printIn("and.w %s, %s, #0x1" % (bit_16[j+4], bit_4[1]))
            else:
                printIn("ubfx.w %s, %s, #%d, #1" % (bit_16[j], bit_4[0], 8*j))
                printIn("ubfx.w %s, %s, #%d, #1" % (bit_16[j+4], bit_4[1], 8*j))
            
            # mid bit
            printIn("ubfx.w %s, %s, #%d, #1" % (tmp[0], bit_4[0], 8*j+4))
            printIn("ubfx.w %s, %s, #%d, #1" % (tmp[1], bit_4[1], 8*j+4))

            printIn("eor.w %s, %s, %s, LSL #%d" % (bit_16[j], bit_16[j], tmp[0], 16))
            printIn("eor.w %s, %s, %s, LSL #%d" % (bit_16[j+4], bit_16[j+4], tmp[1], 16))

        for j in range(1, len(bit_16)):
            printIn("str.w %s, [r0, #%d]" % (bit_16[j], 4*j))
        printIn("str.w %s, [r0], #%d" % (bit_16[0], 4*len(bit_16)))

    epilogue(f_regs)

main()