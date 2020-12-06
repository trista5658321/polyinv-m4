from utility import printIn, LENGTH, barrett_16x2i, barrett
import utility as u

def add_coeffi_3(dest, rfh, sgh, f1g1, coeffi, tmp, q, qR2inv, _2P15, total_round):
    offset_bytes = LENGTH * 2 * 2 # address of g in V
    g1_offset_bytes = LENGTH * 2 # address of g1 in M

    for i in range(total_round):
        # get 4 pair coefficients
        printIn("ldr.w " + coeffi[0] + ", [" + rfh + ", #" + str(offset_bytes + 16*i) + "]")
        printIn("ldr.w " + coeffi[1] + ", [" + rfh + ", #" + str(offset_bytes + 16*i+4) + "]")
        printIn("ldr.w " + coeffi[2] + ", [" + rfh + ", #" + str(offset_bytes + 16*i+8) + "]")
        printIn("ldr.w " + coeffi[3] + ", [" + rfh + ", #" + str(offset_bytes + 16*i+12) + "]")
        printIn("ldr.w " + tmp[0] + ", [" + sgh + ", #" + str(16*i) + "]")
        printIn("ldr.w " + tmp[1] + ", [" + sgh + ", #" + str(16*i+4) + "]")
        printIn("ldr.w " + tmp[2] + ", [" + sgh + ", #" + str(16*i+8) + "]")
        printIn("ldr.w " + tmp[3] + ", [" + sgh + ", #" + str(16*i+12) + "]")
        printIn("sadd16.w " + coeffi[0] + "," + coeffi[0] + "," + tmp[0])
        printIn("sadd16.w " + coeffi[1] + "," + coeffi[1] + "," + tmp[1])
        printIn("sadd16.w " + coeffi[2] + "," + coeffi[2] + "," + tmp[2])
        printIn("sadd16.w " + coeffi[3] + "," + coeffi[3] + "," + tmp[3])

        printIn("ldr.w " + tmp[0] + ", [" + f1g1 + ", #" + str(g1_offset_bytes + 16*i) + "]")
        printIn("ldr.w " + tmp[1] + ", [" + f1g1 + ", #" + str(g1_offset_bytes + 16*i+4) + "]")
        printIn("ldr.w " + tmp[2] + ", [" + f1g1 + ", #" + str(g1_offset_bytes + 16*i+8) + "]")
        printIn("ldr.w " + tmp[3] + ", [" + f1g1 + ", #" + str(g1_offset_bytes + 16*i+12) + "]")
        printIn("sadd16.w " + coeffi[0] + "," + coeffi[0] + "," + tmp[0])
        printIn("sadd16.w " + coeffi[1] + "," + coeffi[1] + "," + tmp[1])
        printIn("sadd16.w " + coeffi[2] + "," + coeffi[2] + "," + tmp[2])        
        printIn("sadd16.w " + coeffi[3] + "," + coeffi[3] + "," + tmp[3])

        # reduction
        barrett_16x2i (coeffi[0], q, qR2inv, _2P15, tmp[0], tmp[1])
        barrett_16x2i (coeffi[1], q, qR2inv, _2P15, tmp[0], tmp[1])
        barrett_16x2i (coeffi[2], q, qR2inv, _2P15, tmp[0], tmp[1])
        barrett_16x2i (coeffi[3], q, qR2inv, _2P15, tmp[0], tmp[1])

        # store result
        printIn("str.w " + coeffi[0] + ", [" + dest + ", #" + str(offset_bytes + 16*i) + "]")
        printIn("str.w " + coeffi[1] + ", [" + dest + ", #" + str(offset_bytes + 16*i+4) + "]")
        printIn("str.w " + coeffi[2] + ", [" + dest + ", #" + str(offset_bytes + 16*i+8) + "]")
        printIn("str.w " + coeffi[3] + ", [" + dest + ", #" + str(offset_bytes + 16*i+12) + "]")

