#include "ntt256_mod7681_macro.S"

.p2align
.syntax unified
.text
wpad:
    .word 559168
    .word 7681
    .word 221708289
    .word 1
    .word 4215474053
    .word 3383
    .word 4181721671
    .word 1925
    .word 4260430673
    .word 6468
    .word 4134668621
    .word 583
    .word 4288673708
    .word 5953
    .word 173602726
    .word 849
    .word 4112516438
    .word 7154
    .word 202638598
    .word 2381
    .word 4250732764
    .word 5235
    .word 4137808968
    .word 5549
    .word 4177396824
    .word 7584
    .word 239531327
    .word 5543
    .word 4173988205
    .word 2648
    .word 173343050
    .word 1366
    .word 4237489951
    .word 4897
    .word 4113234228
    .word 1286
    .word 4186570168
    .word 3092
    .word 226098672
    .word 2268
    .word 192804404
    .word 7006
    .word 50263231
    .word 4681
    .word 4281794317
    .word 5282
    .word 70781396
    .word 1112
    .word 4127847085
    .word 5887
    .word 4073518683
    .word 4928
    .word 4249552562
    .word 3654
    .word 227931128
    .word 365
    .word 201458396
    .word 5835
    .word 125105500
    .word 330
    .word 90573175
    .word 2645
    .word 4204463955
    .word 5408
    .word 4242668873
    .word 6803
    .word 247727205
    .word 5941
    .word 169999967
    .word 4907
    .word 4248636334
    .word 7097
    .word 4200729209
    .word 6026
    .word 4167104516
    .word 7153
    .word 4190763028
    .word 3449
    .word 4214553527
    .word 5173
    .word 121111078
    .word 2941
    .word 4229892770
    .word 4800
    .word 68420992
    .word 766
    .word 4108645407
    .word 7438
    .word 121502741
    .word 7479
    .word 92797294
    .word 2516
    .word 4106227148
    .word 1080
    .word 201722370
    .word 4270
    .word 203096712
    .word 5130
    .word 4146594947
    .word 5212
    .word 4093578734
    .word 4301
    .word 80016893
    .word 1714
    .word 4171429363
    .word 6988
    .word 96862465
    .word 4601
    .word 208407621
    .word 3477
    .word 91943219
    .word 732
    .word 184749109
    .word 3074
    .word 4268428113
    .word 4957
    .word 251461951
    .word 1908
    .word 130874523
    .word 2423
    .word 117966433
    .word 1382
    .word 229441755
    .word 1875
    .word 208993424
    .word 6300
    .word 4159829164
    .word 6986
    .word 4281992755
    .word 6882

    .word 221708289
    .word 1
    .word 4215474053
    .word 3383
    .word 4181721671
    .word 1925
    .word 4260430673
    .word 6468
    .word 4134668621
    .word 583
    .word 4288673708
    .word 5953
    .word 173602726
    .word 849
    .word 4112516438
    .word 7154
    .word 202638598
    .word 2381
    .word 4250732764
    .word 5235
    .word 4137808968
    .word 5549
    .word 4177396824
    .word 7584
    .word 239531327
    .word 5543
    .word 4173988205
    .word 2648
    .word 173343050
    .word 1366
    .word 4237489951
    .word 4897

    .word 221708289
    .word 1
    .word 4215474053
    .word 3383
    .word 4181721671
    .word 1925
    .word 4260430673
    .word 6468

    .word 3383
    .word 256

.equ basesize, 10
.global intt256_mod7681
.type intt256_mod7681, %function
intt256_mod7681:
    push {r4-r11, lr}
    adr.w lr, wpad
    ldm lr!, {r11-r12}
    vmov s0, r0
    add.w r10, r0, #512*basesize
intt256_mod7681_layer_8_7:
    ldm lr!, {r7-r8}
