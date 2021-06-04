import sys, pathlib
d_root = pathlib.Path(__file__).parent.absolute().parent.parent.parent
sys.path.append(str(d_root))

from mod_q.ntt.utility_ntt import gen_iwpad, butterfly_without_mul_32

q = "r11"
qinv = "r12"
per_bytes = 4 # coeffi

w0 = "r1"
w1 = "r2"
w2 = "r3"

s_r0_start = "s0"
s_r0_end = "s2"
s_wpad = "s1"
s_w0 = "s4"
s_w1 = "s5"
s_w2 = "s6"

def printIn(asm):
    print("\t" + asm)

def get_w(tmp, s_id = w0, e_id = w2):
    printIn("vmov %s, %s" % (tmp, s_wpad))
    printIn("ldm %s!, {%s-%s}" % (tmp, s_id, e_id))
    printIn("vmov %s, %s" % (s_wpad, tmp))

def i_butterfly(a, b, w, tmp):
    _b = tmp[2]
    low = tmp[0]
    high = b
    _tmp = tmp[1]

    printIn("sub.w %s, %s, %s" % (_b, a, b))
    printIn("add.w %s, %s, %s" % (a, a, b))
    printIn("smull %s, %s, %s, %s" % (low, high, _b, w))
    printIn("mul.w %s, %s, %s" % (_tmp, low, qinv))
    printIn("smlal %s, %s, %s, %s" % (low, high, _tmp, q))

def i_2_layer_one_coeffi(degree, end):
        w = ["r" + str(x) for x in range(1,4)]
        coeffi = ["r" + str(x) for x in range(4,8)]
        tmp = ["r" + str(x) for x in range(8,11)]

        for i in range(len(coeffi)):
            if i == 0:
                printIn("ldr.w %s, [r0]" % (coeffi[i]))
            else:
                printIn("ldr.w %s, [r0, #%d]" % (coeffi[i], degree*per_bytes*i))

        i_butterfly(coeffi[0], coeffi[1], w[1], tmp)
        i_butterfly(coeffi[2], coeffi[3], w[2], tmp)
        i_butterfly(coeffi[0], coeffi[2], w[0], tmp)
        i_butterfly(coeffi[1], coeffi[3], w[0], tmp)

        for i in range(1, len(coeffi)):
            printIn("str.w %s, [r0, #%d]" % (coeffi[i], degree*per_bytes*i))

        if end:
            add_space = degree * per_bytes * 3 + per_bytes
            if add_space > 256:
                printIn("str.w %s, [r0]" % (coeffi[0]))
                printIn("add.w r0, #%d" % (add_space))
            else:
                printIn("str.w %s, [r0], #%d" % (coeffi[0], add_space))
        else:
            printIn("str.w %s, [r0], #%d" % (coeffi[0], per_bytes))

# required: s_r0_end <- r0 end
def i_2_layer_fold(layer, degree):
    printIn("vmov r0, %s" % (s_r0_start))
    label = "intt2_layer_%d_%d" % (layer-1, layer)
    fold_num = 8 # 8 coeffis per round
    label_inner = label + "inner"
    tmp_reg = "r10"

    # loop: 3 butterfly per round
    print(label + str(":"))

    # inner loop setting:
    printIn("add.w lr, r0, #%d @ %d" % (degree * per_bytes, degree))
    get_w(tmp_reg)
    print(label_inner + str(":"))

    for i in range(fold_num):
        i_2_layer_one_coeffi(degree, i == degree -1)
    
    printIn("cmp.w r0, lr")
    printIn("bne.w %s" % (label_inner))
    # end inner
    printIn("add.w r0, r0, #%d" % (3 * degree * per_bytes))
    printIn("vmov %s, %s" % (tmp_reg, s_r0_end))
    printIn("cmp.w r0, %s" % (tmp_reg))

    printIn("bne.w %s" % (label))

# required: lr <- r0 end
def i_2_layer(layer, degree, loop_flag = "lr"):
    tmp_reg = "r10"
    printIn("vmov r0, %s" % (s_r0_start))
    label = "intt2_layer_%d_%d" % (layer-1, layer)
    # loop: 3 butterfly per round
    print(label + str(":"))
    get_w(tmp_reg)
    for i in range(degree):
        i_2_layer_one_coeffi(degree, i == degree -1)
    printIn("cmp.w r0, %s" % (loop_flag))
    printIn("bne.w %s" % (label))

