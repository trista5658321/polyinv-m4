.p2align 2,,3
.syntax unified
.text
wpad:
	.word 769
	.word 5585133
@ =012=
	.word 62
	.word 11337768
@ =34=
	.word 1
	.word 4063233
	.word 62
	.word 11337768
	.word 40
	.word 1834872
	.word 173
	.word 20447175
	.word -136
	.word 19923321
	.word 27
	.word 4285595348
	.word -57
	.word 11927803
	.word 311
	.word 23527467
@ =56=
	.word 1
	.word 4063233
	.word 62
	.word 11337768
	.word 40
	.word 1834872
	.word 173
	.word 20447175
	.word -136
	.word 19923321
	.word 27
	.word 4285595348
	.word -57
	.word 11927803
	.word 311
	.word 23527467
	.word 377
	.word 4273733726
	.word 304
	.word 7471019
	.word -300
	.word 15139105
	.word -144
	.word 786457
	.word 251
	.word 8060992
	.word 182
	.word 20054269
	.word 43
	.word 12517131
	.word 359
	.word 4289069253
	.word 94
	.word 4292476977
	.word -324
	.word 1244837
	.word -85
	.word 4280877313
	.word 113
	.word 4285727003
	.word 289
	.word 18677777
	.word 231
	.word 4286185383
	.word 25
	.word 4274716667
	.word 12
	.word 4288741176
	.word 64
	.word 17956856
	.word 123
	.word 10157760
	.word 253
	.word 4280811839
	.word 306
	.word 4283170503
	.word -245
	.word 4286775356
	.word 190
	.word 25100381
	.word 197
	.word 5374251
	.word -90
	.word 13434536
// void ntt256_16bit (int *v);
.global ntt256_16bit
.type ntt256_16bit, %function
ntt256_16bit:
	push {r4-r11, lr}
	adr.w r10, wpad
	ldm r10!, {r11-r12}
	vldm r10!, {s2-s3}
	add.w lr, r0, #512
	vmov s0, s1, r0, lr
	add.w lr, r0, #64 @ 32
	vmov.w s4, s5, r10, lr
ntt2_layer_0_1_2:
	vmov.w r10, s2
	ldr.w r3, [r1, #64]
	ldr.w r4, [r1, #128]
	ldr.w r5, [r1, #192]
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
	str.w r2, [r0, #64]
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
	str.w r4, [r0, #128]
	str.w r5, [r0, #192]
	str.w r6, [r0, #256]
	str.w r7, [r0, #320]
	str.w r8, [r0, #384]
	str.w r9, [r0, #448]
	add.w r0, r0, #4
	vmov.w lr, s5
	cmp.w r0, lr
	bne.w ntt2_layer_0_1_2
	vmov r10, s4
@ degree = 8
	vmov r0, lr, s0, s1
ntt2_layer_3_4:
	ldr.w r9, [r10, #4]
	ldr.w r8, [r10], #8
	ldr.w r1, [r0]
	ldr.w r2, [r0, #16]
	ldr.w r3, [r0, #32]
	ldr.w r4, [r0, #48]
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
	str.w r2, [r0, #16]
	str.w r3, [r0, #32]
	str.w r4, [r0, #48]
	str.w r1, [r0], #4
	ldr.w r1, [r0]
	ldr.w r2, [r0, #16]
	ldr.w r3, [r0, #32]
	ldr.w r4, [r0, #48]
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
	str.w r2, [r0, #16]
	str.w r3, [r0, #32]
	str.w r4, [r0, #48]
	str.w r1, [r0], #4
	ldr.w r1, [r0]
	ldr.w r2, [r0, #16]
	ldr.w r3, [r0, #32]
	ldr.w r4, [r0, #48]
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
	str.w r2, [r0, #16]
	str.w r3, [r0, #32]
	str.w r4, [r0, #48]
	str.w r1, [r0], #4
	ldr.w r1, [r0]
	ldr.w r2, [r0, #16]
	ldr.w r3, [r0, #32]
	ldr.w r4, [r0, #48]
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
	str.w r2, [r0, #16]
	str.w r3, [r0, #32]
	str.w r4, [r0, #48]
	str.w r1, [r0], #52
	cmp.w r0, lr
	bne.w ntt2_layer_3_4
@ degree = 2
	vmov.w r0, s0
ntt2_layer_5_6:
	ldr.w r9, [r10, #4]
	ldr.w r8, [r10], #8
	ldr.w r1, [r0]
	ldr.w r2, [r0, #4]
	ldr.w r3, [r0, #8]
	ldr.w r4, [r0, #12]
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
	str.w r2, [r0, #4]
	str.w r3, [r0, #8]
	str.w r4, [r0, #12]
	str.w r1, [r0], #16
	cmp.w r0, lr
	bne.w ntt2_layer_5_6
	pop {r4-r11, pc}
