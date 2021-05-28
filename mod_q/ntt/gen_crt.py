import sys, pathlib
d_root = pathlib.Path(__file__).parent.absolute().parent.parent
sys.path.append(str(d_root))

from utility import printIn, barrett, montgomery
from mod_q.ntt.ntt_python.qinv import inverse_modq
from mod_q.ntt.utility_ntt import reduce_center

r_0 = "r0"
r_h_16 = "r0"
r_h_32 = "r1"

phase1_tmp = ["r5", "lr"]
r_u0_b = "r2"
r_u0_t = "r3"
r_u1 = "r4"
r_u1_b = "r4"
r_u1_t = phase1_tmp[0]
loop_flag = "lr"
s_loop_flag = "s1"

r_mont_layer_mul_2_32 = "r6" # 32bit
r_u1_layer_inv = "r7" # 16bit
r_q0inv_m = "r8" # 32bit
r_q0inv = "r9" # 32bit
r_q0 = "r10"
s_mont_layer_mul_2_32 = "s6"
s_u1_layer_inv = "s7"
s_q0inv_m = "s8"
s_q0inv = "s9"
s_q0 = "s10"

r_q0inv_mod_q1 = "r7" # 16bit
r_q0_modq = "r8" # 16bit
r_qinv = "r9"
r_q = "r10"
s_q0inv_mod_q1 = "s2" # 16bit
s_q0_modq = "s3" # 16bit
s_qinv = "s4"
s_q = "s5"

r_q1inv = "r11"
r_q1 = "r12"

phase2_tmp = ["r6", "lr"]

# Phase 1:
# [u0 = u0 * 2**23 * 128^-1]: mont_layer_mul_2_32 (mod q0)
# u0: barrett (mod q0)
# [u1 = u1 * 128^-1]: barrett (mod q1)

# Phase 2:
# [u_tmp = u1 - u0]: barrett (mod q1)
# [m1 = u_tmp * q0inv_mod_q1]: barrett (mod q1)
# [u = m1 * q0_modq + u0)]: barrett (mod q)

def gen_crt_wpad(q, q0, q1, layer):
    print("wpad:")
    q0inv_mod_q1 = reduce_center(q1, inverse_modq(q0, q1))
    q0_modq = reduce_center(q, q0)
    qinv = round(2**32 / q)
    # q = q
    mont_layer_mul_2_32 = reduce_center(q0, inverse_modq(2**layer, q0) * (2**32) * (2**32) % q0)
    u1_layer_inv = reduce_center(q1, inverse_modq(2**layer, q1))
    q0inv_m = -inverse_modq(q0, 2**32)
    q0inv = round(2**32 / q0)
    # q0 = q0
    q1inv = round(2**32 / q1)
    # q1 = q1

    printIn(".word %d @ q0inv_mod_q1" % (q0inv_mod_q1))
    printIn(".word %d @ q0_modq" % (q0_modq))
    printIn(".word %d @ qinv" % (qinv))
    printIn(".word %d @ q" % (q))
    printIn(".word %d @ mont_layer_mul_2_32" % (mont_layer_mul_2_32))
    printIn(".word %d @ u1_layer_inv" % (u1_layer_inv))
    printIn(".word %d @ q0inv_m" % (q0inv_m))
    printIn(".word %d @ q0inv" % (q0inv))
    printIn(".word %d @ q0" % (q0))
    printIn(".word %d @ q1inv" % (q1inv))
    printIn(".word %d @ q1" % (q1))

def get_final_u0(u0_0, u0_1, q, qinv, qinv_m, tmp_0, tmp_1):
    low = tmp_0
    tmp = tmp_1
    printIn("smull %s, %s, %s, %s @ u0_0" % (low, u0_0, u0_0, r_mont_layer_mul_2_32))
    montgomery(low, u0_0, tmp, q, qinv_m)
    printIn("smull %s, %s, %s, %s @ u0_1" % (low, u0_1, u0_1, r_mont_layer_mul_2_32))
    montgomery(low, u0_1, tmp, q, qinv_m)
    barrett(u0_0, q, qinv, tmp)
    barrett(u0_1, q, qinv, tmp)

def get_final_u1(u0, q, qinv, tmp_0, tmp_1):
    t_u = tmp_0
    tmp = tmp_1
    printIn("smulbt %s, %s, %s" % (t_u, r_u1_layer_inv, u0))
    printIn("smulbb %s, %s, %s" % (u0, r_u1_layer_inv, u0))
    barrett(u0, q, qinv, tmp)
    barrett(t_u, q, qinv, tmp)

