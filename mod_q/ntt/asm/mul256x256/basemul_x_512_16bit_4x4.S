.p2align 2,,3
.syntax unified
.text
wpad:
	.word 7681
	.word 559168
	.word 1
	.word -1
	.word -3383
	.word 3383
	.word 1213
	.word -1213
	.word -1925
	.word 1925
	.word -527
	.word 527
	.word 849
	.word -849
	.word -1728
	.word 1728
	.word 583
	.word -583
	.word 1366
	.word -1366
	.word 2784
	.word -2784
	.word -2138
	.word 2138
	.word -2648
	.word 2648
	.word 2132
	.word -2132
	.word -97
	.word 97
	.word -2381
	.word 2381
	.word -2446
	.word 2446
	.word -330
	.word 330
	.word 2645
	.word -2645
	.word -878
	.word 878
	.word -2273
	.word 2273
	.word -2753
	.word 2753
	.word -3654
	.word 3654
	.word 1846
	.word -1846
	.word -365
	.word 365
	.word 2399
	.word -2399
	.word 3000
	.word -3000
	.word -1112
	.word 1112
	.word -1794
	.word 1794
	.word 3092
	.word -3092
	.word 1286
	.word -1286
	.word 2268
	.word -2268
	.word 675
	.word -675
	.word -1908
	.word 1908
	.word 2724
	.word -2724
	.word -2423
	.word 2423
	.word 1382
	.word -1382
	.word -695
	.word 695
	.word 799
	.word -799
	.word 1875
	.word -1875
	.word 1381
	.word -1381
	.word -2469
	.word 2469
	.word 3380
	.word -3380
	.word 693
	.word -693
	.word -1714
	.word 1714
	.word 3074
	.word -3074
	.word 732
	.word -732
	.word 3477
	.word -3477
	.word -3080
	.word 3080
	.word -202
	.word 202
	.word -243
	.word 243
	.word 766
	.word -766
	.word -2881
	.word 2881
	.word -1080
	.word 1080
	.word -2516
	.word 2516
	.word 3411
	.word -3411
	.word -2551
	.word 2551
	.word 584
	.word -584
	.word -1655
	.word 1655
	.word 1740
	.word -1740
	.word -2774
	.word 2774
	.word -528
	.word 528
	.word -3449
	.word 3449
	.word -2941
	.word 2941
	.word 2508
	.word -2508
// void basemul_x_512_16bit_4x4 (int *h);
.global basemul_x_512_16bit_4x4
.type basemul_x_512_16bit_4x4, %function
basemul_x_512_16bit_4x4:
	push {r4-r11, lr}
	adr.w r10, wpad
	ldm r10!, {r11-r12}
	add.w lr, r0, #1024
start_0:
	ldr.w r9, [r10], #4
	ldrsh.w r3, [r0, #2]
	ldrsh.w r4, [r0, #4]
	ldrsh.w r5, [r0, #6]
	ldrsh.w r2, [r0]
	smulbb r1, r9, r5
	smmulr r5, r1, r12
	mls r1, r5, r11, r1
	smmulr r5, r2, r12
	mls r2, r5, r11, r2
	pkhbt r1, r1, r2, lsl #16
	smmulr r5, r3, r12
	mls r3, r5, r11, r3
	smmulr r5, r4, r12
	mls r4, r5, r11, r4
	pkhbt r2, r3, r4, lsl #16
	str.w r2, [r0, #4]
	str.w r1, [r0], #8
	ldr.w r9, [r10], #4
	ldrsh.w r3, [r0, #2]
	ldrsh.w r4, [r0, #4]
	ldrsh.w r5, [r0, #6]
	ldrsh.w r2, [r0]
	smulbb r1, r9, r5
	smmulr r5, r1, r12
	mls r1, r5, r11, r1
	smmulr r5, r2, r12
	mls r2, r5, r11, r2
	pkhbt r1, r1, r2, lsl #16
	smmulr r5, r3, r12
	mls r3, r5, r11, r3
	smmulr r5, r4, r12
	mls r4, r5, r11, r4
	pkhbt r2, r3, r4, lsl #16
	str.w r2, [r0, #4]
	str.w r1, [r0], #8
	ldr.w r9, [r10], #4
	ldrsh.w r3, [r0, #2]
	ldrsh.w r4, [r0, #4]
	ldrsh.w r5, [r0, #6]
	ldrsh.w r2, [r0]
	smulbb r1, r9, r5
	smmulr r5, r1, r12
	mls r1, r5, r11, r1
	smmulr r5, r2, r12
	mls r2, r5, r11, r2
	pkhbt r1, r1, r2, lsl #16
	smmulr r5, r3, r12
	mls r3, r5, r11, r3
	smmulr r5, r4, r12
	mls r4, r5, r11, r4
	pkhbt r2, r3, r4, lsl #16
	str.w r2, [r0, #4]
	str.w r1, [r0], #8
	ldr.w r9, [r10], #4
	ldrsh.w r3, [r0, #2]
	ldrsh.w r4, [r0, #4]
	ldrsh.w r5, [r0, #6]
	ldrsh.w r2, [r0]
	smulbb r1, r9, r5
	smmulr r5, r1, r12
	mls r1, r5, r11, r1
	smmulr r5, r2, r12
	mls r2, r5, r11, r2
	pkhbt r1, r1, r2, lsl #16
	smmulr r5, r3, r12
	mls r3, r5, r11, r3
	smmulr r5, r4, r12
	mls r4, r5, r11, r4
	pkhbt r2, r3, r4, lsl #16
	str.w r2, [r0, #4]
	str.w r1, [r0], #8
	cmp.w r0, lr
	bne.w start_0
	pop {r4-r11, pc}
