#include <stdint.h>
#include "cmsis.h"
#include <stdio.h>

extern int jump256divsteps(int minusdelta, int *M, int *f, int *g);
void __gf_polymul_256x256_2x2_x2p2 (int *V, int *M_16, int *M_32, int *fh, int *gh, int *M);
void __gf_polymul_256x256_2x2_x_2x2 (int * M, int * M1_16, int * M1_32, int * M2_16, int * M2_32);
int jump512divsteps(int minusdelta, int *M, int *f, int *g);

#define q 7177
#define qR2inv 598435 // round(2^32/q)
#define _2P15 (1 << 15)
#define mont_basemul 119749 // x * 2^32 * 2^32 % q0

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

void __gf_polymul_256x256_2x2_x_2x2(int * M, int * M1_16, int * M1_32, int * M2_16, int * M2_32){
  int tmp_16_1[256];
  int tmp_32_0[512], tmp_32_1[512];
  int i, T, *X, *Y;

  /* u */
  basemul_16bit_4x4(M, M2_16, M1_16); // uux
  basemul_16bit_4x4(tmp_16_1, M2_16+256, M1_16+512); // vr
  basemul_32bit_4x4(tmp_32_0, M2_32, M1_32); // uux
  basemul_32bit_4x4(tmp_32_1, M2_32+512, M1_32+1024); // vr
  for (X=M, Y=tmp_16_1, i=256; i>0; i--) {  
    T = __SADD16(*(Y++),*X);
    *(X++) = T;
  }
  intt512_16bit(M);
  for (X=tmp_32_0, Y=tmp_32_1, i=512; i>0; i--) {  
    T = *(Y++) + *X;
    *(X++) = T;
  }
  intt512_32bit(tmp_32_0);
  crt512(M, tmp_32_0);

  /* v */
  basemul_16bit_4x4(M+256, M2_16, M1_16+256); // uvx
  basemul_16bit_4x4(tmp_16_1, M2_16+256, M1_16+768); // vs
  basemul_32bit_4x4(tmp_32_0, M2_32, M1_32+512); // uvx
  basemul_32bit_4x4(tmp_32_1, M2_32+512, M1_32+1536); // vs
  for (X=M+256, Y=tmp_16_1, i=256; i>0; i--) {  
    T = __SADD16(*(Y++),*X);
    *(X++) = T;
  }
  intt512_16bit(M+256);
  for (X=tmp_32_0, Y=tmp_32_1, i=512; i>0; i--) {  
    T = *(Y++) + *X;
    *(X++) = T;
  }
  intt512_32bit(tmp_32_0);
  crt512(M+256, tmp_32_0);
  
  /* r */
  basemul_16bit_4x4(M+512, M2_16+512, M1_16); // r2 u1 x
  basemul_16bit_4x4(tmp_16_1, M2_16+768, M1_16+512); // s2 r1
  basemul_32bit_4x4(tmp_32_0, M2_32+1024, M1_32); // r2 u1 x
  basemul_32bit_4x4(tmp_32_1, M2_32+1536, M1_32+1024); // s2 r1
  for (X=M+512, Y=tmp_16_1, i=256; i>0; i--) {  
    T = __SADD16(*(Y++),*X);
    *(X++) = T;
  }
  intt512_16bit(M+512);
  for (X=tmp_32_0, Y=tmp_32_1, i=512; i>0; i--) {  
    T = *(Y++) + *X;
    *(X++) = T;
  }
  intt512_32bit(tmp_32_0);
  crt512(M+512, tmp_32_0);

  
  /* s */
  basemul_16bit_4x4(M+768, M2_16+512, M1_16+256); // rvx
  basemul_16bit_4x4(tmp_16_1, M2_16+768, M1_16+768); // ss
  basemul_32bit_4x4(tmp_32_0, M2_32+1024, M1_32+512); // rvx
  basemul_32bit_4x4(tmp_32_1, M2_32+1536, M1_32+1536); // ss
  for (X=M+768, Y=tmp_16_1, i=256; i>0; i--) {  
    T = __SADD16(*(Y++),*X);
    *(X++) = T;
  }
  intt512_16bit(M+768);
  for (X=tmp_32_0, Y=tmp_32_1, i=512; i>0; i--) {  
    T = *(Y++) + *X;
    *(X++) = T;
  }
  intt512_32bit(tmp_32_0);
  crt512(M+768, tmp_32_0);
}

