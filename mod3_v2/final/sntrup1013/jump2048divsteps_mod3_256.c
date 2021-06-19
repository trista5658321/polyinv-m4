#include <inttypes.h>

extern int jump256divsteps_mod3(int minusdelta, uint32_t *M1, uint32_t *f, uint32_t *g);
int jump2048divsteps_mod3_256(int minusdelta, uint32_t *M, uint32_t *f, uint32_t *g);

extern void __update_fg_256x1024(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_VS_256x256(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_256x512(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_256x768(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_256x1024(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_256x1040(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_fg_256x768(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_fg_256x512(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_fg_256x256(uint32_t *f, uint32_t *g, uint32_t *M1);

int jump2048divsteps_mod3_256(int minusdelta, uint32_t *M, uint32_t *f, uint32_t *g){
	uint32_t V[260];
	uint32_t S[260];
	uint32_t M1[384]; // 256 coefficients * 6
	uint32_t *ptr = M;
	for(int i = 0; i < 260; i++){
	    V[i] = 0;
	    S[i] = 0;
	}
	uint8_t * p_S = (uint8_t *)S;
	*(S) = 1;
	// 1: 4
	minusdelta = jump256divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_256x1024(f, g, M1+128);
	__update_VS_256x256(V, S, M1+128);
	minusdelta = jump256divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_256x1024(f, g, M1+128);
	__update_VS_256x256(V, S, M1+128);
	minusdelta = jump256divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_256x1024(f, g, M1+128);
	__update_VS_256x512(V, S, M1+128);
	minusdelta = jump256divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_256x1024(f, g, M1+128);
	__update_VS_256x768(V, S, M1+128);
	// 2
	minusdelta = jump256divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_256x1024(f, g, M1+128);
	__update_VS_256x1024(V, S, M1+128);
	// 3
	minusdelta = jump256divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_256x768(f, g, M1+128);
	__update_VS_256x1024(V, S, M1+128);
	minusdelta = jump256divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_256x512(f, g, M1+128);
	__update_VS_256x1024(V, S, M1+128);
	minusdelta = jump256divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_256x256(f, g, M1+128);
	__update_VS_256x1040(V, S, M1+128);
	

	for (int i = 0; i < 260; i++)
	{
	    *ptr++ = V[i];
	}
	return minusdelta;
}
