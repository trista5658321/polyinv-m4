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
// void basemul512_16bit_4x4 (int *h, int *f, int *g);
.global basemul512_16bit_4x4
.type basemul512_16bit_4x4, %function
basemul512_16bit_4x4:
	push {r4-r11, lr}
	adr.w r3, wpad
	ldm r3!, {r11-r12}
	add.w r4, r0, #1024
	vmov s3, s4, r3, r4
start_0:
	ldr.w r10, [r3], #4
	ldr.w r5, [r1, #4]
	ldr.w r4, [r1], #8
	ldr.w r7, [r2, #4]
	ldr.w r8, [r2, #2]
	ldr.w r6, [r2], #8
	vmov.w s3, r3
	smulbb r3, r4, r6
	smuadx lr, r4, r6
	smulbb r9, r5, r6
	smladx r9, r4, r8, r9
	smuadx r8, r5, r8
	smlatt r8, r4, r7, r8
	smuadx r6, r5, r6
	smladx r6, r4, r7, r6
	smuadx r4, r5, r7
	smultt r7, r5, r7
	smmulr r5, r8, r12
	mls r8, r5, r11, r8
	smlabb r3, r10, r8, r3
	smmulr r5, r4, r12
	mls r4, r5, r11, r4
	smlabb lr, r10, r4, lr
	smmulr r5, r7, r12
	mls r7, r5, r11, r7
	smlabb r9, r10, r7, r9
	smmulr r5, r3, r12
	mls r3, r5, r11, r3
	smmulr r5, lr, r12
	mls lr, r5, r11, lr
	pkhbt r3, r3, lr, lsl #16
	smmulr r5, r9, r12
	mls r9, r5, r11, r9
	smmulr r5, r6, r12
	mls r6, r5, r11, r6
	pkhbt r4, r9, r6, lsl #16
	str.w r4, [r0, #4]
	str.w r3, [r0], #8
	vmov.w r3, s3
	ldr.w r10, [r3], #4
	ldr.w r5, [r1, #4]
	ldr.w r4, [r1], #8
	ldr.w r7, [r2, #4]
	ldr.w r8, [r2, #2]
	ldr.w r6, [r2], #8
	vmov.w s3, r3
	smulbb r3, r4, r6
	smuadx lr, r4, r6
	smulbb r9, r5, r6
	smladx r9, r4, r8, r9
	smuadx r8, r5, r8
	smlatt r8, r4, r7, r8
	smuadx r6, r5, r6
	smladx r6, r4, r7, r6
	smuadx r4, r5, r7
	smultt r7, r5, r7
	smmulr r5, r8, r12
	mls r8, r5, r11, r8
	smlabb r3, r10, r8, r3
	smmulr r5, r4, r12
	mls r4, r5, r11, r4
	smlabb lr, r10, r4, lr
	smmulr r5, r7, r12
	mls r7, r5, r11, r7
	smlabb r9, r10, r7, r9
	smmulr r5, r3, r12
	mls r3, r5, r11, r3
	smmulr r5, lr, r12
	mls lr, r5, r11, lr
	pkhbt r3, r3, lr, lsl #16
	smmulr r5, r9, r12
	mls r9, r5, r11, r9
	smmulr r5, r6, r12
	mls r6, r5, r11, r6
	pkhbt r4, r9, r6, lsl #16
	str.w r4, [r0, #4]
	str.w r3, [r0], #8
	vmov.w r3, s3
	ldr.w r10, [r3], #4
	ldr.w r5, [r1, #4]
	ldr.w r4, [r1], #8
	ldr.w r7, [r2, #4]
	ldr.w r8, [r2, #2]
	ldr.w r6, [r2], #8
	vmov.w s3, r3
	smulbb r3, r4, r6
	smuadx lr, r4, r6
	smulbb r9, r5, r6
	smladx r9, r4, r8, r9
	smuadx r8, r5, r8
	smlatt r8, r4, r7, r8
	smuadx r6, r5, r6
	smladx r6, r4, r7, r6
	smuadx r4, r5, r7
	smultt r7, r5, r7
	smmulr r5, r8, r12
	mls r8, r5, r11, r8
	smlabb r3, r10, r8, r3
	smmulr r5, r4, r12
	mls r4, r5, r11, r4
	smlabb lr, r10, r4, lr
	smmulr r5, r7, r12
	mls r7, r5, r11, r7
	smlabb r9, r10, r7, r9
	smmulr r5, r3, r12
	mls r3, r5, r11, r3
	smmulr r5, lr, r12
	mls lr, r5, r11, lr
	pkhbt r3, r3, lr, lsl #16
	smmulr r5, r9, r12
	mls r9, r5, r11, r9
	smmulr r5, r6, r12
	mls r6, r5, r11, r6
	pkhbt r4, r9, r6, lsl #16
	str.w r4, [r0, #4]
	str.w r3, [r0], #8
	vmov.w r3, s3
	ldr.w r10, [r3], #4
	ldr.w r5, [r1, #4]
	ldr.w r4, [r1], #8
	ldr.w r7, [r2, #4]
	ldr.w r8, [r2, #2]
	ldr.w r6, [r2], #8
	vmov.w s3, r3
	smulbb r3, r4, r6
	smuadx lr, r4, r6
	smulbb r9, r5, r6
	smladx r9, r4, r8, r9
	smuadx r8, r5, r8
	smlatt r8, r4, r7, r8
	smuadx r6, r5, r6
	smladx r6, r4, r7, r6
	smuadx r4, r5, r7
	smultt r7, r5, r7
	smmulr r5, r8, r12
	mls r8, r5, r11, r8
	smlabb r3, r10, r8, r3
	smmulr r5, r4, r12
	mls r4, r5, r11, r4
	smlabb lr, r10, r4, lr
	smmulr r5, r7, r12
	mls r7, r5, r11, r7
	smlabb r9, r10, r7, r9
	smmulr r5, r3, r12
	mls r3, r5, r11, r3
	smmulr r5, lr, r12
	mls lr, r5, r11, lr
	pkhbt r3, r3, lr, lsl #16
	smmulr r5, r9, r12
	mls r9, r5, r11, r9
	smmulr r5, r6, r12
	mls r6, r5, r11, r6
	pkhbt r4, r9, r6, lsl #16
	str.w r4, [r0, #4]
	str.w r3, [r0], #8
	vmov r3, r4, s3, s4
	cmp.w r0, r4
	bne.w start_0
	pop {r4-r11, pc}
