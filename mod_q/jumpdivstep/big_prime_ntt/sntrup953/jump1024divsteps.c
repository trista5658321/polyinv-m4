#include <stdint.h>
#include "cmsis.h"
#include <stdio.h>

extern int jump512divsteps(int minusdelta, int *M, int *f, int *g);
void __gf_polymul_512x512_2x2_x2p2 (int *V, int *M_16, int *M_32, int *fh, int *gh, int *M);
void __gf_polymul_512x512_2x2_x_2x2 (int * M, int * M1_16, int * M1_32, int * M2_16, int * M2_32);
int jump1024divsteps(int minusdelta, int *M, int *f, int *g);

#define q 6343
#define qR2inv 677119 // round(2^32/q)
#define _2P15 (1 << 15)

#if 1
// result range: +- 3171 (note: 3 loads for _2P15 and the longer qR2inv)
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

void __gf_polymul_512x512_2x2_x_2x2(int * M, int * M1_16, int * M1_32, int * M2_16, int * M2_32){
  int tmp_16_1[512];
  int tmp_32_0[1024], tmp_32_1[1024];
  int i, T, *X, *Y;

  /* u */
  basemul1024_16bit_2x2(M, M2_16, M1_16); // uux
  basemul1024_16bit_2x2(tmp_16_1, M2_16+512, M1_16+1024); // vr
  basemul1024_32bit_2x2(tmp_32_0, M2_32, M1_32); // uux
  basemul1024_32bit_2x2(tmp_32_1, M2_32+1024, M1_32+2048); // vr
  for (X=M, Y=tmp_16_1, i=512; i>0; i--) {
    T = __SADD16(*(Y++),*X);
    *(X++) = T;
  }
  intt1024_16bit(M);
  for (X=tmp_32_0, Y=tmp_32_1, i=1024; i>0; i--) {
    T = *(Y++) + *X;
    *(X++) = T;
  }
  intt1024_32bit(tmp_32_0);
  crt1024(M, tmp_32_0);

  /* v */
  basemul1024_16bit_2x2(M+512, M2_16, M1_16+512); // uvx
  basemul1024_16bit_2x2(tmp_16_1, M2_16+512, M1_16+1536); // vs
  basemul1024_32bit_2x2(tmp_32_0, M2_32, M1_32+1024); // uvx
  basemul1024_32bit_2x2(tmp_32_1, M2_32+1024, M1_32+3072); // vs
  for (X=M+512, Y=tmp_16_1, i=512; i>0; i--) {  
    T = __SADD16(*(Y++),*X);
    *(X++) = T;
  }
  intt1024_16bit(M+512);
  for (X=tmp_32_0, Y=tmp_32_1, i=1024; i>0; i--) {
    T = *(Y++) + *X;
    *(X++) = T;
  }
  intt1024_32bit(tmp_32_0);
  crt1024(M+512, tmp_32_0);

  /* r */
  basemul1024_16bit_2x2(M+1024, M2_16+1024, M1_16); // r2 u1 x
  basemul1024_16bit_2x2(tmp_16_1, M2_16+1536, M1_16+1024); // s2 r1
  basemul1024_32bit_2x2(tmp_32_0, M2_32+2048, M1_32); // r2 u1 x
  basemul1024_32bit_2x2(tmp_32_1, M2_32+3072, M1_32+2048); // s2 r1
  for (X=M+1024, Y=tmp_16_1, i=512; i>0; i--) {
    T = __SADD16(*(Y++),*X);
    *(X++) = T;
  }
  intt1024_16bit(M+1024);
  for (X=tmp_32_0, Y=tmp_32_1, i=1024; i>0; i--) {
    T = *(Y++) + *X;
    *(X++) = T;
  }
  intt1024_32bit(tmp_32_0);
  crt1024(M+1024, tmp_32_0);

  /* s */
  basemul1024_16bit_2x2(M+1536, M2_16+1024, M1_16+512); // rvx
  basemul1024_16bit_2x2(tmp_16_1, M2_16+1536, M1_16+1536); // ss
  basemul1024_32bit_2x2(tmp_32_0, M2_32+2048, M1_32+1024); // rvx
  basemul1024_32bit_2x2(tmp_32_1, M2_32+3072, M1_32+3072); // ss
  for (X=M+1536, Y=tmp_16_1, i=512; i>0; i--) {
    T = __SADD16(*(Y++),*X);
    *(X++) = T;
  }
  intt1024_16bit(M+1536);
  for (X=tmp_32_0, Y=tmp_32_1, i=1024; i>0; i--) {
    T = *(Y++) + *X;
    *(X++) = T;
  }
  intt1024_32bit(tmp_32_0);
  crt1024(M+1536, tmp_32_0);
}

