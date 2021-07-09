#include <stdint.h>

extern int jump16divsteps_mod2(int minusdelta, int* M, int* f, int* g);
int jump32divsteps_mod2(int minusdelta, int* M, int* f, int* g);
extern void __gf_polymul_16x16_2x2_x2p2_mod2(int* V,int* M,int *fh, int* gh);
extern void __gf_polymul_16x16_2x2_x_2x2_mod2(int* M,int* M1,int* M2);

int jump32divsteps_mod2(int minusdelta, int* M, int* f, int* g){
  int M1[12], M2[12], fg[8];

  minusdelta = jump16divsteps_mod2(minusdelta, M1, f, g);
  __gf_polymul_16x16_2x2_x2p2_mod2(fg, M1, f+2, g+2);
  minusdelta = jump16divsteps_mod2(minusdelta, M2, fg, fg+4);
  __gf_polymul_16x16_2x2_x2p2_mod2(M, M2, fg+2, fg+6);
  __gf_polymul_16x16_2x2_x_2x2_mod2(M+8, M1+4, M2+4);
  return minusdelta;
}
