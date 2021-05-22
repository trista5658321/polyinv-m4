import sys, pathlib
d_root = pathlib.Path(__file__).parent.absolute()
sys.path.append(str(d_root))

from qinv import inverse_modq

def reduce_center(p,x):
    x = x % p
    if x > p//2:
        x-=p
    elif x< -p//2:
        x+=p
    return x

def ibutterfly(p, poly_len, f, c, shift): # f +- cg
    for i in range(poly_len):
        _f = f[i+shift]
        _g = f[i+poly_len+shift]
        # print("f[%d] = %d" % (i+shift, _f))
        # print("f'[%d] = %d" % (i+poly_len+shift, _g))
        # print("(_f + _g) mod p = (%d + %d)" % (_f, _g))
        f[i+shift] = reduce_center(p, _f + _g)
        f[i+poly_len+shift] = reduce_center(p, (_f - _g) * c)

def intt(n, layer, p, w, c, f, g = []):
    for i in range(len(f)):
        if len(g) == 0:
            pass
            # f[i] = (f[i]*inverse_modq(2**layer, p)) % p
        else:
            f[i] = (f[i]*g[i]*inverse_modq(n, p)) % p
    for i in range(layer-1, -1, -1):
        poly_len = n // (2 ** (i+1))
        times = pow(2, i)
        print("===== -> %d %d =====" % (poly_len, times))
        print(f)
        for j in range(times):
            _c = inverse_modq(c[i][j], p)
            # print("_c = %d" % (_c))
            shift = j * poly_len*2
            # print("shift = %d" % (shift))
            ibutterfly(p, poly_len, f, _c, shift)