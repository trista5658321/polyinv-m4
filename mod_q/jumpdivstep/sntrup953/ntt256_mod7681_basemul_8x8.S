#include "ntt256_mod7681_macro.S"
.align
.syntax unified
.text
wpad:
    .word 503389695
    .word 4088
    .word 3593
    .word 3777
    .word 3904
    .word 4499
    .word 3182
    .word 3625
    .word 4056
    .word 3696
    .word 3985
    .word 1100
    .word 6581
    .word 5225
    .word 2456
    .word 5487
    .word 2194
    .word 5431
    .word 2250
    .word 7560
    .word 121
    .word 5186
    .word 2495
    .word 6847
    .word 834
    .word 4805
    .word 2876
    .word 5362
    .word 2319
    .word 6267
    .word 1414
    .word 5980
    .word 1701
    .word 2237
    .word 5444
    .word 5695
    .word 1986
    .word 2088
    .word 5593
    .word 2816
    .word 4865
    .word 3706
    .word 3975
    .word 5675
    .word 2006
    .word 1993
    .word 5688
    .word 1599
    .word 6082
    .word 6198
    .word 1483
    .word 1296
    .word 6385
    .word 6156
    .word 1525
    .word 5124
    .word 2557
    .word 1921
    .word 5760
    .word 7064
    .word 617
    .word 2830
    .word 4851
    .word 4317
    .word 3364
    .word 1887
    .word 5794
    .word 6871
    .word 810
    .word 7674
    .word 7
    .word 638
    .word 7043
    .word 3600
    .word 4081
    .word 3266
    .word 4415
    .word 3992
    .word 3689
    .word 5943
    .word 1738
    .word 7285
    .word 396
    .word 3174
    .word 4507
    .word 3555
    .word 4126
    .word 1881
    .word 5800
    .word 6376
    .word 1305
    .word 5921
    .word 1760
    .word 7002
    .word 679
    .word 438
    .word 7243
    .word 5371
    .word 2310
    .word 3153
    .word 4528
    .word 1535
    .word 6146
    .word 7132
    .word 549
    .word 3909
    .word 3772
    .word 2535
    .word 5146
    .word 2440
    .word 5241
    .word 2555
    .word 5126
    .word 5638
    .word 2043
    .word 6250
    .word 1431
    .word 2804
    .word 4877
    .word 103
    .word 7578
    .word 6360
    .word 1321
    .word 6282
    .word 1399
    .word 2956
    .word 4725
    .word 514
    .word 7167
    .word 2919
    .word 4762
    .word 2789
    .word 4892
    .word 7487
    .word 194
    .word 3417
    .word 4264
    .word 2113
    .word 5568
    .word 2732
    .word 4949
    .word 5296
    .word 2385
    .word 3405
    .word 4276
    .word 7679
    .word 2
    .word 6766
    .word 915
    .word 5255
    .word 2426
    .word 3850
    .word 3831
    .word 6627
    .word 1054
    .word 1698
    .word 5983
    .word 4225
    .word 3456
    .word 1166
    .word 6515
    .word 5109
    .word 2572
    .word 6184
    .word 1497
    .word 6331
    .word 1350
    .word 4536
    .word 3145
    .word 4093
    .word 3588
    .word 2224
    .word 5457
    .word 2883
    .word 4798
    .word 1681
    .word 6000
    .word 5925
    .word 1756
    .word 3135
    .word 4546
    .word 5290
    .word 2391
    .word 660
    .word 7021
    .word 3989
    .word 3692
    .word 730
    .word 6951
    .word 7308
    .word 373
    .word 2175
    .word 5506
    .word 4938
    .word 2743
    .word 921
    .word 6760
    .word 6295
    .word 1386
    .word 3428
    .word 4253
    .word 6148
    .word 1533
    .word 1464
    .word 6217
    .word 6954
    .word 727
    .word 1521
    .word 6160
    .word 6083
    .word 1598
    .word 6291
    .word 1390
    .word 4919
    .word 2762
    .word 3750
    .word 3931
    .word 2764
    .word 4917
    .word 4846
    .word 2835
    .word 3816
    .word 3865
    .word 2233
    .word 5448
    .word 3480
    .word 4201
    .word 2133
    .word 5548
    .word 4371
    .word 3310
    .word 6513
    .word 1168
    .word 5882
    .word 1799
    .word 2665
    .word 5016
    .word 6898
    .word 783
    .word 6625
    .word 1056
    .word 2579
    .word 5102
    .word 859
    .word 6822
    .word 2160
    .word 5521
    .word 5032
    .word 2649
    .word 7277
    .word 404
    .word 7195
    .word 486
    .word 1532
    .word 6149
    .word 1919
    .word 5762
    
