#include <inttypes.h>

extern int jump128divsteps_mod3(int minusdelta, uint32_t *M1, uint32_t *f, uint32_t *g);
int jump1312divsteps_mod3_128(int minusdelta, uint32_t *M, uint32_t *f, uint32_t *g);

extern void __update_fg_128x656(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_VS_128x128(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_128x256(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_128x384(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_128x512(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_128x640(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_128x656(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_fg_128x544(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_fg_128x416(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_fg_128x288(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_fg_128x160(uint32_t *f, uint32_t *g, uint32_t *M1);
extern int jump32divsteps_mod3(int minusdelta, uint32_t *M1, uint32_t *f, uint32_t *g);
extern void __update_fg_32x32(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_VS_32x672(uint32_t *V, uint32_t *S, uint32_t *M1);

int jump1312divsteps_mod3_128(int minusdelta, uint32_t *M, uint32_t *f, uint32_t *g){
	uint32_t V[168];
	uint32_t S[168];
	uint32_t M1[192]; // 128 coefficients * 6
	uint32_t *ptr = M;
	for(int i = 0; i < 168; i++){
	    V[i] = 0;
	    S[i] = 0;
	}
	*(S) = 1;
	// 1: 5
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x656(f, g, M1+64);
	__update_VS_128x128(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x656(f, g, M1+64);
	__update_VS_128x128(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x656(f, g, M1+64);
	__update_VS_128x256(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x656(f, g, M1+64);
	__update_VS_128x384(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x656(f, g, M1+64);
	__update_VS_128x512(V, S, M1+64);
	// 2
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x656(f, g, M1+64);
	__update_VS_128x640(V, S, M1+64);
	// 3
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x544(f, g, M1+64);
	__update_VS_128x656(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x416(f, g, M1+64);
	__update_VS_128x656(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x288(f, g, M1+64);
	__update_VS_128x656(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x160(f, g, M1+64);
	__update_VS_128x656(V, S, M1+64);
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
