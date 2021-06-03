import sys, pathlib
d_root = pathlib.Path(__file__).parent.absolute().parent.parent.parent
sys.path.append(str(d_root))

from utility import printIn, barrett
from mod_q.ntt.utility_ntt import q, qinv, s_r0_start, gen_wpad_16b

per_bytes = 2 # coeffi
coeffi_num = 2

r_h = "r0"
r_wapd = "r10"
r_w0 = "r8"
r_w12 = "r9"

r_r0_end = "lr"
coeffi = ["r" + str(x) for x in range(1,5)]
butterfly_tmp = ["r6", "r7"]

s_r0_end = "s1"
s_w0 = "s2"
s_w12 = "s3"
s_wpad = "s4"
s_r0_end_012 = "s5"

fold_num = 8 # 8 coeffis per round

def b_reduce(x, w, w_pos, t_x, t_x2, tmp):
    assert(tmp != x and tmp != t_x and tmp != t_x2)
    assert( x != t_x and t_x != t_x2)

    printIn("smul%sb %s, %s, %s" % (w_pos, t_x, w, x))
    printIn("smul%st %s, %s, %s" % (w_pos, t_x2, w, x))
    barrett(t_x, q, qinv, tmp)
    barrett(t_x2, q, qinv, tmp)
    printIn("pkhbt %s, %s, %s, lsl #16" % (t_x, t_x, t_x2))

def butterfly_without_mul(a, b, t_a):
    printIn("sadd16.w %s, %s, %s" % (t_a, a, b))
    printIn("ssub16.w %s, %s, %s" % (b, a, b))

def butterfly(a, b, w, tmp, w_pos = "b"):
    t_x = tmp[0]
    _tmp = tmp[1]

    b_reduce(b, w, w_pos, t_x, b, _tmp) # t_x = b*w
    printIn("ssub16.w %s, %s, %s" % (b, a, t_x))
    printIn("sadd16.w %s, %s, %s" % (a, a, t_x))

def butterfly_rd(ra, rb, a, b, w, tmp_1, tmp_2, tmp_3, w_pos = "b"):
    assert(tmp_1 != b)
    assert(tmp_1 != tmp_2)

    t_x = tmp_1
    t_x2 = tmp_2
    _tmp = tmp_3

    b_reduce(b, w, w_pos, t_x, t_x2, _tmp) # t_x = b*w
    printIn("ssub16.w %s, %s, %s" % (rb, a, t_x))
    printIn("sadd16.w %s, %s, %s" % (ra, a, t_x))

def get_w():
    printIn("ldr.w %s, [%s, #4]" % (r_w12, r_wapd))
    printIn("ldr.w %s, [%s], #8" % (r_w0, r_wapd))

# degree: Lowest poly degree, end: done last pair
def _2_layer_two_coeffi(degree, end):
    for i in range(len(coeffi)):
            if i == 0:
                printIn("ldr.w %s, [r0]" % (coeffi[i]))
            else:
                printIn("ldr.w %s, [r0, #%d]" % (coeffi[i], degree*per_bytes*i))

    butterfly(coeffi[0], coeffi[2], r_w0, butterfly_tmp, "b")
    butterfly(coeffi[1], coeffi[3], r_w0, butterfly_tmp, "b")
    butterfly(coeffi[0], coeffi[1], r_w12, butterfly_tmp, "b")
    butterfly(coeffi[2], coeffi[3], r_w12, butterfly_tmp, "t")

    for i in range(1, len(coeffi)):
        printIn("str.w %s, [r0, #%d]" % (coeffi[i], degree*per_bytes*i))

    if end:
        printIn("str.w %s, [r0], #%d" % (coeffi[0], degree * per_bytes * 3 + per_bytes*coeffi_num))
    else:
        printIn("str.w %s, [r0], #%d" % (coeffi[0], per_bytes*coeffi_num))

