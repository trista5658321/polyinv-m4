import sys, pathlib
d_root = pathlib.Path(__file__).parent.absolute().parent.parent.parent
sys.path.append(str(d_root))

from utility import printIn
from mod_q.ntt.utility_ntt import q, qinv, gen_wpad, butterfly_without_mul_32

# q = "r12"
# qinv = "r11"

per_bytes = 4 # coeffi
coeffi_num = 1 # the number of coeffis in a register
r_h = "r0"
r_f = "r1"
s_r0_start = "s0"

r_wpad = "r10"
r_r0_end = "lr"
r_r0_end_0 = "r9"

s_r0_end = "s1"
s_wpad = "s2"
s_r0_end_0 = "s3"

r_w0_0 = "r10"
r_w0 = "r1"
r_w1 = "r2"
r_w2 = "r3"
s_w0 = "s4"
s_w1 = "s5"
s_w2 = "s6"

fold_num = 8 # 8 coeffis per round

def get_w(tmp, s_id = r_w0, e_id = r_w2):
    printIn("ldm %s!, {%s-%s}" % (tmp, s_id, e_id))

def butterfly(a, b, w, tmp):
    low = tmp[0]
    high = b
    _tmp = tmp[1]

    printIn("smull %s, %s, %s, %s" % (low, high, b, w))
    printIn("mul.w %s, %s, %s" % (_tmp, low, qinv))
    printIn("smlal %s, %s, %s, %s" % (low, high, _tmp, q))
    butterfly_without_mul_32(a, high)

def butterfly_rd(ra, rb, a, b, w, tmp):
    low = tmp[0]
    high = tmp[1]
    _tmp = tmp[2]

    printIn("smull %s, %s, %s, %s" % (low, high, b, w))
    printIn("mul.w %s, %s, %s" % (_tmp, low, qinv))
    printIn("smlal %s, %s, %s, %s" % (low, high, _tmp, q))
    printIn("add.w %s, %s, %s" % (ra, a, high))
    printIn("sub.w %s, %s, %s" % (rb, a, high))

def _2_layer_one_coeffi(degree, end):
        coeffi = ["r" + str(x) for x in range(4,8)]
        tmp = ["r" + str(x) for x in range(8,10)]

        for i in range(len(coeffi)):
            if i == 0:
                printIn("ldr.w %s, [r0]" % (coeffi[i]))
            else:
                printIn("ldr.w %s, [r0, #%d]" % (coeffi[i], degree*per_bytes*i))

        butterfly(coeffi[0], coeffi[2], r_w0, tmp)
        butterfly(coeffi[1], coeffi[3], r_w0, tmp)
        butterfly(coeffi[0], coeffi[1], r_w1, tmp)
        butterfly(coeffi[2], coeffi[3], r_w2, tmp)

        for i in range(1, len(coeffi)):
            printIn("str.w %s, [r0, #%d]" % (coeffi[i], degree*per_bytes*i))

        if end:
            printIn("str.w %s, [r0], #%d" % (coeffi[0], degree * per_bytes * 3 + per_bytes*coeffi_num))
        else:
            printIn("str.w %s, [r0], #%d" % (coeffi[0], per_bytes*coeffi_num))

# required: s_r0_end <- r0 end
def _2_layer_fold(layer, degree, loop_flag = "lr"):
    printIn("vmov %s, %s" % (r_h, s_r0_start))
    label = "ntt2_layer_%d_%d" % (layer-1, layer)
    label_inner = label + "inner"

    # loop: 3 butterfly per round
    print(label + str(":"))

    # inner loop setting:
    printIn("add.w %s, r0, #%d @ %d" % (loop_flag, degree * per_bytes, degree))
    get_w(r_wpad)
    print(label_inner + str(":"))

    for i in range(fold_num):
        _2_layer_one_coeffi(degree, i == degree -1)
    
    printIn("cmp.w r0, %s" % (loop_flag))
    printIn("bne.w %s" % (label_inner))
    # end inner
    printIn("add.w r0, r0, #%d" % (3 * degree * per_bytes))
    printIn("vmov %s, %s" % (loop_flag, s_r0_end))
    printIn("cmp.w r0, %s" % (loop_flag))
    printIn("bne.w %s" % (label))

# required: lr <- r0 end
def _2_layer(layer, degree, loop_flag = "lr"):
    printIn("vmov %s, %s, %s, %s" % (r_h, loop_flag, s_r0_start, s_r0_end))
    label = "ntt2_layer_%d_%d" % (layer-1, layer)
    # loop: 3 butterfly per round
    print(label + str(":"))
    get_w(r_wpad)
    for i in range(degree):
        _2_layer_one_coeffi(degree, i == degree -1)
    printIn("cmp.w r0, %s" % (loop_flag))
    printIn("bne.w %s" % (label))

