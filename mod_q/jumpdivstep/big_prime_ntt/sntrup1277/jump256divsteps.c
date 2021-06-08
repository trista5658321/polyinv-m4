#include <stdint.h>
#include "cmsis.h"
#include <stdio.h>

extern int jump128divsteps(int minusdelta, int *M, int *f, int *g);
void __gf_polymul_128x128_2x2_x2p2 (int *V, int *M_16, int *M_32, int *fh, int *gh, int *M);
void __gf_polymul_128x128_2x2_x_2x2 (int * M, int * M1_16, int * M1_32, int * M2_16, int * M2_32);
int jump256divsteps(int minusdelta, int *M, int *f, int *g);

#define q 7879
#define qR2inv 545116 // round(2^32/q)
#define _2P15 (1 << 15)

#if 1
// result range: +- 3939 (note: 3 loads for _2P15 and the longer qR2inv)
static inline int barrett_16x2i(int X) {
  int32_t QL = __SMLAWB(qR2inv,X,_2P15);
  int32_t QH = __SMLAWT(qR2inv,X,_2P15);
  int32_t SL = __SMULBT(q,QL);
  int32_t SH = __SMULBT(q,QH);
  return(__SSUB16(X,__PKHBT(SL,SH,16)));
}

#else 
#define barrett_16x2i(A) (A)
#endif

void __gf_polymul_128x128_2x2_x_2x2(int * M, int * M1_16, int * M1_32, int * M2_16, int * M2_32){
  int tmp_16_1[128];
  int tmp_32_0[256], tmp_32_1[256];
  int i, T, *X, *Y;

  /* u */
  basemul256_16bit_2x2(M, M2_16, M1_16); // uux
  basemul256_16bit_2x2(tmp_16_1, M2_16+128, M1_16+256); // vr
  basemul256_32bit_2x2(tmp_32_0, M2_32, M1_32); // uux
  basemul256_32bit_2x2(tmp_32_1, M2_32+256, M1_32+512); // vr
  for (X=M, Y=tmp_16_1, i=128; i>0; i--) {
    T = __SADD16(*(Y++),*X);
    *(X++) = T;
  }
  intt256_16bit(M);
  for (X=tmp_32_0, Y=tmp_32_1, i=256; i>0; i--) {
    T = *(Y++) + *X;
    *(X++) = T;
  }
  intt256_32bit(tmp_32_0);
  crt256(M, tmp_32_0);

  /* v */
  basemul256_16bit_2x2(M+128, M2_16, M1_16+128); // uvx
  basemul256_16bit_2x2(tmp_16_1, M2_16+128, M1_16+384); // vs
  basemul256_32bit_2x2(tmp_32_0, M2_32, M1_32+256); // uvx
  basemul256_32bit_2x2(tmp_32_1, M2_32+256, M1_32+768); // vs
  for (X=M+128, Y=tmp_16_1, i=128; i>0; i--) {  
    T = __SADD16(*(Y++),*X);
    *(X++) = T;
  }
  intt256_16bit(M+128);
  for (X=tmp_32_0, Y=tmp_32_1, i=256; i>0; i--) {
    T = *(Y++) + *X;
    *(X++) = T;
  }
  intt256_32bit(tmp_32_0);
  crt256(M+128, tmp_32_0);

  /* r */
  basemul256_16bit_2x2(M+256, M2_16+256, M1_16); // r2 u1 x
  basemul256_16bit_2x2(tmp_16_1, M2_16+384, M1_16+256); // s2 r1
  basemul256_32bit_2x2(tmp_32_0, M2_32+512, M1_32); // r2 u1 x
  basemul256_32bit_2x2(tmp_32_1, M2_32+768, M1_32+512); // s2 r1
  for (X=M+256, Y=tmp_16_1, i=128; i>0; i--) {
    T = __SADD16(*(Y++),*X);
    *(X++) = T;
  }
  intt256_16bit(M+256);
  for (X=tmp_32_0, Y=tmp_32_1, i=256; i>0; i--) {
    T = *(Y++) + *X;
    *(X++) = T;
  }
  intt256_32bit(tmp_32_0);
  crt256(M+256, tmp_32_0);

  /* s */
  basemul256_16bit_2x2(M+384, M2_16+256, M1_16+128); // rvx
  basemul256_16bit_2x2(tmp_16_1, M2_16+384, M1_16+384); // ss
  basemul256_32bit_2x2(tmp_32_0, M2_32+512, M1_32+256); // rvx
  basemul256_32bit_2x2(tmp_32_1, M2_32+768, M1_32+768); // ss
  for (X=M+384, Y=tmp_16_1, i=128; i>0; i--) {
    T = __SADD16(*(Y++),*X);
    *(X++) = T;
  }
  intt256_16bit(M+384);
  for (X=tmp_32_0, Y=tmp_32_1, i=256; i>0; i--) {
    T = *(Y++) + *X;
    *(X++) = T;
  }
  intt256_32bit(tmp_32_0);
  crt256(M+384, tmp_32_0);
}

