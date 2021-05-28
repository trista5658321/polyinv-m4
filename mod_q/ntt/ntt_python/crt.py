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


def crt(p, u0, q0, u1, q1):
    M = q0 * q1
    iq1_mod_q0 = inverse_modq(q1, q0)
    iq0_mod_q1 = inverse_modq(q0, q1)
    # print(iq1_mod_q0)
    # print(iq0_mod_q1)

    u0 = reduce_center(q0, u0)
    # print(("u0", u0))
    
    _u = u1 - u0
    # print(("_u", _u))

    m1 = reduce_center(q1, _u*iq0_mod_q1)
    # print(("m1", m1))

    q0_modq = reduce_center(p, q0)
    u = (m1 * q0_modq) + u0
    # print(("u", u))
    # print(("x", reduce_center(p, u)))

    x = u0*q1*iq1_mod_q0 + u1*q0*iq0_mod_q1
    return reduce_center(M, x) % p


# print(crt(7879, 117944, 1038337, -75, 7681))