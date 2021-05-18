import sys, pathlib
d_root = pathlib.Path(__file__).parent.absolute()
sys.path.append(str(d_root))

from qinv import inverse_modq

def crt(p, a1, m1, a2, m2):
    M = m1 * m2
    im2_mod_m1 = inverse_modq(m2, m1)
    im1_mod_m2 = inverse_modq(m1, m2)
    
    x = a1*m2*im2_mod_m1 + a2*m1*im1_mod_m2
    return x % M % p