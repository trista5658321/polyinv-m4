from utility import printIn, LENGTH, barrett_16x2i
import utility as u

def add_coeffi_3(dest, coeffi, tmp, q, qR2inv, _2P15, total_round):
    for i in range(total_round):
        # get 4 pair coefficients
        printIn("ldr.w " + coeffi[0] + ", [r1, #" + str(16*i) + "]")
        printIn("ldr.w " + coeffi[1] + ", [r1, #" + str(16*i+4) + "]")
        printIn("ldr.w " + coeffi[2] + ", [r1, #" + str(16*i+8) + "]")
        printIn("ldr.w " + coeffi[3] + ", [r1, #" + str(16*i+12) + "]")
        printIn("ldr.w " + tmp[0] + ", [r2, #" + str(16*i) + "]")
        printIn("ldr.w " + tmp[1] + ", [r2, #" + str(16*i+4) + "]")
        printIn("ldr.w " + tmp[2] + ", [r2, #" + str(16*i+8) + "]")
        printIn("sadd16.w " + coeffi[0] + "," + coeffi[0] + "," + tmp[0])
        printIn("sadd16.w " + coeffi[1] + "," + coeffi[1] + "," + tmp[1])
        printIn("sadd16.w " + coeffi[2] + "," + coeffi[2] + "," + tmp[2])

        printIn("ldr.w " + tmp[0] + ", [r3, #" + str(16*i) + "]")
        printIn("ldr.w " + tmp[1] + ", [r3, #" + str(16*i+4) + "]")
        printIn("ldr.w " + tmp[2] + ", [r3, #" + str(16*i+8) + "]")
        printIn("sadd16.w " + coeffi[0] + "," + coeffi[0] + "," + tmp[0])
        printIn("sadd16.w " + coeffi[1] + "," + coeffi[1] + "," + tmp[1])
        printIn("sadd16.w " + coeffi[2] + "," + coeffi[2] + "," + tmp[2])

        printIn("ldr.w " + tmp[0] + ", [r2, #" + str(16*i+12) + "]")
        printIn("ldr.w " + tmp[1] + ", [r3, #" + str(16*i+12) + "]")
        printIn("sadd16.w " + coeffi[3] + "," + coeffi[3] + "," + tmp[0])
        printIn("sadd16.w " + coeffi[3] + "," + coeffi[3] + "," + tmp[1])

        # reduction
        barrett_16x2i (coeffi[0], q, qR2inv, _2P15, tmp[0], tmp[1])
        barrett_16x2i (coeffi[1], q, qR2inv, _2P15, tmp[0], tmp[1])
        barrett_16x2i (coeffi[2], q, qR2inv, _2P15, tmp[0], tmp[1])
        barrett_16x2i (coeffi[3], q, qR2inv, _2P15, tmp[0], tmp[1])

        # store result
        printIn("str.w " + coeffi[0] + ", ["+dest+", #" + str(16*i) + "]")
        printIn("str.w " + coeffi[1] + ", ["+dest+", #" + str(16*i+4) + "]")
        printIn("str.w " + coeffi[2] + ", ["+dest+", #" + str(16*i+8) + "]")
        printIn("str.w " + coeffi[3] + ", ["+dest+", #" + str(16*i+12) + "]")

def add_coeffi_2(dest, coeffi, tmp, q, qR2inv, _2P15, total_round):
    init_position = total_round * 8 * 2
    for i in range(total_round):
        # get 4 pair coefficients
        printIn("ldr.w " + coeffi[0] + ", [r1, #" + str(init_position+16*i) + "]")
        printIn("ldr.w " + coeffi[1] + ", [r1, #" + str(init_position+16*i+4) + "]")
        printIn("ldr.w " + coeffi[2] + ", [r1, #" + str(init_position+16*i+8) + "]")
        printIn("ldr.w " + coeffi[3] + ", [r1, #" + str(init_position+16*i+12) + "]")
        printIn("ldr.w " + tmp[0] + ", [r2, #" + str(init_position+16*i) + "]")
        printIn("ldr.w " + tmp[1] + ", [r2, #" + str(init_position+16*i+4) + "]")
        printIn("ldr.w " + tmp[2] + ", [r2, #" + str(init_position+16*i+8) + "]")
        printIn("sadd16.w " + coeffi[0] + "," + coeffi[0] + "," + tmp[0])
        printIn("sadd16.w " + coeffi[1] + "," + coeffi[1] + "," + tmp[1])
        printIn("sadd16.w " + coeffi[2] + "," + coeffi[2] + "," + tmp[2])

        printIn("ldr.w " + tmp[0] + ", [r2, #" + str(init_position+16*i+12) + "]")
        printIn("sadd16.w " + coeffi[3] + "," + coeffi[3] + "," + tmp[0])

        # reduction
        barrett_16x2i (coeffi[0], q, qR2inv, _2P15, tmp[0], tmp[1])
        barrett_16x2i (coeffi[1], q, qR2inv, _2P15, tmp[0], tmp[1])
        barrett_16x2i (coeffi[2], q, qR2inv, _2P15, tmp[0], tmp[1])
        barrett_16x2i (coeffi[3], q, qR2inv, _2P15, tmp[0], tmp[1])

        # store result
        printIn("str.w " + coeffi[0] + ", ["+dest+", #" + str(init_position+16*i) + "]")
        printIn("str.w " + coeffi[1] + ", ["+dest+", #" + str(init_position+16*i+4) + "]")
        printIn("str.w " + coeffi[2] + ", ["+dest+", #" + str(init_position+16*i+8) + "]")
        printIn("str.w " + coeffi[3] + ", ["+dest+", #" + str(init_position+16*i+12) + "]")

def main():
    dest = "r0"
    ufh = "r1"
    vgh = "r2"
    f1g1 = "r3"
    q = "r4"
    qR2inv = "r5"
    _2P15 = "r6"
    coeffi = ["r7", "r8", "r9", "r10"]
    tmp = ["r11", "r12", "lr"]

    total_round = int(LENGTH / 8)

    # f_params = "(int *V,int *B64_1,int *B64_2,int *M)"
    # u.head("gf_polymul_32x32_add_f", f_params)
    u.get_q(q)
    u.get_qR2inv(qR2inv)
    u.get_2P15(_2P15)
    add_coeffi_3(dest, coeffi, tmp, q, qR2inv, _2P15, total_round)
    add_coeffi_2(dest, coeffi, tmp, q, qR2inv, _2P15, total_round)
    # u.end()

# main()