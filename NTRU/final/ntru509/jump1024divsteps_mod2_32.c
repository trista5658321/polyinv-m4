#include <inttypes.h>

extern int jump32divsteps_mod2(int minusdelta, uint32_t *M1, uint32_t *f, uint32_t *g);
int jump1024divsteps_mod2_32(int minusdelta, uint32_t *M, uint32_t *f, uint32_t *g);

extern void __update_fg_32x512_mod2(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_VS_32x32_mod2(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_32x64_mod2(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_32x96_mod2(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_32x128_mod2(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_32x160_mod2(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_32x192_mod2(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_32x224_mod2(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_32x256_mod2(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_32x288_mod2(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_32x320_mod2(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_32x352_mod2(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_32x384_mod2(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_32x416_mod2(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_32x448_mod2(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_32x480_mod2(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_32x512_mod2(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_32x544_mod2(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_fg_32x480_mod2(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_fg_32x448_mod2(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_fg_32x416_mod2(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_fg_32x384_mod2(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_fg_32x352_mod2(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_fg_32x320_mod2(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_fg_32x288_mod2(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_fg_32x256_mod2(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_fg_32x224_mod2(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_fg_32x192_mod2(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_fg_32x160_mod2(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_fg_32x128_mod2(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_fg_32x96_mod2(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_fg_32x64_mod2(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_fg_32x32_mod2(uint32_t *f, uint32_t *g, uint32_t *M1);

int jump1024divsteps_mod2_32(int minusdelta, uint32_t *M, uint32_t *f, uint32_t *g){
	uint32_t V[68];
	uint32_t S[68];
	uint32_t M1[24]; // 32 coefficients * 6
	uint32_t *ptr = M;
	for(int i = 0; i < 68; i++){
	    V[i] = 0;
	    S[i] = 0;
	}
	*(S) = 1;
	// 1: 16
	minusdelta = jump32divsteps_mod2(minusdelta,f,g,M1);
	__update_fg_32x512_mod2(f, g, M1+8);
	__update_VS_32x32_mod2(V, S, M1+8);
	minusdelta = jump32divsteps_mod2(minusdelta,f,g,M1);
	__update_fg_32x512_mod2(f, g, M1+8);
	__update_VS_32x32_mod2(V, S, M1+8);
	minusdelta = jump32divsteps_mod2(minusdelta,f,g,M1);
	__update_fg_32x512_mod2(f, g, M1+8);
	__update_VS_32x64_mod2(V, S, M1+8);
	minusdelta = jump32divsteps_mod2(minusdelta,f,g,M1);
	__update_fg_32x512_mod2(f, g, M1+8);
	__update_VS_32x96_mod2(V, S, M1+8);
	minusdelta = jump32divsteps_mod2(minusdelta,f,g,M1);
	__update_fg_32x512_mod2(f, g, M1+8);
	__update_VS_32x128_mod2(V, S, M1+8);
	minusdelta = jump32divsteps_mod2(minusdelta,f,g,M1);
	__update_fg_32x512_mod2(f, g, M1+8);
	__update_VS_32x160_mod2(V, S, M1+8);
	minusdelta = jump32divsteps_mod2(minusdelta,f,g,M1);
	__update_fg_32x512_mod2(f, g, M1+8);
	__update_VS_32x192_mod2(V, S, M1+8);
	minusdelta = jump32divsteps_mod2(minusdelta,f,g,M1);
	__update_fg_32x512_mod2(f, g, M1+8);
	__update_VS_32x224_mod2(V, S, M1+8);
	minusdelta = jump32divsteps_mod2(minusdelta,f,g,M1);
	__update_fg_32x512_mod2(f, g, M1+8);
	__update_VS_32x256_mod2(V, S, M1+8);
	minusdelta = jump32divsteps_mod2(minusdelta,f,g,M1);
	__update_fg_32x512_mod2(f, g, M1+8);
	__update_VS_32x288_mod2(V, S, M1+8);
	minusdelta = jump32divsteps_mod2(minusdelta,f,g,M1);
	__update_fg_32x512_mod2(f, g, M1+8);
	__update_VS_32x320_mod2(V, S, M1+8);
	minusdelta = jump32divsteps_mod2(minusdelta,f,g,M1);
	__update_fg_32x512_mod2(f, g, M1+8);
	__update_VS_32x352_mod2(V, S, M1+8);
	minusdelta = jump32divsteps_mod2(minusdelta,f,g,M1);
	__update_fg_32x512_mod2(f, g, M1+8);
	__update_VS_32x384_mod2(V, S, M1+8);
	minusdelta = jump32divsteps_mod2(minusdelta,f,g,M1);
	__update_fg_32x512_mod2(f, g, M1+8);
	__update_VS_32x416_mod2(V, S, M1+8);
	minusdelta = jump32divsteps_mod2(minusdelta,f,g,M1);
	__update_fg_32x512_mod2(f, g, M1+8);
	__update_VS_32x448_mod2(V, S, M1+8);
	minusdelta = jump32divsteps_mod2(minusdelta,f,g,M1);
	__update_fg_32x512_mod2(f, g, M1+8);
	__update_VS_32x480_mod2(V, S, M1+8);
	// 2
	minusdelta = jump32divsteps_mod2(minusdelta,f,g,M1);
	__update_fg_32x512_mod2(f, g, M1+8);
	__update_VS_32x512_mod2(V, S, M1+8);
	// 3
	minusdelta = jump32divsteps_mod2(minusdelta,f,g,M1);
	__update_fg_32x480_mod2(f, g, M1+8);
	__update_VS_32x512_mod2(V, S, M1+8);
	minusdelta = jump32divsteps_mod2(minusdelta,f,g,M1);
	__update_fg_32x448_mod2(f, g, M1+8);
	__update_VS_32x512_mod2(V, S, M1+8);
	minusdelta = jump32divsteps_mod2(minusdelta,f,g,M1);
	__update_fg_32x416_mod2(f, g, M1+8);
	__update_VS_32x512_mod2(V, S, M1+8);
	minusdelta = jump32divsteps_mod2(minusdelta,f,g,M1);
	__update_fg_32x384_mod2(f, g, M1+8);
	__update_VS_32x512_mod2(V, S, M1+8);
	minusdelta = jump32divsteps_mod2(minusdelta,f,g,M1);
	__update_fg_32x352_mod2(f, g, M1+8);
	__update_VS_32x512_mod2(V, S, M1+8);
	minusdelta = jump32divsteps_mod2(minusdelta,f,g,M1);
	__update_fg_32x320_mod2(f, g, M1+8);
	__update_VS_32x512_mod2(V, S, M1+8);
	minusdelta = jump32divsteps_mod2(minusdelta,f,g,M1);
	__update_fg_32x288_mod2(f, g, M1+8);
	__update_VS_32x512_mod2(V, S, M1+8);
	minusdelta = jump32divsteps_mod2(minusdelta,f,g,M1);
	__update_fg_32x256_mod2(f, g, M1+8);
	__update_VS_32x512_mod2(V, S, M1+8);
	minusdelta = jump32divsteps_mod2(minusdelta,f,g,M1);
	__update_fg_32x224_mod2(f, g, M1+8);
	__update_VS_32x512_mod2(V, S, M1+8);
	minusdelta = jump32divsteps_mod2(minusdelta,f,g,M1);
	__update_fg_32x192_mod2(f, g, M1+8);
	__update_VS_32x512_mod2(V, S, M1+8);
	minusdelta = jump32divsteps_mod2(minusdelta,f,g,M1);
	__update_fg_32x160_mod2(f, g, M1+8);
	__update_VS_32x512_mod2(V, S, M1+8);
	minusdelta = jump32divsteps_mod2(minusdelta,f,g,M1);
	__update_fg_32x128_mod2(f, g, M1+8);
	__update_VS_32x512_mod2(V, S, M1+8);
	minusdelta = jump32divsteps_mod2(minusdelta,f,g,M1);
	__update_fg_32x96_mod2(f, g, M1+8);
	__update_VS_32x512_mod2(V, S, M1+8);
	minusdelta = jump32divsteps_mod2(minusdelta,f,g,M1);
	__update_fg_32x64_mod2(f, g, M1+8);
	__update_VS_32x512_mod2(V, S, M1+8);
	minusdelta = jump32divsteps_mod2(minusdelta,f,g,M1);
	__update_fg_32x32_mod2(f, g, M1+8);
	__update_VS_32x544_mod2(V, S, M1+8);
	

	for (int i = 0; i < 68; i++)
	{
	    *ptr++ = V[i];
	}
	return minusdelta;
}
