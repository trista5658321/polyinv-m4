.p2align 2,,3
.syntax unified
.text
wpad:
	.word 310 @ q0inv_mod_q1
	.word -495 @ q0_modq
	.word 545116 @ qinv
	.word 7879 @ q
	.word 326251 @ mont_layer_mul_2_32
	.word -6 @ u1_layer_inv
	.word -213984257 @ q0inv_m
	.word 831 @ q0inv
	.word 5168129 @ q0
	.word 5585133 @ q1inv
	.word 769 @ q1
// void crt256 (int *h_16, int *h_32);
.global crt256
.type crt256, %function
crt256:
	push {r4-r11, lr}
	adr.w lr, wpad
	vldm lr!, {s2-s10}
	ldm lr!, {r11-r12}
	add.w lr, r0, #512
	vmov.w s1, lr
start:
	vmov r6, r7, s6, s7
	vmov r8, r9, s8, s9
	vmov.w r10, s10
	ldr.w r3, [r1, #4]
	ldr.w r2, [r1], #8
	ldr.w r4, [r0]
	smull r5, r2, r2, r6 @ u0_0
	mul.w lr, r5, r8
	smlal r5, r2, lr, r10
	smull r5, r3, r3, r6 @ u0_1
	mul.w lr, r5, r8
	smlal r5, r3, lr, r10
	smmulr lr, r2, r9
	mls r2, lr, r10, r2
	smmulr lr, r3, r9
	mls r3, lr, r10, r3
	smulbt r5, r7, r4
	smulbb r4, r7, r4
	smmulr lr, r4, r11
	mls r4, lr, r12, r4
	smmulr lr, r5, r11
	mls r5, lr, r12, r5
	vmov r7, r8, s2, s3
	vmov r9, r10, s4, s5
	sub.w r6, r4, r2
	smmulr lr, r6, r11
	mls r6, lr, r12, r6
	smulbb r4, r7, r6
	smmulr lr, r4, r11
	mls r4, lr, r12, r4
	sub.w r6, r5, r3
	smmulr lr, r6, r11
	mls r6, lr, r12, r6
	smulbb r5, r7, r6
	smmulr lr, r5, r11
	mls r5, lr, r12, r5
	smlabb r2, r8, r4, r2
	smlabb r3, r8, r5, r3
	smmulr lr, r2, r9
	mls r2, lr, r10, r2
	smmulr lr, r3, r9
	mls r3, lr, r10, r3
	pkhbt r2, r2, r3, lsl #16
	str.w r2, [r0], #4
	vmov r6, r7, s6, s7
	vmov r8, r9, s8, s9
	vmov.w r10, s10
	ldr.w r3, [r1, #4]
	ldr.w r2, [r1], #8
	ldr.w r4, [r0]
	smull r5, r2, r2, r6 @ u0_0
	mul.w lr, r5, r8
	smlal r5, r2, lr, r10
	smull r5, r3, r3, r6 @ u0_1
	mul.w lr, r5, r8
	smlal r5, r3, lr, r10
	smmulr lr, r2, r9
	mls r2, lr, r10, r2
	smmulr lr, r3, r9
	mls r3, lr, r10, r3
	smulbt r5, r7, r4
	smulbb r4, r7, r4
	smmulr lr, r4, r11
	mls r4, lr, r12, r4
	smmulr lr, r5, r11
	mls r5, lr, r12, r5
	vmov r7, r8, s2, s3
	vmov r9, r10, s4, s5
	sub.w r6, r4, r2
	smmulr lr, r6, r11
	mls r6, lr, r12, r6
	smulbb r4, r7, r6
	smmulr lr, r4, r11
	mls r4, lr, r12, r4
	sub.w r6, r5, r3
	smmulr lr, r6, r11
	mls r6, lr, r12, r6
	smulbb r5, r7, r6
	smmulr lr, r5, r11
	mls r5, lr, r12, r5
	smlabb r2, r8, r4, r2
	smlabb r3, r8, r5, r3
	smmulr lr, r2, r9
	mls r2, lr, r10, r2
	smmulr lr, r3, r9
	mls r3, lr, r10, r3
	pkhbt r2, r2, r3, lsl #16
	str.w r2, [r0], #4
	vmov r6, r7, s6, s7
	vmov r8, r9, s8, s9
	vmov.w r10, s10
	ldr.w r3, [r1, #4]
	ldr.w r2, [r1], #8
	ldr.w r4, [r0]
	smull r5, r2, r2, r6 @ u0_0
	mul.w lr, r5, r8
	smlal r5, r2, lr, r10
	smull r5, r3, r3, r6 @ u0_1
	mul.w lr, r5, r8
	smlal r5, r3, lr, r10
	smmulr lr, r2, r9
	mls r2, lr, r10, r2
	smmulr lr, r3, r9
	mls r3, lr, r10, r3
	smulbt r5, r7, r4
	smulbb r4, r7, r4
	smmulr lr, r4, r11
	mls r4, lr, r12, r4
	smmulr lr, r5, r11
	mls r5, lr, r12, r5
	vmov r7, r8, s2, s3
	vmov r9, r10, s4, s5
	sub.w r6, r4, r2
	smmulr lr, r6, r11
	mls r6, lr, r12, r6
	smulbb r4, r7, r6
	smmulr lr, r4, r11
	mls r4, lr, r12, r4
	sub.w r6, r5, r3
	smmulr lr, r6, r11
	mls r6, lr, r12, r6
	smulbb r5, r7, r6
	smmulr lr, r5, r11
	mls r5, lr, r12, r5
	smlabb r2, r8, r4, r2
	smlabb r3, r8, r5, r3
	smmulr lr, r2, r9
	mls r2, lr, r10, r2
	smmulr lr, r3, r9
	mls r3, lr, r10, r3
	pkhbt r2, r2, r3, lsl #16
	str.w r2, [r0], #4
	vmov r6, r7, s6, s7
	vmov r8, r9, s8, s9
	vmov.w r10, s10
	ldr.w r3, [r1, #4]
	ldr.w r2, [r1], #8
	ldr.w r4, [r0]
	smull r5, r2, r2, r6 @ u0_0
	mul.w lr, r5, r8
	smlal r5, r2, lr, r10
	smull r5, r3, r3, r6 @ u0_1
	mul.w lr, r5, r8
	smlal r5, r3, lr, r10
	smmulr lr, r2, r9
	mls r2, lr, r10, r2
	smmulr lr, r3, r9
	mls r3, lr, r10, r3
	smulbt r5, r7, r4
	smulbb r4, r7, r4
	smmulr lr, r4, r11
	mls r4, lr, r12, r4
	smmulr lr, r5, r11
	mls r5, lr, r12, r5
	vmov r7, r8, s2, s3
	vmov r9, r10, s4, s5
	sub.w r6, r4, r2
	smmulr lr, r6, r11
	mls r6, lr, r12, r6
	smulbb r4, r7, r6
	smmulr lr, r4, r11
	mls r4, lr, r12, r4
	sub.w r6, r5, r3
	smmulr lr, r6, r11
	mls r6, lr, r12, r6
	smulbb r5, r7, r6
	smmulr lr, r5, r11
	mls r5, lr, r12, r5
	smlabb r2, r8, r4, r2
	smlabb r3, r8, r5, r3
	smmulr lr, r2, r9
	mls r2, lr, r10, r2
	smmulr lr, r3, r9
	mls r3, lr, r10, r3
	pkhbt r2, r2, r3, lsl #16
	str.w r2, [r0], #4
	vmov.w lr, s1
	cmp.w r0, lr
	bne.w start
	pop {r4-r11, pc}