.equ basesize, 8
.global ntt256_mod7681_basemul_8x8
.type ntt256_mod7681_basemul_8x8, %function
ntt256_mod7681_basemul_8x8:
    push {r4-r11, lr}
    adr.w lr, wpad
    ldr.w r12, [lr], #4
    add.w r11, r0, #512*basesize
    vmov s3, s4, r11, lr
ntt256_mod7681_basemul_8x8_body:
    vmov lr, s4
    ldr.w r11, [lr], #4
    vmov s4, lr
    ldm r1!, {r3-r6}
    ldm r2!, {r7-r10}
    vmov s1, s2, r1, r2

    polymul_8x8_c9 r1, r3, r4, r5, r6, r7, r8, r9, r10
    montgomery_reduce r1, r12, lr
    polymul_8x8_c1 r2, r3, r4, r5, r6, r7, r8, r9, r10
    smlabt r1, r11, r1, r2
    montgomery_reduce r1, r12, lr @ c1/R

    polymul_8x8_c11 r2, r3, r4, r5, r6, r7, r8, r9, r10
    montgomery_reduce r2, r12, lr
    polymul_8x8_c3 lr, r3, r4, r5, r6, r7, r8, r9, r10
    smlabt r2, r11, r2, lr
    montgomery_reduce r2, r12, lr @ c3/R

    pkhtb r1, r2, r1, asr #16 @ c1/R c3/R
    vmov s5, r1

    polymul_8x8_c13 r1, r3, r4, r5, r6, r7, r8, r9, r10
    montgomery_reduce r1, r12, lr
    polymul_8x8_c5 r2, r3, r4, r5, r6, r7, r8, r9, r10
    smlabt r1, r11, r1, r2
    montgomery_reduce r1, r12, lr @ c5/R

    polymul_8x8_c7 r2, r3, r4, r5, r6, r7, r8, r9, r10
    montgomery_reduce r2, r12, lr @ c7/R

    pkhtb r1, r2, r1, asr #16 @ c5/R c7/R
    vmov s6, r1

    permute_07_21_43_65 r2, r3, r4, r5, r6

    polymul_8x8_c8 r1, r7, r8, r9, r10, r2, r3, r4, r5
    montgomery_reduce r1, r12, lr
    polymul_8x8_c0 r6, r7, r8, r9, r10, r2, r3, r4, r5
    smlabt r1, r11, r1, r6
    montgomery_reduce r1, r12, lr @ c0/R

    polymul_8x8_c10 r6, r7, r8, r9, r10, r2, r3, r4, r5
    montgomery_reduce r6, r12, lr
    polymul_8x8_c2 lr, r7, r8, r9, r10, r2, r3, r4, r5
    smlabt r6, r11, r6, lr
    montgomery_reduce r6, r12, lr @ c2/R

    pkhtb r1, r6, r1, asr #16 @ c0/R c2/R
    vmov s7, r1

    polymul_8x8_c12 r1, r7, r8, r9, r10, r2, r3, r4, r5
    montgomery_reduce r1, r12, lr
    polymul_8x8_c4 r6, r7, r8, r9, r10, r2, r3, r4, r5
    smlabt r1, r11, r1, r6
    montgomery_reduce r1, r12, lr @ c4/R

    polymul_8x8_c14 r6, r7, r8, r9, r10, r2, r3, r4, r5
    montgomery_reduce r6, r12, lr
    polymul_8x8_c6 lr, r7, r8, r9, r10, r2, r3, r4, r5
    smlabt r6, r11, r6, lr
    montgomery_reduce r6, r12, lr @ c6/R

    pkhtb r4, r6, r1, asr #16 @ c4/R c6/R
    vmov r1, r2, s5, s6 @ 1357
    vmov r3, s7
    pkhbt r5, r3, r1, lsl #16
    pkhtb r6, r1, r3, asr #16
    pkhbt r7, r4, r2, lsl #16
    pkhtb r8, r2, r4, asr #16

    stm r0!, {r5-r8}
    vmov r1, r2, s1, s2
    vmov r11, s3
    cmp.w r0, r11
    bne.w ntt256_mod7681_basemul_8x8_body
    pop {r4-r11, pc}