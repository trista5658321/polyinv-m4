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
        x = n*j+1
        print("======= j, x = %d, %d ==========" % (j, x))
        for i in range(x):
            val = pow(i, n//2)
            if val % x == -1 or val % x == x-1:
                print((x, i))
                break
        
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
# find_p_w_v2(1010, 1020, 512)