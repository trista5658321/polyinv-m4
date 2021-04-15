#include <inttypes.h>

int jump1536divsteps_mod3_128(int minusdelta, int32_t *M, int32_t *f, int32_t *g){
	uint32_t V[196];
	uint32_t S[196];
	uint32_t M1[192]; // 128 coefficients * 6
	uint32_t *ptr = M;
	for(int i = 0; i < 196; i++){
	    V[i] = 0;
	    S[i] = 0;
	}
	uint8_t * p_S = (uint8_t *)S;
	*(S) = 1;
	// 1: 6
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x768(f, g, M1+64);
	__update_VS_128x128(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x768(f, g, M1+64);
	__update_VS_128x128(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x768(f, g, M1+64);
	__update_VS_128x256(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x768(f, g, M1+64);
	__update_VS_128x384(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x768(f, g, M1+64);
	__update_VS_128x512(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x768(f, g, M1+64);
	__update_VS_128x640(V, S, M1+64);
	// 2
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x768(f, g, M1+64);
	__update_VS_128x768(V, S, M1+64);
	// 3
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x640(f, g, M1+64);
	__update_VS_128x768(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x512(f, g, M1+64);
	__update_VS_128x768(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x384(f, g, M1+64);
	__update_VS_128x768(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x256(f, g, M1+64);
	__update_VS_128x768(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x128(f, g, M1+64);
	__update_VS_128x784(V, S, M1+64);
	

	for (int i = 0; i < 196; i++)
	{
	    *ptr++ = V[i];
	}
	return minusdelta;
}
