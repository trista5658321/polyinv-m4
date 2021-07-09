#include <stdint.h>

extern int jump8divsteps_mod2(int minusdelta, int* M, int* f, int* g);
int jump16divsteps_mod2(int minusdelta, int* M, int* f, int* g);
extern void __gf_polymul_8x8_2x2_x2p2_mod2(int* V,int* M,int *fh, int* gh);
extern void __gf_polymul_8x8_2x2_x_2x2_mod2(int* M,int* M1,int* M2);

int jump16divsteps_mod2(int minusdelta, int* M, int* f, int* g){
  int M1[6], M2[6], fg[4];

  minusdelta = jump8divsteps_mod2(minusdelta, M1, f, g);
  __gf_polymul_8x8_2x2_x2p2_mod2(fg, M1, f+1, g+1);
  minusdelta = jump8divsteps_mod2(minusdelta, M2, fg, fg+2);
  __gf_polymul_8x8_2x2_x2p2_mod2(M, M2, fg+1, fg+3);
  __gf_polymul_8x8_2x2_x_2x2_mod2(M+4, M1+2, M2+2);
  return minusdelta;
}
