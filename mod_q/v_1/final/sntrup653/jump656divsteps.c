#include <inttypes.h>

int jump656divsteps(int minusdelta, int32_t *M, int32_t *f, int32_t *g){
	int M0[1536], M1[384], M2[48], m1[288], fg[656];

	minusdelta = jump512divsteps(minusdelta,M0,f,g);
	gf_polymul_512x144_2x2_x2p2(fg,M0,f+256,g+256);
	minusdelta = jump128divsteps(minusdelta,M1,fg,fg+328);
	gf_polymul_128x528_2x2_x2p2(fg,M1,fg+64,fg+392);
	minusdelta = jump16divsteps(minusdelta,M2,fg,fg+328);
	gf_polymul_16x640_2x2_x2p2(M,M2,fg+8,fg+336);

	gf_polymul_16x128_2x2_x_2x2(m1,M1+128,M2+16);
	gf_polymul_144x512_2x2_x_2x2(M+656,M0+512,m1);

	return minusdelta;
}
