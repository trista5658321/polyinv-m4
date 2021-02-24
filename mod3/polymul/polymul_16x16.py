import sys, pathlib
sys.path.append(str(pathlib.Path(__file__).parent.absolute().parent))

from utility import printIn

a_adr = "r1"
b_adr = "r2"
b0 = "r11"
b1 = "r12"
b2 = "lr"

def str_to_s(r, s):
    printIn("vmov.w %s, %s, %s, %s" % (s[0], s[1], r[0], r[1]))
    printIn("vmov.w %s, %s, %s, %s" % (s[2], s[3], r[2], r[3]))

def polymul(i = 0):
    r_1 = ["r" + str(x) for x in range(6,10)]
    r_2 = ["r" + str(x) for x in range(5,9)]
    s_1 = ["s" + str(x + i*8) for x in range(2,6)]
    s_2 = ["s" + str(x + i*8) for x in range(6,10)]

    printIn("mov.w r6, #0")
    printIn("ldr.w r5, [%s], #4" % (a_adr))

    printIn("ldr.w r4, [%s, #12]" % (b_adr))
    printIn("ldr.w %s, [%s, #8]" % (b2, b_adr))
    printIn("ldr.w %s, [%s, #4]" % (b1, b_adr))
    printIn("ldr.w %s, [%s, #0]" % (b0, b_adr))
    
    printIn("umull.w r7, r8, %s, r5" % (b1))
    printIn("umull.w r9, r10, r4, r5")
    printIn("umlal.w r6, r7, %s, r5" % (b0))
    printIn("umlal.w r8, r9, %s, r5" % (b2))

    printIn("ldr.w r5, [%s], #4" % (a_adr))
    printIn("umlal.w r9, r10, %s, r5" % (b2))
    printIn("umlal.w r8, r9, %s, r5" % (b1))
    printIn("umlal.w r7, r8, %s, r5" % (b0))

    printIn("ldr.w r5, [%s], #4" % (a_adr))
    printIn("umlal.w r9, r10, %s, r5" % (b1))
    printIn("umlal.w r8, r9, %s, r5" % (b0))

    printIn("ldr.w r5, [%s], #4" % (a_adr))
    printIn("umlal.w r9, r10, %s, r5" % (b0))

    str_to_s(r_1, s_1)

    printIn("mov.w r6, #0")
    printIn("mov.w r5, r10")

    printIn("ldr.w %s, [%s, #4]" % (b1, b_adr))
    printIn("ldr.w %s, [%s, #8]" % (b2, b_adr))
    printIn("ldr.w r4, [%s, #12]" % (b_adr))
    printIn("ldr.w r9, [%s, #-4]" % (a_adr))
    printIn("umull.w r7, r8, r4, r9")
    printIn("umlal.w r6, r7, %s, r9" % (b2))
    printIn("umlal.w r5, r6, %s, r9" % (b1))

    printIn("ldr.w r9, [%s, #-8]" % (a_adr))
    printIn("umlal.w r6, r7, r4, r9")
    printIn("umlal.w r5, r6, %s, r9" % (b2))

    printIn("ldr.w r9, [%s, #-12]" % (a_adr))
    printIn("umlal.w r5, r6, r4, r9")

    str_to_s(r_2, s_2)