def i_layer_012(layer, degree, loop_flag = "lr"):
    printIn("vmov r0, %s" % (s_r0_start))
    get_w("r10")
    printIn("vmov %s, %s, %s, %s" % (s_w0, s_w1, w0, w1))
    printIn("vmov %s, %s" % (s_w2, w2))
    printIn("add.w lr, r0, #%d @ %d" % (degree * per_bytes, degree))

    label = "intt2_layer_%d_%d_%d" % (0, layer-1, layer)
    # loop: 7 butterfly per round
    print(label + str(":"))

    printIn("vmov %s, %s, %s, %s" % (w0, w1, s_w0, s_w1))
    printIn("vmov %s, %s" % (w2, s_w2))

    coeffi_2 = ["r" + str(x) for x in range(7,11)]
    tmp_2 = ["r" + str(x) for x in range(4,7)]
    coeffi_1 = ["r" + str(x) for x in range(3,7)]
    tmp_1 = ["r1", "r2", "r2"] # low, _tmp, _b

    # right half
    for i in range(len(coeffi_2)):
        printIn("ldr.w %s, [r0, #%d]" % (coeffi_2[i], degree*per_bytes*i + degree * per_bytes * 4))

    i_butterfly(coeffi_2[0], coeffi_2[1], w1, tmp_2)
    i_butterfly(coeffi_2[2], coeffi_2[3], w2, tmp_2)
    i_butterfly(coeffi_2[0], coeffi_2[2], w0, tmp_2)
    i_butterfly(coeffi_2[1], coeffi_2[3], w0, tmp_2)

    # left half
    for i in range(len(coeffi_1)):
        if i == 0:
            printIn("ldr.w %s, [r0]" % (coeffi_1[i]))
        else:
            printIn("ldr.w %s, [r0, #%d]" % (coeffi_1[i], degree*per_bytes*i))
    
    butterfly_without_mul_32(coeffi_1[0], coeffi_1[1])
    i_butterfly(coeffi_1[2], coeffi_1[3], w0, tmp_1)
    butterfly_without_mul_32(coeffi_1[0], coeffi_1[2])
    butterfly_without_mul_32(coeffi_1[1], coeffi_1[3])

    printIn("@ layer 0")
    butterfly_without_mul_32(coeffi_1[0], coeffi_2[0])
    butterfly_without_mul_32(coeffi_1[1], coeffi_2[1])
    butterfly_without_mul_32(coeffi_1[2], coeffi_2[2])
    butterfly_without_mul_32(coeffi_1[3], coeffi_2[3])
    
    # store back
    coeffi = coeffi_1 + coeffi_2
    for i in range(1, len(coeffi)):
        printIn("str.w %s, [r0, #%d]" % (coeffi[i], degree*per_bytes*i))
    printIn("str.w %s, [r0], #%d" % (coeffi[0], per_bytes))

    printIn("cmp.w r0, %s" % (loop_flag))
    printIn("bne.w %s" % (label))

def prologue(p, n, w, w_power):
    print(".p2align 2,,3")
    print(".syntax unified")
    print(".text")

    gen_iwpad(p, n, w, w_power)

    print("// void intt%d_32bit (int *v);" % (n))
    print(".global intt%d_32bit" % (n))
    print(".type intt%d_32bit, %%function" % (n))
    print("intt%d_32bit:" % (n))

    printIn("push {r4-r11, lr}")
    printIn("adr.w r1, wpad")
    printIn("ldm r1!, {%s-%s}" % (q, qinv))
    # s0: r0 start, s1: w_pad
    printIn("vmov.w s0, s1, r0, r1")

    printIn("add.w lr, r0, #%d" % (n * 4))
    printIn("vmov %s, lr @ lr: flag(r0-end)" % (s_r0_end))

def epilogue():
    printIn("pop {r4-r11, pc}")

def intt(p, n, w, layer, w_power, jump = 2):
    if not layer & 1:
        jump = 1
    prologue(p, n, w, w_power)
    ini_layer = layer - jump # jump 2
    for i in range(ini_layer-1, 0, -1):
        if not i & 1:
            degree = n // (2 ** (i+1))
            # print((i, degree))
            if i == 2:
                i_layer_012(i, degree)
            else:
                i_2_layer(i, degree)
    epilogue()

p = int(sys.argv[1])
n = int(sys.argv[2])
w = int(sys.argv[3])
layer = int(sys.argv[4]) # 2^layer = n
w_power = int(sys.argv[5]) # w^w_power = 1
intt(p, n, w, layer, w_power)