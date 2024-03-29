#include <stdint.h>
#include "cmsis.h"
#include <stdlib.h>

extern int jump1024divsteps_onlyvs(int minusdelta, int32_t *M, int32_t *f, int32_t *g);
extern int jump1024divsteps_onlyuv(int minusdelta, int32_t *M, int32_t *f, int32_t *g);

void gf_polymul_1024x1024(int32_t *h, int32_t *f, int32_t *g);
void gf_polymul_1024x1024_2x2_x_2x2_onlyv (int32_t *M, int32_t *M1, int32_t *M2); // M = M2 x M1 
int jump2048divsteps(int minusdelta, int32_t *M, int32_t *f, int32_t *g);

#define q 7177
#define qR2inv 598435 // round(2^32/q)
#define _2P15 (1 << 15)

static inline int barrett_16x2i(int X) {
  int32_t QL = __SMLAWB(qR2inv,X,_2P15);
  int32_t QH = __SMLAWT(qR2inv,X,_2P15);
  int32_t SL = __SMULBT(q,QL);
  int32_t SH = __SMULBT(q,QH);
  return(__SSUB16(X,__PKHBT(SL,SH,16)));
}

void gf_polymul_1024x1024(int32_t *h, int32_t *f, int32_t *g){
  int32_t fpad[1248], gpad[1248];
  int32_t* tmp = malloc(1248*4);
  mask1013(tmp, f);
  ntt13_rader(fpad, tmp);
  ntt24(fpad);
  mask1013(tmp, g);
  ntt13_rader(gpad, tmp);
  free(tmp);
  ntt24(gpad);
  basemul_8x8_312(fpad, fpad, gpad);
  intt24(fpad);
  intt13_rader(gpad, fpad);
  imask2026(h, gpad);
}

void gf_polymul_1024x1024_2x2_x_2x2_onlyv (int32_t *M, int32_t *M1, int32_t *M2){ //only v = g^-1 mod f
  int i;
  int32_t T, *X, *Y;
  int32_t B2048[1025];
  int32_t *BB2048 = (int32_t *)((void *)B2048 + 2);
  B2048[0] = 0;
  B2048[1] = 0;

  gf_polymul_1024x1024(BB2048, M2, M1); // x * u2 * v1 
  gf_polymul_1024x1024(M, M2+512,M1+512); // v2 * s1

  for (i=1024, X=M, Y=B2048; i>0; i--) {	// v = x u2 v1 + v2 s1
      T = barrett_16x2i(__SADD16(*X,*(Y++)));
      *(X++) = T;
  }
}

// M: f(512), g(512), v(1024*2)
int jump2048divsteps(int minusdelta, int32_t *M, int32_t *f, int32_t *g){
  int32_t M1[3072],M2[1536]={0};
  minusdelta = jump1024divsteps_onlyvs(minusdelta,M1,f,g); // M1: f, g, v, s(1024)
  minusdelta = jump1024divsteps_onlyuv(minusdelta,M2,M1,M1+512); // M2: f(512), g(512), u(1024), v(1024)
  gf_polymul_1024x1024_2x2_x_2x2_onlyv(M+512,M1+1024,M2+512);

  for(int i=0;i<512;i++)M[i]=M2[i];

  return minusdelta;
}