.rept basesize/2
    ldr.w r4, [r1, #2*basesize] @ b
    ldr.w r5, [r1, #4*basesize] @ c
    ldr.w r6, [r1, #6*basesize] @ d
    ldr.w r3, [r1], #4 @ a
    sadd16 r2, r3, r4 @ a + b
    ssub16 r3, r3, r4 @ a - b
    sadd16 r4, r5, r6 @ c + d
    ssub16 r5, r5, r6 @ c - d
    coef_multiply_w_16bitx2_wbot r3, r3, r7, r11, r12, r6, r9 @ (a-b)w
    coef_multiply_w_16bitx2_wtop r5, r5, r7, r11, r12, r6, r9 @ (c-d)w
    ssub16 r6, r3, r5 @ (a-b)w - (c-d)w
    sadd16 r3, r3, r5 @ (a-b)w + (c-d)w
    ssub16 r5, r2, r4 @ (a+b) - (c+d)
    sadd16 r2, r2, r4 @ (a+b) + (c+d)
    coef_multiply_w_16bitx2_wbot r5, r5, r8, r11, r12, r4, r9
    coef_multiply_w_16bitx2_wbot r6, r6, r8, r11, r12, r4, r9
    reduce_16bitx2 r2, r11, r12, r4, r9
    str.w r3, [r0, #2*basesize]
    str.w r5, [r0, #4*basesize]
    str.w r6, [r0, #6*basesize]
    str.w r2, [r0], #4
.endr
    add.w r0, r0, #6*basesize
    add.w r1, r1, #6*basesize
    cmp.w r0, r10
    bne.w intt256_mod7681_layer_8_7

    vmov r0, s0
intt256_mod7681_layer_6_5:
    add.w r9, r0, #8*basesize
    ldm lr!, {r7-r8}
intt256_mod7681_layer_6_5_inner:
.rept 4
    ldr.w r1, [r0]
    ldr.w r2, [r0, #8*basesize]
    ldr.w r3, [r0, #16*basesize]
    ldr.w r4, [r0, #24*basesize]
    ssub16 r5, r3, r4
    sadd16 r4, r3, r4
    ssub16 r3, r1, r2
    sadd16 r2, r1, r2
    coef_multiply_w_16bitx2_wbot r3, r3, r7, r11, r12, r1, r6
    coef_multiply_w_16bitx2_wtop r5, r5, r7, r11, r12, r1, r6
    sadd16 r1, r2, r4
    ssub16 r4, r2, r4
    sadd16 r2, r3, r5
    ssub16 r5, r3, r5
    coef_multiply_w_16bitx2_wbot r4, r4, r8, r11, r12, r3, r6
    coef_multiply_w_16bitx2_wbot r5, r5, r8, r11, r12, r3, r6
    reduce_16bitx2 r1, r11, r12, r3, r6
    str.w r2, [r0, #8*basesize]
    str.w r4, [r0, #16*basesize]
    str.w r5, [r0, #24*basesize]
    str.w r1, [r0], #4
.endr
    cmp.w r0, r9
    bne.w intt256_mod7681_layer_6_5_inner
    add.w r0, r0, #24*basesize
    cmp.w r0, r10
    bne.w intt256_mod7681_layer_6_5

    vmov r0, s0
intt256_mod7681_layer_4_3:
    add.w r9, r0, #32*basesize
    ldm lr!, {r7-r8}
intt256_mod7681_layer_4_3_inner:
.rept 4
    ldr.w r1, [r0]
    ldr.w r2, [r0, #32*basesize]
    ldr.w r3, [r0, #64*basesize]
    ldr.w r4, [r0, #96*basesize]
    ssub16 r5, r3, r4
    sadd16 r4, r3, r4
    ssub16 r3, r1, r2
    sadd16 r2, r1, r2
    coef_multiply_w_16bitx2_wbot r3, r3, r7, r11, r12, r1, r6
    coef_multiply_w_16bitx2_wtop r5, r5, r7, r11, r12, r1, r6
    sadd16 r1, r2, r4
    ssub16 r4, r2, r4
    sadd16 r2, r3, r5
    ssub16 r5, r3, r5
    coef_multiply_w_16bitx2_wbot r4, r4, r8, r11, r12, r3, r6
    coef_multiply_w_16bitx2_wbot r5, r5, r8, r11, r12, r3, r6
    reduce_16bitx2 r1, r11, r12, r3, r6
    str.w r2, [r0, #32*basesize]
    str.w r4, [r0, #64*basesize]
    str.w r5, [r0, #96*basesize]
    str.w r1, [r0], #4
.endr
    cmp.w r0, r9
    bne.w intt256_mod7681_layer_4_3_inner
    add.w r0, r0, #96*basesize
    cmp.w r0, r10
    bne.w intt256_mod7681_layer_4_3

    vmov r0, s0
    ldm lr!, {r8-r9}
    add.w r10, r0, #128*basesize
intt256_mod7681_layer_2_1:
.rept 4
    ldr.w r1, [r0]
    ldr.w r2, [r0, #128*basesize]
    ldr.w r3, [r0, #256*basesize]
    ldr.w r4, [r0, #384*basesize]
    ssub16 r5, r3, r4
    sadd16 r4, r3, r4
    ssub16 r3, r1, r2
    sadd16 r2, r1, r2
    coef_multiply_w_16bitx2_wbot r5, r5, r8, r11, r12, r6, r7
    sadd16 r1, r2, r4
    ssub16 r4, r2, r4
    sadd16 r2, r3, r5
    ssub16 r5, r3, r5
    div256_reduce_16bitx2 r1, r9, r11, r12, r6, r7
    div256_reduce_16bitx2 r2, r9, r11, r12, r6, r7
    div256_reduce_16bitx2 r4, r9, r11, r12, r6, r7
    div256_reduce_16bitx2 r5, r9, r11, r12, r6, r7
    str.w r2, [r0, #128*basesize]
    str.w r4, [r0, #256*basesize]
    str.w r5, [r0, #384*basesize]
    str.w r1, [r0], #4
.endr
    cmp.w r0, r10
    bne.w intt256_mod7681_layer_2_1

    pop {r4-r11, pc}
