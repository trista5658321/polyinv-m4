def gcd(a : int, b : int):
    if b == 0:
        return a
    else:
        return gcd(b, a%b)

def inverse_modq(tar : int, mod : int):
    assert gcd(tar, mod) == 1
    tar %= mod
    uvrs = [1, 0, 0, 1]
    f = mod
    g = tar
    while g != 0:
        u = uvrs[0]
        v = uvrs[1]
        r = uvrs[2]
        s = uvrs[3]
        uu = 0
        vv = 1
        rr = 1
        ss = -(f // g)
        nf = g
        ng = f + ss * g
        uvrs[0] = uu * u + vv * r
        uvrs[1] = uu * v + vv * s
        uvrs[2] = rr * u + ss * r
        uvrs[3] = rr * v + ss * s
        f = nf
        g = ng
    res = uvrs[1]
    if res <0:
        res += mod
    return res

# p = 1038337
# p = 518657
p = 7879
# p = 7681

# mont_qinv = -inverse_modq(p, 2**32)
# print(mont_qinv)
# mont_basemul = (2 ** 32) * (2 ** 32) % p
# print(mont_basemul)
# mont_layer = inverse_modq(128, p) * (2 ** 32) % p
# print(mont_layer)
# mont_layer_mul2_32 = inverse_modq(128, p) * (2**32) * (2 ** 32) % p
# print(mont_layer_mul2_32)