void __gf_polymul_512x512_2x2_x2p2(int *V, int *M, int *M_16_r, int *M_16_s, int *M_32_u, int *M_32_v, int *M_32_r, int *M_32_s, int *fh, int *gh){
  int fh_16[512], gh_16[512];
  int fh_32[1024], gh_32[1024];
  int tmp_16_1[512];
  int tmp_32_0[1024], tmp_32_1[1024];

  basemul_x_1024_16bit_2x2(M+512); // u x
  basemul_x_1024_16bit_2x2(M+1024); // v x
  basemul_x_1024_32bit_2x2(M_32_u); // u x
  basemul_x_1024_32bit_2x2(M_32_v); // v x

  ntt1024_16bit(fh_16, fh);
  ntt1024_32bit(fh_32, fh);
  ntt1024_16bit(gh_16, gh);
  ntt1024_32bit(gh_32, gh);

  basemul1024_16bit_2x2(V, M+512, fh_16); // ux * fh
  basemul1024_16bit_2x2(tmp_16_1, M+1024, gh_16); // vx * gh
  basemul1024_32bit_2x2(tmp_32_0, M_32_u, fh_32); // ux * fh
  basemul1024_32bit_2x2(tmp_32_1, M_32_v, gh_32); // vx * gh

  int i, T, *X, *Y, *W;
  for (X=V, Y=tmp_16_1, i=512; i>0; i--) {
    T = __SADD16(*(Y++),*X);
    *(X++) = T;
  }
  intt1024_16bit(V);

  for (X=tmp_32_0, Y=tmp_32_1, i=1024; i>0; i--) {
    T = *(Y++) + *X;
    *(X++) = T;
  }
  intt1024_32bit(tmp_32_0);

  crt1024(V, tmp_32_0);

  basemul1024_16bit_2x2(V+512, M_16_r, fh_16); // r * fh
  basemul1024_16bit_2x2(tmp_16_1, M_16_s, gh_16); // s * gh
  basemul1024_32bit_2x2(tmp_32_0, M_32_r, fh_32); // r * fh
  basemul1024_32bit_2x2(tmp_32_1, M_32_s, gh_32); // s * gh

  for (X=V+512, Y=tmp_16_1, i=512; i>0; i--) {
    T = __SADD16(*(Y++),*X);
    *(X++) = T;
  }
  intt1024_16bit(V+512);

  for (X=tmp_32_0, Y=tmp_32_1, i=1024; i>0; i--) {
    T = *(Y++) + *X;
    *(X++) = T;
  }
  intt1024_32bit(tmp_32_0);

  crt1024(V+512, tmp_32_0);

  for (X=V, Y=M, i=256; i>0; i--) {  // + f'
    T = barrett_16x2i(__SADD16(*(Y++),*X)); *(X++) = T;
  } 
  for (X=V+512, Y=M+256, i=256; i>0; i--) {  // + g'
    T = barrett_16x2i(__SADD16(*(Y++),*X)); *(X++) = T;
  }
}

int jump1024divsteps(int minusdelta, int *M, int *f, int *g){
  int M1[1536], M2[1536], fg[1024];
  int M1_16[2048]={0}, M1_32[4096];
  int M2_16[2048]={0}, M2_32[4096];

  minusdelta = jump512divsteps(minusdelta, M1, f, g);

  ntt1024_16bit(M1_16, M1+512); // u1
  ntt1024_16bit(M1_16+512, M1+768); // v1
  ntt1024_16bit(M1_16+1024, M1+1024); // r1
  ntt1024_16bit(M1_16+1536, M1+1280); // s1

  ntt1024_32bit(M1_32, M1+512); // u1
  ntt1024_32bit(M1_32+1024, M1+768); // v1
  ntt1024_32bit(M1_32+2048, M1+1024); // r1
  ntt1024_32bit(M1_32+3072, M1+1280); // s1

  __gf_polymul_512x512_2x2_x2p2(fg, M1_16, M1_32, f+256, g+256, M1);

  minusdelta = jump512divsteps(minusdelta, M2, fg, fg+512);

  ntt1024_16bit(M2_16, M2+512); // u2
  ntt1024_16bit(M2_16+512, M2+768); // v2
  ntt1024_16bit(M2_16+1024, M2+1024); // r2
  ntt1024_16bit(M2_16+1536, M2+1280); // s2

  ntt1024_32bit(M2_32, M2+512); // u2
  ntt1024_32bit(M2_32+1024, M2+768); // v2
  ntt1024_32bit(M2_32+2048, M2+1024); // r2
  ntt1024_32bit(M2_32+3072, M2+1280); // s2

  __gf_polymul_512x512_2x2_x_2x2(M+1024, M1_16, M1_32, M2_16, M2_32);
  __gf_polymul_512x512_2x2_x2p2(M, M2_16, M2_32, fg+256, fg+768, M2);

  return(minusdelta);
}
