// #include <stdint.h>
#include "poly.h"

#define p 700
#define p_minus_1 699
#define _p 704 // for jumpdivsteps
#define _p_space_4bit 88
#define _v_space_16bit 736
#define _v_space_4bit 92
#define reverse_head 708

extern void convert_bit_to_4_704(uint32_t *f, uint16_t *_f);
extern void convert_bit_to_16_736(uint16_t *_M, uint32_t *M);
extern int jump1408divsteps_mod2_64(int minusdelta, uint32_t *M, uint32_t *f, uint32_t *g);

void PQCLEAN_NTRUHRSS701_CLEAN_poly_R2_inv_jumpdivsteps(poly *r, const poly *a){
	uint16_t _f[_p]={0}, _g[_p]={0}, _M[_v_space_16bit]={0};
	int i;
	int minusdelta=1;

	for(i=0; i<=p; i++) _f[i]=1;
	for(i=0;i<p;i++) _g[i]= (a->coeffs[p_minus_1-i] & 1) ^ (a->coeffs[p] & 1);

	uint32_t f[_p_space_4bit], g[_p_space_4bit], M[_v_space_4bit];
	convert_bit_to_4_704(f, _f);
	convert_bit_to_4_704(g, _g);

	minusdelta = jump1408divsteps_mod2_64(minusdelta, M, f, g);
	convert_bit_to_16_736(_M, M);

	for(i=0;i<p;i++){
	    r->coeffs[i] = _M[reverse_head-i];
	}
	r->coeffs[p] = 0;
}
