#include <stdint.h>

extern int jump8divsteps(int minusdelta, int *M, int *f, int *g);
extern void __gf_polymul_8x8_2x2_x2p2 (int *V,int *M,int *fh,int *gh);
extern void __gf_polymul_8x8_2x2_x_2x2 (int *M, int *M1, int *M2);
void jump16steps(int minusdelta, int *M, int *f, int *g);

int jump16divsteps(int minusdelta, int *M, int *f, int *g){
int M1[24], M2[24], fg[16];
  minusdelta = jump8divsteps(minusdelta, M1, f, g);
  __gf_polymul_8x8_2x2_x2p2 (fg, M1, f+4, g+4);
  minusdelta = jump8divsteps(minusdelta, M2, fg, fg+8);
  __gf_polymul_8x8_2x2_x2p2 (M, M2, fg+4, fg+12);
  __gf_polymul_8x8_2x2_x_2x2(M+16, M1+8, M2+8);
  return(minusdelta);
}
