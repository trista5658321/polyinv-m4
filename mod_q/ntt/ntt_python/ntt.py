def reduce_center(p,x):
    x = x % p
    if x > p//2:
        x-=p
    elif x< -p//2:
        x+=p
    return x

def butterfly(p, poly_len, F, f, c, shift, layer_id): # f +- cg
    input_f = F
    if layer_id == 0:
        input_f = f
    for i in range(poly_len):
        _f = input_f[i+shift]
        _g = c*input_f[i+poly_len+shift]
        F[i+shift] = reduce_center(p, _f + _g)
        F[i+poly_len+shift] = reduce_center(p, _f - _g)

def ntt(n, layer, p, w, c, F, f):
    poly_len = n
    for i in range(layer):
        poly_len //= 2
        times = pow(2, i)
        # print(F)
        # print("= %d =" % (i))
        # print("-> %d %d" % (poly_len, times))
        for j in range(times):
            _c = c[i][j]
            shift = j * poly_len*2
            # print("shift = %d" % (shift))
            butterfly(p, poly_len, F, f, _c, shift, i)