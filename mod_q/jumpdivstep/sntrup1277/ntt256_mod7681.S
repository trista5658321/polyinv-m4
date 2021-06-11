#include "ntt256_mod7681_macro.S"

.p2align
.syntax unified
.text
wpad:
    .word 559168
    .word 7681
    .word 4298
    .word 1
    .word 4073259009
    .word 4298
    .word 4168811709
    .word 1213
    .word 4239327759
    .word 5756
    .word 4256761536
    .word 1
    .word 4073259009
    .word 4298
    .word 4168811709
    .word 1213
    .word 4239327759
    .word 5756
    .word 4256761536
    .word 527
    .word 4205447904
    .word 6832
    .word 140178856
    .word 1728
    .word 139722849
    .word 7098
    .word 4138928526
    .word 2784
    .word 148964206
    .word 6315
    .word 4273403307
    .word 5033
    .word 4271048502
    .word 2138
    .word 180482490
    .word 97
    .word 4222093058
    .word 2132
    .word 196610399
    .word 2446
    .word 4146332323
    .word 5300
    .word 4210750444
    .word 1
    .word 4073259009
    .word 4298
    .word 4168811709
    .word 1213
    .word 4239327759
    .word 5756
    .word 4256761536
    .word 527
    .word 4205447904
    .word 6832
    .word 140178856
    .word 1728
    .word 139722849
    .word 7098
    .word 4138928526
    .word 2784
    .word 148964206
    .word 6315
    .word 4273403307
    .word 5033
    .word 4271048502
    .word 2138
    .word 180482490
    .word 97
    .word 4222093058
    .word 2132
    .word 196610399
    .word 2446
    .word 4146332323
    .word 5300
    .word 4210750444
    .word 878
    .word 45548319
    .word 2273
    .word 4172088677
    .word 5036
    .word 4136237722
    .word 7351
    .word 178583692
    .word 1846
    .word 4247057406
    .word 7316
    .word 201912939
    .word 4027
    .word 4182639285
    .word 2753
    .word 161811764
    .word 1794
    .word 223545847
    .word 6569
    .word 4130143176
    .word 2399
    .word 15925450
    .word 3000
    .word 188873986
    .word 675
    .word 164426883
    .word 5413
    .word 34665095
    .word 4589
    .word 38274679
    .word 6395
    .word 114035414
    .word 799
    .word 4190961862
    .word 695
    .word 190056463
    .word 1381
    .word 57734028
    .word 5806
    .word 4280676947
    .word 6299
    .word 4188010744
    .word 5258
    .word 57014324
    .word 5773
    .word 4274123011
    .word 2724
    .word 4105109909
    .word 4607
    .word 4090230013
    .word 6949
    .word 248380038
    .word 4204
    .word 4089181076
    .word 3080
    .word 4278188602
    .word 693
    .word 168626014
    .word 5967
    .word 168033084
    .word 3380
    .word 4061268993
    .word 2469
    .word 4219275480
    .word 2551
    .word 4252562405
    .word 3411
    .word 4127126522
    .word 6601
    .word 4063497024
    .word 5165
    .word 110295673
    .word 202
    .word 65796291
    .word 243
    .word 199297820
    .word 6915
    .word 4202757100
    .word 2881
    .word 4116579297
    .word 4740
    .word 4258986184
    .word 2508
    .word 71894220
    .word 4232
    .word 132908599
    .word 528
    .word 133957536
    .word 1655
    .word 4119266718
    .word 584
    .word 4099015363
    .word 2774
    .word 27391455
    .word 1740
    .word 4221301052

.equ basesize, 10
.global ntt256_mod7681
.type ntt256_mod7681, %function
ntt256_mod7681:
    push {r4-r11, lr}
    adr.w lr, wpad
    ldm lr!, {r11-r12}
    ldr.w r9, [lr], #4
    vmov s0, r0
    add.w r10, r0, #128*basesize
