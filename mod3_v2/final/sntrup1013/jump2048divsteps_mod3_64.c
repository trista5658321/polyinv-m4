#include <inttypes.h>

int jump2048divsteps_mod3_64(int minusdelta, int32_t *M, int32_t *f, int32_t *g){
	uint32_t V[260];
	uint32_t S[260];
	uint32_t M1[96]; // 64 coefficients * 6
	uint32_t *ptr = M;
	for(int i = 0; i < 260; i++){
	    V[i] = 0;
	    S[i] = 0;
	}
	uint8_t * p_S = (uint8_t *)S;
	*(S) = 1;
	// 1: 16
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x1024(f, g, M1+32);
	__update_VS_64x64(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x1024(f, g, M1+32);
	__update_VS_64x64(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x1024(f, g, M1+32);
	__update_VS_64x128(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x1024(f, g, M1+32);
	__update_VS_64x192(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x1024(f, g, M1+32);
	__update_VS_64x256(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x1024(f, g, M1+32);
	__update_VS_64x320(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x1024(f, g, M1+32);
	__update_VS_64x384(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x1024(f, g, M1+32);
	__update_VS_64x448(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x1024(f, g, M1+32);
	__update_VS_64x512(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x1024(f, g, M1+32);
	__update_VS_64x576(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x1024(f, g, M1+32);
	__update_VS_64x640(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x1024(f, g, M1+32);
	__update_VS_64x704(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x1024(f, g, M1+32);
	__update_VS_64x768(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x1024(f, g, M1+32);
	__update_VS_64x832(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x1024(f, g, M1+32);
	__update_VS_64x896(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x1024(f, g, M1+32);
	__update_VS_64x960(V, S, M1+32);
	// 2
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x1024(f, g, M1+32);
	__update_VS_64x1024(V, S, M1+32);
	// 3
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x960(f, g, M1+32);
	__update_VS_64x1024(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x896(f, g, M1+32);
	__update_VS_64x1024(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x832(f, g, M1+32);
	__update_VS_64x1024(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x768(f, g, M1+32);
	__update_VS_64x1024(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x704(f, g, M1+32);
	__update_VS_64x1024(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x640(f, g, M1+32);
	__update_VS_64x1024(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x576(f, g, M1+32);
	__update_VS_64x1024(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x512(f, g, M1+32);
	__update_VS_64x1024(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x448(f, g, M1+32);
	__update_VS_64x1024(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x384(f, g, M1+32);
	__update_VS_64x1024(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x320(f, g, M1+32);
	__update_VS_64x1024(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x256(f, g, M1+32);
	__update_VS_64x1024(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x192(f, g, M1+32);
	__update_VS_64x1024(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x128(f, g, M1+32);
	__update_VS_64x1024(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x64(f, g, M1+32);
	__update_VS_64x1040(V, S, M1+32);
	

	for (int i = 0; i < 260; i++)
	{
	    *ptr++ = V[i];
	}
	return minusdelta;
}
