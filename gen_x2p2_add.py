from utility import printIn, LENGTH_1, LENGTH_2, barrett_16x2i
import utility as u

Total_co = LENGTH_1 + LENGTH_2
stack_align_space = Total_co * 2
f1g1_space = LENGTH_1 * 2

DEST = "r0"
stack = "r1"
f1g1 = "r2"
q = "r10"
qR2inv = "r11"
_2P15 = "r12"

COEFFI_3 = ["r3", "r4"]
TMP_3_0 = ["r5", "r6"]
TMP_3_1 = ["r7", "r8", "r9"]
COEFFI_2 = ["r2", "r3", "r4", "r5"]
TMP_2 = ["r6", "r7", "r8", "r9"]

def add_coeffi_3():
    c_pair_num = len(COEFFI_3)
    next_gap = c_pair_num * 4
    for i in range(1, c_pair_num):
        printIn("ldr.w " + COEFFI_3[i] + ", [" + f1g1 + ", #" + str(4*i) + "]")
    printIn("ldr.w " + COEFFI_3[0] + ", [" + f1g1 + "], #" + str(next_gap))
    
    for i in range(1, c_pair_num):
        printIn("ldr.w " + TMP_3_0[i] + ", [" + stack + ", #" + str(4*i) + "]")
    for i in range(c_pair_num):
        printIn("ldr.w " + TMP_3_1[i] + ", [" + stack + ", #" + str(4*i + stack_align_space) + "]")
    printIn("ldr.w " + TMP_3_0[0] + ", [" + stack + "], #" + str(next_gap))
    
    for i in range(c_pair_num):
        printIn("sadd16.w " + COEFFI_3[i] + ", " + COEFFI_3[i] + ", " + TMP_3_0[i])
    for i in range(c_pair_num):
        printIn("sadd16.w " + COEFFI_3[i] + ", " + COEFFI_3[i] + ", " + TMP_3_1[i])

    # reduction
    for i in range(c_pair_num):
        barrett_16x2i (COEFFI_3[i], q, qR2inv, _2P15, TMP_3_0[0], TMP_3_0[1])
    
    # store result
    for i in range(1, c_pair_num):
        printIn("str.w " + COEFFI_3[i] + ", ["+DEST+", #" + str(i*4) + "]")
    printIn("str.w " + COEFFI_3[0] + ", ["+DEST+"], #" + str(next_gap))

def add_coeffi_2():
    c_pair_num = len(COEFFI_2)
    next_gap = c_pair_num * 4
    
    for i in range(1, c_pair_num):
        printIn("ldr.w " + COEFFI_2[i] + ", [" + stack + ", #" + str(4*i) + "]")
    for i in range(c_pair_num):
        printIn("ldr.w " + TMP_2[i] + ", [" + stack + ", #" + str(4*i + stack_align_space) + "]")
    printIn("ldr.w " + COEFFI_2[0] + ", [" + stack + "], #" + str(next_gap))
    
    for i in range(c_pair_num):
        printIn("sadd16.w " + COEFFI_2[i] + ", " + COEFFI_2[i] + ", " + TMP_2[i])

    # reduction
    for i in range(c_pair_num):
        barrett_16x2i (COEFFI_2[i], q, qR2inv, _2P15, TMP_2[0], TMP_2[1])
    
    # store result
    for i in range(1, c_pair_num):
        printIn("str.w " + COEFFI_2[i] + ", ["+DEST+", #" + str(i*4) + "]")
    printIn("str.w " + COEFFI_2[0] + ", ["+DEST+"], #" + str(next_gap))

def main():
    # f_params = "(int *V,int *B64_1,int *B64_2,int *M)"
    # u.head("gf_polymul_32x32_add_f", f_params)
    # u.get_q(q)
    # u.get_qR2inv(qR2inv)
    # u.get_2P15(_2P15)
    printIn("add.w lr, r0, #" + str(f1g1_space))
    printIn("add_3:")
    add_coeffi_3()
    printIn("cmp.w lr, r0")
    printIn("bne.w add_3")

    printIn("add.w lr, r0, #" + str(stack_align_space - f1g1_space))
    printIn("add_2:")
    add_coeffi_2()
    printIn("cmp.w lr, r0")
    printIn("bne.w add_2")
    # u.end()

# main()