ntt256_mod7681_layer_1_2:
.rept 8
    ldr.w r5, [r1, #128*basesize]
    ldr.w r4, [r1], #4
    sadd16 r2, r4, r5
    ssub16 r3, r4, r5
    coef_multiply_w_16bitx2_wbot r6, r5, r9, r11, r12, r7, r8
    ssub16 r5, r4, r6
    sadd16 r4, r4, r6
    str.w r3, [r0, #128*basesize]
    str.w r4, [r0, #256*basesize]
    str.w r5, [r0, #384*basesize]
    str.w r2, [r0], #4
.endr
    cmp.w r0, r10
    bne.w ntt256_mod7681_layer_1_2

    vmov r0, s0
    add.w r10, r0, #512*basesize
ntt256_mod7681_layer_3_4:
    add.w r9, r0, #32*basesize
    ldm lr!, {r7-r8}
ntt256_mod7681_layer_3_4_inner:
.rept 4
    ldr.w r1, [r0]
    ldr.w r2, [r0, #32*basesize]
    ldr.w r3, [r0, #64*basesize]
    ldr.w r4, [r0, #96*basesize]
    coef_multiply_w_16bitx2_wbot r3, r3, r7, r11, r12, r5, r6
    coef_multiply_w_16bitx2_wbot r4, r4, r7, r11, r12, r5, r6
    ssub16 r5, r1, r3
    ssub16 r6, r2, r4
    sadd16 r3, r1, r3
    sadd16 r4, r2, r4
    coef_multiply_w_16bitx2_wbot r4, r4, r8, r11, r12, r1, r2
    coef_multiply_w_16bitx2_wtop r6, r6, r8, r11, r12, r1, r2
    sadd16 r1, r3, r4
    ssub16 r2, r3, r4
    sadd16 r3, r5, r6
    ssub16 r4, r5, r6
    str.w r2, [r0, #32*basesize]
    str.w r3, [r0, #64*basesize]
    str.w r4, [r0, #96*basesize]
    str.w r1, [r0], #4
.endr
    cmp.w r0, r9
    bne.w ntt256_mod7681_layer_3_4_inner
    add.w r0, r0, #96*basesize
    cmp.w r0, r10
    bne.w ntt256_mod7681_layer_3_4

    vmov r0, s0
ntt256_mod7681_layer_5_6:
    add.w r9, r0, #8*basesize
    ldm lr!, {r7-r8}
ntt256_mod7681_layer_5_6_inner:
.rept 4
    ldr.w r1, [r0]
    ldr.w r2, [r0, #8*basesize]
    ldr.w r3, [r0, #16*basesize]
    ldr.w r4, [r0, #24*basesize]
    coef_multiply_w_16bitx2_wbot r3, r3, r7, r11, r12, r5, r6
    coef_multiply_w_16bitx2_wbot r4, r4, r7, r11, r12, r5, r6
    ssub16 r5, r1, r3
    ssub16 r6, r2, r4
    sadd16 r3, r1, r3
    sadd16 r4, r2, r4
    coef_multiply_w_16bitx2_wbot r4, r4, r8, r11, r12, r1, r2
    coef_multiply_w_16bitx2_wtop r6, r6, r8, r11, r12, r1, r2
    sadd16 r1, r3, r4
    ssub16 r2, r3, r4
    sadd16 r3, r5, r6
    ssub16 r4, r5, r6
    str.w r2, [r0, #8*basesize]
    str.w r3, [r0, #16*basesize]
    str.w r4, [r0, #24*basesize]
    str.w r1, [r0], #4
.endr
    cmp.w r0, r9
    bne.w ntt256_mod7681_layer_5_6_inner
    add.w r0, r0, #24*basesize
    cmp.w r0, r10
    bne.w ntt256_mod7681_layer_5_6

    vmov r0, s0
ntt256_mod7681_layer_7_8:
    ldm lr!, {r7-r8}
.rept basesize/2
    ldr.w r1, [r0]
    ldr.w r2, [r0, #2*basesize]
    ldr.w r3, [r0, #4*basesize]
    ldr.w r4, [r0, #6*basesize]
    coef_multiply_w_16bitx2_wbot r3, r3, r7, r11, r12, r5, r6
    coef_multiply_w_16bitx2_wbot r4, r4, r7, r11, r12, r5, r6
    ssub16 r5, r1, r3
    ssub16 r6, r2, r4
    sadd16 r3, r1, r3
    sadd16 r4, r2, r4
    coef_multiply_w_16bitx2_wbot r4, r4, r8, r11, r12, r1, r2
    coef_multiply_w_16bitx2_wtop r6, r6, r8, r11, r12, r1, r2
    sadd16 r1, r3, r4
    ssub16 r2, r3, r4
    sadd16 r3, r5, r6
    ssub16 r4, r5, r6
    bar_red_16bitx2 r1, r11, r12, r5, r6
    bar_red_16bitx2 r2, r11, r12, r5, r6
    bar_red_16bitx2 r3, r11, r12, r5, r6
    bar_red_16bitx2 r4, r11, r12, r5, r6
    str.w r2, [r0, #2*basesize]
    str.w r3, [r0, #4*basesize]
    str.w r4, [r0, #6*basesize]
    str.w r1, [r0], #4
.endr
    add.w r0, r0, #6*basesize
    cmp.w r0, r10
    bne.w ntt256_mod7681_layer_7_8

    pop {r4-r11, pc}
