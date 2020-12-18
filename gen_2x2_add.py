from utility import printIn, LENGTH, barrett_16x2i
import utility as u

DEST = "r0"
M = "r0"
B_1 = "r1"
q = "r2"
qR2inv = "r3"
_2P15 = "r4"
COEFFI = ["r5", "r6", "r7", "r8"]
TMP = ["r9", "r10", "r11", "r12", "lr"]

def add_coeffi(total_round):
    for i in range(total_round):
        # get 4 pair coefficients
        printIn("ldr.w " + COEFFI[0] + ", [" + B_1 + ", #" + str(16*i) + "]")
        printIn("ldr.w " + COEFFI[1] + ", [" + B_1 + ", #" + str(16*i+4) + "]")
        printIn("ldr.w " + COEFFI[2] + ", [" + B_1 + ", #" + str(16*i+8) + "]")
        printIn("ldr.w " + COEFFI[3] + ", [" + B_1 + ", #" + str(16*i+12) + "]")

        printIn("ldr.w " + TMP[0] + ", [" + M + ", #" + str(16*i) + "]")
        printIn("ldr.w " + TMP[1] + ", [" + M + ", #" + str(16*i+4) + "]")
        printIn("ldr.w " + TMP[2] + ", [" + M + ", #" + str(16*i+8) + "]")
        printIn("ldr.w " + TMP[3] + ", [" + M + ", #" + str(16*i+12) + "]")

        printIn("sadd16.w " + COEFFI[0] + "," + COEFFI[0] + "," + TMP[0])
        printIn("sadd16.w " + COEFFI[1] + "," + COEFFI[1] + "," + TMP[1])
        printIn("sadd16.w " + COEFFI[2] + "," + COEFFI[2] + "," + TMP[2])
        printIn("sadd16.w " + COEFFI[3] + "," + COEFFI[3] + "," + TMP[3])

        # reduction
        barrett_16x2i (COEFFI[0], q, qR2inv, _2P15, TMP[0], TMP[1])
        barrett_16x2i (COEFFI[1], q, qR2inv, _2P15, TMP[0], TMP[1])
        barrett_16x2i (COEFFI[2], q, qR2inv, _2P15, TMP[0], TMP[1])
        barrett_16x2i (COEFFI[3], q, qR2inv, _2P15, TMP[0], TMP[1])

        # store result
        printIn("str.w " + COEFFI[0] + ", ["+DEST+", #" + str(16*i) + "]")
        printIn("str.w " + COEFFI[1] + ", ["+DEST+", #" + str(16*i+4) + "]")
        printIn("str.w " + COEFFI[2] + ", ["+DEST+", #" + str(16*i+8) + "]")
        printIn("str.w " + COEFFI[3] + ", ["+DEST+", #" + str(16*i+12) + "]")

def main():
    total_round = int(LENGTH * 2 / 8)

    u.get_q(q)
    u.get_qR2inv(qR2inv)
    u.get_2P15(_2P15)
    add_coeffi(total_round)

# main()