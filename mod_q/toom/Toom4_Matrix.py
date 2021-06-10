
def cmod (a,b) :
    assert (b>0)
    r = (a % b)
    if (r >= b/2) : return (r-b)
    else : return r

def extended_gcd(a, b) :
    if a == 0:
        return (b, 0, 1)
    else:
        g, y, x = extended_gcd(b % a, a)
        return (g, x - (b // a) * y, y)

def mod_inverse(a, m) :
    g, x, y = extended_gcd(a, m)
    if (g ** 2 != 1):
        raise Exception('modular inverse does not exist')
    elif (g == 1):
        return x % m
    else : # (g == -1)
        return (-x) % m

def Toom4(q) :
    Toom_matrix4_numer = [[1, 0, 0, 0, 0, 0, 0], [-2, 2, -2, -2, 1, 1, -2], [-5, 0, 2, 2, -1, -1, 4], [5, -1, 3, -7, -1, 0, 5], [1, 0, -1, -1, 1, 1, -5], [-1, 1, -1, 1, 1, -1, -1], [0, 0, 0, 0, 0, 0, 1]]
    Toom_matrix4_denom = [[1, 1, 1, 1, 1, 1, 1], [1, 45, 3, 9, 36, 60, 1], [4, 1, 3, 3, 24, 24, 1], [2, 18, 2, 18, 18, 1, 2], [4, 1, 6, 6, 24, 24, 1], [2, 90, 3, 9, 36, 60, 2], [1, 1, 1, 1, 1, 1, 1]]
    matrix_interpol = []
    for i in range(7) :
        vector_interpol = []
        for j in range(7) :
            vector_interpol.append(cmod(Toom_matrix4_numer[i][j] * mod_inverse(Toom_matrix4_denom[i][j], q), q) % 2**16)
        matrix_interpol.append(vector_interpol)
    return(matrix_interpol)

def Toom4Table(q) :
    A = Toom4(q)
    print("Toom4Table_%d:" % q)
    print("	.word	%d	@ s1"  % (A[1][0] + 2**16 * A[1][2]))
    print("	.word	%d	@ s2^" % (A[1][3] * 2**16 + A[1][4])) # inv
    print("	.word	%d	@ s3^" % (A[1][5] * 2**16 + A[1][6])) # inv
    print("	.word	%d	@ s4^" % (A[2][0] * 2**16 + A[2][2])) # inv
    print("	.word	%d	@ s5"  % (A[2][3] + 2**16 * A[2][4]))
    print("	.word	%d	@ s6"  % (A[2][5] + 2**16 * A[2][6]))
    print("	.word	%d	@ s7"  % (A[3][0] + 2**16 * A[3][2]))
    print("	.word	%d	@ s8"  % (A[3][3] + 2**16 * A[3][4]))
    print("	.word	%d	@ s9#" % (A[5][1] + 2**16 * A[3][6])) # pack
    print("	.word	%d	@ s10^"% (A[4][0] * 2**16 + A[4][2])) # inv
    print("	.word	%d	@ s11" % (A[4][3] + 2**16 * A[4][4]))
    print("	.word	%d	@ s12" % (A[4][5] + 2**16 * A[4][6]))
    print("	.word	%d	@ s13" % (A[5][0] + 2**16 * A[5][2]))
    print("	.word	%d	@ s14^"% (A[5][3] * 2**16 + A[5][4])) # inv
    print("	.word	%d	@ s15^"% (A[5][5] * 2**16 + A[5][6])) # inv
    print("	.word	%d	@ s16#"% (A[1][1] + 2**16 * A[3][1])) # pack
    print("@ # two packed coeffs ^ swapped position")
    print("Toom4Table_%d_end:" % q)
    
def Toom4hex(q) :
    Toom_matrix4_numer = [[1, 0, 0, 0, 0, 0, 0], [-2, 2, -2, -2, 1, 1, -2], [-5, 0, 2, 2, -1, -1, 4], [5, -1, 3, -7, -1, 0, 5], [1, 0, -1, -1, 1, 1, -5], [-1, 1, -1, 1, 1, -1, -1], [0, 0, 0, 0, 0, 0, 1]]
    Toom_matrix4_denom = [[1, 1, 1, 1, 1, 1, 1], [1, 45, 3, 9, 36, 60, 1], [4, 1, 3, 3, 24, 24, 1], [2, 18, 2, 18, 18, 1, 2], [4, 1, 6, 6, 24, 24, 1], [2, 90, 3, 9, 36, 60, 2], [1, 1, 1, 1, 1, 1, 1]]
    matrix_interpol = []
    for i in range(7) :
        vector_interpol = []
        for j in range(7) :
            vector_interpol.append(hex(cmod(Toom_matrix4_numer[i][j] * mod_inverse(Toom_matrix4_denom[i][j], q), q) % 2**16))
        matrix_interpol.append(vector_interpol)
    return(matrix_interpol)

# M = Toom4(4591)
# print(M)