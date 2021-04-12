#include <inttypes.h>

void gf_polymul_64x672_mod3(uint32_t *h, uint32_t *f, uint32_t *g){
    uint8_t *ptr = (uint8_t *)h;
    for (int i = 0; i < 736; i++) *ptr++ = 0;
    
    for (int i = 0; i < 64; i++)
    {
        uint8_t *result = (uint8_t *)h + i;
        uint8_t *f_i = (uint8_t *)f + i;
        for (int j = 0; j < 672; j++)
        {
            uint8_t *g_i = (uint8_t *)g + j;
            *(result++) = (*(result) + (*f_i * *g_i)) % 3;
        }
    }
}
void gf_polymul_64x704_mod3(uint32_t *h, uint32_t *f, uint32_t *g){
    uint8_t *ptr = (uint8_t *)h;
    for (int i = 0; i < 768; i++) *ptr++ = 0;
    
    for (int i = 0; i < 64; i++)
    {
        uint8_t *result = (uint8_t *)h + i;
        uint8_t *f_i = (uint8_t *)f + i;
        for (int j = 0; j < 704; j++)
        {
            uint8_t *g_i = (uint8_t *)g + j;
            *(result++) = (*(result) + (*f_i * *g_i)) % 3;
        }
    }
}

void update_fg_64x672(int *f, int*g, int *M1){
    uint32_t C800_1[185], C800_2[185], C800_3[184], C800_4[184];
    C800_1[0]=C800_2[0]=0;
    uint32_t * CC800_1 = (uint32_t *)((void *)C800_1 + 1);
    uint32_t * CC800_2 = (uint32_t *)((void *)C800_2 + 1);

    uint32_t i, *X, *Y, *Z;

    gf_polymul_64x672_mod3(CC800_1, M1, f); // x * u * f
    gf_polymul_64x672_mod3(CC800_2, M1+16, g); // x * v * g
    gf_polymul_64x672_mod3(C800_3, M1+32, f); // r * f
    gf_polymul_64x672_mod3(C800_4, M1+48, g); // s * g

    for (X=f, Y=C800_1+16, Z=C800_2+16, i=168; i>0; i--) {// f = x(u fh+v gh) / x^64
      *(X++) = add_ub3(*(Y++), *(Z++));
    }

    for (X=g, Y=C800_3+16, Z=C800_4+16, i=168; i>0; i--) {// g = (r f+s g) / x^64
      *(X++) = add_ub3(*(Y++), *(Z++));
    }
}
void update_VS_64x672(int *V, int*S, int *M1){
    uint32_t C800_1[185], C800_2[184], C800_3[185], C800_4[184];
    C800_1[0]=C800_3[0]=0;
    uint32_t * CC800_1 = (uint32_t *)((void *)C800_1 + 1);
    uint32_t * CC800_3 = (uint32_t *)((void *)C800_3 + 1);

    uint32_t i, *X, *Y, *Z;
    // print_poly_byte(M1, "v", 37, 32);
    // print_poly_byte(S, "S", 5, 0);

    gf_polymul_64x672_mod3(CC800_1, M1, V); // u * V * x
    gf_polymul_64x672_mod3(C800_2, M1+16, S); // v * S
    gf_polymul_64x672_mod3(CC800_3, M1+32, V); // r * V * x
    gf_polymul_64x672_mod3(C800_4, M1+48, S); // s * S

    // print_poly_byte(C800_1, "C800_1", 5, 0);
    // print_poly_byte(C800_2, "C800_2", 5, 0);

    for (X=V, Y=C800_1, Z=C800_2, i=168; i>0; i--) {// V = u V x + v S
      *(X++) = add_ub3(*(Y++), *(Z++));
    }
    for (X=S, Y=C800_3, Z=C800_4, i=168; i>0; i--) {// S = r V x + s S
      *(X++) = add_ub3(*(Y++), *(Z++));
    }
}

void update_VS_64x704(int *V, int*S, int *M1){
    uint32_t C800_1[193], C800_2[192], C800_3[193], C800_4[192];
    C800_1[0]=C800_3[0]=0;
    uint32_t * CC800_1 = (uint32_t *)((void *)C800_1 + 1);
    uint32_t * CC800_3 = (uint32_t *)((void *)C800_3 + 1);

    uint32_t i, *X, *Y, *Z;
    // print_poly_byte(M1, "v", 37, 32);
    // print_poly_byte(S, "S", 5, 0);

    gf_polymul_64x704_mod3(CC800_1, M1, V); // u * V * x
    gf_polymul_64x704_mod3(C800_2, M1+16, S); // v * S
    gf_polymul_64x704_mod3(CC800_3, M1+32, V); // r * V * x
    gf_polymul_64x704_mod3(C800_4, M1+48, S); // s * S

    // print_poly_byte(C800_1, "C800_1", 5, 0);
    // print_poly_byte(C800_2, "C800_2", 5, 0);

    for (X=V, Y=C800_1, Z=C800_2, i=176; i>0; i--) {// V = u V x + v S
      *(X++) = add_ub3(*(Y++), *(Z++));
    }
    for (X=S, Y=C800_3, Z=C800_4, i=176; i>0; i--) {// S = r V x + s S
      *(X++) = add_ub3(*(Y++), *(Z++));
    }
}

