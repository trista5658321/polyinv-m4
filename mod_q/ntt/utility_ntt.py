import sys, pathlib
d_root = pathlib.Path(__file__).parent.absolute()
sys.path.append(str(d_root))

from utility import printIn
from ntt_python.gen_wpad import inverse_modq, gen_iwpad, gen_wpad, gen_iwpad_16b, gen_wpad_16b, gen_basemul_wpad_16b, gen_basemul_wpad_32b, gen_basemul_wpad_16b_2x2

q = "r11"
qinv = "r12"

s_r0_start = "s0"
s_r0_end = "s2"
s_wpad = "s1"

def reduce_center(p,x):
    x = x % p
    if x > p//2:
        x-=p
    elif x< -p//2:
        x+=p
    return x

def butterfly_without_mul_32(a, b):
    printIn("add.w %s, %s, %s" % (a, a, b))
    printIn("sub.w %s, %s, %s, lsl #1" % (b, a, b))

def get_power(n):
    power = 0
    while(n!=1):
        power+=1
        n//=2
    return power