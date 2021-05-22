from ntt_python.ntt import ntt
from ntt_python.intt import intt
from ntt_python.gen_wpad import get_w, cal_w

def get_c(p,w,n,final_deg):
    c = get_w(w,n,final_deg)
    for w_list in c:
        for i in range(len(w_list)):
            w_list[i] = cal_w(p, w_list[i])
    return c

def ntt41():
    n = 512
    layer = 7
    final_deg = 4
    # p = 518657
    p = 7681
    w = 62
    # f = [-8,-1,-7,-2,0,0,0,0]
    # g = [8,4,0,2,0,0,0,0]
    f0 = [0] * 512
    f1 = [0] * 512
    for i in range(256):
        f0[i] = 1
        f1[i] = 1

    c = get_c(p,w,n,final_deg)
    # print(len(c))
    ntt(n,layer,p,w,c,f0)
    # ntt(n,layer,p,w,c,g)
    intt(n, layer, p, w, c, f0)
    print(f0)
    # intt(n, layer, p, w, c, f, g)
    print((f0 == f1))

ntt41()