def add_coeffi_2(dest, rfh, sgh, coeffi, tmp, q, qR2inv, _2P15, total_round):
    offset_bytes = LENGTH * 2 * 2 # address of g in V
    sgh_offset_bytes = LENGTH * 2 # address of sgh

    v_init_position = offset_bytes + LENGTH * 2

    for i in range(total_round):
        # get 4 pair coefficients
        printIn("ldr.w " + coeffi[0] + ", [" + rfh + ", #" + str(v_init_position + 16*i) + "]")
        printIn("ldr.w " + coeffi[1] + ", [" + rfh + ", #" + str(v_init_position + 16*i+4) + "]")
        printIn("ldr.w " + coeffi[2] + ", [" + rfh + ", #" + str(v_init_position + 16*i+8) + "]")
        
        if i == total_round - 1:
            printIn("ldrsh.w " + coeffi[3] + ", [" + rfh + ", #" + str(v_init_position + 16*i+12) + "]")
        else:
            printIn("ldr.w " + coeffi[3] + ", [" + rfh + ", #" + str(v_init_position + 16*i+12) + "]")

        printIn("ldr.w " + tmp[0] + ", [" + sgh + ", #" + str(sgh_offset_bytes + 16*i) + "]")
        printIn("ldr.w " + tmp[1] + ", [" + sgh + ", #" + str(sgh_offset_bytes + 16*i+4) + "]")
        printIn("ldr.w " + tmp[2] + ", [" + sgh + ", #" + str(sgh_offset_bytes + 16*i+8) + "]")
        if i == total_round - 1:
            printIn("ldrsh.w " + tmp[3] + ", [" + sgh + ", #" + str(sgh_offset_bytes + 16*i+12) + "]")
        else:
            printIn("ldr.w " + tmp[3] + ", [" + sgh + ", #" + str(sgh_offset_bytes + 16*i+12) + "]")

        printIn("sadd16.w " + coeffi[0] + "," + coeffi[0] + "," + tmp[0])
        printIn("sadd16.w " + coeffi[1] + "," + coeffi[1] + "," + tmp[1])
        printIn("sadd16.w " + coeffi[2] + "," + coeffi[2] + "," + tmp[2])
        if i == total_round - 1:
            printIn("add.w " + coeffi[3] + "," + coeffi[3] + "," + tmp[3])
        else:
            printIn("sadd16.w " + coeffi[3] + "," + coeffi[3] + "," + tmp[3])

        # reduction
        barrett_16x2i (coeffi[0], q, qR2inv, _2P15, tmp[0], tmp[1])
        barrett_16x2i (coeffi[1], q, qR2inv, _2P15, tmp[0], tmp[1])
        barrett_16x2i (coeffi[2], q, qR2inv, _2P15, tmp[0], tmp[1])

        if i == total_round - 1:
            barrett(coeffi[3], q, qR2inv, tmp[0])
        else:
            barrett_16x2i (coeffi[3], q, qR2inv, _2P15, tmp[0], tmp[1])

        # store result
        printIn("str.w " + coeffi[0] + ", ["+dest+", #" + str(v_init_position+16*i) + "]")
        printIn("str.w " + coeffi[1] + ", ["+dest+", #" + str(v_init_position+16*i+4) + "]")
        printIn("str.w " + coeffi[2] + ", ["+dest+", #" + str(v_init_position+16*i+8) + "]")

        if i == total_round - 1:
            printIn("strh.w " + coeffi[3] + ", ["+dest+", #" + str(v_init_position+16*i+12) + "]")
        else:
            printIn("str.w " + coeffi[3] + ", ["+dest+", #" + str(v_init_position+16*i+12) + "]")

def main():
    dest = "r0"
    rfh = "r0" # store in V
    sgh = "r1"
    f1g1 = "r2"
    q = "r3"
    qR2inv = "r4"
    _2P15 = "r5"
    coeffi = ["r6", "r7", "r8", "r9"]
    tmp = ["r10", "r11", "r12", "lr"]

    total_round = int(LENGTH / 8)

    # f_name = "gf_polymul_32x32_add_g"
    # f_params = "(int *V,int *B64_1,int *B64_2,int *M)"
    # u.head(f_name, f_params)
    u.get_q(q)
    u.get_qR2inv(qR2inv)
    u.get_2P15(_2P15)
    add_coeffi_3(dest, rfh, sgh, f1g1, coeffi, tmp, q, qR2inv, _2P15, total_round)
    add_coeffi_2(dest, rfh, sgh, coeffi, tmp, q, qR2inv, _2P15, total_round)
    # u.end()

# main()