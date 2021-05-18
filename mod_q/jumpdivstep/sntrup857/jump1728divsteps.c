#include <stdint.h>
#include "cmsis.h"

extern int jump1024divsteps(int minusdelta, int32_t *M, int32_t *f, int32_t *g);
extern int jump704divsteps(int minusdelta, int32_t *M, int32_t *f, int32_t *g);
extern void gf_polymul_768x768(int32_t *h, int32_t *f, int32_t *g);

void gf_polymul_858x858_2x2_x_2x2 (int32_t *M, int32_t *M1, int32_t *M2); // M = M2 x M1 
int jump1728divsteps(int minusdelta, int32_t *M, int32_t *f, int32_t *g);

#define q 5167
#define qR2inv 831230 // round(2^32/q)
#define _2P15 (1 << 15)

static inline int barrett_16x2i(int X) {
  int32_t QL = __SMLAWB(qR2inv,X,_2P15);
  int32_t QH = __SMLAWT(qR2inv,X,_2P15);
  int32_t SL = __SMULBT(q,QL);
  int32_t SH = __SMULBT(q,QH);
  return(__SSUB16(X,__PKHBT(SL,SH,16)));
}

void gf_polymul_858x858(int *h, int *f, int *g){
    int16_t *ptr = (int16_t *)h;
    for (int i = 0; i < 1716; i++) *ptr++ = 0;
    
    for (int i = 0; i < 858; i++)
    {
        int16_t *result = (int16_t *)h + i;
        int16_t *f_i = (int16_t *)f + i;
        for (int j = 0; j < 858; j++)
        {
            int16_t *g_i = (int16_t *)g + j;
            int new_val = (*f_i * *g_i) + *(result);
            *(result++) = (int16_t)(new_val % q);
        }
    }
}

void gf_polymul_858x858_2x2_x_2x2 (int32_t *M, int32_t *M1, int32_t *M2){ //only v = g^-1 mod f
    int i;
    int32_t T, *X, *Y;
    int32_t B1728[1728];
    int32_t *BB1728 = (int32_t *)((void *)B1728 + 2);
    B1728[0] = 0;
    B1728[1] = 0;

    gf_polymul_858x858(BB1728, M2, M1); // x * u2 * v1 
    gf_polymul_858x858(M, M2+429,M1+512); // v2 * s1

    for (i=857, X=M, Y=B1728; i>0; i--) {	// v = x u2 v1 + v2 s1
        T = barrett_16x2i(__SADD16(*X,*(Y++)));
        *(X++) = T;
    }
}

// M: f(64), g(64), v(857*2)
int jump1728divsteps(int minusdelta, int32_t *M, int32_t *f, int32_t *g){
    int32_t M1[3072],M2[922]={0};
    int i;

    minusdelta = jump1024divsteps(minusdelta,M1,f,g); // M1: f, g, v, s(1024)
    minusdelta = jump704divsteps(minusdelta,M2,M1,M1+512); // M2: f(64), g(64), u(858), v(858)

    gf_polymul_858x858_2x2_x_2x2(M+64,M1+1024,M2+64);

    for(i=0;i<64;i++)M[i]=M2[i];
    return minusdelta;
}
