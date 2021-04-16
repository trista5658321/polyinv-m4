#include <inttypes.h>

int jump2560divsteps_mod3_128(int minusdelta, int32_t *M, int32_t *f, int32_t *g){
	uint32_t V[324];
	uint32_t S[324];
	uint32_t M1[192]; // 128 coefficients * 6
	uint32_t *ptr = M;
	for(int i = 0; i < 324; i++){
	    V[i] = 0;
	    S[i] = 0;
	}
	uint8_t * p_S = (uint8_t *)S;
	*(S) = 1;
	// 1: 10
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x1280(f, g, M1+64);
	__update_VS_128x128(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x1280(f, g, M1+64);
	__update_VS_128x128(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x1280(f, g, M1+64);
	__update_VS_128x256(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x1280(f, g, M1+64);
	__update_VS_128x384(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x1280(f, g, M1+64);
	__update_VS_128x512(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x1280(f, g, M1+64);
	__update_VS_128x640(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x1280(f, g, M1+64);
	__update_VS_128x768(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x1280(f, g, M1+64);
	__update_VS_128x896(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x1280(f, g, M1+64);
	__update_VS_128x1024(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x1280(f, g, M1+64);
	__update_VS_128x1152(V, S, M1+64);
	// 2
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x1280(f, g, M1+64);
	__update_VS_128x1280(V, S, M1+64);
	// 3
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x1152(f, g, M1+64);
	__update_VS_128x1280(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x1024(f, g, M1+64);
	__update_VS_128x1280(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x896(f, g, M1+64);
	__update_VS_128x1280(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x768(f, g, M1+64);
	__update_VS_128x1280(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x640(f, g, M1+64);
	__update_VS_128x1280(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x512(f, g, M1+64);
	__update_VS_128x1280(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x384(f, g, M1+64);
	__update_VS_128x1280(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x256(f, g, M1+64);
	__update_VS_128x1280(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x128(f, g, M1+64);
	__update_VS_128x1296(V, S, M1+64);
	

	for (int i = 0; i < 324; i++)
	{
	    *ptr++ = V[i];
	}
	return minusdelta;
}