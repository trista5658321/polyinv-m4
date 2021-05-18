#include <stdint.h>
#include "cmsis.h"

extern int jump768divsteps(int minusdelta, int32_t *M, int32_t *f, int32_t *g);
extern int jump544divsteps(int minusdelta, int32_t *M, int32_t *f, int32_t *g);
extern void gf_polymul_768x768(int32_t *h, int32_t *f, int32_t *g);

void gf_polymul_656x656_2x2_x_2x2 (int32_t *M, int32_t *M1, int32_t *M2); // M = M2 x M1 
int jump1312divsteps(int minusdelta, int32_t *M, int32_t *f, int32_t *g);

#define q 4621
#define qR2inv 929445 // round(2^32/q)
#define _2P15 (1 << 15)

static inline int barrett_16x2i(int X) {
  int32_t QL = __SMLAWB(qR2inv,X,_2P15);
  int32_t QH = __SMLAWT(qR2inv,X,_2P15);
  int32_t SL = __SMULBT(q,QL);
  int32_t SH = __SMULBT(q,QH);
  return(__SSUB16(X,__PKHBT(SL,SH,16)));
}

void gf_polymul_656x656(int *h, int *f, int *g){
    int16_t *ptr = (int16_t *)h;
    for (int i = 0; i < 1312; i++) *ptr++ = 0;
    
    for (int i = 0; i < 656; i++)
    {
        int16_t *result = (int16_t *)h + i;
        int16_t *f_i = (int16_t *)f + i;
        for (int j = 0; j < 656; j++)
        {
            int16_t *g_i = (int16_t *)g + j;
            int new_val = (*f_i * *g_i) + *(result);
            *(result++) = (int16_t)(new_val % q);
        }
    }
}

void gf_polymul_656x656_2x2_x_2x2 (int32_t *M, int32_t *M1, int32_t *M2){ //only v = g^-1 mod f
    int i;
    int32_t T, *X, *Y;
    int32_t B1521_1[769];
    int32_t *BB1521_1 = (int32_t *)((void *)B1521_1 + 2);
    B1521_1[0] = 0;
    B1521_1[1] = 0;

    gf_polymul_656x656(BB1521_1, M2, M1); // x * u2 * v1 
    gf_polymul_656x656(M, M2+384,M1+384); // v2 * s1

    for (i=656, X=M, Y=B1521_1; i>0; i--) {	// v = x u2 v1 + v2 s1
        T = barrett_16x2i(__SADD16(*X,*(Y++)));
        *(X++) = T;
    }
}

int jump1312divsteps(int minusdelta, int32_t *M, int32_t *f, int32_t *g){
    int32_t M1[1536],M2[800]={0};
    int i;

    minusdelta = jump768divsteps(minusdelta,M1,f,g); // M1: f, g, v, s(768)
    minusdelta = jump544divsteps(minusdelta,M2,M1,M1+384); // M2: f(32), g(32), u(768), v(768)

    gf_polymul_656x656_2x2_x_2x2(M+32,M1+768,M2+32);

    for(i=0;i<32;i++)M[i]=M2[i];
    // M: f(32), g(32), v(768)

    return minusdelta;
}
