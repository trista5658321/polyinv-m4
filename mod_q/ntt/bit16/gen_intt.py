import sys, pathlib
d_root = pathlib.Path(__file__).parent.absolute().parent.parent.parent
sys.path.append(str(d_root))

from utility import printIn, barrett, barrett_16x2i, get_2P15
from mod_q.ntt.utility_ntt import q, qinv, s_r0_start, gen_iwpad_16b

per_bytes = 2 # coeffi
coeffi_num = 2
r_wapd = "r10"
r_w0 = "r8"
r_w12 = "r9"
butterfly_tmp = ["r6", "r7"]
r_2P15 = "r5"
r_r0_end = "lr"
coeffi = ["r" + str(x) for x in range(1,5)]
# w0 = "r1"
# w1 = "r2"
# w2 = "r3"

s_r0_end = "s3"
s_w0 = "s4"
s_w12 = "s5"

def b_reduce(x, w, w_pos, t_x, tmp):
    printIn("smul%sb %s, %s, %s" % (w_pos, x, w, t_x))
    printIn("smul%st %s, %s, %s" % (w_pos, t_x, w, t_x))
    barrett(x, q, qinv, tmp)
    barrett(t_x, q, qinv, tmp)
    printIn("pkhbt %s, %s, %s, lsl #16" % (x, x, t_x))

def i_butterfly_without_mul(a, b, t_a):
    printIn("sadd16.w %s, %s, %s" % (t_a, a, b))
    printIn("ssub16.w %s, %s, %s" % (b, a, b))

def i_butterfly(a, b, w, tmp, w_pos = "b"):
    t_x = tmp[0]
    _tmp = tmp[1]

    printIn("ssub16.w %s, %s, %s" % (t_x, a, b))
    printIn("sadd16.w %s, %s, %s" % (a, a, b))
    b_reduce(b, w, w_pos, t_x, _tmp)

def get_w():
    printIn("ldr.w %s, [%s, #4]" % (r_w12, r_wapd))
    printIn("ldr.w %s, [%s], #8" % (r_w0, r_wapd))

# degree: Lowest poly degree, end: done last pair
def i_2_layer_two_coeffi(degree, end, reduce_list_bot = [], reduce_list_top = []):
    for i in range(len(coeffi)):
            if i == 0:
                printIn("ldr.w %s, [r0]" % (coeffi[i]))
            else:
                printIn("ldr.w %s, [r0, #%d]" % (coeffi[i], degree*per_bytes*i))

    i_butterfly(coeffi[0], coeffi[1], r_w12, butterfly_tmp, "b")
    i_butterfly(coeffi[2], coeffi[3], r_w12, butterfly_tmp, "t")
    
    if len(reduce_list_bot):
        print("@ reduce layer")
        get_2P15(r_2P15)
    for r in reduce_list_bot:
        barrett_16x2i(r, q, qinv, r_2P15, butterfly_tmp[0], butterfly_tmp[1])

    i_butterfly(coeffi[0], coeffi[2], r_w0, butterfly_tmp, "b")
    i_butterfly(coeffi[1], coeffi[3], r_w0, butterfly_tmp, "b")

    if not len(reduce_list_bot) and len(reduce_list_top):
        print("@ reduce layer")
        get_2P15(r_2P15)
    for r in reduce_list_top:
        barrett_16x2i(r, q, qinv, r_2P15, butterfly_tmp[0], butterfly_tmp[1])

    for i in range(1, len(coeffi)):
        printIn("str.w %s, [r0, #%d]" % (coeffi[i], degree*per_bytes*i))

    if end:
        printIn("str.w %s, [r0], #%d" % (coeffi[0], degree * per_bytes * 3 + per_bytes*coeffi_num))
    else:
        printIn("str.w %s, [r0], #%d" % (coeffi[0], per_bytes*coeffi_num))

