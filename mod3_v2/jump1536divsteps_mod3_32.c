#include <inttypes.h>
#include "red_mod3_int.h"

extern int jump32divsteps_mod3(int minusdelta, int* M, int* f, int* g);
int jump1536divsteps_mod3_32(int minusdelta, int32_t *M, int32_t *f, int32_t *g);
void gf_polymul_32x768_mod3(uint32_t *h, uint32_t *f, uint32_t *g);
void update_fg(int *f, int*g, int *M1);
void update_vs(int *V, int*S, int *M1);

void gf_polymul_32x800_mod3(uint32_t *h, uint32_t *f, uint32_t *g){
    uint8_t *ptr = (uint8_t *)h;
    for (int i = 0; i < 832; i++) *ptr++ = 0;
    
    for (int i = 0; i < 32; i++)
    {
        uint8_t *result = (uint8_t *)h + i;
        uint8_t *f_i = (uint8_t *)f + i;
        for (int j = 0; j < 800; j++)
        {
            uint8_t *g_i = (uint8_t *)g + j;
            *(result++) = (*(result) + (*f_i * *g_i)) % 3;
        }
    }
}

void gf_polymul_32x768_mod3(uint32_t *h, uint32_t *f, uint32_t *g){
    uint8_t *ptr = (uint8_t *)h;
    for (int i = 0; i < 800; i++) *ptr++ = 0;
    
    for (int i = 0; i < 32; i++)
    {
        uint8_t *result = (uint8_t *)h + i;
        uint8_t *f_i = (uint8_t *)f + i;
        for (int j = 0; j < 768; j++)
        {
            uint8_t *g_i = (uint8_t *)g + j;
            *(result++) = (*(result) + (*f_i * *g_i)) % 3;
        }
    }
}

void update_fg(int *f, int*g, int *M1){
    uint32_t C800_1[201], C800_2[201], C800_3[200], C800_4[200];
    C800_1[0]=C800_2[0]=0;
    uint32_t * CC800_1 = (uint32_t *)((void *)C800_1 + 1);
    uint32_t * CC800_2 = (uint32_t *)((void *)C800_2 + 1);

    uint32_t i, *X, *Y, *Z;

    gf_polymul_32x768_mod3(CC800_1, M1, f); // x * u * f
    gf_polymul_32x768_mod3(CC800_2, M1+8, g); // x * v * g
    gf_polymul_32x768_mod3(C800_3, M1+16, f); // r * f
    gf_polymul_32x768_mod3(C800_4, M1+24, g); // s * g

    for (X=f, Y=C800_1+8, Z=C800_2+8, i=192; i>0; i--) {// f = x(u fh+v gh) / x^32
      *(X++) = add_ub3(*(Y++), *(Z++));
    }

    for (X=g, Y=C800_3+8, Z=C800_4+8, i=192; i>0; i--) {// g = (r f+s g) / x^32
      *(X++) = add_ub3(*(Y++), *(Z++));
    }
}
void update_VS(int *V, int*S, int *M1){
    uint32_t C800_1[201], C800_2[200], C800_3[201], C800_4[200];
    C800_1[0]=C800_3[0]=0;
    uint32_t * CC800_1 = (uint32_t *)((void *)C800_1 + 1);
    uint32_t * CC800_3 = (uint32_t *)((void *)C800_3 + 1);

    uint32_t i, *X, *Y, *Z;
    // print_poly_byte(M1, "v", 37, 32);
    // print_poly_byte(S, "S", 5, 0);

    gf_polymul_32x768_mod3(CC800_1, M1, V); // u * V * x
    gf_polymul_32x768_mod3(C800_2, M1+8, S); // v * S
    gf_polymul_32x768_mod3(CC800_3, M1+16, V); // r * V * x
    gf_polymul_32x768_mod3(C800_4, M1+24, S); // s * S

    // print_poly_byte(C800_1, "C800_1", 5, 0);
    // print_poly_byte(C800_2, "C800_2", 5, 0);

    for (X=V, Y=C800_1, Z=C800_2, i=192; i>0; i--) {// V = u V x + v S
      *(X++) = add_ub3(*(Y++), *(Z++));
    }
    for (X=S, Y=C800_3, Z=C800_4, i=192; i>0; i--) {// S = r V x + s S
      *(X++) = add_ub3(*(Y++), *(Z++));
    }
}

