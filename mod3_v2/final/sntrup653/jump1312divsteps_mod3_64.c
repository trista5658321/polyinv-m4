#include <inttypes.h>

int jump1312divsteps_mod3_64(int minusdelta, int32_t *M, int32_t *f, int32_t *g){
	uint32_t V[168];
	uint32_t S[168];
	uint32_t M1[96]; // 64 coefficients * 6
	uint32_t *ptr = M;
	for(int i = 0; i < 168; i++){
	    V[i] = 0;
	    S[i] = 0;
	}
	uint8_t * p_S = (uint8_t *)S;
	*(S) = 1;
	// 1: 10
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x656(f, g, M1+32);
	__update_VS_64x64(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x656(f, g, M1+32);
	__update_VS_64x64(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x656(f, g, M1+32);
	__update_VS_64x128(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x656(f, g, M1+32);
	__update_VS_64x192(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x656(f, g, M1+32);
	__update_VS_64x256(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x656(f, g, M1+32);
	__update_VS_64x320(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x656(f, g, M1+32);
	__update_VS_64x384(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x656(f, g, M1+32);
	__update_VS_64x448(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x656(f, g, M1+32);
	__update_VS_64x512(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x656(f, g, M1+32);
	__update_VS_64x576(V, S, M1+32);
	// 2
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x656(f, g, M1+32);
	__update_VS_64x640(V, S, M1+32);
	// 3
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x608(f, g, M1+32);
	__update_VS_64x656(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x544(f, g, M1+32);
	__update_VS_64x656(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x480(f, g, M1+32);
	__update_VS_64x656(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x416(f, g, M1+32);
	__update_VS_64x656(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x352(f, g, M1+32);
	__update_VS_64x656(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x288(f, g, M1+32);
	__update_VS_64x656(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x224(f, g, M1+32);
	__update_VS_64x656(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x160(f, g, M1+32);
	__update_VS_64x656(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_64x96(f, g, M1+32);
	__update_VS_64x656(V, S, M1+32);
	// 4
	minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_32x32(f, g, M1+16);
	__update_VS_32x672(V, S, M1+16);
	

	for (int i = 0; i < 168; i++)
	{
	    *ptr++ = V[i];
	}
	return minusdelta;
}
