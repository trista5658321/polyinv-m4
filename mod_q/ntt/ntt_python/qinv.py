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