void __gf_polymul_256x256_2x2_x2p2(int *V, int *M_16, int *M_32, int *fh, int *gh, int *M){
  int fh_16[256], gh_16[256];
  int fh_32[512], gh_32[512];
  int tmp_16_1[256];
  int tmp_32_0[512], tmp_32_1[512];

  int16_t x[512] = {0};
  x[1]=1;
  int x_ntt_16[256];
  int x_ntt_32[512];
  ntt512_16bit(x_ntt_16, x);
  ntt512_32bit(x_ntt_32, x);

  basemul_16bit_4x4(M_16, M_16, x_ntt_16);  // u x
  basemul_16bit_4x4(M_16+256, M_16+256, x_ntt_16); // v x
  basemul_32bit_4x4(M_32, M_32, x_ntt_32); // u x
  basemul_32bit_4x4(M_32+512, M_32+512, x_ntt_32); // v x
  int *mont_ptr_u = M_32;
  int *mont_ptr_v = M_32+512;
  for (int i = 0; i < 512; i++)
  {
      int a = *mont_ptr_u;
      int b = *mont_ptr_v;
      *mont_ptr_u++ = inverse_layer( a, 1038337, -103819265, mont_basemul);
      *mont_ptr_v++ = inverse_layer( b, 1038337, -103819265, mont_basemul);
  }
  /* M(ntt): ux vx r s */

  ntt512_16bit(fh_16, fh);
  ntt512_32bit(fh_32, fh);
  ntt512_16bit(gh_16, gh);
  ntt512_32bit(gh_32, gh);

  basemul_16bit_4x4(V, M_16, fh_16); // ux * fh
  basemul_16bit_4x4(tmp_16_1, M_16+256, gh_16); // vx * gh
  basemul_32bit_4x4(tmp_32_0, M_32, fh_32); // ux * fh
  basemul_32bit_4x4(tmp_32_1, M_32+512, gh_32); // vx * gh

  int i, T, *X, *Y, *W;
  for (X=V, Y=tmp_16_1, i=256; i>0; i--) {  
    T = __SADD16(*(Y++),*X);
    *(X++) = T;
  } 
  intt512_16bit(V);

  for (X=tmp_32_0, Y=tmp_32_1, i=512; i>0; i--) {  
    T = *(Y++) + *X;
    *(X++) = T;
  }
  intt512_32bit(tmp_32_0);

  crt512(V, tmp_32_0);

  basemul_16bit_4x4(V+256, M_16+512, fh_16); // r * fh
  basemul_16bit_4x4(tmp_16_1, M_16+768, gh_16); // s * gh
  basemul_32bit_4x4(tmp_32_0, M_32+1024, fh_32); // r * fh
  basemul_32bit_4x4(tmp_32_1, M_32+1536, gh_32); // s * gh

  for (X=V+256, Y=tmp_16_1, i=256; i>0; i--) {  
    T = __SADD16(*(Y++),*X);
    *(X++) = T;
  } 
  intt512_16bit(V+256);

  for (X=tmp_32_0, Y=tmp_32_1, i=512; i>0; i--) {  
    T = *(Y++) + *X;
    *(X++) = T;
  }
  intt512_32bit(tmp_32_0);

  crt512(V+256, tmp_32_0);


  for (X=V, Y=M, i=128; i>0; i--) {  // + f'
    T = barrett_16x2i(__SADD16(*(Y++),*X)); *(X++) = T;
  } 
  for (X=V+256, Y=M+128, i=128; i>0; i--) {  // + g'
    T = barrett_16x2i(__SADD16(*(Y++),*X)); *(X++) = T;
  }
}

int jump512divsteps(int minusdelta, int *M, int *f, int *g){
  int M1[1536], M2[1536], fg[512];
  int M1_16[1024]={0}, M1_32[2048];
  int M2_16[1024]={0}, M2_32[2048]; // 512 * 4 / 2, 512 * 4

  minusdelta = jump256divsteps(minusdelta, M1, f, g);

  // step: 512/2, 256/2
  ntt512_16bit(M1_16, M1+256); // u
  ntt512_16bit(M1_16+256, M1+384); // v1
  ntt512_16bit(M1_16+512, M1+512); // r
  ntt512_16bit(M1_16+768, M1+640); // s
  
  // step: 512, 256/2
  ntt512_32bit(M1_32, M1+256); // u
  ntt512_32bit(M1_32+512, M1+384); // v
  ntt512_32bit(M1_32+1024, M1+512); // r
  ntt512_32bit(M1_32+1536, M1+640); // s

  __gf_polymul_256x256_2x2_x2p2(fg, M1_16, M1_32, f+128, g+128, M1);

  minusdelta = jump256divsteps(minusdelta, M2, fg, fg+256);

  ntt512_16bit(M2_16, M2+256); // u2
  ntt512_16bit(M2_16+256, M2+384); // v2
  ntt512_16bit(M2_16+512, M2+512);
  ntt512_16bit(M2_16+768, M2+640);
  
  ntt512_32bit(M2_32, M2+256); // u2
  ntt512_32bit(M2_32+512, M2+384); // v2
  ntt512_32bit(M2_32+1024, M2+512);
  ntt512_32bit(M2_32+1536, M2+640);

  __gf_polymul_256x256_2x2_x_2x2(M+512, M1_16, M1_32, M2_16, M2_32);
  __gf_polymul_256x256_2x2_x2p2(M, M2_16, M2_32, fg+128, fg+384, M2);

  return(minusdelta);
}
