#include <stdint.h>
#include "cmsis.h"

extern int jump1024divsteps(int minusdelta, int32_t *M, int32_t *f, int32_t *g);
extern int jump896divsteps(int minusdelta, int32_t *M, int32_t *f, int32_t *g);

void gf_polymul_954x954(int32_t *h, int32_t *f, int32_t *g);
void gf_polymul_954x954_2x2_x_2x2 (int32_t *M, int32_t *M1, int32_t *M2); // M = M2 x M1 
int jump1920divsteps(int minusdelta, int32_t *M, int32_t *f, int32_t *g);

#define q 6343
#define qR2inv 677119 // round(2^32/q)
#define _2P15 (1 << 15)

static inline int barrett_16x2i(int X) {
  int32_t QL = __SMLAWB(qR2inv,X,_2P15);
  int32_t QH = __SMLAWT(qR2inv,X,_2P15);
  int32_t SL = __SMULBT(q,QL);
  int32_t SH = __SMULBT(q,QH);
  return(__SSUB16(X,__PKHBT(SL,SH,16)));
}

void gf_polymul_954x954(int *h, int *f, int *g){
    int pad[1024]={0}, fpad[512]={0}, gpad[512]={0};
    for(int i=0;i<477;++i)fpad[i]=f[i];
    for(int i=0;i<477;++i)gpad[i]=g[i];
    polymul_953x953_mod6343_32bit_16bit_crt(pad, fpad, gpad);
    for(int i=0;i<954;++i)h[i]=pad[i];
}

void gf_polymul_954x954_2x2_x_2x2 (int32_t *M, int32_t *M1, int32_t *M2){ //only v = g^-1 mod f
    int i;
    int32_t T, *X, *Y;
    int32_t B1728[955];
    int32_t *BB1728 = (int32_t *)((void *)B1728 + 2);
    B1728[0] = 0;
    B1728[1] = 0;

    gf_polymul_954x954(BB1728, M2, M1); // x * u2 * v1 
    gf_polymul_954x954(M, M2+477,M1+512); // v2 * s1

    for (i=954, X=M, Y=B1728; i>0; i--) {	// v = x u2 v1 + v2 s1
        T = barrett_16x2i(__SADD16(*X,*(Y++)));
        *(X++) = T;
    }
}

// M: f(128), g(128), v(954*2)
int jump1920divsteps(int minusdelta, int32_t *M, int32_t *f, int32_t *g){
    int32_t M1[3072],M2[1082]={0};
    int i;

    minusdelta = jump1024divsteps(minusdelta,M1,f,g); // M1: f, g, v, s(1024)
    minusdelta = jump896divsteps(minusdelta,M2,M1,M1+512); // M2: f(128), g(128), u(954), v(954)

    gf_polymul_954x954_2x2_x_2x2(M+128,M1+1024,M2+128);

    for(i=0;i<128;i++)M[i]=M2[i];

    return minusdelta;
}
