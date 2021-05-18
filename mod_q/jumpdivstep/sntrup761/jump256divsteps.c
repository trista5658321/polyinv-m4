#include <stdint.h>
#include "cmsis.h"
#include <stdio.h>

extern int jump128divsteps(int minusdelta, int *M, int *f, int *g);
extern void __gf_polymul_128x128_2x2_x2p2 (int *V,int *M,int *fh,int *gh);
extern void __gf_polymul_128x128_2x2_x_2x2 (int *M, int *M1, int *M2);
int jump256divsteps(int minusdelta, int *M, int *f, int *g);

int jump256divsteps(int minusdelta, int *M, int *f, int *g){
int M1[768], M2[768], fg[256];
  minusdelta = jump128divsteps(minusdelta, M1, f, g);
  /*
  printf("u1 = GF4591x(");
  printn((short *)(M1+128),128);
  printf(")\n");
  printf("v1 = GF4591x(");
  printn((short *)(M1+192),128);
  printf(")\n");
  printf("r1 = GF4591x(");
  printn((short *)(M1+256),128);
  printf(")\n");
  printf("s1 = GF4591x(");
  printn((short *)(M1+320),128);
  printf(")\n");

  printf("f1 = GF4591x(");
  printn((short *)(M1),128);
  printf(")\n");
  printf("g1 = GF4591x(");
  printn((short *)(M1+64),128);
  printf(")\n");
  */
  __gf_polymul_128x128_2x2_x2p2 (fg, M1, f+64, g+64);
  /*
  printf("f2 = GF4591x(");
  printn((short *)(fg),256);
  printf(")\n");
  printf("g2 = GF4591x(");
  printn((short *)(fg+128),256);
  printf(")\n");
  */
  minusdelta = jump128divsteps(minusdelta, M2, fg, fg+128);
  /*
  printf("u2 = GF4591x(");
  printn((short *)(M2+128),128);
  printf(")\n");
  printf("v2 = GF4591x(");
  printn((short *)(M2+192),128);
  printf(")\n");
  printf("r2 = GF4591x(");
  printn((short *)(M2+256),128);
  printf(")\n");
  printf("s2 = GF4591x(");
  printn((short *)(M2+320),128);
  printf(")\n");

  printf("f3 = GF4591x(");
  printn((short *)(M2),128);
  printf(")\n");
  printf("g3 = GF4591x(");
  printn((short *)(M2+64),128);
  printf(")\n");
  */
  __gf_polymul_128x128_2x2_x2p2 (M, M2, fg+64, fg+192);
  __gf_polymul_128x128_2x2_x_2x2(M+256, M1+128, M2+128);
  return(minusdelta);
}
