#include <stdint.h>
#include <stdio.h>

extern int jump64divsteps(int minusdelta, int *M, int *f, int *g);
extern void __gf_polymul_64x64_2x2_x2p2 (int *V,int *M,int *fh,int *gh);
extern void __gf_polymul_64x64_2x2_x_2x2 (int *M, int *M1, int *M2);
int jump128divsteps(int minusdelta, int *M, int *f, int *g);

int jump128divsteps(int minusdelta, int *M, int *f, int *g){
int M1[192], M2[192], fg[128];
  minusdelta = jump64divsteps(minusdelta, M1, f, g);
  /*
  printf("u1 = GF4591x(");
  printn((short *)(M1+64),64);
  printf(")\n");
  printf("v1 = GF4591x(");
  printn((short *)(M1+96),64);
  printf(")\n");
  printf("r1 = GF4591x(");
  printn((short *)(M1+128),64);
  printf(")\n");
  printf("s1 = GF4591x(");
  printn((short *)(M1+160),64);
  printf(")\n");

  printf("f1 = GF4591x(");
  printn((short *)(M1),64);
  printf(")\n");
  printf("g1 = GF4591x(");
  printn((short *)(M1+32),64);
  printf(")\n");
  */
  __gf_polymul_64x64_2x2_x2p2 (fg, M1, f+32, g+32);
  /*
  printf("f2 = GF4591x(");
  printn((short *)(fg),128);
  printf(")\n");
  printf("g2 = GF4591x(");
  printn((short *)(fg+64),128);
  printf(")\n");
  */
  minusdelta = jump64divsteps(minusdelta, M2, fg, fg+64);
  /*
  printf("u2 = GF4591x(");
  printn((short *)(M2+64),64);
  printf(")\n");
  printf("v2 = GF4591x(");
  printn((short *)(M2+96),64);
  printf(")\n");
  printf("r2 = GF4591x(");
  printn((short *)(M2+128),64);
  printf(")\n");
  printf("s2 = GF4591x(");
  printn((short *)(M2+160),64);
  printf(")\n");

  printf("f3 = GF4591x(");
  printn((short *)(M2),64);
  printf(")\n");
  printf("g3 = GF4591x(");
  printn((short *)(M2+32),64);
  printf(")\n");
  */
  __gf_polymul_64x64_2x2_x2p2 (M, M2, fg+32, fg+96);
  __gf_polymul_64x64_2x2_x_2x2(M+128, M1+64, M2+64);
  return(minusdelta);
}
