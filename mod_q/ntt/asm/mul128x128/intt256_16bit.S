.p2align 2,,3
.syntax unified
.text
wpad:
	.word 769
	.word 5585133
@ =56=
	.word 1
	.word 4290904065
	.word -62
	.word 4292411219
	.word -173
	.word 3800777
	.word -40
	.word 8978405
	.word -311
	.word 4292214425
	.word 57
	.word 4278583114
	.word -27
	.word 19660944
	.word 136
	.word 4270325456
	.word -359
	.word 4282056794
	.word -43
	.word 16121666
	.word -182
	.word 4278451918
	.word -251
	.word 4290838405
	.word 144
	.word 4293394420
	.word 300
	.word 4276092697
	.word -304
	.word 5635983
	.word -377
	.word 4288807236
	.word 90
	.word 22609716
	.word -197
	.word 4275437486
	.word -190
	.word 4288937601
	.word 245
	.word 4291035261
	.word -306
	.word 20512949
	.word -253
	.word 4274061528
	.word -123
	.word 21036902
	.word -64
	.word 589551
	.word -12
	.word 13107296
	.word -25
	.word 327990
	.word -231
	.word 5832839
	.word -289
	.word 4293918435
	.word -113
	.word 4276420749
	.word 85
	.word 4278124759
	.word 324
	.word 22806510
	.word -94
	.word 4291756070
@ =34=
	.word 1
	.word 4290904065
	.word -62
	.word 4292411219
	.word -173
	.word 3800777
	.word -40
	.word 8978405
	.word -311
	.word 4292214425
	.word 57
	.word 4278583114
	.word -27
	.word 19660944
	.word 136
	.word 4270325456
@ =012=
	.word -62
	.word 4292411219
// void intt256_16bit (int *v);
.global intt256_16bit
.type intt256_16bit, %function
intt256_16bit:
	push {r4-r11, lr}
	adr.w r10, wpad
	ldm r10!, {r11-r12}
	vmov.w s0, r0
	add.w lr, r0, #512
@ degree = 2
	vmov.w r0, s0
