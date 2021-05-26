import sys, pathlib
d_root = pathlib.Path(__file__).parent.absolute()
sys.path.append(str(d_root))

def reduce_center(p,x):
    x = x % p
    if x > p//2:
        x-=p
    elif x< -p//2:
        x+=p
    return x

def basemul_4x4(p,h,f,g,w_list):
    for i in range(len(f)):
        w = w_list[i//4]
        if i % 4 == 0:
            _f = [ f[i+x] for x in range(4)]
            _g = [ g[i+x] for x in range(4)]
            _h = [0] * 4
            _h[0] = _f[0]*_g[0] + (_f[1]*_g[3] + _f[2]*_g[2] + _f[3]*_g[1]) * w
            _h[1] = _f[0]*_g[1] + _f[1]*_g[0] + (_f[2]*_g[3] + _f[3]*_g[2]) * w
            _h[2] = _f[0]*_g[2] + _f[1]*_g[1] + _f[2]*_g[0] + (_f[3]*_g[3]) * w
            _h[3] = _f[0]*_g[3] + _f[1]*_g[2] + _f[2]*_g[1] + _f[3]*_g[0]
            
            for x in range(4):
                h[i+x] = reduce_center(p, _h[x])

