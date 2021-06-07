#include <stdint.h>
#include "cmsis.h"
#include <stdio.h>

extern int jump512divsteps(int minusdelta, int *M, int *f, int *g);
void gf_polymul_512x512_2x2_x2p2 (int *V,int *M,int *fh,int *gh);
void gf_polymul_512x512_2x2_x_2x2 (int *M, int *M1, int *M2);
int jump1024divsteps(int minusdelta, int *M, int *f, int *g);

#define q 5167
#define qR2inv 831230 // round(2^32/q)
#define _2P15 (1 << 15)

#if 1
// result range: +- 2295 (note: 3 loads for _2P15 and the longer qR2inv)
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

void __gf_polymul_512x512_2x2_x_2x2(int * M, int *M1_16_v, int *M1_16_s, int *M1_32_v, int *M1_32_s, int * M2_16_u, int * M2_16_v, int * M2_16_r, int * M2_16_s, int * M2_32_u, int * M2_32_v, int * M2_32_r, int * M2_32_s){
  int tmp_16_1[512];
  int tmp_32_0[1024], tmp_32_1[1024];
  int i, T, *X, *Y;

  /* v */
  basemul1024_16bit_2x2(M, M2_16_u, M1_16_v); // uvx
  basemul1024_16bit_2x2(tmp_16_1, M2_16_v, M1_16_s); // vs
  basemul1024_32bit_2x2(tmp_32_0, M2_32_u, M1_32_v); // uvx
  basemul1024_32bit_2x2(tmp_32_1, M2_32_v, M1_32_s); // vs
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

  /* s */
  basemul1024_16bit_2x2(M+512, M2_16_r, M1_16_v); // rvx
  basemul1024_16bit_2x2(tmp_16_1, M2_16_s, M1_16_s); // ss
  basemul1024_32bit_2x2(tmp_32_0, M2_32_r, M1_32_v); // rvx
  basemul1024_32bit_2x2(tmp_32_1, M2_32_s, M1_32_s); // ss
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
}
void __gf_polymul_512x512_2x2_x2p2(int *V, int *M_16, int *M_16_v, int *M_16_r, int *M_16_s, int *M_32_u, int *M_32_v, int *M_32_r, int *M_32_s, int *fh, int *gh, int *M){
  int fh_16[512], gh_16[512];
  int fh_32[1024], gh_32[1024];
  int tmp_16_1[512];
  int tmp_32_0[1024], tmp_32_1[1024];

  basemul_x_1024_16bit_2x2(M_16); // u x
  basemul_x_1024_16bit_2x2(M_16_v); // v x
  basemul_x_1024_32bit_2x2(M_32_u); // u x
  basemul_x_1024_32bit_2x2(M_32_v); // v x

  ntt1024_16bit(fh_16, fh);
  ntt1024_32bit(fh_32, fh);
  ntt1024_16bit(gh_16, gh);
  ntt1024_32bit(gh_32, gh);

  basemul1024_16bit_2x2(V, M_16, fh_16); // ux * fh
  basemul1024_16bit_2x2(tmp_16_1, M_16_v, gh_16); // vx * gh
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

  int M1_16[512];
  int M1_16_v[512];
  int M1_16_r[512];
  int M1_16_s[512];

  int M1_32_u[1024];
  int M1_32_v[1024];
  int M1_32_r[1024];
  int M1_32_s[1024];

  // int M2_16[512];
  // int M2_16_v[512];
  // M2: f,g, M2_16_u, M2_16_v
  int M2_16_r[512];
  int M2_16_s[512];

  int M2_32_u[1024];
  int M2_32_v[1024];
  int M2_32_r[1024];
  int M2_32_s[1024];

  minusdelta = jump512divsteps(minusdelta, M1, f, g);

  ntt1024_16bit(M1_16_r, M1+1024); // r1
  ntt1024_16bit(M1_16_s, M1+1280); // s1
  ntt1024_16bit(M1_16_v, M1+768); // v1
  ntt1024_16bit(M1_16, M1+512); // u1

  ntt1024_32bit(M1_32_u, M1+512); // u1
  ntt1024_32bit(M1_32_v, M1+768); // v1
  ntt1024_32bit(M1_32_r, M1+1024); // r1
  ntt1024_32bit(M1_32_s, M1+1280); // s1

  __gf_polymul_512x512_2x2_x2p2(fg, M1_16, M1_16_v, M1_16_r, M1_16_s, M1_32_u, M1_32_v, M1_32_r, M1_32_s, f+256, g+256, M1);

  minusdelta = jump512divsteps(minusdelta, M2, fg, fg+512);

  ntt1024_16bit(M2_16_r, M2+1024); // r2
  ntt1024_16bit(M2_16_s, M2+1280); // s2

  ntt1024_16bit(M1_16, M2+512); // u2
  ntt1024_16bit(M1_16_r, M2+768); // v2

  ntt1024_32bit(M2_32_u, M2+512); // u1
  ntt1024_32bit(M2_32_v, M2+768); // v1
  ntt1024_32bit(M2_32_r, M2+1024); // r1
  ntt1024_32bit(M2_32_s, M2+1280); // s1

  __gf_polymul_512x512_2x2_x_2x2(M+1024, M1_16_v, M1_16_s, M1_32_v, M1_32_s, M1_16, M1_16_r, M2_16_r, M2_16_s, M2_32_u, M2_32_v, M2_32_r, M2_32_s);
  __gf_polymul_512x512_2x2_x2p2(M, M1_16, M1_16_r, M2_16_r, M2_16_s, M2_32_u, M2_32_v, M2_32_r, M2_32_s, fg+256, fg+768, M2);
  
  return(minusdelta);
}