intt2_layer_5_6:
	ldr.w r9, [r10, #4]
	ldr.w r8, [r10], #8
	ldr.w r1, [r0]
	ldr.w r2, [r0, #4]
	ldr.w r3, [r0, #8]
	ldr.w r4, [r0, #12]
	ssub16.w r6, r1, r2
	sadd16.w r1, r1, r2
	smulbb r2, r9, r6
	smulbt r6, r9, r6
	smmulr r7, r2, r12
	mls r2, r7, r11, r2
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r2, r2, r6, lsl #16
	ssub16.w r6, r3, r4
	sadd16.w r3, r3, r4
	smultb r4, r9, r6
	smultt r6, r9, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r4, r4, r6, lsl #16
	ssub16.w r6, r1, r3
	sadd16.w r1, r1, r3
	smulbb r3, r8, r6
	smulbt r6, r8, r6
	smmulr r7, r3, r12
	mls r3, r7, r11, r3
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r3, r3, r6, lsl #16
	ssub16.w r6, r2, r4
	sadd16.w r2, r2, r4
	smulbb r4, r8, r6
	smulbt r6, r8, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r4, r4, r6, lsl #16
@ reduce layer
	movw.w r5, #32768
	smlawb.w r7, r12, r1, r5
	smlawt.w r6, r12, r1, r5
	smulbt.w r7, r11, r7
	smulbt.w r6, r11, r6
	pkhbt.w r7, r7, r6, LSL #16
	ssub16.w r1, r1, r7
	str.w r2, [r0, #4]
	str.w r3, [r0, #8]
	str.w r4, [r0, #12]
	str.w r1, [r0], #16
	cmp.w r0, lr
	bne.w intt2_layer_5_6
@ degree = 8
	vmov.w r0, s0
intt2_layer_3_4:
	ldr.w r9, [r10, #4]
	ldr.w r8, [r10], #8
	ldr.w r1, [r0]
	ldr.w r2, [r0, #16]
	ldr.w r3, [r0, #32]
	ldr.w r4, [r0, #48]
	ssub16.w r6, r1, r2
	sadd16.w r1, r1, r2
	smulbb r2, r9, r6
	smulbt r6, r9, r6
	smmulr r7, r2, r12
	mls r2, r7, r11, r2
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r2, r2, r6, lsl #16
	ssub16.w r6, r3, r4
	sadd16.w r3, r3, r4
	smultb r4, r9, r6
	smultt r6, r9, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r4, r4, r6, lsl #16
	ssub16.w r6, r1, r3
	sadd16.w r1, r1, r3
	smulbb r3, r8, r6
	smulbt r6, r8, r6
	smmulr r7, r3, r12
	mls r3, r7, r11, r3
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r3, r3, r6, lsl #16
	ssub16.w r6, r2, r4
	sadd16.w r2, r2, r4
	smulbb r4, r8, r6
	smulbt r6, r8, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r4, r4, r6, lsl #16
@ reduce layer
	movw.w r5, #32768
	smlawb.w r7, r12, r1, r5
	smlawt.w r6, r12, r1, r5
	smulbt.w r7, r11, r7
	smulbt.w r6, r11, r6
	pkhbt.w r7, r7, r6, LSL #16
	ssub16.w r1, r1, r7
	str.w r2, [r0, #16]
	str.w r3, [r0, #32]
	str.w r4, [r0, #48]
	str.w r1, [r0], #4
	ldr.w r1, [r0]
	ldr.w r2, [r0, #16]
	ldr.w r3, [r0, #32]
	ldr.w r4, [r0, #48]
	ssub16.w r6, r1, r2
	sadd16.w r1, r1, r2
	smulbb r2, r9, r6
	smulbt r6, r9, r6
	smmulr r7, r2, r12
	mls r2, r7, r11, r2
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r2, r2, r6, lsl #16
	ssub16.w r6, r3, r4
	sadd16.w r3, r3, r4
	smultb r4, r9, r6
	smultt r6, r9, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r4, r4, r6, lsl #16
	ssub16.w r6, r1, r3
	sadd16.w r1, r1, r3
	smulbb r3, r8, r6
	smulbt r6, r8, r6
	smmulr r7, r3, r12
	mls r3, r7, r11, r3
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r3, r3, r6, lsl #16
	ssub16.w r6, r2, r4
	sadd16.w r2, r2, r4
	smulbb r4, r8, r6
	smulbt r6, r8, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r4, r4, r6, lsl #16
@ reduce layer
	movw.w r5, #32768
	smlawb.w r7, r12, r1, r5
	smlawt.w r6, r12, r1, r5
	smulbt.w r7, r11, r7
	smulbt.w r6, r11, r6
	pkhbt.w r7, r7, r6, LSL #16
	ssub16.w r1, r1, r7
	str.w r2, [r0, #16]
	str.w r3, [r0, #32]
	str.w r4, [r0, #48]
	str.w r1, [r0], #4
	ldr.w r1, [r0]
	ldr.w r2, [r0, #16]
	ldr.w r3, [r0, #32]
	ldr.w r4, [r0, #48]
	ssub16.w r6, r1, r2
	sadd16.w r1, r1, r2
	smulbb r2, r9, r6
	smulbt r6, r9, r6
	smmulr r7, r2, r12
	mls r2, r7, r11, r2
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r2, r2, r6, lsl #16
	ssub16.w r6, r3, r4
	sadd16.w r3, r3, r4
	smultb r4, r9, r6
	smultt r6, r9, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r4, r4, r6, lsl #16
	ssub16.w r6, r1, r3
	sadd16.w r1, r1, r3
	smulbb r3, r8, r6
	smulbt r6, r8, r6
	smmulr r7, r3, r12
	mls r3, r7, r11, r3
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r3, r3, r6, lsl #16
	ssub16.w r6, r2, r4
	sadd16.w r2, r2, r4
	smulbb r4, r8, r6
	smulbt r6, r8, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r4, r4, r6, lsl #16
@ reduce layer
	movw.w r5, #32768
	smlawb.w r7, r12, r1, r5
	smlawt.w r6, r12, r1, r5
	smulbt.w r7, r11, r7
	smulbt.w r6, r11, r6
	pkhbt.w r7, r7, r6, LSL #16
	ssub16.w r1, r1, r7
	str.w r2, [r0, #16]
	str.w r3, [r0, #32]
	str.w r4, [r0, #48]
	str.w r1, [r0], #4
	ldr.w r1, [r0]
	ldr.w r2, [r0, #16]
	ldr.w r3, [r0, #32]
	ldr.w r4, [r0, #48]
	ssub16.w r6, r1, r2
	sadd16.w r1, r1, r2
	smulbb r2, r9, r6
	smulbt r6, r9, r6
	smmulr r7, r2, r12
	mls r2, r7, r11, r2
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r2, r2, r6, lsl #16
	ssub16.w r6, r3, r4
	sadd16.w r3, r3, r4
	smultb r4, r9, r6
	smultt r6, r9, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r4, r4, r6, lsl #16
	ssub16.w r6, r1, r3
	sadd16.w r1, r1, r3
	smulbb r3, r8, r6
	smulbt r6, r8, r6
	smmulr r7, r3, r12
	mls r3, r7, r11, r3
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r3, r3, r6, lsl #16
	ssub16.w r6, r2, r4
	sadd16.w r2, r2, r4
	smulbb r4, r8, r6
	smulbt r6, r8, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r4, r4, r6, lsl #16
@ reduce layer
	movw.w r5, #32768
	smlawb.w r7, r12, r1, r5
	smlawt.w r6, r12, r1, r5
	smulbt.w r7, r11, r7
	smulbt.w r6, r11, r6
	pkhbt.w r7, r7, r6, LSL #16
	ssub16.w r1, r1, r7
	str.w r2, [r0, #16]
	str.w r3, [r0, #32]
	str.w r4, [r0, #48]
	str.w r1, [r0], #52
	cmp.w r0, lr
	bne.w intt2_layer_3_4
	vmov.w r0, s0
	ldr.w r2, [r10, #4]
	ldr.w r1, [r10], #8
	vmov s4, s5, r1, r2
	add.w lr, r0, #64 @ 32
	vmov.w s3, lr
intt2_layer_0_1_2:
	vmov.w r1, r2, s4, s5
	ldr.w r7, [r0, #256]
	ldr.w r8, [r0, #320]
	ldr.w r9, [r0, #384]
	ldr.w r10, [r0, #448]
	ssub16.w r5, r7, r8
	sadd16.w r7, r7, r8
	smulbb r8, r2, r5
	smulbt r5, r2, r5
	smmulr r6, r8, r12
	mls r8, r6, r11, r8
	smmulr r6, r5, r12
	mls r5, r6, r11, r5
	pkhbt r8, r8, r5, lsl #16
	ssub16.w r5, r9, r10
	sadd16.w r9, r9, r10
	smultb r10, r2, r5
	smultt r5, r2, r5
	smmulr r6, r10, r12
	mls r10, r6, r11, r10
	smmulr r6, r5, r12
	mls r5, r6, r11, r5
	pkhbt r10, r10, r5, lsl #16
	ssub16.w r5, r7, r9
	sadd16.w r7, r7, r9
	smulbb r9, r1, r5
	smulbt r5, r1, r5
	smmulr r6, r9, r12
	mls r9, r6, r11, r9
	smmulr r6, r5, r12
	mls r5, r6, r11, r5
	pkhbt r9, r9, r5, lsl #16
	ssub16.w r5, r8, r10
	sadd16.w r8, r8, r10
	smulbb r10, r1, r5
	smulbt r5, r1, r5
	smmulr r6, r10, r12
	mls r10, r6, r11, r10
	smmulr r6, r5, r12
	mls r5, r6, r11, r5
	pkhbt r10, r10, r5, lsl #16
	ldr.w r2, [r0]
	ldr.w r3, [r0, #64]
	ldr.w r4, [r0, #128]
	ldr.w r5, [r0, #192]
	ssub16.w r6, r4, r5
	sadd16.w r4, r4, r5
	smulbb r5, r1, r6
	smulbt r6, r1, r6
	smmulr r1, r5, r12
	mls r5, r1, r11, r5
	smmulr r1, r6, r12
	mls r6, r1, r11, r6
	pkhbt r5, r5, r6, lsl #16
	sadd16.w r1, r2, r3
	ssub16.w r3, r2, r3
	sadd16.w r2, r1, r4
	ssub16.w r4, r1, r4
	sadd16.w r1, r3, r5
	ssub16.w r5, r3, r5
@reduction:
	movw.w lr, #32768
	smlawb.w r3, r12, r2, lr
	smlawt.w r6, r12, r2, lr
	smulbt.w r3, r11, r3
	smulbt.w r6, r11, r6
	pkhbt.w r3, r3, r6, LSL #16
	ssub16.w r2, r2, r3
	smlawb.w r3, r12, r7, lr
	smlawt.w r6, r12, r7, lr
	smulbt.w r3, r11, r3
	smulbt.w r6, r11, r6
	pkhbt.w r3, r3, r6, LSL #16
	ssub16.w r7, r7, r3
	@ layer 0
	sadd16.w r6, r5, r10
	ssub16.w r10, r5, r10
	sadd16.w r5, r4, r9
	ssub16.w r9, r4, r9
	sadd16.w r4, r1, r8
	ssub16.w r8, r1, r8
	sadd16.w r3, r2, r7
	ssub16.w r7, r2, r7
	str.w r4, [r0, #64]
	str.w r5, [r0, #128]
	str.w r6, [r0, #192]
	str.w r7, [r0, #256]
	str.w r8, [r0, #320]
	str.w r9, [r0, #384]
	str.w r10, [r0, #448]
	str.w r3, [r0], #4
	vmov.w lr, s3
	cmp.w r0, lr
	bne.w intt2_layer_0_1_2
	pop {r4-r11, pc}