# Phase 1:
def get_final_u0_u1_16b():
    # [u0 = u0 * 2**23 * 128^-1]: mont_layer_mul_2_32 (mod q0)
    # u0: barrett (mod q0)
    # [u1 = u1 * 128^-1]: barrett (mod q1)

    printIn("ldr.w %s, [%s, #%d]" % (r_u0_t, r_h_32, 4))
    printIn("ldr.w %s, [%s], #%d" % (r_u0_b, r_h_32, 8))
    printIn("ldr.w %s, [%s]" % (r_u1, r_h_16))
    tmp_0 = phase1_tmp[0]
    tmp_1 = phase1_tmp[1]
    get_final_u0(r_u0_b, r_u0_t, r_q0, r_q0inv, r_q0inv_m, tmp_0, tmp_1)
    get_final_u1(r_u1, r_q1, r_q1inv, tmp_0, tmp_1)

def get_m1_16b(u0, u1, tmp_0, tmp_1):
    # [u_tmp = u1 - u0]: barrett (mod q1)
    # [m1 = u_tmp * q0inv_mod_q1]: barrett (mod q1)
    m1 = u1
    u_tmp = tmp_0
    tmp = tmp_1
    printIn("sub.w %s, %s, %s" % (u_tmp, u1, u0)) # result = 32bit
    barrett(u_tmp, r_q1, r_q1inv, tmp)
    printIn("smulbb %s, %s, %s" % (m1, r_q0inv_mod_q1, u_tmp))
    barrett(m1, r_q1, r_q1inv, tmp)
    return m1

# Phase 2:
def get_u():
    # [u = m1 * q0_modq + u0)]: barrett (mod q)
    tmp = phase2_tmp[1]

    m1_b = get_m1_16b(r_u0_b, r_u1_b, phase2_tmp[0], phase2_tmp[1])
    m1_t = get_m1_16b(r_u0_t, r_u1_t, phase2_tmp[0], phase2_tmp[1])

    printIn("smlabb %s, %s, %s, %s" % (r_u0_b, r_q0_modq, m1_b, r_u0_b))
    printIn("smlabb %s, %s, %s, %s" % (r_u0_t, r_q0_modq, m1_t, r_u0_t))
    barrett(r_u0_b, r_q, r_qinv, tmp)
    barrett(r_u0_t, r_q, r_qinv, tmp)
    printIn("pkhbt %s, %s, %s, lsl #16" % (r_u0_b, r_u0_b, r_u0_t))
    printIn("str.w %s, [%s], #%d" % (r_u0_b, r_0, 4))

def loop_2_coeffi():
    label = "start"
    print(label + str(":"))

    print("@ phase 1")
    printIn("vmov %s, %s, %s, %s" % (r_mont_layer_mul_2_32, r_u1_layer_inv, s_mont_layer_mul_2_32, s_u1_layer_inv))
    printIn("vmov %s, %s, %s, %s" % (r_q0inv_m, r_q0inv, s_q0inv_m, s_q0inv))
    printIn("vmov.w %s, %s" % (r_q0, s_q0))
    get_final_u0_u1_16b()

    print("@ phase 2")
    printIn("vmov %s, %s, %s, %s" % (r_q0inv_mod_q1, r_q0_modq, s_q0inv_mod_q1, s_q0_modq))
    printIn("vmov %s, %s, %s, %s" % (r_qinv, r_q, s_qinv, s_q))
    get_u()

    printIn("vmov.w %s, %s" % (loop_flag, s_loop_flag))
    printIn("cmp.w %s, %s" % (r_0, loop_flag))
    printIn("bne.w %s" % (label))

def prologue(p, n, q0, q1, layer):
    print(".p2align 2,,3")
    print(".syntax unified")
    print(".text")

    # gen_crt_wpad(p, n, w)
    gen_crt_wpad(p, q0, q1, layer)

    print("// void crt%d (int *h_16, int *h_32);" % (n))
    print(".global crt%d" % (n))
    print(".type crt%d, %%function" % (n))
    print("crt%d:" % (n))

    printIn("push {r4-r11, lr}")
    tmp = "lr"
    r_wpad = tmp
    per_bytes = 2
    printIn("adr.w %s, wpad" % (r_wpad))
    printIn("vldm %s!, {%s-%s}" % (r_wpad, s_q0inv_mod_q1, s_q0))
    printIn("ldm %s!, {%s-%s}" % (r_wpad, r_q1inv, r_q1))

    printIn("add.w %s, r0, #%d" % (loop_flag, n * per_bytes))
    printIn("vmov.w %s, %s" % (s_loop_flag, loop_flag))

def epilogue():
    printIn("pop {r4-r11, pc}")

def crt(p, n, q0, q1, layer, jump = 2):
    prologue(p, n, q0, q1, layer-jump)
    loop_2_coeffi()
    epilogue()

p = int(sys.argv[1])
n = int(sys.argv[2])
q0 = int(sys.argv[3])
q1 = int(sys.argv[4])
layer = int(sys.argv[5]) # 2^layer = n

crt(p, n, q0, q1, layer)