void __gf_polymul_128x128_2x2_x2p2(int *V, int *M_16, int *M_32, int *fh, int *gh, int *M){
  int fh_16[128], gh_16[128];
  int fh_32[256], gh_32[256];
  int tmp_16_1[128];
  int tmp_32_0[256], tmp_32_1[256];

  basemul_x_256_16bit_2x2(M_16); // u x
  basemul_x_256_16bit_2x2(M_16+128); // v x
  basemul_x_256_32bit_2x2(M_32); // u x
  basemul_x_256_32bit_2x2(M_32+256); // v x

  ntt256_16bit(fh_16, fh);
  ntt256_32bit(fh_32, fh);
  ntt256_16bit(gh_16, gh);
  ntt256_32bit(gh_32, gh);

  basemul256_16bit_2x2(V, M_16, fh_16); // ux * fh
  basemul256_16bit_2x2(tmp_16_1, M_16+128, gh_16); // vx * gh
  basemul256_32bit_2x2(tmp_32_0, M_32, fh_32); // ux * fh
  basemul256_32bit_2x2(tmp_32_1, M_32+256, gh_32); // vx * gh

  int i, T, *X, *Y, *W;
  for (X=V, Y=tmp_16_1, i=128; i>0; i--) {
    T = __SADD16(*(Y++),*X);
    *(X++) = T;
  }
  intt256_16bit(V);

  for (X=tmp_32_0, Y=tmp_32_1, i=256; i>0; i--) {
    T = *(Y++) + *X;
    *(X++) = T;
  }
  intt256_32bit(tmp_32_0);

  crt256(V, tmp_32_0);

  basemul256_16bit_2x2(V+128, M_16+256, fh_16); // r * fh
  basemul256_16bit_2x2(tmp_16_1, M_16+384, gh_16); // s * gh
  basemul256_32bit_2x2(tmp_32_0, M_32+512, fh_32); // r * fh
  basemul256_32bit_2x2(tmp_32_1, M_32+768, gh_32); // s * gh

  for (X=V+128, Y=tmp_16_1, i=128; i>0; i--) {
    T = __SADD16(*(Y++),*X);
    *(X++) = T;
  }
  intt256_16bit(V+128);

  for (X=tmp_32_0, Y=tmp_32_1, i=256; i>0; i--) {
    T = *(Y++) + *X;
    *(X++) = T;
  }
  intt256_32bit(tmp_32_0);

  crt256(V+128, tmp_32_0);

  for (X=V, Y=M, i=64; i>0; i--) {  // + f'
    T = barrett_16x2i(__SADD16(*(Y++),*X)); *(X++) = T;
  } 
  for (X=V+128, Y=M+64, i=64; i>0; i--) {  // + g'
    T = barrett_16x2i(__SADD16(*(Y++),*X)); *(X++) = T;
  }
}

int jump256divsteps(int minusdelta, int *M, int *f, int *g){
  int M1[384], M2[384], fg[256];
  int M1_16[512]={0}, M1_32[1024];
  int M2_16[512]={0}, M2_32[1024];

  minusdelta = jump128divsteps(minusdelta, M1, f, g);

  ntt256_16bit(M1_16, M1+128); // u1
  ntt256_16bit(M1_16+128, M1+192); // v1
  ntt256_16bit(M1_16+256, M1+256); // r1
  ntt256_16bit(M1_16+384, M1+320); // s1

  ntt256_32bit(M1_32, M1+128); // u1
  ntt256_32bit(M1_32+256, M1+192); // v1
  ntt256_32bit(M1_32+512, M1+256); // r1
  ntt256_32bit(M1_32+768, M1+320); // s1

  __gf_polymul_128x128_2x2_x2p2(fg, M1_16, M1_32, f+64, g+64, M1);

  minusdelta = jump128divsteps(minusdelta, M2, fg, fg+128);

  ntt256_16bit(M2_16, M2+128); // u2
  ntt256_16bit(M2_16+128, M2+192); // v2
  ntt256_16bit(M2_16+256, M2+256); // r2
  ntt256_16bit(M2_16+384, M2+320); // s2

  ntt256_32bit(M2_32, M2+128); // u2
  ntt256_32bit(M2_32+256, M2+192); // v2
  ntt256_32bit(M2_32+512, M2+256); // r2
  ntt256_32bit(M2_32+768, M2+320); // s2

  __gf_polymul_128x128_2x2_x_2x2(M+256, M1_16, M1_32, M2_16, M2_32);
  __gf_polymul_128x128_2x2_x2p2(M, M2_16, M2_32, fg+64, fg+192, M2);

  return(minusdelta);
}