def _layer_012(layer, degree, loop_flag = "lr"):
    label = "ntt2_layer_%d_%d_%d" % (0, layer-1, layer)
    input_per_bytes = 2
    f = ["r" + str(x) for x in range(2,6)]
    f_left = ["r" + str(x) for x in range(6,10)]
    
    print("@ degree = " + str(degree))

    # loop: 7 butterfly per round
    print(label + str(":"))
    printIn("vmov.w %s, %s" % (r_w0_0, s_w0))

    for i in range(1, len(f)):
        printIn("ldrsh.w %s, [%s, #%d]" % (f[i], r_f, degree*input_per_bytes*i))
    printIn("ldrsh.w %s, [%s], #%d" % (f[0], r_f, coeffi_num*input_per_bytes))

    # left: layer 1
    tmp = [f_left[1], f_left[3], "lr"]
    butterfly_rd(f_left[0], f_left[2], f[0], f[2], r_w0_0, tmp)
    butterfly_rd(f_left[1], f_left[3], f[1], f[3], r_w0_0, tmp)
    
    # right: layer 12
    butterfly_without_mul_32(f[0], f[2])
    butterfly_without_mul_32(f[1], f[3])
    tmp = [r_w0_0, "lr"]
    butterfly(f[2], f[3], r_w0_0, tmp)
    butterfly_without_mul_32(f[0], f[1])
    
    # str right:
    for i in range(len(f)):
        if i == 0:
            printIn("str.w %s, [r0]" % (f[0]))
        else:
            printIn("str.w %s, [r0, #%d]" % (f[i], degree*per_bytes*i))

    # left: layer 2
    printIn("vmov %s, %s, %s, %s" % (r_w1, r_w2, s_w1, s_w2))
    tmp = ["r4", "r5", "lr"]
    butterfly(f_left[0], f_left[1], r_w1, tmp)
    butterfly(f_left[2], f_left[3], r_w2, tmp)

    # str left:
    for i in range(len(f_left)):
        printIn("str.w %s, [%s, #%d]" % (f_left[i], r_h, degree*per_bytes*(i+len(f))))
    # printIn("str.w %s, [%s], #%d" % (f_left[0], r_h, coeffi_num*per_bytes))
    printIn("add.w r0, r0, #4")

    printIn("vmov.w %s, %s" % (r_r0_end, s_r0_end_0))
    printIn("cmp.w r0, %s" % (loop_flag))
    printIn("bne.w %s" % (label))

def prologue(p, n, w, w_power):
    print(".p2align 2,,3")
    print(".syntax unified")
    print(".text")

    gen_wpad(p, n, w, w_power)

    print("// void ntt%d_32bit (int *v);" % (n))
    print(".global ntt%d_32bit" % (n))
    print(".type ntt%d_32bit, %%function" % (n))
    print("ntt%d_32bit:" % (n))

    printIn("push {r4-r11, lr}")
    printIn("add.w %s, r0, #%d" % (r_r0_end, n * 4))
    printIn("add.w %s, r0, #%d" % (r_r0_end_0, n//8 * per_bytes * coeffi_num))
    printIn("adr.w %s, wpad" % (r_wpad))
    printIn("ldm %s!, {%s-%s}" % (r_wpad, q, qinv))
    printIn("vldm %s!, {%s-%s}" % (r_wpad, s_w0, s_w2))
    printIn("vmov %s, %s, %s, %s" % (s_r0_start, s_r0_end, r_h, r_r0_end))
    printIn("vmov %s, %s, %s, %s" % (s_wpad, s_r0_end_0, r_wpad, r_r0_end_0))

def epilogue():
    printIn("pop {r4-r11, pc}")

def ntt(p, n, w, layer, w_power, jump = 2):
    if not layer & 1:
        jump = 1
    prologue(p, n, w, w_power)
    ini_layer = layer - jump # jump 2
    for i in range(2, ini_layer):
        if not i & 1:
            # i: do ntt to layer i
            # (layer 0: n -> (n//2, n//2)
            # degree: final poly degree after operation
            degree = n // (2 ** (i+1))
            # print((i, degree))
            if i == 2:
                _layer_012(i, degree)
                printIn("vmov %s, %s" % (r_wpad, s_wpad))
            else:
                if degree > fold_num:
                    _2_layer_fold(i, degree)
                else:
                    _2_layer(i, degree)
    epilogue()

p = int(sys.argv[1])
n = int(sys.argv[2])
w = int(sys.argv[3])
layer = int(sys.argv[4]) # 2^layer = n
w_power = int(sys.argv[5]) # w^w_power = 1
ntt(p, n, w, layer, w_power)