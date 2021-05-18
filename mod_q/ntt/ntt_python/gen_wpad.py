# (7681, 62)
# (518657, 1595)
import sys, pathlib
d_root = pathlib.Path(__file__).parent.absolute()
sys.path.append(str(d_root))

from qinv import inverse_modq

def get_layer(n, final_deg):
    layer = 0
    while(n!=final_deg):
        n//=2
        layer+=1
    return layer-1

def get_w(w, n, final_deg = 4):
    arr = [[1]]
    c_id = 1
    # print(get_layer(n, final_deg))
    for i in range(get_layer(n, final_deg)):
        _arr = []
        for elem in arr[i]:
            if elem == 1:
                _arr.append(1)
                _arr.append((w, n//4))
            else:
                _arr.append((w, elem[1]//2, "c%d" % (c_id)))
                _arr.append((w, elem[1]//2 + n//4, "c%d" % (c_id+1)))
            c_id+=2
        arr.append(_arr)
    return arr

def cal_w(p, w_info, r_mont = False):
    val = 1
    if not w_info == 1:
        w = w_info[0]
        power = w_info[1]
        val = w ** power % p

    if r_mont:
        val = (val * (2**32)) % p
    if val > p//2:
        val -= p
    elif val < -p//2:
        val += p
    return val

def cal_w_inverse(p, w_info, r_mont = False):
    val = 1
    if not w_info == 1:
        w = w_info[0]
        power = w_info[1]
        val = w ** power % p
    
    val = inverse_modq(val, p)

    if r_mont:
        val = (val * (2**32)) % p
    if val > p//2:
        val -= p
    elif val < -p//2:
        val += p
    return val

def print_w(w):
    print("\t.word %d" % (w))

# w^n = 1
def gen_wpad(p, n, w):
    arr = get_w(w, n)
    # for _arr in arr:
    #     print("-")
    #     print(_arr)

    print("wpad:")
    print_w(p)
    print_w(-inverse_modq(p, 2**32))

    for i in range(len(arr)):
        _arr = arr[i]
        if i == 0 or i == 1:
            continue
        elif i == 2:
            print("@ =012=")
            # print(_arr)
            for i in range(1,len(_arr)):
                print_w(cal_w(p, _arr[i], True))
        elif i & 1:
            print("@ =%d%d=" % (i, i+1))
            for j in range(len(_arr)):
                print_w(cal_w(p, _arr[j], True))
                __arr = arr[i+1]
                print_w(cal_w(p, __arr[2*j], True))
                print_w(cal_w(p, __arr[2*j+1], True))

def gen_iwpad(p, n, w):
    arr = get_w(w, n)
    print("wpad:")
    print_w(p)
    print_w(-inverse_modq(p, 2**32))

    for i in range(len(arr)-1, -1, -1):
        _arr = arr[i]
        if i == 0 or i == 1:
            continue
        elif i == 2:
            print("@ =012=")
            # print(_arr)
            for i in range(1,len(_arr)):
                print_w(cal_w_inverse(p, _arr[i], True))
        elif i & 1:
            print("@ =%d%d=" % (i, i+1))
            for j in range(len(_arr)):
                # print(_arr[j])
                print_w(cal_w_inverse(p, _arr[j], True))
                __arr = arr[i+1]
                # print(__arr[2*j])
                # print(__arr[2*j+1])
                print_w(cal_w_inverse(p, __arr[2*j], True))
                print_w(cal_w_inverse(p, __arr[2*j+1], True))

# gen_wpad(518657, 512, 1595)
# print(inverse_modq(2**7, 518657))