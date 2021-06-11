#ifndef NTT256_MOD7681_MACRO
#define NTT256_MOD7681_MACRO
.macro montgomery_reduce tar, reduce_coef_qinvbot_qtop, tmp
    smulbb \tmp, \tar, \reduce_coef_qinvbot_qtop
    smlabt \tar, \tmp, \reduce_coef_qinvbot_qtop, \tar
.endm

.macro bar_red_16bitx2 tar, qinv, q, tmp0, tmp1
    sbfx \tmp0, \tar, #0, #16
    sbfx \tmp1, \tar, #16, #16
    smmulr \tar, \tmp0, \qinv
    mls \tmp0, \tar, \q, \tmp0
    smmulr \tar, \tmp1, \qinv
    mls \tmp1, \tar, \q, \tmp1
    pkhbt \tar, \tmp0, \tmp1, lsl #16
.endm

.macro coef_multiply_w_16bitx2_wbot ans, coef, w, qinv, q, tmp0, tmp1
    smulbb \tmp0, \w, \coef
    smulbt \tmp1, \w, \coef
    smmulr \ans, \tmp0, \qinv
    mls \tmp0, \ans, \q, \tmp0
    smmulr \ans, \tmp1, \qinv
    mls \tmp1, \ans, \q, \tmp1
    pkhbt \ans, \tmp0, \tmp1, lsl #16
.endm

.macro coef_multiply_w_16bitx2_wtop ans, coef, w, qinv, q, tmp0, tmp1
    smultb \tmp0, \w, \coef
    smultt \tmp1, \w, \coef
    smmulr \ans, \tmp0, \qinv
    mls \tmp0, \ans, \q, \tmp0
    smmulr \ans, \tmp1, \qinv
    mls \tmp1, \ans, \q, \tmp1
    pkhbt \ans, \tmp0, \tmp1, lsl #16
.endm

.macro reduce_16bitx2 tar, qinv, q, tmp0, tmp1
    sbfx \tmp0, \tar, #0, #16
    sbfx \tmp1, \tar, #16, #16
    smmulr \tar, \tmp0, \qinv
    mls \tmp0, \tar, \q, \tmp0
    smmulr \tar, \tmp1, \qinv
    mls \tmp1, \tar, \q, \tmp1
    pkhbt \tar, \tmp0, \tmp1, lsl #16
.endm

.macro div256_reduce_16bitx2 tar, w, qinv, q, tmp0, tmp1
    smulbb \tmp0, \w, \tar
    smulbt \tmp1, \w, \tar
    smmulr \tar, \tmp0, \qinv
    mls \tmp0, \tar, \q, \tmp0
    smmulr \tar, \tmp1, \qinv
    mls \tmp1, \tar, \q, \tmp1
    pkhbt \tar, \tmp0, \tmp1, lsl #16
.endm


@ for 6x6
.macro permute_05_21_43 f05, f01, f23, f45
    pkhbt \f05, \f01, \f45
    pkhtb \f01, \f01, \f23
    pkhtb \f23, \f23, \f45
.endm

.macro polymul_6x6_c0 ans, f01, f23, f45, g05, g21, g43
    smulbb \ans, \f01, \g05
.endm

.macro polymul_6x6_c1 ans, f01, f23, f45, g01, g23, g45
    smuadx \ans, \f01, \g01
.endm

.macro polymul_6x6_c2 ans, f01, f23, f45, g05, g21, g43
    smuad \ans, \f01, \g21
    smlabb \ans, \f23, \g05, \ans
.endm

.macro polymul_6x6_c3 ans, f01, f23, f45, g01, g23, g45
    smuadx \ans, \f01, \g23
    smladx \ans, \f23, \g01, \ans
.endm

.macro polymul_6x6_c4 ans, f01, f23, f45, g05, g21, g43
    smuad \ans, \f01, \g43
    smlad \ans, \f23, \g21, \ans
    smlabb \ans, \f45, \g05, \ans
.endm

.macro polymul_6x6_c5 ans, f01, f23, f45, g01, g23, g45
    smuadx \ans, \f01, \g45
    smladx \ans, \f23, \g23, \ans
    smladx \ans, \f45, \g01, \ans
.endm

.macro polymul_6x6_c6 ans, f01, f23, f45, g05, g21, g43
    smultt \ans, \f01, \g05
    smlad \ans, \f23, \g43, \ans
    smlad \ans, \f45, \g21, \ans
.endm

.macro polymul_6x6_c7 ans, f01, f23, f45, g01, g23, g45
    smuadx \ans, \f23, \g45
    smladx \ans, \f45, \g23, \ans
.endm

.macro polymul_6x6_c8 ans, f01, f23, f45, g05, g21, g43
    smultt \ans, \f23, \g05
    smlad \ans, \f45, \g43, \ans
