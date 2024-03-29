#include "NTT.h"

const int streamlined_Rmod_root_table_skip0[NTT_N << 1] = {
2795066, 2795066, 1445601, 2795066, 1445601, -1504640, 2071945, 1445601, -1504640, 2071945, 2394021, -788737, 2109337, 2871587, 2795066, 2795066, 1445601, 2795066, 1445601, -1504640, 2071945, 1445601, -1504640, 2071945, 2394021, -788737, 2109337, 2871587, -1504640, 2394021, -788737, -362499, 547408, 2019017, 1866804, 2071945, 2109337, 2871587, 553138, -973308, -1336332, -57419, 2394021, -362499, 547408, -1162504, -2334203, -2933065, -2688372, -788737, 2019017, 1866804, 2437853, 406220, 2636239, 2861791, 2109337, 553138, -973308, -1051864, 2859018, 2064503, 783451, 2871587, -1336332, -57419, 143039, 2948048, 578313, -2237034, -362499, -1162504, -2334203, 2053516, -171613, 1822464, -2411888, 547408, -2933065, -2688372, -1577505, 2900847, -1373599, -836315, 2019017, 2437853, 406220, 1722702, -1456050, -2634746, 2420840, 1866804, 2636239, 2861791, -2355259, -3006278, 2201279, 2124594, 553138, -1051864, 2859018, -2970486, -177659, -2222704, -1355277, -973308, 2064503, 783451, -2984684, 2961337, 2764282, 165017, -1336332, 143039, 2948048, 2740249, 1529664, 121192, -2185258, -57419, 578313, -2237034, 2986458, 1853820, 2973003, 701828, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};
const int streamlined_Rmod_inv_GS_root_table_skip0[NTT_N << 1] = {
2795066, 2795066, -1445601, 2795066, -1445601, -2071945, 1504640, -1445601, -2071945, 1504640, -2871587, -2109337, 788737, -2394021, 2795066, 2795066, -1445601, 2795066, -1445601, -2071945, 1504640, -1445601, -2071945, 1504640, -2871587, -2109337, 788737, -2394021, -2071945, -2871587, -2109337, 57419, 1336332, 973308, -553138, 1504640, 788737, -2394021, -1866804, -2019017, -547408, 362499, -2871587, 57419, 1336332, 2237034, -578313, -2948048, -143039, -2109337, 973308, -553138, -783451, -2064503, -2859018, 1051864, 788737, -1866804, -2019017, -2861791, -2636239, -406220, -2437853, -2394021, -547408, 362499, 2688372, 2933065, 2334203, 1162504, 57419, 2237034, -578313, -701828, -2973003, -1853820, -2986458, 1336332, -2948048, -143039, 2185258, -121192, -1529664, -2740249, 973308, -783451, -2064503, -165017, -2764282, -2961337, 2984684, -553138, -2859018, 1051864, 1355277, 2222704, 177659, 2970486, -1866804, -2861791, -2636239, -2124594, -2201279, 3006278, 2355259, -2019017, -406220, -2437853, -2420840, 2634746, 1456050, -1722702, -547408, 2688372, 2933065, 836315, 1373599, -2900847, 1577505, 362499, 2334203, 1162504, 2411888, -1822464, 171613, -2053516, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};


extern void __asm_Good_3x2(int*, int*, int, int, int*);
extern void __asm_Good_3x2_small(int*, int*, int, int, int*);
extern void __asm_ntt(int*, const int*, int, int);
extern void __asm_base_mul(int*, int*, int, int);
extern void __asm_intt(int*, const int*, int, int);
extern void __asm_intt_2x3(int*, int*, int, int);
extern void __asm_final_map(int*, int, int, int, int*);
extern void __asm_final_map_n(int*, int*, int, int);

extern void ntt256_mod7681(int*, int*);
extern void ntt256_mod7681_basemul_8x8(int*, int*, int*);
extern void intt256_mod7681(int*, int*);
extern void crt_32bit_16bit(int*, int*, int*);

void polymul_953x953_mod6343(int* polyout, int* polyin1, int* polyin2);
void polymul_953x953_32bit(int* polyout, int* polyin1, int* polyin2);
void polymul_953x953_16bit(int* polyout, int* polyin1, int* polyin2);
void polymul_953x953_mod6343_32bit_16bit_crt(int* polyout, int* polyin1, int* polyin2);

void polymul_953x953_mod6343(int* polyout, int* polyin1, int* polyin2){
    int mem[1 << 12];
    int *ntt1, *ntt2;
    ntt1 = mem;
    ntt2 = ntt1 + (ARRAY_N * 3);
    __asm_Good_3x2(ntt1, ntt1 + ((ARRAY_N >> 1) * 3), Mprime, MOD, polyin1);
    __asm_ntt(ntt1, streamlined_Rmod_root_table_skip0, Mprime, MOD);
    __asm_Good_3x2_small(ntt2, ntt2 + ((ARRAY_N >> 1) * 3), Mprime, MOD, polyin2);
    __asm_ntt(ntt2, streamlined_Rmod_root_table_skip0, Mprime, MOD);
    __asm_base_mul(ntt1, ntt2, Mprime, MOD);
    __asm_intt(ntt1, streamlined_Rmod_inv_GS_root_table_skip0, Mprime, MOD);
    __asm_intt_2x3(ntt1, ntt1 + ((ARRAY_N >> 1) * 3), Mprime, MOD);
    __asm_final_map(ntt1, Mhalf, Mprime, MOD, polyout);
}

void polymul_953x953_32bit(int* polyout, int* polyin1, int* polyin2){
    int mem[1 << 12];
    int *ntt1, *ntt2;
    ntt1 = mem;
    ntt2 = ntt1 + (ARRAY_N * 3);
    __asm_Good_3x2(ntt1, ntt1 + ((ARRAY_N >> 1) * 3), Mprime, MOD, polyin1);
    __asm_ntt(ntt1, streamlined_Rmod_root_table_skip0, Mprime, MOD);
    __asm_Good_3x2(ntt2, ntt2 + ((ARRAY_N >> 1) * 3), Mprime, MOD, polyin2);
    __asm_ntt(ntt2, streamlined_Rmod_root_table_skip0, Mprime, MOD);
    __asm_base_mul(ntt1, ntt2, Mprime, MOD);
    __asm_intt(ntt1, streamlined_Rmod_inv_GS_root_table_skip0, Mprime, MOD);
    __asm_intt_2x3(ntt1, ntt1 + ((ARRAY_N >> 1) * 3), Mprime, MOD);
    __asm_final_map_n(ntt1, polyout, Mprime, MOD);
}

void polymul_953x953_16bit(int* polyout, int* polyin1, int* polyin2){
    int fpad[1024], gpad[1024];
    ntt256_mod7681(fpad, polyin1);
    ntt256_mod7681(gpad, polyin2);
    ntt256_mod7681_basemul_8x8(fpad, fpad, gpad);
    intt256_mod7681(polyout, fpad);
}

void polymul_953x953_mod6343_32bit_16bit_crt(int* polyout, int* polyin1, int* polyin2){
    int h_32bit[2048], h_16bit[1024];
    polymul_953x953_32bit(h_32bit, polyin1, polyin2);
    polymul_953x953_16bit(h_16bit, polyin1, polyin2);
    crt_32bit_16bit(polyout, h_32bit, h_16bit);
}