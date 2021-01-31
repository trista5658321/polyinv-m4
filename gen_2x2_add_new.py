from utility import printIn, LENGTH_1, LENGTH_2, barrett_16x2i
import utility as u

DEST = "r0"
M = "r0"
B_1 = "r1"
q = "r2"
qR2inv = "r3"
_2P15 = "r4"
COEFFI = ["r5", "r6", "r7", "r8"]
TMP = ["r9", "r10", "r11", "r12"]

def add_c(next_gap):
    printIn("ldr.w " + COEFFI[1] + ", [" + B_1 + ", #" + str(4) + "]")
    printIn("ldr.w " + COEFFI[2] + ", [" + B_1 + ", #" + str(8) + "]")
    printIn("ldr.w " + COEFFI[3] + ", [" + B_1 + ", #" + str(12) + "]")
    printIn("ldr.w " + COEFFI[0] + ", [" + B_1 + "], #" + str(next_gap))

    printIn("ldr.w " + TMP[0] + ", [" + M + "]")
    printIn("ldr.w " + TMP[1] + ", [" + M + ", #" + str(4) + "]")
    printIn("ldr.w " + TMP[2] + ", [" + M + ", #" + str(8) + "]")
    printIn("ldr.w " + TMP[3] + ", [" + M + ", #" + str(12) + "]")

    printIn("sadd16.w " + COEFFI[0] + ", " + COEFFI[0] + ", " + TMP[0])
    printIn("sadd16.w " + COEFFI[1] + ", " + COEFFI[1] + ", " + TMP[1])
    printIn("sadd16.w " + COEFFI[2] + ", " + COEFFI[2] + ", " + TMP[2])
    printIn("sadd16.w " + COEFFI[3] + ", " + COEFFI[3] + ", " + TMP[3])

    # reduction
    barrett_16x2i (COEFFI[0], q, qR2inv, _2P15, TMP[0], TMP[1])
    barrett_16x2i (COEFFI[1], q, qR2inv, _2P15, TMP[0], TMP[1])
    barrett_16x2i (COEFFI[2], q, qR2inv, _2P15, TMP[0], TMP[1])
    barrett_16x2i (COEFFI[3], q, qR2inv, _2P15, TMP[0], TMP[1])

    # store result
    printIn("str.w " + COEFFI[1] + ", ["+DEST+", #" + str(4) + "]")
    printIn("str.w " + COEFFI[2] + ", ["+DEST+", #" + str(8) + "]")
    printIn("str.w " + COEFFI[3] + ", ["+DEST+", #" + str(12) + "]")
    printIn("str.w " + COEFFI[0] + ", ["+DEST+"], #" + str(next_gap))

def add_r(c_pair_num):
    next_gap = c_pair_num * 4
    for i in range(1, c_pair_num):
        printIn("ldr.w " + COEFFI[i] + ", [" + B_1 + ", #" + str(4*i) + "]")
    printIn("ldr.w " + COEFFI[0] + ", [" + B_1 + "], #" + str(next_gap))
    
    printIn("ldr.w " + TMP[0] + ", [" + M + "]")
    for i in range(1, c_pair_num):
        printIn("ldr.w " + TMP[i] + ", [" + M + ", #" + str(4*i) + "]")
    
    for i in range(c_pair_num):
        printIn("sadd16.w " + COEFFI[i] + ", " + COEFFI[i] + ", " + TMP[i])

    # reduction
    for i in range(c_pair_num):
        barrett_16x2i (COEFFI[i], q, qR2inv, _2P15, TMP[0], TMP[1])
    
    # store result
    for i in range(1, c_pair_num):
        printIn("str.w " + COEFFI[i] + ", ["+DEST+", #" + str(i*4) + "]")
    printIn("str.w " + COEFFI[0] + ", ["+DEST+"], #" + str(next_gap))

def main():
    Total_C = LENGTH_1 + LENGTH_2
    c_pair_num = 4

    u.get_q(q)
    u.get_qR2inv(qR2inv)
    u.get_2P15(_2P15)

    printIn("add.w lr, r0, #" + str(Total_C*2))
    print("_add:")
    add_r(c_pair_num)
    printIn("cmp.w lr, r0")
    printIn("bne.w _add")

# main()