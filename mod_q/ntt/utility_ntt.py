import sys, pathlib
d_root = pathlib.Path(__file__).parent.absolute()
sys.path.append(str(d_root))

from ntt_python.gen_wpad import inverse_modq, gen_iwpad, gen_wpad, gen_iwpad_16b, gen_wpad_16b

q = "r11"
qinv = "r12"

s_r0_start = "s0"
s_r0_end = "s2"
s_wpad = "s1"