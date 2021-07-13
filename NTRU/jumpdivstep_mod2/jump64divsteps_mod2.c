#include <stdint.h>

extern int jump32divsteps_mod2(int minusdelta, int* M, int* f, int* g);
int jump64divsteps_mod2(int minusdelta, int* M, int* f, int* g);
extern void __gf_polymul_32x32_2x2_x2p2_mod2(int* V,int* M,int *fh, int* gh);
extern void __gf_polymul_32x32_2x2_x_2x2_mod2(int* M,int* M1,int* M2);

int jump64divsteps_mod2(int minusdelta, int* M, int* f, int* g){
  int M1[24], M2[24], fg[16];

  minusdelta = jump32divsteps_mod2(minusdelta, M1, f, g);
  __gf_polymul_32x32_2x2_x2p2_mod2(fg, M1, f+4, g+4);
  minusdelta = jump32divsteps_mod2(minusdelta, M2, fg, fg+8);
  // __gf_polymul_32x32_2x2_x2p2_mod2(M, M2, fg+4, fg+12);
  __gf_polymul_32x32_2x2_x_2x2_mod2(M+16, M1+8, M2+8);
  return minusdelta;
}
