def reduce_center(p,x):
    x = x % p
    if x > p//2:
        x-=p
    elif x< -p//2:
        x+=p
    return x

def butterfly(p, poly_len, f, c, shift): # f +- cg
    for i in range(poly_len):
        _f = f[i+shift]
        _g = c*f[i+poly_len+shift]
        # print("f[%d] = %d" % (i+shift, _f))
        # print("f'[%d] = %d" % (i+poly_len+shift, _g))
        # print("(_f + _g) mod p = (%d + %d)" % (_f, _g))
        f[i+shift] = reduce_center(p, _f + _g)
        f[i+poly_len+shift] = reduce_center(p, _f - _g)

def ntt(n, layer, p, w, c, f):
    poly_len = n
    for i in range(layer):
        poly_len //= 2
        times = pow(2, i)
        # print(f)
        # print("= %d =" % (i))
        # print("-> %d %d" % (poly_len, times))
        for j in range(times):
            _c = c[i][j]
            shift = j * poly_len*2
            # print("shift = %d" % (shift))
            butterfly(p, poly_len, f, _c, shift)