int jump1344divsteps_mod3_64(int minusdelta, int32_t *M, int32_t *f, int32_t *g){
	uint32_t V[176];
	uint32_t S[176];
	uint32_t M1[96]; // 64 coefficients * 6
	uint32_t *ptr = M;
	for(int i = 0; i < 176; i++){
	    V[i] = 0;
	    S[i] = 0;
	}
	uint8_t * p_S = (uint8_t *)S;
	*(S) = 1;
	// 1: 10
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	// __update_fg_64x672(f, g, M1+32);
	update_fg_64x672(f, g, M1+32);
	// __update_VS_64x64(V, S, M1+32);
	update_VS_64x672(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	// __update_fg_64x672(f, g, M1+32);
	update_fg_64x672(f, g, M1+32);
	// __update_VS_64x64(V, S, M1+32);
	update_VS_64x672(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	// __update_fg_64x672(f, g, M1+32);
	update_fg_64x672(f, g, M1+32);
	// __update_VS_64x128(V, S, M1+32);
	update_VS_64x672(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	// __update_fg_64x672(f, g, M1+32);
	update_fg_64x672(f, g, M1+32);
	// __update_VS_64x192(V, S, M1+32);
	update_VS_64x672(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	// __update_fg_64x672(f, g, M1+32);
	update_fg_64x672(f, g, M1+32);
	// __update_VS_64x256(V, S, M1+32);
	update_VS_64x672(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	// __update_fg_64x672(f, g, M1+32);
	update_fg_64x672(f, g, M1+32);
	// __update_VS_64x320(V, S, M1+32);
	update_VS_64x672(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	// __update_fg_64x672(f, g, M1+32);
	update_fg_64x672(f, g, M1+32);
	// __update_VS_64x384(V, S, M1+32);
	update_VS_64x672(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	// __update_fg_64x672(f, g, M1+32);
	update_fg_64x672(f, g, M1+32);
	// __update_VS_64x448(V, S, M1+32);
	update_VS_64x672(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	// __update_fg_64x672(f, g, M1+32);
	update_fg_64x672(f, g, M1+32);
	// __update_VS_64x512(V, S, M1+32);
	update_VS_64x672(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	// __update_fg_64x672(f, g, M1+32);
	update_fg_64x672(f, g, M1+32);
	// __update_VS_64x576(V, S, M1+32);
	update_VS_64x672(V, S, M1+32);
	// 2
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	// __update_fg_64x672(f, g, M1+32);
	update_fg_64x672(f, g, M1+32);
	// __update_VS_64x640(V, S, M1+32);
	update_VS_64x672(V, S, M1+32);
	// 3
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	// __update_fg_64x640(f, g, M1+32);
	update_fg_64x672(f, g, M1+32);
	// __update_VS_64x672(V, S, M1+32);
	update_VS_64x672(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	// __update_fg_64x576(f, g, M1+32);
	update_fg_64x672(f, g, M1+32);
	// __update_VS_64x672(V, S, M1+32);
	update_VS_64x672(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	// __update_fg_64x512(f, g, M1+32);
	update_fg_64x672(f, g, M1+32);
	// __update_VS_64x672(V, S, M1+32);
	update_VS_64x672(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	// __update_fg_64x448(f, g, M1+32);
	update_fg_64x672(f, g, M1+32);
	// __update_VS_64x672(V, S, M1+32);
	update_VS_64x672(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	// __update_fg_64x384(f, g, M1+32);
	update_fg_64x672(f, g, M1+32);
	// __update_VS_64x672(V, S, M1+32);
	update_VS_64x672(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	// __update_fg_64x320(f, g, M1+32);
	update_fg_64x672(f, g, M1+32);
	// __update_VS_64x672(V, S, M1+32);
	update_VS_64x672(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	// __update_fg_64x256(f, g, M1+32);
	update_fg_64x672(f, g, M1+32);
	// __update_VS_64x672(V, S, M1+32);
	update_VS_64x672(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	// __update_fg_64x192(f, g, M1+32);
	update_fg_64x672(f, g, M1+32);
	// __update_VS_64x672(V, S, M1+32);
	update_VS_64x672(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	// __update_fg_64x128(f, g, M1+32);
	update_fg_64x672(f, g, M1+32);
	// __update_VS_64x672(V, S, M1+32);
	update_VS_64x672(V, S, M1+32);
	minusdelta = jump64divsteps_mod3(minusdelta,M1,f,g);
	// __update_fg_64x64(f, g, M1+32);
	update_fg_64x672(f, g, M1+32);
	// __update_VS_64x704(V, S, M1+32);
	update_VS_64x704(V, S, M1+32);
	

	for (int i = 0; i < 176; i++)
	{
	    *ptr++ = V[i];
	}
	return minusdelta;
}