# required: s_r0_end <- r0 end
def _2_layer_fold(layer, degree, loop_flag = "lr"):
    printIn("vmov %s, %s, %s, %s" % (r_h, loop_flag, s_r0_start, s_r0_end))
    label = "ntt2_layer_%d_%d" % (layer-1, layer)
    label_inner = label + "inner"

    # loop: 3 butterfly per round
    print(label + str(":"))

    # inner loop setting:
    printIn("add.w %s, r0, #%d @ %d" % (loop_flag, degree * per_bytes, degree))
    get_w()
    print(label_inner + str(":"))

    for i in range(fold_num//coeffi_num):
        _2_layer_two_coeffi(degree, i == degree -1)
    
    printIn("cmp.w r0, %s" % (loop_flag))
    printIn("bne.w %s" % (label_inner))
    # end inner
    printIn("add.w r0, r0, #%d" % (3 * degree * per_bytes))
    printIn("vmov %s, %s" % (loop_flag, s_r0_end))
    printIn("cmp.w r0, %s" % (loop_flag))
    printIn("bne.w %s" % (label))

# degree: Lowest poly degree
def _2_layer(layer, degree, is_flag_set, loop_flag = "lr"):
    print("@ degree = " + str(degree))
    # printIn("vmov.w lr, %s" % (s_r0_end))
    if is_flag_set:
        printIn("vmov.w r0, %s" % (s_r0_start))
    else:
        printIn("vmov %s, %s, %s, %s" % (r_h, loop_flag, s_r0_start, s_r0_end))
    label = "ntt2_layer_%d_%d" % (layer-1, layer)
    # loop: 3 butterfly per round
    print(label + str(":"))
    get_w()
    for i in range(degree//2):
        _2_layer_two_coeffi(degree, i == degree//2 -1)
    printIn("cmp.w r0, %s" % (loop_flag))
    printIn("bne.w %s" % (label))

# reduction at layer 1 end
def layer_012(layer, degree, loop_flag = "lr"):
    r_w0 = "r10"
    r_w12 = "r10"

    printIn("add.w %s, r0, #%d @ %d" % (r_r0_end, degree * per_bytes, degree))
    printIn("vmov.w %s, %s, %s, %s" % (s_wpad, s_r0_end_012, r_wapd, r_r0_end))
    
    label = "ntt2_layer_%d_%d_%d" % (0, layer-1, layer)
    # loop: 7 butterfly per round
    print(label + str(":"))
    printIn("vmov.w %s, %s" % (r_w0, s_w0))
    
    left_poly = ["r" + str(x) for x in range(2,6)]
    # left half - initial
    for i in range(1, len(left_poly)):
        printIn("ldr.w %s, [r1, #%d]" % (left_poly[i], degree*per_bytes*i))
    printIn("ldr.w %s, [r1], #%d" % (left_poly[0], per_bytes*coeffi_num))


    right_poly = ["r" + str(x) for x in range(6,10)]

    # right half (01)
    butterfly_rd(right_poly[0] ,right_poly[2] , left_poly[0], left_poly[2], r_w0, right_poly[1], right_poly[3], "lr", "b")
    butterfly_rd(right_poly[1] ,right_poly[3] , left_poly[1], left_poly[3], r_w0, right_poly[1], right_poly[3], "lr", "b")
    
    # left half (012)
    tmp_0 = "lr"
    tmp_1 = left_poly[0]
    tmp_0_2 = left_poly[1]
    butterfly_without_mul(left_poly[0], left_poly[2], tmp_0)
    butterfly_without_mul(left_poly[1], left_poly[3], tmp_1)
    butterfly_without_mul(tmp_0, tmp_1, tmp_0_2)
    printIn("str.w %s, [r0]" % (tmp_0_2))
    printIn("str.w %s, [r0, #%d]" % (tmp_1, degree*per_bytes))

    butterfly_tmp = [tmp_1, tmp_0_2]
    butterfly(left_poly[2], left_poly[3], r_w0, butterfly_tmp, "b")

    # get w12
    printIn("vmov.w %s, %s" % (r_w12, s_w12))

    # right half (2)
    butterfly(right_poly[0], right_poly[1], r_w12, butterfly_tmp, "b")
    butterfly(right_poly[2], right_poly[3], r_w12, butterfly_tmp, "t")

    # store back
    coeffi = left_poly + right_poly
    for i in range(2, len(coeffi)):
        printIn("str.w %s, [r0, #%d]" % (coeffi[i], degree*per_bytes*i))
    printIn("add.w r0, r0, #4")

    printIn("vmov.w %s, %s" % (r_r0_end, s_r0_end_012))
    printIn("cmp.w r0, %s" % (loop_flag))
    printIn("bne.w %s" % (label))

def prologue(p, n, w):
    print(".p2align 2,,3")
    print(".syntax unified")
    print(".text")

    gen_wpad_16b(p, n, w)

    print("// void ntt%d_16bit (int *v);" % (n))
    print(".global ntt%d_16bit" % (n))
    print(".type ntt%d_16bit, %%function" % (n))
    print("ntt%d_16bit:" % (n))

    printIn("push {r4-r11, lr}")
    printIn("adr.w %s, wpad" % (r_wapd))
    printIn("ldm %s!, {%s-%s}" % (r_wapd, q, qinv))
    printIn("vldm %s!, {%s-%s}" % (r_wapd, s_w0, s_w12))
    
    # s0: r0 start, s1: w_pad
    printIn("add.w %s, r0, #%d" % (r_r0_end, n * per_bytes))
    printIn("vmov s0, %s, r0, %s" % (s_r0_end, r_r0_end))

def epilogue():
    printIn("pop {r4-r11, pc}")

def ntt(p, n, w, layer, jump = 2):
    if not layer & 1:
        jump = 1
    prologue(p, n, w)
    end_layer = layer - jump # jump 2
    is_flag_set = False
    for i in range(2, end_layer):
        if not i & 1:
            # i: do ntt to layer i
            # (layer 0: n -> (n//2, n//2)
            # degree: final poly degree after operation
            degree = n // (2 ** (i+1))
            # print((i, degree))
            if i == 2:
                layer_012(i, degree)
                printIn("vmov %s, %s" % (r_wapd, s_wpad))
            else:
                if degree > fold_num:
                    _2_layer_fold(i, degree)
                    is_flag_set = True
                else:
                    _2_layer(i, degree, is_flag_set)
                    is_flag_set = True
    epilogue()

p = int(sys.argv[1])
n = int(sys.argv[2])
w = int(sys.argv[3])
layer = int(sys.argv[4]) # 2^layer = n
ntt(p, n, w, layer)