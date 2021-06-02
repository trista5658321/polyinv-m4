.p2align 2,,3
.syntax unified
.text
wpad:
	.word 7681
	.word 559168
@ =012=
	.word -3383
	.word 4168811709
@ =34=
	.word 1
	.word 4073259009
	.word -3383
	.word 4168811709
	.word 1213
	.word 55705073
	.word -1925
	.word 38271296
	.word -527
	.word 182453590
	.word 849
	.word 4121491366
	.word -1728
	.word 4288612436
	.word 583
	.word 4134729395
@ =56=
	.word 1
	.word 4073259009
	.word -3383
	.word 4168811709
	.word 1213
	.word 55705073
	.word -1925
	.word 38271296
	.word -527
	.word 182453590
	.word 849
	.word 4121491366
	.word -1728
	.word 4288612436
	.word 583
	.word 4134729395
	.word 1366
	.word 173407926
	.word 2784
	.word 4146068626
	.word -2138
	.word 4055561535
	.word -2648
	.word 4271048502
	.word 2132
	.word 196610399
	.word -97
	.word 4177460136
	.word -2381
	.word 84282388
	.word -2446
	.word 44239068
	.word -330
	.word 178583692
	.word 2645
	.word 90633865
	.word -878
	.word 52428105
	.word -2273
	.word 90507091
	.word -2753
	.word 221574747
	.word -3654
	.word 4182639285
	.word 1846
	.word 47975426
	.word -365
	.word 4093119893
	.word 2399
	.word 4279107382
	.word 3000
	.word 4106158846
	.word -1112
	.word 4130143176
	.word -1794
	.word 4127788371
	.word 3092
	.word 4186505800
	.word 1286
	.word 4113172172
	.word 2268
	.word 4068998640
	.word 675
	.word 164426883
// void ntt512_16bit (int *v);
.global ntt512_16bit
.type ntt512_16bit, %function
ntt512_16bit:
	push {r4-r11, lr}
	adr.w r10, wpad
	ldm r10!, {r11-r12}
	vldm r10!, {s2-s3}
	add.w lr, r0, #1024
	vmov s0, s1, r0, lr
	add.w lr, r0, #128 @ 64
	vmov.w s4, s5, r10, lr