.endm

.macro polymul_6x6_c9 ans, f01, f23, f45, g01, g23, g45
    smuadx \ans, \f45, \g45
.endm

.macro polymul_6x6_c10 ans, f01, f23, f45, g05, g21, g43
    smultt \ans, \f45, \g05
.endm

@ for 8x8
.macro permute_07_21_43_65 f07, f01, f23, f45, f67
    pkhbt \f07, \f01, \f67
    pkhtb \f01, \f01, \f23
    pkhtb \f23, \f23, \f45
    pkhtb \f45, \f45, \f67
.endm

.macro polymul_8x8_c0 ans, f01, f23, f45, f67, g07, g21, g43, g65
    smulbb \ans, \f01, \g07
.endm

.macro polymul_8x8_c1 ans, f01, f23, f45, f67, g01, g23, g45, g67
    smuadx \ans, \f01, \g01
.endm

.macro polymul_8x8_c2 ans, f01, f23, f45, f67, g07, g21, g43, g65
    smuad \ans, \f01, \g21
    smlabb \ans, \f23, \g07, \ans
.endm

.macro polymul_8x8_c3 ans, f01, f23, f45, f67, g01, g23, g45, g67
    smuadx \ans, \f01, \g23
    smladx \ans, \f23, \g01, \ans
.endm

.macro polymul_8x8_c4 ans, f01, f23, f45, f67, g07, g21, g43, g65
    smuad \ans, \f01, \g43
    smlad \ans, \f23, \g21, \ans
    smlabb \ans, \f45, \g07, \ans
.endm

.macro polymul_8x8_c5 ans, f01, f23, f45, f67, g01, g23, g45, g67
    smuadx \ans, \f01, \g45
    smladx \ans, \f23, \g23, \ans
    smladx \ans, \f45, \g01, \ans
.endm

.macro polymul_8x8_c6 ans, f01, f23, f45, f67, g07, g21, g43, g65
    smuad \ans, \f01, \g65
    smlad \ans, \f23, \g43, \ans
    smlad \ans, \f45, \g21, \ans
    smlabb \ans, \f67, \g07, \ans
.endm

.macro polymul_8x8_c7 ans, f01, f23, f45, f67, g01, g23, g45, g67
    smuadx \ans, \f01, \g67
    smladx \ans, \f23, \g45, \ans
    smladx \ans, \f45, \g23, \ans
    smladx \ans, \f67, \g01, \ans
.endm

.macro polymul_8x8_c8 ans, f01, f23, f45, f67, g07, g21, g43, g65
    smultt \ans, \f01, \g07
    smlad \ans, \f23, \g65, \ans
    smlad \ans, \f45, \g43, \ans
    smlad \ans, \f67, \g21, \ans
.endm

.macro polymul_8x8_c9 ans, f01, f23, f45, f67, g01, g23, g45, g67
    smuadx \ans, \f23, \g67
    smladx \ans, \f45, \g45, \ans
    smladx \ans, \f67, \g23, \ans
.endm

.macro polymul_8x8_c10 ans, f01, f23, f45, f67, g07, g21, g43, g65
    smultt \ans, \f23, \g07
    smlad \ans, \f45, \g65, \ans
    smlad \ans, \f67, \g43, \ans
.endm

.macro polymul_8x8_c11 ans, f01, f23, f45, f67, g01, g23, g45, g67
    smuadx \ans, \f45, \g67
    smladx \ans, \f67, \g45, \ans
.endm

.macro polymul_8x8_c12 ans, f01, f23, f45, f67, g07, g21, g43, g65
    smultt \ans, \f45, \g07
    smlad \ans, \f67, \g65, \ans
.endm

.macro polymul_8x8_c13 ans, f01, f23, f45, f67, g01, g23, g45, g67
    smuadx \ans, \f67, \g67
.endm

.macro polymul_8x8_c14 ans, f01, f23, f45, f67, g07, g21, g43, g65
    smultt \ans, \f67, \g07
.endm

@ for 10x10

.macro permute_09_21_43_65_87 f09, f01, f23, f45, f67, f89
    pkhbt \f09, \f01, \f89
    pkhtb \f01, \f01, \f23
    pkhtb \f23, \f23, \f45
    pkhtb \f45, \f45, \f67
    pkhtb \f67, \f67, \f89
.endm

.macro polymul_10x10_c1 ans, f01, f23, f45, f67, f89, g01, g23, g45, g67, g89
    smuadx \ans, \f01, \g01
.endm

.macro polymul_10x10_c3 ans, f01, f23, f45, f67, f89, g01, g23, g45, g67, g89
    smuadx \ans, \f01, \g23
    smladx \ans, \f23, \g01, \ans
