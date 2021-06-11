#include <stdint.h>
#include "cmsis.h"

extern void polymul_1277x1277_mod7879_32bit_16bit_crt(int *h, int *f, int *g);
extern int jump1280divsteps_onlyvs(int minusdelta, int *M, int *f, int *g);
extern int jump1280divsteps_onlyuv(int minusdelta, int *M, int *f, int *g);

void gf_polymul_1280x1280_2x2_x_2x2_onlyv (int *M, int *M1, int *M2); // M = M2 x M1 
int jump2560divsteps(int minusdelta, int *M, int *f, int *g);

#define q 7879
#define qR2inv 545116 // round(2^32/q)
#define _2P15 (1 << 15)

static inline int barrett_16x2i(int X) {
  int32_t QL = __SMLAWB(qR2inv,X,_2P15);
  int32_t QH = __SMLAWT(qR2inv,X,_2P15);
  int32_t SL = __SMULBT(q,QL);
  int32_t SH = __SMULBT(q,QH);
  return(__SSUB16(X,__PKHBT(SL,SH,16)));
}

void gf_polymul_1280x1280_2x2_x_2x2_onlyv (int *M, int *M1, int *M2){ //only v = g^-1 mod f
    int i;
    int T, *X, *Y, *Z;
    int B2048[1281], B2048_1[1281];
    int *BB2048 = (int *)((void *)B2048 + 2);
    int *BB2048_1 = (int *)((void *)B2048_1 + 2);
    B2048[0] = 0;
    B2048_1[0] = 0;

    polymul_1277x1277_mod7879_32bit_16bit_crt(BB2048, M2, M1); // x * u2 * v1 
    polymul_1277x1277_mod7879_32bit_16bit_crt(B2048_1, M2+640,M1+640); // v2 * s1

    for (i=644, X=M, Y=B2048, Z=B2048_1; i>0; i--) {	// v = x u2 v1 + v2 s1
        T = barrett_16x2i(__SADD16(*(Z++),*(Y++)));
        *(X++) = T;
    }
}

// M: f(256), g(256), v(1288)
int jump2560divsteps(int minusdelta, int *M, int *f, int *g){
    int M1[2560],M2[1536]={0};
    int i;

    minusdelta = jump1280divsteps_onlyvs(minusdelta,M1,f,g); // M1: f, g, v, s(1280)
    minusdelta = jump1280divsteps_onlyuv(minusdelta,M2,M1,M1+640); // M2: f(256), g(256), u(1280), v(1280)

    gf_polymul_1280x1280_2x2_x_2x2_onlyv(M+256,M1+1280,M2+256);
    
    for(int i=0;i<256;i++)M[i]=M2[i];

    return minusdelta;
}