void update_VS_800(int *V, int*S, int *M1){
    uint32_t C800_1[209], C800_2[208], C800_3[209], C800_4[208];
    C800_1[0]=C800_3[0]=0;
    uint32_t * CC800_1 = (uint32_t *)((void *)C800_1 + 1);
    uint32_t * CC800_3 = (uint32_t *)((void *)C800_3 + 1);

    uint32_t i, *X, *Y, *Z;
    // print_poly_byte(M1, "v", 37, 32);
    // print_poly_byte(S, "S", 5, 0);

    gf_polymul_32x800_mod3(CC800_1, M1, V); // u * V * x
    gf_polymul_32x800_mod3(C800_2, M1+8, S); // v * S
    gf_polymul_32x800_mod3(CC800_3, M1+16, V); // r * V * x
    gf_polymul_32x800_mod3(C800_4, M1+24, S); // s * S

    // print_poly_byte(C800_1, "C800_1", 5, 0);
    // print_poly_byte(C800_2, "C800_2", 5, 0);

    for (X=V, Y=C800_1, Z=C800_2, i=200; i>0; i--) {// V = u V x + v S
      *(X++) = add_ub3(*(Y++), *(Z++));
    }
    for (X=S, Y=C800_3, Z=C800_4, i=200; i>0; i--) {// S = r V x + s S
      *(X++) = add_ub3(*(Y++), *(Z++));
    }
}

int jump1536divsteps_mod3_32(int minusdelta, int32_t *M, int32_t *f, int32_t *g){
    uint32_t V[200];
    uint32_t S[200];
    uint32_t M1[48]; // 32 coefficients * 6
    uint32_t *ptr = M;

    for(int i = 0; i < 200; i++){
        V[i] = 0;
        S[i] = 0;
    }
    uint8_t * p_S = (uint8_t *)S;
    *(S) = 1;

    // 1
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x768(f, g, M1+16);
    __update_VS_32x32(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x768(f, g, M1+16);
    __update_VS_32x32(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x768(f, g, M1+16);
    __update_VS_32x64(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x768(f, g, M1+16);
    __update_VS_32x96(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x768(f, g, M1+16);
    __update_VS_32x128(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x768(f, g, M1+16);
    __update_VS_32x160(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x768(f, g, M1+16);
    __update_VS_32x192(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x768(f, g, M1+16);
    __update_VS_32x224(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x768(f, g, M1+16);
    __update_VS_32x256(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x768(f, g, M1+16);
    __update_VS_32x288(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x768(f, g, M1+16);
    __update_VS_32x320(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x768(f, g, M1+16);
    __update_VS_32x352(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x768(f, g, M1+16);
    __update_VS_32x384(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x768(f, g, M1+16);
    __update_VS_32x416(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x768(f, g, M1+16);
    __update_VS_32x448(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x768(f, g, M1+16);
    __update_VS_32x480(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x768(f, g, M1+16);
    __update_VS_32x512(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x768(f, g, M1+16);
    __update_VS_32x544(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x768(f, g, M1+16);
    __update_VS_32x576(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x768(f, g, M1+16);
    __update_VS_32x608(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x768(f, g, M1+16);
    __update_VS_32x640(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x768(f, g, M1+16);
    __update_VS_32x672(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x768(f, g, M1+16);
    __update_VS_32x704(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x768(f, g, M1+16);
    __update_VS_32x736(V, S, M1+16);

    // 2

    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x768(f, g, M1+16);
    __update_VS_32x768(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x736(f, g, M1+16);
    __update_VS_32x768(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x704(f, g, M1+16);
    __update_VS_32x768(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x672(f, g, M1+16);
    __update_VS_32x768(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x640(f, g, M1+16);
    __update_VS_32x768(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x608(f, g, M1+16);
    __update_VS_32x768(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x576(f, g, M1+16);
    __update_VS_32x768(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x544(f, g, M1+16);
    __update_VS_32x768(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x512(f, g, M1+16);
    __update_VS_32x768(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x480(f, g, M1+16);
    __update_VS_32x768(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x448(f, g, M1+16);
    __update_VS_32x768(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x416(f, g, M1+16);
    __update_VS_32x768(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x384(f, g, M1+16);
    __update_VS_32x768(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x352(f, g, M1+16);
    __update_VS_32x768(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x320(f, g, M1+16);
    __update_VS_32x768(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x288(f, g, M1+16);
    __update_VS_32x768(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x256(f, g, M1+16);
    __update_VS_32x768(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x224(f, g, M1+16);
    __update_VS_32x768(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x192(f, g, M1+16);
    __update_VS_32x768(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x160(f, g, M1+16);
    __update_VS_32x768(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x128(f, g, M1+16);
    __update_VS_32x768(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x96(f, g, M1+16);
    __update_VS_32x768(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x64(f, g, M1+16);
    __update_VS_32x768(V, S, M1+16);
    minusdelta = jump32divsteps_mod3(minusdelta,M1,f,g);
    __update_fg_32x32(f, g, M1+16);
    __update_VS_32x800(V, S, M1+16);

    for (int i = 0; i < 200; i++)
    {
        *ptr++ = V[i];
    }
    
    return minusdelta;
}