ntt2_layer_0_1_2:
	vmov.w r10, s2
	ldr.w r3, [r1, #128]
	ldr.w r4, [r1, #256]
	ldr.w r5, [r1, #384]
	ldr.w r2, [r1], #4
	smulbb r7, r10, r4
	smulbt r9, r10, r4
	smmulr lr, r7, r12
	mls r7, lr, r11, r7
	smmulr lr, r9, r12
	mls r9, lr, r11, r9
	pkhbt r7, r7, r9, lsl #16
	ssub16.w r8, r2, r7
	sadd16.w r6, r2, r7
	smulbb r7, r10, r5
	smulbt r9, r10, r5
	smmulr lr, r7, r12
	mls r7, lr, r11, r7
	smmulr lr, r9, r12
	mls r9, lr, r11, r9
	pkhbt r7, r7, r9, lsl #16
	ssub16.w r9, r3, r7
	sadd16.w r7, r3, r7
	sadd16.w lr, r2, r4
	ssub16.w r4, r2, r4
	sadd16.w r2, r3, r5
	ssub16.w r5, r3, r5
	sadd16.w r3, lr, r2
	ssub16.w r2, lr, r2
	str.w r3, [r0]
	str.w r2, [r0, #128]
	smulbb r2, r10, r5
	smulbt r5, r10, r5
	smmulr r3, r2, r12
	mls r2, r3, r11, r2
	smmulr r3, r5, r12
	mls r5, r3, r11, r5
	pkhbt r2, r2, r5, lsl #16
	ssub16.w r5, r4, r2
	sadd16.w r4, r4, r2
	vmov.w r10, s3
	smulbb r2, r10, r7
	smulbt r7, r10, r7
	smmulr r3, r2, r12
	mls r2, r3, r11, r2
	smmulr r3, r7, r12
	mls r7, r3, r11, r7
	pkhbt r2, r2, r7, lsl #16
	ssub16.w r7, r6, r2
	sadd16.w r6, r6, r2
	smultb r2, r10, r9
	smultt r9, r10, r9
	smmulr r3, r2, r12
	mls r2, r3, r11, r2
	smmulr r3, r9, r12
	mls r9, r3, r11, r9
	pkhbt r2, r2, r9, lsl #16
	ssub16.w r9, r8, r2
	sadd16.w r8, r8, r2
	str.w r4, [r0, #256]
	str.w r5, [r0, #384]
	str.w r6, [r0, #512]
	str.w r7, [r0, #640]
	str.w r8, [r0, #768]
	str.w r9, [r0, #896]
	add.w r0, r0, #4
	vmov.w lr, s5
	cmp.w r0, lr
	bne.w ntt2_layer_0_1_2
	vmov r10, s4
	vmov r0, lr, s0, s1
ntt2_layer_3_4:
	add.w lr, r0, #32 @ 16
	ldr.w r9, [r10, #4]
	ldr.w r8, [r10], #8
ntt2_layer_3_4inner:
	ldr.w r1, [r0]
	ldr.w r2, [r0, #32]
	ldr.w r3, [r0, #64]
	ldr.w r4, [r0, #96]
	smulbb r6, r8, r3
	smulbt r3, r8, r3
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	smmulr r7, r3, r12
	mls r3, r7, r11, r3
	pkhbt r6, r6, r3, lsl #16
	ssub16.w r3, r1, r6
	sadd16.w r1, r1, r6
	smulbb r6, r8, r4
	smulbt r4, r8, r4
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	pkhbt r6, r6, r4, lsl #16
	ssub16.w r4, r2, r6
	sadd16.w r2, r2, r6
	smulbb r6, r9, r2
	smulbt r2, r9, r2
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	smmulr r7, r2, r12
	mls r2, r7, r11, r2
	pkhbt r6, r6, r2, lsl #16
	ssub16.w r2, r1, r6
	sadd16.w r1, r1, r6
	smultb r6, r9, r4
	smultt r4, r9, r4
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	pkhbt r6, r6, r4, lsl #16
	ssub16.w r4, r3, r6
	sadd16.w r3, r3, r6
	str.w r2, [r0, #32]
	str.w r3, [r0, #64]
	str.w r4, [r0, #96]
	str.w r1, [r0], #4
	ldr.w r1, [r0]
	ldr.w r2, [r0, #32]
	ldr.w r3, [r0, #64]
	ldr.w r4, [r0, #96]
	smulbb r6, r8, r3
	smulbt r3, r8, r3
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	smmulr r7, r3, r12
	mls r3, r7, r11, r3
	pkhbt r6, r6, r3, lsl #16
	ssub16.w r3, r1, r6
	sadd16.w r1, r1, r6
	smulbb r6, r8, r4
	smulbt r4, r8, r4
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	pkhbt r6, r6, r4, lsl #16
	ssub16.w r4, r2, r6
	sadd16.w r2, r2, r6
	smulbb r6, r9, r2
	smulbt r2, r9, r2
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	smmulr r7, r2, r12
	mls r2, r7, r11, r2
	pkhbt r6, r6, r2, lsl #16
	ssub16.w r2, r1, r6
	sadd16.w r1, r1, r6
	smultb r6, r9, r4
	smultt r4, r9, r4
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	pkhbt r6, r6, r4, lsl #16
	ssub16.w r4, r3, r6
	sadd16.w r3, r3, r6
	str.w r2, [r0, #32]
	str.w r3, [r0, #64]
	str.w r4, [r0, #96]
	str.w r1, [r0], #4
	ldr.w r1, [r0]
	ldr.w r2, [r0, #32]
	ldr.w r3, [r0, #64]
	ldr.w r4, [r0, #96]
	smulbb r6, r8, r3
	smulbt r3, r8, r3
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	smmulr r7, r3, r12
	mls r3, r7, r11, r3
	pkhbt r6, r6, r3, lsl #16
	ssub16.w r3, r1, r6
	sadd16.w r1, r1, r6
	smulbb r6, r8, r4
	smulbt r4, r8, r4
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	pkhbt r6, r6, r4, lsl #16
	ssub16.w r4, r2, r6
	sadd16.w r2, r2, r6
	smulbb r6, r9, r2
	smulbt r2, r9, r2
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	smmulr r7, r2, r12
	mls r2, r7, r11, r2
	pkhbt r6, r6, r2, lsl #16
	ssub16.w r2, r1, r6
	sadd16.w r1, r1, r6
	smultb r6, r9, r4
	smultt r4, r9, r4
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	pkhbt r6, r6, r4, lsl #16
	ssub16.w r4, r3, r6
	sadd16.w r3, r3, r6
	str.w r2, [r0, #32]
	str.w r3, [r0, #64]
	str.w r4, [r0, #96]
	str.w r1, [r0], #4
	ldr.w r1, [r0]
	ldr.w r2, [r0, #32]
	ldr.w r3, [r0, #64]
	ldr.w r4, [r0, #96]
	smulbb r6, r8, r3
	smulbt r3, r8, r3
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	smmulr r7, r3, r12
	mls r3, r7, r11, r3
	pkhbt r6, r6, r3, lsl #16
	ssub16.w r3, r1, r6
	sadd16.w r1, r1, r6
	smulbb r6, r8, r4
	smulbt r4, r8, r4
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	pkhbt r6, r6, r4, lsl #16
	ssub16.w r4, r2, r6
	sadd16.w r2, r2, r6
	smulbb r6, r9, r2
	smulbt r2, r9, r2
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	smmulr r7, r2, r12
	mls r2, r7, r11, r2
	pkhbt r6, r6, r2, lsl #16
	ssub16.w r2, r1, r6
	sadd16.w r1, r1, r6
	smultb r6, r9, r4
	smultt r4, r9, r4
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	pkhbt r6, r6, r4, lsl #16
	ssub16.w r4, r3, r6
	sadd16.w r3, r3, r6
	str.w r2, [r0, #32]
	str.w r3, [r0, #64]
	str.w r4, [r0, #96]
	str.w r1, [r0], #4
	cmp.w r0, lr
	bne.w ntt2_layer_3_4inner
	add.w r0, r0, #96
	vmov lr, s1
	cmp.w r0, lr
	bne.w ntt2_layer_3_4
@ degree = 4
	vmov.w r0, s0
intt2_layer_5_6:
	ldr.w r9, [r10, #4]
	ldr.w r8, [r10], #8
	ldr.w r1, [r0]
	ldr.w r2, [r0, #8]
	ldr.w r3, [r0, #16]
	ldr.w r4, [r0, #24]
	smulbb r6, r8, r3
	smulbt r3, r8, r3
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	smmulr r7, r3, r12
	mls r3, r7, r11, r3
	pkhbt r6, r6, r3, lsl #16
	ssub16.w r3, r1, r6
	sadd16.w r1, r1, r6
	smulbb r6, r8, r4
	smulbt r4, r8, r4
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	pkhbt r6, r6, r4, lsl #16
	ssub16.w r4, r2, r6
	sadd16.w r2, r2, r6
	smulbb r6, r9, r2
	smulbt r2, r9, r2
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	smmulr r7, r2, r12
	mls r2, r7, r11, r2
	pkhbt r6, r6, r2, lsl #16
	ssub16.w r2, r1, r6
	sadd16.w r1, r1, r6
	smultb r6, r9, r4
	smultt r4, r9, r4
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	pkhbt r6, r6, r4, lsl #16
	ssub16.w r4, r3, r6
	sadd16.w r3, r3, r6
	str.w r2, [r0, #8]
	str.w r3, [r0, #16]
	str.w r4, [r0, #24]
	str.w r1, [r0], #4
	ldr.w r1, [r0]
	ldr.w r2, [r0, #8]
	ldr.w r3, [r0, #16]
	ldr.w r4, [r0, #24]
	smulbb r6, r8, r3
	smulbt r3, r8, r3
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	smmulr r7, r3, r12
	mls r3, r7, r11, r3
	pkhbt r6, r6, r3, lsl #16
	ssub16.w r3, r1, r6
	sadd16.w r1, r1, r6
	smulbb r6, r8, r4
	smulbt r4, r8, r4
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	pkhbt r6, r6, r4, lsl #16
	ssub16.w r4, r2, r6
	sadd16.w r2, r2, r6
	smulbb r6, r9, r2
	smulbt r2, r9, r2
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	smmulr r7, r2, r12
	mls r2, r7, r11, r2
	pkhbt r6, r6, r2, lsl #16
	ssub16.w r2, r1, r6
	sadd16.w r1, r1, r6
	smultb r6, r9, r4
	smultt r4, r9, r4
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	smmulr r7, r4, r12
	mls r4, r7, r11, r4
	pkhbt r6, r6, r4, lsl #16
	ssub16.w r4, r3, r6
	sadd16.w r3, r3, r6
	str.w r2, [r0, #8]
	str.w r3, [r0, #16]
	str.w r4, [r0, #24]
	str.w r1, [r0], #28
	cmp.w r0, lr
	bne.w intt2_layer_5_6
	pop {r4-r11, pc}
