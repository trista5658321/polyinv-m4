#include <inttypes.h>

extern int jump128divsteps_mod3(int minusdelta, uint32_t *M1, uint32_t *f, uint32_t *g);
int jump1408divsteps_mod3_128(int minusdelta, uint32_t *M, uint32_t *f, uint32_t *g);

extern void __update_fg_128x704(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_VS_128x128(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_128x256(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_128x384(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_128x512(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_128x640(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_128x704(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_VS_128x720(uint32_t *V, uint32_t *S, uint32_t *M1);
extern void __update_fg_128x640(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_fg_128x512(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_fg_128x384(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_fg_128x256(uint32_t *f, uint32_t *g, uint32_t *M1);
extern void __update_fg_128x128(uint32_t *f, uint32_t *g, uint32_t *M1);

int jump1408divsteps_mod3_128(int minusdelta, uint32_t *M, uint32_t *f, uint32_t *g){
	uint32_t V[180];
	uint32_t S[180];
	uint32_t M1[192]; // 128 coefficients * 6
	uint32_t *ptr = M;
	for(int i = 0; i < 180; i++){
	    V[i] = 0;
	    S[i] = 0;
	}
	*(S) = 1;
	// 1: 5
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x704(f, g, M1+64);
	__update_VS_128x128(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x704(f, g, M1+64);
	__update_VS_128x128(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x704(f, g, M1+64);
	__update_VS_128x256(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x704(f, g, M1+64);
	__update_VS_128x384(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x704(f, g, M1+64);
	__update_VS_128x512(V, S, M1+64);
	// 2
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x704(f, g, M1+64);
	__update_VS_128x640(V, S, M1+64);
	// 3
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x640(f, g, M1+64);
	__update_VS_128x704(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x512(f, g, M1+64);
	__update_VS_128x704(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x384(f, g, M1+64);
	__update_VS_128x704(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x256(f, g, M1+64);
	__update_VS_128x704(V, S, M1+64);
	minusdelta = jump128divsteps_mod3(minusdelta,M1,f,g);
	__update_fg_128x128(f, g, M1+64);
	__update_VS_128x720(V, S, M1+64);
	

	for (int i = 0; i < 180; i++)
	{
	    *ptr++ = V[i];
	}
	return minusdelta;
}
