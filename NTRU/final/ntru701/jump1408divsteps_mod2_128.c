#include <inttypes.h>

extern int jump128divsteps_mod2(int minusdelta, uint32_t *M1, uint32_t *f, uint32_t *g);
int jump1408divsteps_mod2_128(int minusdelta, uint32_t *M, uint32_t *f, uint32_t *g);

extern void __update_fg_128x704_mod2(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_VS_128x128_mod2(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_128x256_mod2(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_128x384_mod2(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_128x512_mod2(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_128x640_mod2(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_128x704_mod2(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_128x736_mod2(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_fg_128x640_mod2(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_fg_128x512_mod2(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_fg_128x384_mod2(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_fg_128x256_mod2(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_fg_128x128_mod2(uint32_t *f, uint32_t *g, uint32_t *M1);

int jump1408divsteps_mod2_128(int minusdelta, uint32_t *M, uint32_t *f, uint32_t *g){
	uint32_t V[92]={0};
	uint32_t S[92]={0};
	uint32_t M1[96]; // 128 coefficients * 6
	uint32_t *ptr = M;
	*(S) = 1;
	// 1: 5
	minusdelta = jump128divsteps_mod2(minusdelta,M1,f,g);
	__update_fg_128x704_mod2(f, g, M1+32);
	__update_VS_128x128_mod2(V, S, M1+32);
	minusdelta = jump128divsteps_mod2(minusdelta,M1,f,g);
	__update_fg_128x704_mod2(f, g, M1+32);
	__update_VS_128x128_mod2(V, S, M1+32);
	minusdelta = jump128divsteps_mod2(minusdelta,M1,f,g);
	__update_fg_128x704_mod2(f, g, M1+32);
	__update_VS_128x256_mod2(V, S, M1+32);
	minusdelta = jump128divsteps_mod2(minusdelta,M1,f,g);
	__update_fg_128x704_mod2(f, g, M1+32);
	__update_VS_128x384_mod2(V, S, M1+32);
	minusdelta = jump128divsteps_mod2(minusdelta,M1,f,g);
	__update_fg_128x704_mod2(f, g, M1+32);
	__update_VS_128x512_mod2(V, S, M1+32);
	// 2
	minusdelta = jump128divsteps_mod2(minusdelta,M1,f,g);
	__update_fg_128x704_mod2(f, g, M1+32);
	__update_VS_128x640_mod2(V, S, M1+32);
	// 3
	minusdelta = jump128divsteps_mod2(minusdelta,M1,f,g);
	__update_fg_128x640_mod2(f, g, M1+32);
	__update_VS_128x704_mod2(V, S, M1+32);
	minusdelta = jump128divsteps_mod2(minusdelta,M1,f,g);
	__update_fg_128x512_mod2(f, g, M1+32);
	__update_VS_128x704_mod2(V, S, M1+32);
	minusdelta = jump128divsteps_mod2(minusdelta,M1,f,g);
	__update_fg_128x384_mod2(f, g, M1+32);
	__update_VS_128x704_mod2(V, S, M1+32);
	minusdelta = jump128divsteps_mod2(minusdelta,M1,f,g);
	__update_fg_128x256_mod2(f, g, M1+32);
	__update_VS_128x704_mod2(V, S, M1+32);
	minusdelta = jump128divsteps_mod2(minusdelta,M1,f,g);
	__update_fg_128x128_mod2(f, g, M1+32);
	__update_VS_128x736_mod2(V, S, M1+32);
	
	for (int i = 0; i < 92; i++)
	{
	    *ptr++ = V[i];
	}
	return minusdelta;
}