.endm

.macro polymul_10x10_c5 ans, f01, f23, f45, f67, f89, g01, g23, g45, g67, g89
    smuadx \ans, \f01, \g45
    smladx \ans, \f23, \g23, \ans
    smladx \ans, \f45, \g01, \ans
.endm

.macro polymul_10x10_c7 ans, f01, f23, f45, f67, f89, g01, g23, g45, g67, g89
    smuadx \ans, \f01, \g67
    smladx \ans, \f23, \g45, \ans
    smladx \ans, \f45, \g23, \ans
    smladx \ans, \f67, \g01, \ans
.endm

.macro polymul_10x10_c9 ans, f01, f23, f45, f67, f89, g01, g23, g45, g67, g89
    smuadx \ans, \f01, \g89
    smladx \ans, \f23, \g67, \ans
    smladx \ans, \f45, \g45, \ans
    smladx \ans, \f67, \g23, \ans
    smladx \ans, \f89, \g01, \ans
.endm

.macro polymul_10x10_c11 ans, f01, f23, f45, f67, f89, g01, g23, g45, g67, g89
    smuadx \ans, \f23, \g89
    smladx \ans, \f45, \g67, \ans
    smladx \ans, \f67, \g45, \ans
    smladx \ans, \f89, \g23, \ans
.endm

.macro polymul_10x10_c13 ans, f01, f23, f45, f67, f89, g01, g23, g45, g67, g89
    smuadx \ans, \f45, \g89
    smladx \ans, \f67, \g67, \ans
    smladx \ans, \f89, \g45, \ans
.endm

.macro polymul_10x10_c15 ans, f01, f23, f45, f67, f89, g01, g23, g45, g67, g89
    smuadx \ans, \f67, \g89
    smladx \ans, \f89, \g67, \ans
.endm

.macro polymul_10x10_c17 ans, f01, f23, f45, f67, f89, g01, g23, g45, g67, g89
    smuadx \ans, \f89, \g89
.endm

.macro polymul_10x10_c0 ans, f01, f23, f45, f67, f89, g09, g21, g43, g65, g87
    smulbb \ans, \f01, \g09
.endm

.macro polymul_10x10_c2 ans, f01, f23, f45, f67, f89, g09, g21, g43, g65, g87
    smuad \ans, \f01, \g21
    smlabb \ans, \f23, \g09, \ans
.endm

.macro polymul_10x10_c4 ans, f01, f23, f45, f67, f89, g09, g21, g43, g65, g87
    smuad \ans, \f01, \g43
    smlad \ans, \f23, \g21, \ans
    smlabb \ans, \f45, \g09, \ans
.endm

.macro polymul_10x10_c6 ans, f01, f23, f45, f67, f89, g09, g21, g43, g65, g87
    smuad \ans, \f01, \g65
    smlad \ans, \f23, \g43, \ans
    smlad \ans, \f45, \g21, \ans
    smlabb \ans, \f67, \g09, \ans
.endm

.macro polymul_10x10_c8 ans, f01, f23, f45, f67, f89, g09, g21, g43, g65, g87
    smuad \ans, \f01, \g87
    smlad \ans, \f23, \g65, \ans
    smlad \ans, \f45, \g43, \ans
    smlad \ans, \f67, \g21, \ans
    smlabb \ans, \f89, \g09, \ans
.endm

.macro polymul_10x10_c10 ans, f01, f23, f45, f67, f89, g09, g21, g43, g65, g87
    smultt \ans, \f01, \g09
    smlad \ans, \f23, \g87, \ans
    smlad \ans, \f45, \g65, \ans
    smlad \ans, \f67, \g43, \ans
    smlad \ans, \f89, \g21, \ans
.endm

.macro polymul_10x10_c12 ans, f01, f23, f45, f67, f89, g09, g21, g43, g65, g87
    smultt \ans, \f23, \g09
    smlad \ans, \f45, \g87, \ans
    smlad \ans, \f67, \g65, \ans
    smlad \ans, \f89, \g43, \ans
.endm

.macro polymul_10x10_c14 ans, f01, f23, f45, f67, f89, g09, g21, g43, g65, g87
    smultt \ans, \f45, \g09
    smlad \ans, \f67, \g87, \ans
    smlad \ans, \f89, \g65, \ans
.endm

.macro polymul_10x10_c16 ans, f01, f23, f45, f67, f89, g09, g21, g43, g65, g87
    smultt \ans, \f67, \g09
    smlad \ans, \f89, \g87, \ans
.endm

.macro polymul_10x10_c18 ans, f01, f23, f45, f67, f89, g09, g21, g43, g65, g87
    smultt \ans, \f89, \g09
.endm

#endif