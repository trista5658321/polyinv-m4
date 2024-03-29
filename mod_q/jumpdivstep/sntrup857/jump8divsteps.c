#include <stdint.h>
// #include "cmsis.h"
#include <stdio.h>

extern int jump4divsteps(int minusdelta, int *M, int *f, int *g);

extern void __polymul_4x4_2x2_x2p2 (int *V, int *M, int *fh, int *gh);
extern void __polymul_4x4_2x2_x_2x2 (int *M, int *M1, int *M2);
int jump8divsteps(int minusdelta, int *M, int *f, int *g);

int jump8divsteps(int minusdelta, int *M, int *f, int *g){
  int M1[24], M2[24], fg[8];

  minusdelta = jump4divsteps(minusdelta, M1, f, g);
  __polymul_4x4_2x2_x2p2 (fg, M1, f+2, g+2);
  minusdelta = jump4divsteps(minusdelta, M2, fg, fg+4);
  __polymul_4x4_2x2_x2p2 (M, M2, fg+2, fg+6);
  __polymul_4x4_2x2_x_2x2(M+8, M1+4, M2+4);
  return(minusdelta);
}