# degree: Lowest poly degree
def i_2_layer(layer, degree, loop_flag = "lr"):
    print("@ degree = " + str(degree))
    printIn("vmov.w r0, %s" % (s_r0_start))
    label = "intt2_layer_%d_%d" % (layer-1, layer)
    # loop: 3 butterfly per round
    print(label + str(":"))
    get_w()
    for i in range(degree//2):
        i_2_layer_two_coeffi(degree, i == degree//2 -1, [], [coeffi[0]])
    printIn("cmp.w r0, %s" % (loop_flag))
    printIn("bne.w %s" % (label))

# reduction at layer 1 end
def i_layer_012(layer, degree, loop_flag = "lr"):
    r_w0 = "r1"
    r_w12 = "r2"

    printIn("vmov.w r0, %s" % (s_r0_start))
    printIn("ldr.w %s, [%s, #4]" % ("r2", r_wapd))
    printIn("ldr.w %s, [%s], #8" % ("r1", r_wapd))
    printIn("vmov %s, %s, %s, %s" % (s_w0, s_w12, r_w0, r_w12))
    printIn("add.w %s, r0, #%d @ %d" % (r_r0_end, degree * per_bytes, degree))
    printIn("vmov.w %s, %s" % (s_r0_end, r_r0_end))
    
    label = "intt2_layer_%d_%d_%d" % (0, layer-1, layer)
    # loop: 7 butterfly per round
    print(label + str(":"))
    printIn("vmov.w %s, %s, %s, %s" % (r_w0, r_w12, s_w0, s_w12))

    coeffi_2 = ["r" + str(x) for x in range(7,11)]
    tmp_2 = ["r" + str(x) for x in range(5,7)]
    coeffi_1 = ["r" + str(x) for x in range(2,7)]
    tmp_1 = ["r6", r_w0] # t_x, _tmp

    # right half
    for i in range(len(coeffi_2)):
        printIn("ldr.w %s, [r0, #%d]" % (coeffi_2[i], degree*per_bytes*i + degree * per_bytes * 4))

    i_butterfly(coeffi_2[0], coeffi_2[1], r_w12, tmp_2, "b")
    i_butterfly(coeffi_2[2], coeffi_2[3], r_w12, tmp_2, "t")
    i_butterfly(coeffi_2[0], coeffi_2[2], r_w0, tmp_2, "b")
    i_butterfly(coeffi_2[1], coeffi_2[3], r_w0, tmp_2, "b")
    
    # left half
    for i in range(len(coeffi_1)-1):
        if i == 0:
            printIn("ldr.w %s, [r0]" % (coeffi_1[i]))
        else:
            printIn("ldr.w %s, [r0, #%d]" % (coeffi_1[i], degree*per_bytes*i))
    
    i_butterfly(coeffi_1[2], coeffi_1[3], r_w0, tmp_1, "b")
    i_butterfly_without_mul(coeffi_1[0], coeffi_1[1], tmp_1[1])
    i_butterfly_without_mul(tmp_1[1], coeffi_1[2], coeffi_1[0])
    i_butterfly_without_mul(coeffi_1[1], coeffi_1[3], tmp_1[1])

    print("@reduction:")
    get_2P15("lr")
    for r in [coeffi_1[0], coeffi_2[0]]:
        barrett_16x2i(r, q, qinv, "lr", tmp_1[0], coeffi_1[1])


    printIn("@ layer 0")
    i_butterfly_without_mul(coeffi_1[3], coeffi_2[3], coeffi_1[4])
    i_butterfly_without_mul(coeffi_1[2], coeffi_2[2], coeffi_1[3])
    i_butterfly_without_mul(tmp_1[1], coeffi_2[1], coeffi_1[2])
    i_butterfly_without_mul(coeffi_1[0], coeffi_2[0], coeffi_1[1])

    # store back
    coeffi = coeffi_1 + coeffi_2
    for i in range(1, len(coeffi)-1):
        printIn("str.w %s, [r0, #%d]" % (coeffi[i+1], degree*per_bytes*i))
    printIn("str.w %s, [r0], #%d" % (coeffi[1], per_bytes*coeffi_num))

    printIn("vmov.w %s, %s" % (r_r0_end, s_r0_end))
    printIn("cmp.w r0, %s" % (loop_flag))
    printIn("bne.w %s" % (label))

def prologue(p, n, w, w_power):
    print(".p2align 2,,3")
    print(".syntax unified")
    print(".text")

    gen_iwpad_16b(p, n, w, w_power)

    print("// void intt%d_16bit (int *v);" % (n))
    print(".global intt%d_16bit" % (n))
    print(".type intt%d_16bit, %%function" % (n))
    print("intt%d_16bit:" % (n))

    printIn("push {r4-r11, lr}")
    printIn("adr.w %s, wpad" % (r_wapd))
    printIn("ldm %s!, {%s-%s}" % (r_wapd, q, qinv))
    
    # s0: r0 start, s1: w_pad
    printIn("vmov.w s0, r0")

    printIn("add.w %s, r0, #%d" % (r_r0_end, n * per_bytes))
    # printIn("vmov %s, lr @ lr: flag(r0-end)" % (s_r0_end))

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
                pass
            else:
                i_2_layer(i, degree)
    epilogue()

p = int(sys.argv[1])
n = int(sys.argv[2])
w = int(sys.argv[3])
layer = int(sys.argv[4]) # 2^layer = n
w_power = int(sys.argv[5]) # w^w_power = 1
intt(p, n, w, layer, w_power)