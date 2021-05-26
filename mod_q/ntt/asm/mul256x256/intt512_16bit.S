.p2align 2,,3
.syntax unified
.text
wpad:
	.word 7681
	.word 559168
@ =56=
	.word 1
	.word 221708289
	.word 3383
	.word 4215474053
	.word 1925
	.word 113311161
	.word -1213
	.word 34602159
	.word -583
	.word 156043662
	.word 1728
	.word 4155244641
	.word -849
	.word 140118616
	.word 527
	.word 4205507872
	.word 2446
	.word 4146396509
	.word 2381
	.word 4092394234
	.word 97
	.word 72877826
	.word -2132
	.word 4137808968
	.word 2648
	.word 4173988205
	.word 2138
	.word 180424262
	.word -2784
	.word 57542881
	.word -1366
	.word 21689771
	.word -675
	.word 192804404
	.word -2268
	.word 34606457
	.word -1286
	.word 4180937430
	.word -3092
	.word 4256695927
	.word 1794
	.word 4071426551
	.word 1112
	.word 70781396
	.word -3000
	.word 4244769601
	.word -2399
	.word 13238515
	.word 365
	.word 4067101704
	.word -1846
	.word 4093574436
	.word 3654
	.word 4249552562
	.word 2753
	.word 161870540
	.word 2273
	.word 4172151451
	.word 878
	.word 45612257
	.word -2645
	.word 158857882
	.word 330
	.word 125105500
@ =34=
	.word 1
	.word 221708289
	.word 3383
	.word 4215474053
	.word 1925
	.word 113311161
	.word -1213
	.word 34602159
	.word -583
	.word 156043662
	.word 1728
	.word 4155244641
	.word -849
	.word 140118616
	.word 527
	.word 4205507872
@ =012=
	.word 3383
	.word 4215474053
// void intt512_16bit (int *v);
.global intt512_16bit
.type intt512_16bit, %function
intt512_16bit:
	push {r4-r11, lr}
	adr.w r10, wpad
	ldm r10!, {r11-r12}
	vmov.w s0, r0
	add.w lr, r0, #1024
@ degree = 4
	vmov r0, s0
