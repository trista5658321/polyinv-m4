import sys, pathlib
from math import ceil, sqrt

d_root = pathlib.Path(__file__).parent.absolute().parent.parent.parent
sys.path.append(str(d_root))

from mod_q.ntt.ntt_python.qinv import inverse_modq

# top: j in [bot-top], n: w^n = 1 (mod j)
def find_p_w(bot, top, n):
    for j in range(bot, top):
        if (j - 1) % n != 0:
            continue
        for i in range(j):
            val = pow(i, n//2)
            if val % j == -1 or val % j == j-1:
                print((j, i))
                break

# top: multiplier(j) in [bot - top], x in [n * j + 1], n: w^n = 1 (mod x)
def find_p_w_v2(bot, top, n):
    for j in range(bot, top):
        p = n*j+1
        print("======= j, p = %d, %d ==========" % (j, p))
        for i in range(p):
            val = pow(i, n//2)
            if val % p == -1 or val % p == p-1:
                print((p, i))
                break

# w^n = 1 (mod p)
def find_w(n, p):
    for i in range(2, p):
        ans = (i**(n//2)) % p
        if ans == p-1:
            return i

def isPrime(num):
    if num == 1 or not num % 2:
        return False
    for i in range(3, ceil(sqrt(num))):
        if num % i == 0:
            return False
    return True

def find_q1(n, num_th = 1):
    counter = 0
    for j in range(num_th):
        counter+=1
        while(not isPrime(n*counter + 1)):
            counter+=1
    return (n*counter+1)

def find_q0(n, q1, q=(7879//2)):
    min = (q*q*2*(n//2)) // q1
    counter = min // n
    while(not isPrime(n*counter + 1)):
        counter+=1
    return (n*counter+1)

n = 256
layer = 7
q1 = find_q1(n, 2)
w1 = find_w(n, q1)
q0 = find_q0(n, q1)
w0 = find_w(n, q0)
print("= 256 =")
print((q0, w0))
print((q1, w1))
print(("q1_layer_inv", inverse_modq(2**layer, q1)-q1))
mont_qinv = -inverse_modq(q0, 2**32)
print(("mont_qinv", mont_qinv))
mont_basemul = (2 ** 32) * (2 ** 32) % q0
print(("mont_basemul", mont_basemul))
mont_layer = inverse_modq(2**layer, q0) * (2 ** 32) % q0
print(("mont_layer", mont_layer))
mont_layer_mul2_32 = inverse_modq(2**layer, q0) * (2**32) * (2 ** 32) % q0
print(("mont_layer_mul2_32", mont_layer_mul2_32))

n = 512
layer = 7
q1 = find_q1(n, 1)
w1 = find_w(n, q1)
q0 = find_q0(n, q1)
w0 = find_w(n, q0)
print("\n= 512 =")
print((q0, w0))
print((q1, w1))
print(("q1_layer_inv", inverse_modq(2**layer, q1)-q1))
mont_qinv = -inverse_modq(q0, 2**32)
print(("mont_qinv", mont_qinv))
mont_basemul = (2 ** 32) * (2 ** 32) % q0
print(("mont_basemul", mont_basemul))
mont_layer = inverse_modq(2**layer, q0) * (2 ** 32) % q0
print(("mont_layer", mont_layer))
mont_layer_mul2_32 = inverse_modq(2**layer, q0) * (2**32) * (2 ** 32) % q0
print(("mont_layer_mul2_32", mont_layer_mul2_32))

n = 1024
layer = 9
# 使用 n = 512 的參數
print("\n= 1024 =")
print((q0, w0))
print((q1, w1))
print(("q1_layer_inv", inverse_modq(2**layer, q1)-q1))
mont_qinv = -inverse_modq(q0, 2**32)
print(("mont_qinv", mont_qinv))
mont_basemul = (2 ** 32) * (2 ** 32) % q0
print(("mont_basemul", mont_basemul))
mont_layer = inverse_modq(2**layer, q0) * (2 ** 32) % q0
print(("mont_layer", mont_layer))
mont_layer_mul2_32 = inverse_modq(2**layer, q0) * (2**32) * (2 ** 32) % q0
print(("mont_layer_mul2_32", mont_layer_mul2_32))

# p = 73
# find_inv(p, 2)
# find_inv(p, 4)
# find_inv(p, 8)

# find_p_w(100, 8)

# n = 8
# p = 17
# w = 2
# f = [8,1,7,2,0,0,0,0]
# g = [8,4,0,2,0,0,0,0]

# ntt(n,3,p,w,f)
# ntt(n,3,p,w,g)
# intt(n, 3, p, w, f, g)
# print(f)

# def ntt73():
#     n = 8
#     p = 73
#     w = 10
#     f = [8,1,7,2,0,0,0,0]
#     g = [8,4,0,2,0,0,0,0]

#     ntt(n,3,p,w,f)
#     ntt(n,3,p,w,g)
#     intt(n, 3, p, w, f, g)
#     print(f)

# ntt73()

# print(crt(17, 23, 41, 64, 73))
# print(crt(17, 19, 41, 60, 73))

# s_q = 3939
# mul_len = 256
# bot = pow(s_q, 2) * mul_len
# find_p_w_v2(2020, 2030, 512)
# find_p_w_v2(2020, 2030, 256)

