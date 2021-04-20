import sys, pathlib, math

root = pathlib.Path(__file__).absolute().parent.parent.parent.parent
sys.path.append(str(root))

from mod_q.utility_mod_q import printIn, BASE, P, _P, gen_divsteps_base

def x2p2(N1, N2, fg, M, f_h, g_h):
    printIn("gf_polymul_%dx%d_2x2_x2p2(%s,%s,%s,%s);" % (N1, N2, fg, M, f_h, g_h))

def _2x2(N1, N2, M, M1, M2):
    printIn("gf_polymul_%dx%d_2x2_x_2x2(%s,%s,%s);" % (N1, N2, M, M1, M2))

base = BASE
intial = "int "
fg_shift = _P // 4
fg_f_h_shift = fg_shift
fg_g_l_shift = fg_shift * 2
fg_g_h_shift = fg_shift * 3

base_list = [BASE]
_p = _P - BASE
while(_p > 0):
    if _p >= base:
        base_list.append(base)
        _p -= base
    base //= 2

M_list = []
for i in range(len(base_list)):
    M_str = "M%d" % (i)
    intial += M_str + "[%d], " % (base_list[i]*3)
    M_list.append(M_str)

for i in range(2, len(base_list)):
    M2 = base_list[i]
    M1 = base_list[i-1]
    space = (M1+M2) // 2 * 4
    intial += "m%d[%d], " % (len(base_list)-i, space)

intial += "fg[%d];" % (_P)


print("#include <inttypes.h>\n")
print("int jump%ddivsteps(int minusdelta, int32_t *M, int32_t *f, int32_t *g){" % (_P))
printIn(intial)
print('')

for i in range(len(base_list)):
    base = base_list[i]
    M = M_list[i]
    h_shift = base // 2
    new_fg = "fg"

    f_l = "f"
    g_l = "g"
    f_h = "f+%d" % (h_shift)
    g_h = "g+%d" % (h_shift)
    if i != 0:
        f_l = "fg"
        g_l = "fg+%d" % (fg_g_l_shift)
        f_h = "fg+%d" % (h_shift)
        g_h = "fg+%d" % (fg_g_l_shift + h_shift)
    
    if i == len(base_list)-1:
        new_fg = "M"

    gen_divsteps_base(base, M, f_l, g_l)
    x2p2(base, _P-base, new_fg, M, f_h, g_h)

print('')

for i in range(len(base_list)-1, 0, -1):
    N2 = base_list[i]
    N1 = base_list[i-1]
    new_M = "m%d" % (len(base_list)-i)
    M2 = "%s+%d" % (M_list[i], N2)
    M1 = "%s+%d" % (M_list[i-1], N1)

    if i != len(base_list)-1:
        N2 += base_list[i+1]
        M2 = "m%d" % (len(base_list)-i-1)
    if i == 1:
        new_M = "M+%d" % (_P)

    _2x2(N2, N1, new_M, M1, M2)

print('')
printIn("return minusdelta;")
print("}")