intt2_layer_5_6:
	ldr.w r9, [r10, #4]
	ldr.w r8, [r10], #8
	ldr.w r1, [r0]
	ldr.w r2, [r0, #8]
	ldr.w r3, [r0, #16]
	ldr.w r4, [r0, #24]
	ssub16.w r6, r1, r2
	sadd16.w r1, r1, r2
	smulbb r2, r9, r6
	smmulr r7, r2, r12
	mls r2, r7, r11, r2
	smulbt r6, r9, r6
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r2, r2, r6, lsl #16
	ssub16.w r6, r3, r4
	sadd16.w r3, r3, r4
	smultb r4, r9, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	smultt r6, r9, r6
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r4, r4, r6, lsl #16
	ssub16.w r6, r1, r3
	sadd16.w r1, r1, r3
	smulbb r3, r8, r6
	smmulr r7, r3, r12
	mls r3, r7, r11, r3
	smulbt r6, r8, r6
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r3, r3, r6, lsl #16
	ssub16.w r6, r2, r4
	sadd16.w r2, r2, r4
	smulbb r4, r8, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	smulbt r6, r8, r6
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r4, r4, r6, lsl #16
	str.w r2, [r0, #8]
	str.w r3, [r0, #16]
	str.w r4, [r0, #24]
	str.w r1, [r0], #4
	ldr.w r1, [r0]
	ldr.w r2, [r0, #8]
	ldr.w r3, [r0, #16]
	ldr.w r4, [r0, #24]
	ssub16.w r6, r1, r2
	sadd16.w r1, r1, r2
	smulbb r2, r9, r6
	smmulr r7, r2, r12
	mls r2, r7, r11, r2
	smulbt r6, r9, r6
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r2, r2, r6, lsl #16
	ssub16.w r6, r3, r4
	sadd16.w r3, r3, r4
	smultb r4, r9, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	smultt r6, r9, r6
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r4, r4, r6, lsl #16
	ssub16.w r6, r1, r3
	sadd16.w r1, r1, r3
	smulbb r3, r8, r6
	smmulr r7, r3, r12
	mls r3, r7, r11, r3
	smulbt r6, r8, r6
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r3, r3, r6, lsl #16
	ssub16.w r6, r2, r4
	sadd16.w r2, r2, r4
	smulbb r4, r8, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	smulbt r6, r8, r6
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r4, r4, r6, lsl #16
	str.w r2, [r0, #8]
	str.w r3, [r0, #16]
	str.w r4, [r0, #24]
	str.w r1, [r0], #28
	cmp.w r0, lr
	bne.w intt2_layer_5_6
@ degree = 16
	vmov r0, s0
intt2_layer_3_4:
	ldr.w r9, [r10, #4]
	ldr.w r8, [r10], #8
	ldr.w r1, [r0]
	ldr.w r2, [r0, #32]
	ldr.w r3, [r0, #64]
	ldr.w r4, [r0, #96]
	ssub16.w r6, r1, r2
	sadd16.w r1, r1, r2
	smulbb r2, r9, r6
	smmulr r7, r2, r12
	mls r2, r7, r11, r2
	smulbt r6, r9, r6
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r2, r2, r6, lsl #16
	ssub16.w r6, r3, r4
	sadd16.w r3, r3, r4
	smultb r4, r9, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	smultt r6, r9, r6
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
	smlawb.w r7, r12, r3, r5
	smlawt.w r6, r12, r3, r5
	smulbt.w r7, r11, r7
	smulbt.w r6, r11, r6
	pkhbt.w r7, r7, r6, LSL #16
	ssub16.w r3, r3, r7
	ssub16.w r6, r1, r3
	sadd16.w r1, r1, r3
	smulbb r3, r8, r6
	smmulr r7, r3, r12
	mls r3, r7, r11, r3
	smulbt r6, r8, r6
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r3, r3, r6, lsl #16
	ssub16.w r6, r2, r4
	sadd16.w r2, r2, r4
	smulbb r4, r8, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	smulbt r6, r8, r6
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r4, r4, r6, lsl #16
	str.w r2, [r0, #32]
	str.w r3, [r0, #64]
	str.w r4, [r0, #96]
	str.w r1, [r0], #4
	ldr.w r1, [r0]
	ldr.w r2, [r0, #32]
	ldr.w r3, [r0, #64]
	ldr.w r4, [r0, #96]
	ssub16.w r6, r1, r2
	sadd16.w r1, r1, r2
	smulbb r2, r9, r6
	smmulr r7, r2, r12
	mls r2, r7, r11, r2
	smulbt r6, r9, r6
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r2, r2, r6, lsl #16
	ssub16.w r6, r3, r4
	sadd16.w r3, r3, r4
	smultb r4, r9, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	smultt r6, r9, r6
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
	smlawb.w r7, r12, r3, r5
	smlawt.w r6, r12, r3, r5
	smulbt.w r7, r11, r7
	smulbt.w r6, r11, r6
	pkhbt.w r7, r7, r6, LSL #16
	ssub16.w r3, r3, r7
	ssub16.w r6, r1, r3
	sadd16.w r1, r1, r3
	smulbb r3, r8, r6
	smmulr r7, r3, r12
	mls r3, r7, r11, r3
	smulbt r6, r8, r6
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r3, r3, r6, lsl #16
	ssub16.w r6, r2, r4
	sadd16.w r2, r2, r4
	smulbb r4, r8, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	smulbt r6, r8, r6
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r4, r4, r6, lsl #16
	str.w r2, [r0, #32]
	str.w r3, [r0, #64]
	str.w r4, [r0, #96]
	str.w r1, [r0], #4
	ldr.w r1, [r0]
	ldr.w r2, [r0, #32]
	ldr.w r3, [r0, #64]
	ldr.w r4, [r0, #96]
	ssub16.w r6, r1, r2
	sadd16.w r1, r1, r2
	smulbb r2, r9, r6
	smmulr r7, r2, r12
	mls r2, r7, r11, r2
	smulbt r6, r9, r6
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r2, r2, r6, lsl #16
	ssub16.w r6, r3, r4
	sadd16.w r3, r3, r4
	smultb r4, r9, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	smultt r6, r9, r6
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
	smlawb.w r7, r12, r3, r5
	smlawt.w r6, r12, r3, r5
	smulbt.w r7, r11, r7
	smulbt.w r6, r11, r6
	pkhbt.w r7, r7, r6, LSL #16
	ssub16.w r3, r3, r7
	ssub16.w r6, r1, r3
	sadd16.w r1, r1, r3
	smulbb r3, r8, r6
	smmulr r7, r3, r12
	mls r3, r7, r11, r3
	smulbt r6, r8, r6
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r3, r3, r6, lsl #16
	ssub16.w r6, r2, r4
	sadd16.w r2, r2, r4
	smulbb r4, r8, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	smulbt r6, r8, r6
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r4, r4, r6, lsl #16
	str.w r2, [r0, #32]
	str.w r3, [r0, #64]
	str.w r4, [r0, #96]
	str.w r1, [r0], #4
	ldr.w r1, [r0]
	ldr.w r2, [r0, #32]
	ldr.w r3, [r0, #64]
	ldr.w r4, [r0, #96]
	ssub16.w r6, r1, r2
	sadd16.w r1, r1, r2
	smulbb r2, r9, r6
	smmulr r7, r2, r12
	mls r2, r7, r11, r2
	smulbt r6, r9, r6
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r2, r2, r6, lsl #16
	ssub16.w r6, r3, r4
	sadd16.w r3, r3, r4
	smultb r4, r9, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	smultt r6, r9, r6
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
	smlawb.w r7, r12, r3, r5
	smlawt.w r6, r12, r3, r5
	smulbt.w r7, r11, r7
	smulbt.w r6, r11, r6
	pkhbt.w r7, r7, r6, LSL #16
	ssub16.w r3, r3, r7
	ssub16.w r6, r1, r3
	sadd16.w r1, r1, r3
	smulbb r3, r8, r6
	smmulr r7, r3, r12
	mls r3, r7, r11, r3
	smulbt r6, r8, r6
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r3, r3, r6, lsl #16
	ssub16.w r6, r2, r4
	sadd16.w r2, r2, r4
	smulbb r4, r8, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	smulbt r6, r8, r6
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r4, r4, r6, lsl #16
	str.w r2, [r0, #32]
	str.w r3, [r0, #64]
	str.w r4, [r0, #96]
	str.w r1, [r0], #4
	ldr.w r1, [r0]
	ldr.w r2, [r0, #32]
	ldr.w r3, [r0, #64]
	ldr.w r4, [r0, #96]
	ssub16.w r6, r1, r2
	sadd16.w r1, r1, r2
	smulbb r2, r9, r6
	smmulr r7, r2, r12
	mls r2, r7, r11, r2
	smulbt r6, r9, r6
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r2, r2, r6, lsl #16
	ssub16.w r6, r3, r4
	sadd16.w r3, r3, r4
	smultb r4, r9, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	smultt r6, r9, r6
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
	smlawb.w r7, r12, r3, r5
	smlawt.w r6, r12, r3, r5
	smulbt.w r7, r11, r7
	smulbt.w r6, r11, r6
	pkhbt.w r7, r7, r6, LSL #16
	ssub16.w r3, r3, r7
	ssub16.w r6, r1, r3
	sadd16.w r1, r1, r3
	smulbb r3, r8, r6
	smmulr r7, r3, r12
	mls r3, r7, r11, r3
	smulbt r6, r8, r6
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r3, r3, r6, lsl #16
	ssub16.w r6, r2, r4
	sadd16.w r2, r2, r4
	smulbb r4, r8, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	smulbt r6, r8, r6
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r4, r4, r6, lsl #16
	str.w r2, [r0, #32]
	str.w r3, [r0, #64]
	str.w r4, [r0, #96]
	str.w r1, [r0], #4
	ldr.w r1, [r0]
	ldr.w r2, [r0, #32]
	ldr.w r3, [r0, #64]
	ldr.w r4, [r0, #96]
	ssub16.w r6, r1, r2
	sadd16.w r1, r1, r2
	smulbb r2, r9, r6
	smmulr r7, r2, r12
	mls r2, r7, r11, r2
	smulbt r6, r9, r6
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r2, r2, r6, lsl #16
	ssub16.w r6, r3, r4
	sadd16.w r3, r3, r4
	smultb r4, r9, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	smultt r6, r9, r6
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
	smlawb.w r7, r12, r3, r5
	smlawt.w r6, r12, r3, r5
	smulbt.w r7, r11, r7
	smulbt.w r6, r11, r6
	pkhbt.w r7, r7, r6, LSL #16
	ssub16.w r3, r3, r7
	ssub16.w r6, r1, r3
	sadd16.w r1, r1, r3
	smulbb r3, r8, r6
	smmulr r7, r3, r12
	mls r3, r7, r11, r3
	smulbt r6, r8, r6
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r3, r3, r6, lsl #16
	ssub16.w r6, r2, r4
	sadd16.w r2, r2, r4
	smulbb r4, r8, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	smulbt r6, r8, r6
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r4, r4, r6, lsl #16
	str.w r2, [r0, #32]
	str.w r3, [r0, #64]
	str.w r4, [r0, #96]
	str.w r1, [r0], #4
	ldr.w r1, [r0]
	ldr.w r2, [r0, #32]
	ldr.w r3, [r0, #64]
	ldr.w r4, [r0, #96]
	ssub16.w r6, r1, r2
	sadd16.w r1, r1, r2
	smulbb r2, r9, r6
	smmulr r7, r2, r12
	mls r2, r7, r11, r2
	smulbt r6, r9, r6
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r2, r2, r6, lsl #16
	ssub16.w r6, r3, r4
	sadd16.w r3, r3, r4
	smultb r4, r9, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	smultt r6, r9, r6
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
	smlawb.w r7, r12, r3, r5
	smlawt.w r6, r12, r3, r5
	smulbt.w r7, r11, r7
	smulbt.w r6, r11, r6
	pkhbt.w r7, r7, r6, LSL #16
	ssub16.w r3, r3, r7
	ssub16.w r6, r1, r3
	sadd16.w r1, r1, r3
	smulbb r3, r8, r6
	smmulr r7, r3, r12
	mls r3, r7, r11, r3
	smulbt r6, r8, r6
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r3, r3, r6, lsl #16
	ssub16.w r6, r2, r4
	sadd16.w r2, r2, r4
	smulbb r4, r8, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	smulbt r6, r8, r6
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r4, r4, r6, lsl #16
	str.w r2, [r0, #32]
	str.w r3, [r0, #64]
	str.w r4, [r0, #96]
	str.w r1, [r0], #4
	ldr.w r1, [r0]
	ldr.w r2, [r0, #32]
	ldr.w r3, [r0, #64]
	ldr.w r4, [r0, #96]
	ssub16.w r6, r1, r2
	sadd16.w r1, r1, r2
	smulbb r2, r9, r6
	smmulr r7, r2, r12
	mls r2, r7, r11, r2
	smulbt r6, r9, r6
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r2, r2, r6, lsl #16
	ssub16.w r6, r3, r4
	sadd16.w r3, r3, r4
	smultb r4, r9, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	smultt r6, r9, r6
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
	smlawb.w r7, r12, r3, r5
	smlawt.w r6, r12, r3, r5
	smulbt.w r7, r11, r7
	smulbt.w r6, r11, r6
	pkhbt.w r7, r7, r6, LSL #16
	ssub16.w r3, r3, r7
	ssub16.w r6, r1, r3
	sadd16.w r1, r1, r3
	smulbb r3, r8, r6
	smmulr r7, r3, r12
	mls r3, r7, r11, r3
	smulbt r6, r8, r6
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r3, r3, r6, lsl #16
	ssub16.w r6, r2, r4
	sadd16.w r2, r2, r4
	smulbb r4, r8, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	smulbt r6, r8, r6
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	pkhbt r4, r4, r6, lsl #16
	str.w r2, [r0, #32]
	str.w r3, [r0, #64]
	str.w r4, [r0, #96]
	str.w r1, [r0], #100
	cmp.w r0, lr
	bne.w intt2_layer_3_4
	vmov.w r0, s0
	ldr.w r2, [r10, #4]
	ldr.w r1, [r10], #8
	vmov s4, s5, r1, r2
	add.w lr, r0, #128 @ 64
	vmov.w s3, lr
intt2_layer_0_1_2:
	vmov.w r1, r2, s4, s5
	ldr.w r7, [r0, #512]
	ldr.w r8, [r0, #640]
	ldr.w r9, [r0, #768]
	ldr.w r10, [r0, #896]
	ssub16.w r5, r7, r8
	sadd16.w r7, r7, r8
	smulbb r8, r2, r5
	smmulr r6, r8, r12
	mls r8, r6, r11, r8
	smulbt r5, r2, r5
	smmulr r6, r5, r12
	mls r5, r6, r11, r5
	pkhbt r8, r8, r5, lsl #16
	ssub16.w r5, r9, r10
	sadd16.w r9, r9, r10
	smultb r10, r2, r5
	smmulr r6, r10, r12
	mls r10, r6, r11, r10
	smultt r5, r2, r5
	smmulr r6, r5, r12
	mls r5, r6, r11, r5
	pkhbt r10, r10, r5, lsl #16
	ssub16.w r5, r7, r9
	sadd16.w r7, r7, r9
	smulbb r9, r1, r5
	smmulr r6, r9, r12
	mls r9, r6, r11, r9
	smulbt r5, r1, r5
	smmulr r6, r5, r12
	mls r5, r6, r11, r5
	pkhbt r9, r9, r5, lsl #16
	ssub16.w r5, r8, r10
	sadd16.w r8, r8, r10
	smulbb r10, r1, r5
	smmulr r6, r10, r12
	mls r10, r6, r11, r10
	smulbt r5, r1, r5
	smmulr r6, r5, r12
	mls r5, r6, r11, r5
	pkhbt r10, r10, r5, lsl #16
	ldr.w r2, [r0]
	ldr.w r3, [r0, #128]
	ldr.w r4, [r0, #256]
	ldr.w r5, [r0, #384]
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
	smlawb.w r3, r12, r4, lr
	smlawt.w r6, r12, r4, lr
	smulbt.w r3, r11, r3
	smulbt.w r6, r11, r6
	pkhbt.w r3, r3, r6, LSL #16
	ssub16.w r4, r4, r3
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
	str.w r4, [r0, #128]
	str.w r5, [r0, #256]
	str.w r6, [r0, #384]
	str.w r7, [r0, #512]
	str.w r8, [r0, #640]
	str.w r9, [r0, #768]
	str.w r10, [r0, #896]
	str.w r3, [r0], #4
	vmov.w lr, s3
	cmp.w r0, lr
	bne.w intt2_layer_0_1_2
	pop {r4-r11, pc}
