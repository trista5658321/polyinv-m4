.p2align 2,,3
.syntax	unified
.text
__polymul_128x128:
	push.w {lr}
	sub.w sp, sp, #2432
	vmov.w s9, r0
	mov.w r0, sp
	vmov.w s3, r2
	movw.w r2, #4591
	movw.w r3, #32768
	vmov.w r4, s2
	add.w lr, r0, #64
gf_polymul_128x128_eval_input_c_body:
	ldr.w r8, [r1, #192]
	ldr.w r7, [r1, #64]
	ldr.w r6, [r1, #128]
	ldr.w r5, [r1], #4
	lsl.w r9, r7, #1
	lsl.w r10, r8, #3
	bfc.w r9, #16, #1
	bfc.w r10, #16, #3
	sadd16.w r9, r9, r10
	smlawb.w r10, r4, r9, r3
	smlawt.w r11, r4, r9, r3
	smulbt.w r10, r2, r10
	smulbt.w r11, r2, r11
	pkhbt.w r10, r10, r11, lsl #16
	ssub16.w r9, r9, r10
	lsl.w r10, r6, #2
	bfc.w r10, #16, #2
	sadd16.w r10, r10, r5
	sadd16.w r11, r10, r9
	ssub16.w r10, r10, r9
	smlawb.w r9, r4, r11, r3
	smlawt.w r12, r4, r11, r3
	smulbt.w r9, r2, r9
	smulbt.w r12, r2, r12
	pkhbt.w r9, r9, r12, lsl #16
	ssub16.w r11, r11, r9
	smlawb.w r9, r4, r10, r3
	smlawt.w r12, r4, r10, r3
	smulbt.w r9, r2, r9
	smulbt.w r12, r2, r12
	pkhbt.w r9, r9, r12, lsl #16
	ssub16.w r10, r10, r9
	lsl.w r9, r5, #3
	lsl.w r12, r6, #1
	bfc.w r9, #16, #3
	bfc.w r12, #16, #1
	sadd16.w r9, r9, r12
	sadd16.w r5, r5, r6
	smlawb.w r6, r4, r9, r3
	smlawt.w r12, r4, r9, r3
	smulbt.w r6, r2, r6
	smulbt.w r12, r2, r12
	pkhbt.w r6, r6, r12, lsl #16
	ssub16.w r9, r9, r6
	lsl.w r12, r7, #2
	bfc.w r12, #16, #2
	sadd16.w r12, r12, r8
	sadd16.w r7, r7, r8
	sadd16.w r9, r9, r12
	smlawb.w r6, r4, r9, r3
	smlawt.w r8, r4, r9, r3
	smulbt.w r6, r2, r6
	smulbt.w r8, r2, r8
	pkhbt.w r6, r6, r8, lsl #16
	ssub16.w r9, r9, r6
	ssub16.w r8, r5, r7
	sadd16.w r7, r5, r7
	smlawb.w r5, r4, r8, r3
	smlawt.w r6, r4, r8, r3
	smulbt.w r5, r2, r5
	smulbt.w r6, r2, r6
	pkhbt.w r5, r5, r6, lsl #16
	ssub16.w r8, r8, r5
	smlawb.w r5, r4, r7, r3
	smlawt.w r6, r4, r7, r3
	smulbt.w r5, r2, r5
	smulbt.w r6, r2, r6
	pkhbt.w r5, r5, r6, lsl #16
	ssub16.w r7, r7, r5
	str.w r10, [r0, #256]
	str.w r11, [r0, #192]
	str.w r8, [r0, #128]
	str.w r7, [r0, #64]
	str.w r9, [r0], #4
	cmp.w r0, lr
	bne.w gf_polymul_128x128_eval_input_c_body
	vmov.w r2, s3
	add.w r0, r0, #256
	vmov.w s3, r1
	movw.w r1, #4591
	movw.w r3, #32768
	vmov.w r4, s2
	add.w lr, r0, #64
gf_polymul_128x128_eval_input_d_body:
	ldr.w r8, [r2, #192]
	ldr.w r7, [r2, #64]
	ldr.w r6, [r2, #128]
	ldr.w r5, [r2], #4
	lsl.w r9, r7, #1
	lsl.w r10, r8, #3
	bfc.w r9, #16, #1
	bfc.w r10, #16, #3
	sadd16.w r9, r9, r10
	smlawb.w r10, r4, r9, r3
	smlawt.w r11, r4, r9, r3
	smulbt.w r10, r1, r10
	smulbt.w r11, r1, r11
	pkhbt.w r10, r10, r11, lsl #16
	ssub16.w r9, r9, r10
	lsl.w r10, r6, #2
	bfc.w r10, #16, #2
	sadd16.w r10, r10, r5
	sadd16.w r11, r10, r9
	ssub16.w r10, r10, r9
	smlawb.w r9, r4, r11, r3
	smlawt.w r12, r4, r11, r3
	smulbt.w r9, r1, r9
	smulbt.w r12, r1, r12
	pkhbt.w r9, r9, r12, lsl #16
	ssub16.w r11, r11, r9
	smlawb.w r9, r4, r10, r3
	smlawt.w r12, r4, r10, r3
	smulbt.w r9, r1, r9
	smulbt.w r12, r1, r12
	pkhbt.w r9, r9, r12, lsl #16
	ssub16.w r10, r10, r9
	lsl.w r9, r5, #3
	lsl.w r12, r6, #1
	bfc.w r9, #16, #3
	bfc.w r12, #16, #1
	sadd16.w r9, r9, r12
	sadd16.w r5, r5, r6
	smlawb.w r6, r4, r9, r3
	smlawt.w r12, r4, r9, r3
	smulbt.w r6, r1, r6
	smulbt.w r12, r1, r12
	pkhbt.w r6, r6, r12, lsl #16
	ssub16.w r9, r9, r6
	lsl.w r12, r7, #2
	bfc.w r12, #16, #2
	sadd16.w r12, r12, r8
	sadd16.w r7, r7, r8
	sadd16.w r9, r9, r12
	smlawb.w r6, r4, r9, r3
	smlawt.w r8, r4, r9, r3
	smulbt.w r6, r1, r6
	smulbt.w r8, r1, r8
	pkhbt.w r6, r6, r8, lsl #16
	ssub16.w r9, r9, r6
	ssub16.w r8, r5, r7
	sadd16.w r7, r5, r7
	smlawb.w r5, r4, r8, r3
	smlawt.w r6, r4, r8, r3
	smulbt.w r5, r1, r5
	smulbt.w r6, r1, r6
	pkhbt.w r5, r5, r6, lsl #16
	ssub16.w r8, r8, r5
	smlawb.w r5, r4, r7, r3
	smlawt.w r6, r4, r7, r3
	smulbt.w r5, r1, r5
	smulbt.w r6, r1, r6
	pkhbt.w r5, r5, r6, lsl #16
	ssub16.w r7, r7, r5
	str.w r10, [r0, #256]
	str.w r11, [r0, #192]
	str.w r8, [r0, #128]
	str.w r7, [r0, #64]
	str.w r9, [r0], #4
	cmp.w r0, lr
	bne.w gf_polymul_128x128_eval_input_d_body
	vmov.w r1, s3
	add.w r0, r0, #256
	vmov.w r4, s9
	mov.w r5, r0
	sub.w r6, r1, #64
	sub.w r7, r2, #64
	mov.w r1, r6
	mov.w r2, r7
	bl.w gf_polymul_32x32
	add.w r0, r5, #512
	sub.w r1, r5, #640
	sub.w r2, r5, #320
	bl.w gf_polymul_32x32
	add.w r0, r5, #128
	sub.w r1, r5, #576
	sub.w r2, r5, #256
	bl.w gf_polymul_32x32
	add.w r0, r5, #640
	sub.w r1, r5, #512
	sub.w r2, r5, #192
	bl.w gf_polymul_32x32
	add.w r0, r5, #256
	sub.w r1, r5, #448
	sub.w r2, r5, #128
	bl.w gf_polymul_32x32
	add.w r0, r5, #768
	sub.w r1, r5, #384
	sub.w r2, r5, #64
	bl.w gf_polymul_32x32
	add.w r0, r5, #384
	add.w r1, r6, #192
	add.w r2, r7, #192
	bl.w gf_polymul_32x32
	vmov.w s9, r4
	mov.w r0, r5
	add.w lr, r0, #128
	vmov.w r12, s2
	movw.w r11, #4591
	add.w r1, r0, #768
gf_polymul_128x128_interpol_output_body:
	ldr.w r10, [r0, #384]
	ldr.w r9, [r1]
	ldr.w r8, [r0, #256]
	ldr.w r7, [r0, #640]
	ldr.w r6, [r0, #128]
	ldr.w r3, [r0, #512]
	ldr.w r4, [r0], #4
	pkhbt.w r1, r4, r6, lsl #16
	pkhtb.w r2, r6, r4, asr #16
	pkhbt.w r4, r7, r8, lsl #16
	pkhtb.w r5, r8, r7, asr #16
	pkhbt.w r6, r9, r10, lsl #16
	pkhtb.w r7, r10, r9, asr #16
	vmov.w r10, s10
	smuad.w r8, r10, r1
	smuad.w r9, r10, r2
	vmov.w r10, s25 @ bot = A[1][1]
	smlabb.w r8, r10, r3, r8
	smlabt.w r9, r10, r3, r9
	vmov.w r10, s11
	smladx.w r8, r10, r4, r8
	smladx.w r9, r10, r5, r9
	vmov.w r10, s12
	smladx.w r8, r10, r6, r8
	smladx.w r9, r10, r7, r9
	smmulr.w r10, r12, r8
	mls.w r8, r11, r10, r8
	smmulr.w r10, r12, r9
	mls.w r9, r11, r10, r9
	pkhbt.w r8, r8, r9, lsl #16
	str.w r8, [r0, #508]
	vmov.w r10, s13
	smuadx.w r8, r10, r1
	smuadx.w r9, r10, r2
	vmov.w r10, s14
	smlad.w r8, r10, r4, r8
	smlad.w r9, r10, r5, r9
	vmov.w r10, s15
	smlad.w r8, r10, r6, r8
	smlad.w r9, r10, r7, r9
	smmulr.w r10, r12, r8
	mls.w r8, r11, r10, r8
	smmulr.w r10, r12, r9
	mls.w r9, r11, r10, r9
	pkhbt.w r8, r8, r9, lsl #16
	str.w r8, [r0, #124]
	vmov.w r10, s16
	smuad.w r8, r10, r1
	smuad.w r9, r10, r2
	vmov.w r10, s25 @ top = A[3][1]
	smlatb.w r8, r10, r3, r8
	smlatt.w r9, r10, r3, r9
	vmov.w r10, s17
	smlad.w r8, r10, r4, r8
	smlad.w r9, r10, r5, r9
	vmov.w r10, s18 @ top = A[3][6]
	smlatt.w r8, r10, r6, r8
	smlatt.w r9, r10, r7, r9
	smmulr.w r10, r12, r8
	mls.w r8, r11, r10, r8
	smmulr.w r10, r12, r9
	mls.w r9, r11, r10, r9
	pkhbt.w r8, r8, r9, lsl #16
	str.w r8, [r0, #636]
	vmov.w r10, s19
	smuadx.w r8, r10, r1
	smuadx.w r9, r10, r2
	vmov.w r10, s20
	smlad.w r8, r10, r4, r8
	smlad.w r9, r10, r5, r9
	vmov.w r10, s21
	smlad.w r8, r10, r6, r8
	smlad.w r9, r10, r7, r9
	smmulr.w r10, r12, r8
	mls.w r8, r11, r10, r8
	smmulr.w r10, r12, r9
	mls.w r9, r11, r10, r9
	pkhbt.w r8, r8, r9, lsl #16
	str.w r8, [r0, #252]
	vmov.w r10, s22
	smuad.w r8, r10, r1
	smuad.w r9, r10, r2
	vmov.w r10, s18 @ bot = A[5][1]
	smlabb.w r8, r10, r3, r8
	smlabt.w r9, r10, r3, r9
	vmov.w r10, s23
	smladx.w r8, r10, r4, r8
	smladx.w r9, r10, r5, r9
	vmov.w r10, s24
	smladx.w r8, r10, r6, r8
	smladx.w r9, r10, r7, r9
	smmulr.w r10, r12, r8
	mls.w r8, r11, r10, r8
	smmulr.w r10, r12, r9
	mls.w r9, r11, r10, r9
	pkhbt.w r8, r8, r9, lsl #16
	add.w r1, r0, #768
	str.w r8, [r1, #-4]
	cmp.w r0, lr
	bne.w gf_polymul_128x128_interpol_output_body
	sub.w r1, r0, #128
	vmov.w r0, s9
	ldr.w r3, [r1, #4]
	ldr.w r4, [r1, #8]
	ldr.w r5, [r1, #12]
	ldr.w r6, [r1, #16]
	ldr.w r7, [r1, #20]
	ldr.w r8, [r1, #24]
	ldr.w r9, [r1, #28]
	ldr.w r10, [r1, #32]
	ldr.w r11, [r1, #36]
	ldr.w r12, [r1, #40]
	ldr.w lr, [r1, #44]
	ldr.w r2, [r1], #48
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r5, [r0, #12]
	str.w r6, [r0, #16]
	str.w r7, [r0, #20]
	str.w r8, [r0, #24]
	str.w r9, [r0, #28]
	str.w r10, [r0, #32]
	str.w r11, [r0, #36]
	str.w r12, [r0, #40]
	str.w lr, [r0, #44]
	str.w r2, [r0], #48
	ldr.w r3, [r1, #4]
	ldr.w r4, [r1, #8]
	ldr.w r5, [r1, #12]
	ldr.w r2, [r1], #16
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r5, [r0, #12]
	str.w r2, [r0], #16
	add.w lr, r0, #380
gf_polymul_128x128_copy_output_B:
	ldr.w r8, [r1, #452]
	ldr.w r3, [r1, #4]
	ldr.w r9, [r1, #456]
	ldr.w r4, [r1, #8]
	ldr.w r10, [r1, #460]
	ldr.w r5, [r1, #12]
	ldr.w r11, [r1, #464]
	ldr.w r6, [r1, #16]
	ldr.w r7, [r1, #448]
	ldr.w r2, [r1], #20
	sadd16.w r2, r2, r7
	sadd16.w r3, r3, r8
	sadd16.w r4, r4, r9
	sadd16.w r5, r5, r10
	sadd16.w r6, r6, r11
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r5, [r0, #12]
	str.w r6, [r0, #16]
	str.w r2, [r0], #20
	cmp.w r0, lr
	bne.w gf_polymul_128x128_copy_output_B
	ldr.w r3, [r1, #448]
	ldr.w r2, [r1], #4
	sadd16.w r2, r2, r3
	str.w r2, [r0], #4
	ldr.w r3, [r1, #4]
	ldr.w r4, [r1, #8]
	ldr.w r5, [r1, #12]
	ldr.w r6, [r1, #16]
	ldr.w r7, [r1, #20]
	ldr.w r8, [r1, #24]
	ldr.w r9, [r1, #28]
	ldr.w r10, [r1, #32]
	ldr.w r11, [r1, #36]
	ldr.w r12, [r1, #40]
	ldr.w lr, [r1, #44]
	ldr.w r2, [r1], #48
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r5, [r0, #12]
	str.w r6, [r0, #16]
	str.w r7, [r0, #20]
	str.w r8, [r0, #24]
	str.w r9, [r0, #28]
	str.w r10, [r0, #32]
	str.w r11, [r0, #36]
	str.w r12, [r0, #40]
	str.w lr, [r0, #44]
	str.w r2, [r0], #48
	ldr.w r3, [r1, #4]
	ldr.w r4, [r1, #8]
	ldr.w r5, [r1, #12]
	ldr.w r2, [r1], #16
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r5, [r0, #12]
	str.w r2, [r0], #16
	add.w sp, sp, #2432
	pop.w {pc}
.p2align 2,,3
.syntax	unified
.data
b256_1: .space 516
b256_2: .space 516
.text
b1_addr:
	.word b256_1
	.word b256_1+2
b2_addr:
	.word b256_2
	.word b256_2+2
Toom4Table_4591:
	.word 4194697214 @ s1
	.word 66848888   @ s2^
	.word 145489918  @ s3^
	.word 4219667963 @ s4^
	.word 87754235   @ s5
	.word 263483     @ s6
	.word 4144690955 @ s7
	.word 16713465   @ s8
	.word 4144758733 @ s9#
	.word 75236093   @ s10^
	.word 4207215357 @ s11
	.word 4294703813 @ s12
	.word 100272375  @ s13
	.word 4261546104 @ s14^
	.word 4149545207 @ s15^
	.word 16777012   @ s16#
.global	__gf_polymul_128x128_2x2_x2p2
.type 	__gf_polymul_128x128_2x2_x2p2, %function
@ void __gf_polymul_128x128_2x2_x2p2(int *V,int *M,int *fh,int *gh)
__gf_polymul_128x128_2x2_x2p2:
	push {r1-r12, lr}
	vpush.w { s16-s25 }
	adr lr, Toom4Table_4591
	vldm lr, {s10-s25}
	vmov.w s0, s1, r0, r1
	vmov.w s4, s5, r2, r3
	movw.w r7, #18015
	movt.w r7, #14
	vmov.w s2, r7
	movw.w r11, #0
	ldr.w r7, b1_addr
	ldr.w r8, b1_addr+4
	ldr.w r9, b2_addr
	ldr.w r0, b2_addr+4
	str.w r11, [r7]
	str.w r11, [r9]
	vmov.w s6, s7, r7, r8
	vmov.w s8, r9
	movw.w r7, #512
	add.w r1, r7
	bl	__polymul_128x128
	vmov.w r0, s7
	vmov.w r1, s1
	movw.w r7, #768
	add.w r1, r7
	vmov.w r2, s5
	bl	__polymul_128x128
	vmov.w r0, r3, s0, s1
	vmov.w r1, s6
	vmov.w r2, s8
	mov.w r4, 4591
	vmov.w r5, s2
	movw.w r6, #32768
	ldr.w r7, [r1, #0]
	ldr.w r8, [r1, #4]
	ldr.w r9, [r1, #8]
	ldr.w r10, [r1, #12]
	ldr.w r11, [r2, #0]
	ldr.w r12, [r2, #4]
	ldr.w lr, [r2, #8]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r3, #0]
	ldr.w r12, [r3, #4]
	ldr.w lr, [r3, #8]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r2, #12]
	ldr.w r12, [r3, #12]
	sadd16.w r10,r10,r11
	sadd16.w r10,r10,r12
	smlawb.w r12, r5, r7, r6
	smlawt.w r11, r5, r7, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r7, r7, r12
	smlawb.w r12, r5, r8, r6
	smlawt.w r11, r5, r8, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r8, r8, r12
	smlawb.w r12, r5, r9, r6
	smlawt.w r11, r5, r9, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r9, r9, r12
	smlawb.w r12, r5, r10, r6
	smlawt.w r11, r5, r10, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r10, r10, r12
	str.w r7, [r0, #0]
	str.w r8, [r0, #4]
	str.w r9, [r0, #8]
	str.w r10, [r0, #12]
	ldr.w r7, [r1, #16]
	ldr.w r8, [r1, #20]
	ldr.w r9, [r1, #24]
	ldr.w r10, [r1, #28]
	ldr.w r11, [r2, #16]
	ldr.w r12, [r2, #20]
	ldr.w lr, [r2, #24]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r3, #16]
	ldr.w r12, [r3, #20]
	ldr.w lr, [r3, #24]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r2, #28]
	ldr.w r12, [r3, #28]
	sadd16.w r10,r10,r11
	sadd16.w r10,r10,r12
	smlawb.w r12, r5, r7, r6
	smlawt.w r11, r5, r7, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r7, r7, r12
	smlawb.w r12, r5, r8, r6
	smlawt.w r11, r5, r8, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r8, r8, r12
	smlawb.w r12, r5, r9, r6
	smlawt.w r11, r5, r9, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r9, r9, r12
	smlawb.w r12, r5, r10, r6
	smlawt.w r11, r5, r10, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r10, r10, r12
	str.w r7, [r0, #16]
	str.w r8, [r0, #20]
	str.w r9, [r0, #24]
	str.w r10, [r0, #28]
	ldr.w r7, [r1, #32]
	ldr.w r8, [r1, #36]
	ldr.w r9, [r1, #40]
	ldr.w r10, [r1, #44]
	ldr.w r11, [r2, #32]
	ldr.w r12, [r2, #36]
	ldr.w lr, [r2, #40]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r3, #32]
	ldr.w r12, [r3, #36]
	ldr.w lr, [r3, #40]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r2, #44]
	ldr.w r12, [r3, #44]
	sadd16.w r10,r10,r11
	sadd16.w r10,r10,r12
	smlawb.w r12, r5, r7, r6
	smlawt.w r11, r5, r7, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r7, r7, r12
	smlawb.w r12, r5, r8, r6
	smlawt.w r11, r5, r8, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r8, r8, r12
	smlawb.w r12, r5, r9, r6
	smlawt.w r11, r5, r9, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r9, r9, r12
	smlawb.w r12, r5, r10, r6
	smlawt.w r11, r5, r10, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r10, r10, r12
	str.w r7, [r0, #32]
	str.w r8, [r0, #36]
	str.w r9, [r0, #40]
	str.w r10, [r0, #44]
	ldr.w r7, [r1, #48]
	ldr.w r8, [r1, #52]
	ldr.w r9, [r1, #56]
	ldr.w r10, [r1, #60]
	ldr.w r11, [r2, #48]
	ldr.w r12, [r2, #52]
	ldr.w lr, [r2, #56]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r3, #48]
	ldr.w r12, [r3, #52]
	ldr.w lr, [r3, #56]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r2, #60]
	ldr.w r12, [r3, #60]
	sadd16.w r10,r10,r11
	sadd16.w r10,r10,r12
	smlawb.w r12, r5, r7, r6
	smlawt.w r11, r5, r7, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r7, r7, r12
	smlawb.w r12, r5, r8, r6
	smlawt.w r11, r5, r8, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r8, r8, r12
	smlawb.w r12, r5, r9, r6
	smlawt.w r11, r5, r9, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r9, r9, r12
	smlawb.w r12, r5, r10, r6
	smlawt.w r11, r5, r10, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r10, r10, r12
	str.w r7, [r0, #48]
	str.w r8, [r0, #52]
	str.w r9, [r0, #56]
	str.w r10, [r0, #60]
	ldr.w r7, [r1, #64]
	ldr.w r8, [r1, #68]
	ldr.w r9, [r1, #72]
	ldr.w r10, [r1, #76]
	ldr.w r11, [r2, #64]
	ldr.w r12, [r2, #68]
	ldr.w lr, [r2, #72]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r3, #64]
	ldr.w r12, [r3, #68]
	ldr.w lr, [r3, #72]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r2, #76]
	ldr.w r12, [r3, #76]
	sadd16.w r10,r10,r11
	sadd16.w r10,r10,r12
	smlawb.w r12, r5, r7, r6
	smlawt.w r11, r5, r7, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r7, r7, r12
	smlawb.w r12, r5, r8, r6
	smlawt.w r11, r5, r8, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r8, r8, r12
	smlawb.w r12, r5, r9, r6
	smlawt.w r11, r5, r9, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r9, r9, r12
	smlawb.w r12, r5, r10, r6
	smlawt.w r11, r5, r10, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r10, r10, r12
	str.w r7, [r0, #64]
	str.w r8, [r0, #68]
	str.w r9, [r0, #72]
	str.w r10, [r0, #76]
	ldr.w r7, [r1, #80]
	ldr.w r8, [r1, #84]
	ldr.w r9, [r1, #88]
	ldr.w r10, [r1, #92]
	ldr.w r11, [r2, #80]
	ldr.w r12, [r2, #84]
	ldr.w lr, [r2, #88]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r3, #80]
	ldr.w r12, [r3, #84]
	ldr.w lr, [r3, #88]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r2, #92]
	ldr.w r12, [r3, #92]
	sadd16.w r10,r10,r11
	sadd16.w r10,r10,r12
	smlawb.w r12, r5, r7, r6
	smlawt.w r11, r5, r7, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r7, r7, r12
	smlawb.w r12, r5, r8, r6
	smlawt.w r11, r5, r8, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r8, r8, r12
	smlawb.w r12, r5, r9, r6
	smlawt.w r11, r5, r9, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r9, r9, r12
	smlawb.w r12, r5, r10, r6
	smlawt.w r11, r5, r10, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r10, r10, r12
	str.w r7, [r0, #80]
	str.w r8, [r0, #84]
	str.w r9, [r0, #88]
	str.w r10, [r0, #92]
	ldr.w r7, [r1, #96]
	ldr.w r8, [r1, #100]
	ldr.w r9, [r1, #104]
	ldr.w r10, [r1, #108]
	ldr.w r11, [r2, #96]
	ldr.w r12, [r2, #100]
	ldr.w lr, [r2, #104]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r3, #96]
	ldr.w r12, [r3, #100]
	ldr.w lr, [r3, #104]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r2, #108]
	ldr.w r12, [r3, #108]
	sadd16.w r10,r10,r11
	sadd16.w r10,r10,r12
	smlawb.w r12, r5, r7, r6
	smlawt.w r11, r5, r7, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r7, r7, r12
	smlawb.w r12, r5, r8, r6
	smlawt.w r11, r5, r8, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r8, r8, r12
	smlawb.w r12, r5, r9, r6
	smlawt.w r11, r5, r9, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r9, r9, r12
	smlawb.w r12, r5, r10, r6
	smlawt.w r11, r5, r10, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r10, r10, r12
	str.w r7, [r0, #96]
	str.w r8, [r0, #100]
	str.w r9, [r0, #104]
	str.w r10, [r0, #108]
	ldr.w r7, [r1, #112]
	ldr.w r8, [r1, #116]
	ldr.w r9, [r1, #120]
	ldr.w r10, [r1, #124]
	ldr.w r11, [r2, #112]
	ldr.w r12, [r2, #116]
	ldr.w lr, [r2, #120]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r3, #112]
	ldr.w r12, [r3, #116]
	ldr.w lr, [r3, #120]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r2, #124]
	ldr.w r12, [r3, #124]
	sadd16.w r10,r10,r11
	sadd16.w r10,r10,r12
	smlawb.w r12, r5, r7, r6
	smlawt.w r11, r5, r7, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r7, r7, r12
	smlawb.w r12, r5, r8, r6
	smlawt.w r11, r5, r8, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r8, r8, r12
	smlawb.w r12, r5, r9, r6
	smlawt.w r11, r5, r9, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r9, r9, r12
	smlawb.w r12, r5, r10, r6
	smlawt.w r11, r5, r10, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r10, r10, r12
	str.w r7, [r0, #112]
	str.w r8, [r0, #116]
	str.w r9, [r0, #120]
	str.w r10, [r0, #124]
	ldr.w r7, [r1, #128]
	ldr.w r8, [r1, #132]
	ldr.w r9, [r1, #136]
	ldr.w r10, [r1, #140]
	ldr.w r11, [r2, #128]
	ldr.w r12, [r2, #132]
	ldr.w lr, [r2, #136]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r3, #128]
	ldr.w r12, [r3, #132]
	ldr.w lr, [r3, #136]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r2, #140]
	ldr.w r12, [r3, #140]
	sadd16.w r10,r10,r11
	sadd16.w r10,r10,r12
	smlawb.w r12, r5, r7, r6
	smlawt.w r11, r5, r7, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r7, r7, r12
	smlawb.w r12, r5, r8, r6
	smlawt.w r11, r5, r8, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r8, r8, r12
	smlawb.w r12, r5, r9, r6
	smlawt.w r11, r5, r9, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r9, r9, r12
	smlawb.w r12, r5, r10, r6
	smlawt.w r11, r5, r10, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r10, r10, r12
	str.w r7, [r0, #128]
	str.w r8, [r0, #132]
	str.w r9, [r0, #136]
	str.w r10, [r0, #140]
	ldr.w r7, [r1, #144]
	ldr.w r8, [r1, #148]
	ldr.w r9, [r1, #152]
	ldr.w r10, [r1, #156]
	ldr.w r11, [r2, #144]
	ldr.w r12, [r2, #148]
	ldr.w lr, [r2, #152]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r3, #144]
	ldr.w r12, [r3, #148]
	ldr.w lr, [r3, #152]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r2, #156]
	ldr.w r12, [r3, #156]
	sadd16.w r10,r10,r11
	sadd16.w r10,r10,r12
	smlawb.w r12, r5, r7, r6
	smlawt.w r11, r5, r7, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r7, r7, r12
	smlawb.w r12, r5, r8, r6
	smlawt.w r11, r5, r8, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r8, r8, r12
	smlawb.w r12, r5, r9, r6
	smlawt.w r11, r5, r9, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r9, r9, r12
	smlawb.w r12, r5, r10, r6
	smlawt.w r11, r5, r10, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r10, r10, r12
	str.w r7, [r0, #144]
	str.w r8, [r0, #148]
	str.w r9, [r0, #152]
	str.w r10, [r0, #156]
	ldr.w r7, [r1, #160]
	ldr.w r8, [r1, #164]
	ldr.w r9, [r1, #168]
	ldr.w r10, [r1, #172]
	ldr.w r11, [r2, #160]
	ldr.w r12, [r2, #164]
	ldr.w lr, [r2, #168]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r3, #160]
	ldr.w r12, [r3, #164]
	ldr.w lr, [r3, #168]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r2, #172]
	ldr.w r12, [r3, #172]
	sadd16.w r10,r10,r11
	sadd16.w r10,r10,r12
	smlawb.w r12, r5, r7, r6
	smlawt.w r11, r5, r7, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r7, r7, r12
	smlawb.w r12, r5, r8, r6
	smlawt.w r11, r5, r8, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r8, r8, r12
	smlawb.w r12, r5, r9, r6
	smlawt.w r11, r5, r9, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r9, r9, r12
	smlawb.w r12, r5, r10, r6
	smlawt.w r11, r5, r10, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r10, r10, r12
	str.w r7, [r0, #160]
	str.w r8, [r0, #164]
	str.w r9, [r0, #168]
	str.w r10, [r0, #172]
	ldr.w r7, [r1, #176]
	ldr.w r8, [r1, #180]
	ldr.w r9, [r1, #184]
	ldr.w r10, [r1, #188]
	ldr.w r11, [r2, #176]
	ldr.w r12, [r2, #180]
	ldr.w lr, [r2, #184]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r3, #176]
	ldr.w r12, [r3, #180]
	ldr.w lr, [r3, #184]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r2, #188]
	ldr.w r12, [r3, #188]
	sadd16.w r10,r10,r11
	sadd16.w r10,r10,r12
	smlawb.w r12, r5, r7, r6
	smlawt.w r11, r5, r7, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r7, r7, r12
	smlawb.w r12, r5, r8, r6
	smlawt.w r11, r5, r8, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r8, r8, r12
	smlawb.w r12, r5, r9, r6
	smlawt.w r11, r5, r9, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r9, r9, r12
	smlawb.w r12, r5, r10, r6
	smlawt.w r11, r5, r10, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r10, r10, r12
	str.w r7, [r0, #176]
	str.w r8, [r0, #180]
	str.w r9, [r0, #184]
	str.w r10, [r0, #188]
	ldr.w r7, [r1, #192]
	ldr.w r8, [r1, #196]
	ldr.w r9, [r1, #200]
	ldr.w r10, [r1, #204]
	ldr.w r11, [r2, #192]
	ldr.w r12, [r2, #196]
	ldr.w lr, [r2, #200]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r3, #192]
	ldr.w r12, [r3, #196]
	ldr.w lr, [r3, #200]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r2, #204]
	ldr.w r12, [r3, #204]
	sadd16.w r10,r10,r11
	sadd16.w r10,r10,r12
	smlawb.w r12, r5, r7, r6
	smlawt.w r11, r5, r7, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r7, r7, r12
	smlawb.w r12, r5, r8, r6
	smlawt.w r11, r5, r8, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r8, r8, r12
	smlawb.w r12, r5, r9, r6
	smlawt.w r11, r5, r9, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r9, r9, r12
	smlawb.w r12, r5, r10, r6
	smlawt.w r11, r5, r10, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r10, r10, r12
	str.w r7, [r0, #192]
	str.w r8, [r0, #196]
	str.w r9, [r0, #200]
	str.w r10, [r0, #204]
	ldr.w r7, [r1, #208]
	ldr.w r8, [r1, #212]
	ldr.w r9, [r1, #216]
	ldr.w r10, [r1, #220]
	ldr.w r11, [r2, #208]
	ldr.w r12, [r2, #212]
	ldr.w lr, [r2, #216]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r3, #208]
	ldr.w r12, [r3, #212]
	ldr.w lr, [r3, #216]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r2, #220]
	ldr.w r12, [r3, #220]
	sadd16.w r10,r10,r11
	sadd16.w r10,r10,r12
	smlawb.w r12, r5, r7, r6
	smlawt.w r11, r5, r7, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r7, r7, r12
	smlawb.w r12, r5, r8, r6
	smlawt.w r11, r5, r8, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r8, r8, r12
	smlawb.w r12, r5, r9, r6
	smlawt.w r11, r5, r9, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r9, r9, r12
	smlawb.w r12, r5, r10, r6
	smlawt.w r11, r5, r10, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r10, r10, r12
	str.w r7, [r0, #208]
	str.w r8, [r0, #212]
	str.w r9, [r0, #216]
	str.w r10, [r0, #220]
	ldr.w r7, [r1, #224]
	ldr.w r8, [r1, #228]
	ldr.w r9, [r1, #232]
	ldr.w r10, [r1, #236]
	ldr.w r11, [r2, #224]
	ldr.w r12, [r2, #228]
	ldr.w lr, [r2, #232]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r3, #224]
	ldr.w r12, [r3, #228]
	ldr.w lr, [r3, #232]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r2, #236]
	ldr.w r12, [r3, #236]
	sadd16.w r10,r10,r11
	sadd16.w r10,r10,r12
	smlawb.w r12, r5, r7, r6
	smlawt.w r11, r5, r7, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r7, r7, r12
	smlawb.w r12, r5, r8, r6
	smlawt.w r11, r5, r8, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r8, r8, r12
	smlawb.w r12, r5, r9, r6
	smlawt.w r11, r5, r9, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r9, r9, r12
	smlawb.w r12, r5, r10, r6
	smlawt.w r11, r5, r10, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r10, r10, r12
	str.w r7, [r0, #224]
	str.w r8, [r0, #228]
	str.w r9, [r0, #232]
	str.w r10, [r0, #236]
	ldr.w r7, [r1, #240]
	ldr.w r8, [r1, #244]
	ldr.w r9, [r1, #248]
	ldr.w r10, [r1, #252]
	ldr.w r11, [r2, #240]
	ldr.w r12, [r2, #244]
	ldr.w lr, [r2, #248]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r3, #240]
	ldr.w r12, [r3, #244]
	ldr.w lr, [r3, #248]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r2, #252]
	ldr.w r12, [r3, #252]
	sadd16.w r10,r10,r11
	sadd16.w r10,r10,r12
	smlawb.w r12, r5, r7, r6
	smlawt.w r11, r5, r7, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r7, r7, r12
	smlawb.w r12, r5, r8, r6
	smlawt.w r11, r5, r8, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r8, r8, r12
	smlawb.w r12, r5, r9, r6
	smlawt.w r11, r5, r9, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r9, r9, r12
	smlawb.w r12, r5, r10, r6
	smlawt.w r11, r5, r10, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r10, r10, r12
	str.w r7, [r0, #240]
	str.w r8, [r0, #244]
	str.w r9, [r0, #248]
	str.w r10, [r0, #252]
	ldr.w r7, [r1, #256]
	ldr.w r8, [r1, #260]
	ldr.w r9, [r1, #264]
	ldr.w r10, [r1, #268]
	ldr.w r11, [r2, #256]
	ldr.w r12, [r2, #260]
	ldr.w lr, [r2, #264]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r2, #268]
	sadd16.w r10,r10,r11
	smlawb.w r12, r5, r7, r6
	smlawt.w r11, r5, r7, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r7, r7, r12
	smlawb.w r12, r5, r8, r6
	smlawt.w r11, r5, r8, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r8, r8, r12
	smlawb.w r12, r5, r9, r6
	smlawt.w r11, r5, r9, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r9, r9, r12
	smlawb.w r12, r5, r10, r6
	smlawt.w r11, r5, r10, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r10, r10, r12
	str.w r7, [r0, #256]
	str.w r8, [r0, #260]
	str.w r9, [r0, #264]
	str.w r10, [r0, #268]
	ldr.w r7, [r1, #272]
	ldr.w r8, [r1, #276]
	ldr.w r9, [r1, #280]
	ldr.w r10, [r1, #284]
	ldr.w r11, [r2, #272]
	ldr.w r12, [r2, #276]
	ldr.w lr, [r2, #280]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r2, #284]
	sadd16.w r10,r10,r11
	smlawb.w r12, r5, r7, r6
	smlawt.w r11, r5, r7, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r7, r7, r12
	smlawb.w r12, r5, r8, r6
	smlawt.w r11, r5, r8, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r8, r8, r12
	smlawb.w r12, r5, r9, r6
	smlawt.w r11, r5, r9, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r9, r9, r12
	smlawb.w r12, r5, r10, r6
	smlawt.w r11, r5, r10, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r10, r10, r12
	str.w r7, [r0, #272]
	str.w r8, [r0, #276]
	str.w r9, [r0, #280]
	str.w r10, [r0, #284]
	ldr.w r7, [r1, #288]
	ldr.w r8, [r1, #292]
	ldr.w r9, [r1, #296]
	ldr.w r10, [r1, #300]
	ldr.w r11, [r2, #288]
	ldr.w r12, [r2, #292]
	ldr.w lr, [r2, #296]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r2, #300]
	sadd16.w r10,r10,r11
	smlawb.w r12, r5, r7, r6
	smlawt.w r11, r5, r7, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r7, r7, r12
	smlawb.w r12, r5, r8, r6
	smlawt.w r11, r5, r8, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r8, r8, r12
	smlawb.w r12, r5, r9, r6
	smlawt.w r11, r5, r9, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r9, r9, r12
	smlawb.w r12, r5, r10, r6
	smlawt.w r11, r5, r10, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r10, r10, r12
	str.w r7, [r0, #288]
	str.w r8, [r0, #292]
	str.w r9, [r0, #296]
	str.w r10, [r0, #300]
	ldr.w r7, [r1, #304]
	ldr.w r8, [r1, #308]
	ldr.w r9, [r1, #312]
	ldr.w r10, [r1, #316]
	ldr.w r11, [r2, #304]
	ldr.w r12, [r2, #308]
	ldr.w lr, [r2, #312]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r2, #316]
	sadd16.w r10,r10,r11
	smlawb.w r12, r5, r7, r6
	smlawt.w r11, r5, r7, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r7, r7, r12
	smlawb.w r12, r5, r8, r6
	smlawt.w r11, r5, r8, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r8, r8, r12
	smlawb.w r12, r5, r9, r6
	smlawt.w r11, r5, r9, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r9, r9, r12
	smlawb.w r12, r5, r10, r6
	smlawt.w r11, r5, r10, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r10, r10, r12
	str.w r7, [r0, #304]
	str.w r8, [r0, #308]
	str.w r9, [r0, #312]
	str.w r10, [r0, #316]
	ldr.w r7, [r1, #320]
	ldr.w r8, [r1, #324]
	ldr.w r9, [r1, #328]
	ldr.w r10, [r1, #332]
	ldr.w r11, [r2, #320]
	ldr.w r12, [r2, #324]
	ldr.w lr, [r2, #328]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r2, #332]
	sadd16.w r10,r10,r11
	smlawb.w r12, r5, r7, r6
	smlawt.w r11, r5, r7, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r7, r7, r12
	smlawb.w r12, r5, r8, r6
	smlawt.w r11, r5, r8, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r8, r8, r12
	smlawb.w r12, r5, r9, r6
	smlawt.w r11, r5, r9, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r9, r9, r12
	smlawb.w r12, r5, r10, r6
	smlawt.w r11, r5, r10, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r10, r10, r12
	str.w r7, [r0, #320]
	str.w r8, [r0, #324]
	str.w r9, [r0, #328]
	str.w r10, [r0, #332]
	ldr.w r7, [r1, #336]
	ldr.w r8, [r1, #340]
	ldr.w r9, [r1, #344]
	ldr.w r10, [r1, #348]
	ldr.w r11, [r2, #336]
	ldr.w r12, [r2, #340]
	ldr.w lr, [r2, #344]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r2, #348]
	sadd16.w r10,r10,r11
	smlawb.w r12, r5, r7, r6
	smlawt.w r11, r5, r7, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r7, r7, r12
	smlawb.w r12, r5, r8, r6
	smlawt.w r11, r5, r8, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r8, r8, r12
	smlawb.w r12, r5, r9, r6
	smlawt.w r11, r5, r9, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r9, r9, r12
	smlawb.w r12, r5, r10, r6
	smlawt.w r11, r5, r10, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r10, r10, r12
	str.w r7, [r0, #336]
	str.w r8, [r0, #340]
	str.w r9, [r0, #344]
	str.w r10, [r0, #348]
	ldr.w r7, [r1, #352]
	ldr.w r8, [r1, #356]
	ldr.w r9, [r1, #360]
	ldr.w r10, [r1, #364]
	ldr.w r11, [r2, #352]
	ldr.w r12, [r2, #356]
	ldr.w lr, [r2, #360]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r2, #364]
	sadd16.w r10,r10,r11
	smlawb.w r12, r5, r7, r6
	smlawt.w r11, r5, r7, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r7, r7, r12
	smlawb.w r12, r5, r8, r6
	smlawt.w r11, r5, r8, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r8, r8, r12
	smlawb.w r12, r5, r9, r6
	smlawt.w r11, r5, r9, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r9, r9, r12
	smlawb.w r12, r5, r10, r6
	smlawt.w r11, r5, r10, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r10, r10, r12
	str.w r7, [r0, #352]
	str.w r8, [r0, #356]
	str.w r9, [r0, #360]
	str.w r10, [r0, #364]
	ldr.w r7, [r1, #368]
	ldr.w r8, [r1, #372]
	ldr.w r9, [r1, #376]
	ldr.w r10, [r1, #380]
	ldr.w r11, [r2, #368]
	ldr.w r12, [r2, #372]
	ldr.w lr, [r2, #376]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r2, #380]
	sadd16.w r10,r10,r11
	smlawb.w r12, r5, r7, r6
	smlawt.w r11, r5, r7, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r7, r7, r12
	smlawb.w r12, r5, r8, r6
	smlawt.w r11, r5, r8, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r8, r8, r12
	smlawb.w r12, r5, r9, r6
	smlawt.w r11, r5, r9, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r9, r9, r12
	smlawb.w r12, r5, r10, r6
	smlawt.w r11, r5, r10, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r10, r10, r12
	str.w r7, [r0, #368]
	str.w r8, [r0, #372]
	str.w r9, [r0, #376]
	str.w r10, [r0, #380]
	ldr.w r7, [r1, #384]
	ldr.w r8, [r1, #388]
	ldr.w r9, [r1, #392]
	ldr.w r10, [r1, #396]
	ldr.w r11, [r2, #384]
	ldr.w r12, [r2, #388]
	ldr.w lr, [r2, #392]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r2, #396]
	sadd16.w r10,r10,r11
	smlawb.w r12, r5, r7, r6
	smlawt.w r11, r5, r7, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r7, r7, r12
	smlawb.w r12, r5, r8, r6
	smlawt.w r11, r5, r8, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r8, r8, r12
	smlawb.w r12, r5, r9, r6
	smlawt.w r11, r5, r9, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r9, r9, r12
	smlawb.w r12, r5, r10, r6
	smlawt.w r11, r5, r10, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r10, r10, r12
	str.w r7, [r0, #384]
	str.w r8, [r0, #388]
	str.w r9, [r0, #392]
	str.w r10, [r0, #396]
	ldr.w r7, [r1, #400]
	ldr.w r8, [r1, #404]
	ldr.w r9, [r1, #408]
	ldr.w r10, [r1, #412]
	ldr.w r11, [r2, #400]
	ldr.w r12, [r2, #404]
	ldr.w lr, [r2, #408]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r2, #412]
	sadd16.w r10,r10,r11
	smlawb.w r12, r5, r7, r6
	smlawt.w r11, r5, r7, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r7, r7, r12
	smlawb.w r12, r5, r8, r6
	smlawt.w r11, r5, r8, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r8, r8, r12
	smlawb.w r12, r5, r9, r6
	smlawt.w r11, r5, r9, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r9, r9, r12
	smlawb.w r12, r5, r10, r6
	smlawt.w r11, r5, r10, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r10, r10, r12
	str.w r7, [r0, #400]
	str.w r8, [r0, #404]
	str.w r9, [r0, #408]
	str.w r10, [r0, #412]
	ldr.w r7, [r1, #416]
	ldr.w r8, [r1, #420]
	ldr.w r9, [r1, #424]
	ldr.w r10, [r1, #428]
	ldr.w r11, [r2, #416]
	ldr.w r12, [r2, #420]
	ldr.w lr, [r2, #424]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r2, #428]
	sadd16.w r10,r10,r11
	smlawb.w r12, r5, r7, r6
	smlawt.w r11, r5, r7, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r7, r7, r12
	smlawb.w r12, r5, r8, r6
	smlawt.w r11, r5, r8, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r8, r8, r12
	smlawb.w r12, r5, r9, r6
	smlawt.w r11, r5, r9, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r9, r9, r12
	smlawb.w r12, r5, r10, r6
	smlawt.w r11, r5, r10, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r10, r10, r12
	str.w r7, [r0, #416]
	str.w r8, [r0, #420]
	str.w r9, [r0, #424]
	str.w r10, [r0, #428]
	ldr.w r7, [r1, #432]
	ldr.w r8, [r1, #436]
	ldr.w r9, [r1, #440]
	ldr.w r10, [r1, #444]
	ldr.w r11, [r2, #432]
	ldr.w r12, [r2, #436]
	ldr.w lr, [r2, #440]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r2, #444]
	sadd16.w r10,r10,r11
	smlawb.w r12, r5, r7, r6
	smlawt.w r11, r5, r7, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r7, r7, r12
	smlawb.w r12, r5, r8, r6
	smlawt.w r11, r5, r8, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r8, r8, r12
	smlawb.w r12, r5, r9, r6
	smlawt.w r11, r5, r9, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r9, r9, r12
	smlawb.w r12, r5, r10, r6
	smlawt.w r11, r5, r10, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r10, r10, r12
	str.w r7, [r0, #432]
	str.w r8, [r0, #436]
	str.w r9, [r0, #440]
	str.w r10, [r0, #444]
	ldr.w r7, [r1, #448]
	ldr.w r8, [r1, #452]
	ldr.w r9, [r1, #456]
	ldr.w r10, [r1, #460]
	ldr.w r11, [r2, #448]
	ldr.w r12, [r2, #452]
	ldr.w lr, [r2, #456]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r2, #460]
	sadd16.w r10,r10,r11
	smlawb.w r12, r5, r7, r6
	smlawt.w r11, r5, r7, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r7, r7, r12
	smlawb.w r12, r5, r8, r6
	smlawt.w r11, r5, r8, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r8, r8, r12
	smlawb.w r12, r5, r9, r6
	smlawt.w r11, r5, r9, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r9, r9, r12
	smlawb.w r12, r5, r10, r6
	smlawt.w r11, r5, r10, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r10, r10, r12
	str.w r7, [r0, #448]
	str.w r8, [r0, #452]
	str.w r9, [r0, #456]
	str.w r10, [r0, #460]
	ldr.w r7, [r1, #464]
	ldr.w r8, [r1, #468]
	ldr.w r9, [r1, #472]
	ldr.w r10, [r1, #476]
	ldr.w r11, [r2, #464]
	ldr.w r12, [r2, #468]
	ldr.w lr, [r2, #472]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r2, #476]
	sadd16.w r10,r10,r11
	smlawb.w r12, r5, r7, r6
	smlawt.w r11, r5, r7, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r7, r7, r12
	smlawb.w r12, r5, r8, r6
	smlawt.w r11, r5, r8, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r8, r8, r12
	smlawb.w r12, r5, r9, r6
	smlawt.w r11, r5, r9, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r9, r9, r12
	smlawb.w r12, r5, r10, r6
	smlawt.w r11, r5, r10, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r10, r10, r12
	str.w r7, [r0, #464]
	str.w r8, [r0, #468]
	str.w r9, [r0, #472]
	str.w r10, [r0, #476]
	ldr.w r7, [r1, #480]
	ldr.w r8, [r1, #484]
	ldr.w r9, [r1, #488]
	ldr.w r10, [r1, #492]
	ldr.w r11, [r2, #480]
	ldr.w r12, [r2, #484]
	ldr.w lr, [r2, #488]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r2, #492]
	sadd16.w r10,r10,r11
	smlawb.w r12, r5, r7, r6
	smlawt.w r11, r5, r7, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r7, r7, r12
	smlawb.w r12, r5, r8, r6
	smlawt.w r11, r5, r8, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r8, r8, r12
	smlawb.w r12, r5, r9, r6
	smlawt.w r11, r5, r9, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r9, r9, r12
	smlawb.w r12, r5, r10, r6
	smlawt.w r11, r5, r10, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r10, r10, r12
	str.w r7, [r0, #480]
	str.w r8, [r0, #484]
	str.w r9, [r0, #488]
	str.w r10, [r0, #492]
	ldr.w r7, [r1, #496]
	ldr.w r8, [r1, #500]
	ldr.w r9, [r1, #504]
	ldr.w r10, [r1, #508]
	ldr.w r11, [r2, #496]
	ldr.w r12, [r2, #500]
	ldr.w lr, [r2, #504]
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r11, [r2, #508]
	sadd16.w r10,r10,r11
	smlawb.w r12, r5, r7, r6
	smlawt.w r11, r5, r7, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r7, r7, r12
	smlawb.w r12, r5, r8, r6
	smlawt.w r11, r5, r8, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r8, r8, r12
	smlawb.w r12, r5, r9, r6
	smlawt.w r11, r5, r9, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r9, r9, r12
	smlawb.w r12, r5, r10, r6
	smlawt.w r11, r5, r10, r6
	smulbt.w r12, r4, r12
	smulbt.w r11, r4, r11
	pkhbt.w r12, r12, r11, LSL #16
	ssub16.w r10, r10, r12
	str.w r7, [r0, #496]
	str.w r8, [r0, #500]
	str.w r9, [r0, #504]
	str.w r10, [r0, #508]
	vmov.w r2, s4
	add.w r0, r0, #512
	add.w r1, r3, #1024
	bl	__polymul_128x128
	vmov.w r0, s7
	vmov.w r1, s1
	movw.w r7, #1280
	add.w r1, r7
	vmov.w r2, s5
	bl	__polymul_128x128
	vmov.w r0, s0
	vmov.w r1, s7
	vmov.w r2, s1
	mov.w r3, 4591
	vmov.w r4, s2
	movw.w r5, #32768
	ldr.w r6, [r0, #512]
	ldr.w r7, [r0, #516]
	ldr.w r8, [r0, #520]
	ldr.w r9, [r0, #524]
	ldr.w r10, [r1, #0]
	ldr.w r11, [r1, #4]
	ldr.w r12, [r1, #8]
	ldr.w lr, [r1, #12]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r10, [r2, #256]
	ldr.w r11, [r2, #260]
	ldr.w r12, [r2, #264]
	ldr.w lr, [r2, #268]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	smlawb.w r11, r4, r6, r5
	smlawt.w r10, r4, r6, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r6, r6, r11
	smlawb.w r11, r4, r7, r5
	smlawt.w r10, r4, r7, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r7, r7, r11
	smlawb.w r11, r4, r8, r5
	smlawt.w r10, r4, r8, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r8, r8, r11
	smlawb.w r11, r4, r9, r5
	smlawt.w r10, r4, r9, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r9, r9, r11
	str.w r6, [r0, #512]
	str.w r7, [r0, #516]
	str.w r8, [r0, #520]
	str.w r9, [r0, #524]
	ldr.w r6, [r0, #528]
	ldr.w r7, [r0, #532]
	ldr.w r8, [r0, #536]
	ldr.w r9, [r0, #540]
	ldr.w r10, [r1, #16]
	ldr.w r11, [r1, #20]
	ldr.w r12, [r1, #24]
	ldr.w lr, [r1, #28]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r10, [r2, #272]
	ldr.w r11, [r2, #276]
	ldr.w r12, [r2, #280]
	ldr.w lr, [r2, #284]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	smlawb.w r11, r4, r6, r5
	smlawt.w r10, r4, r6, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r6, r6, r11
	smlawb.w r11, r4, r7, r5
	smlawt.w r10, r4, r7, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r7, r7, r11
	smlawb.w r11, r4, r8, r5
	smlawt.w r10, r4, r8, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r8, r8, r11
	smlawb.w r11, r4, r9, r5
	smlawt.w r10, r4, r9, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r9, r9, r11
	str.w r6, [r0, #528]
	str.w r7, [r0, #532]
	str.w r8, [r0, #536]
	str.w r9, [r0, #540]
	ldr.w r6, [r0, #544]
	ldr.w r7, [r0, #548]
	ldr.w r8, [r0, #552]
	ldr.w r9, [r0, #556]
	ldr.w r10, [r1, #32]
	ldr.w r11, [r1, #36]
	ldr.w r12, [r1, #40]
	ldr.w lr, [r1, #44]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r10, [r2, #288]
	ldr.w r11, [r2, #292]
	ldr.w r12, [r2, #296]
	ldr.w lr, [r2, #300]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	smlawb.w r11, r4, r6, r5
	smlawt.w r10, r4, r6, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r6, r6, r11
	smlawb.w r11, r4, r7, r5
	smlawt.w r10, r4, r7, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r7, r7, r11
	smlawb.w r11, r4, r8, r5
	smlawt.w r10, r4, r8, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r8, r8, r11
	smlawb.w r11, r4, r9, r5
	smlawt.w r10, r4, r9, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r9, r9, r11
	str.w r6, [r0, #544]
	str.w r7, [r0, #548]
	str.w r8, [r0, #552]
	str.w r9, [r0, #556]
	ldr.w r6, [r0, #560]
	ldr.w r7, [r0, #564]
	ldr.w r8, [r0, #568]
	ldr.w r9, [r0, #572]
	ldr.w r10, [r1, #48]
	ldr.w r11, [r1, #52]
	ldr.w r12, [r1, #56]
	ldr.w lr, [r1, #60]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r10, [r2, #304]
	ldr.w r11, [r2, #308]
	ldr.w r12, [r2, #312]
	ldr.w lr, [r2, #316]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	smlawb.w r11, r4, r6, r5
	smlawt.w r10, r4, r6, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r6, r6, r11
	smlawb.w r11, r4, r7, r5
	smlawt.w r10, r4, r7, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r7, r7, r11
	smlawb.w r11, r4, r8, r5
	smlawt.w r10, r4, r8, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r8, r8, r11
	smlawb.w r11, r4, r9, r5
	smlawt.w r10, r4, r9, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r9, r9, r11
	str.w r6, [r0, #560]
	str.w r7, [r0, #564]
	str.w r8, [r0, #568]
	str.w r9, [r0, #572]
	ldr.w r6, [r0, #576]
	ldr.w r7, [r0, #580]
	ldr.w r8, [r0, #584]
	ldr.w r9, [r0, #588]
	ldr.w r10, [r1, #64]
	ldr.w r11, [r1, #68]
	ldr.w r12, [r1, #72]
	ldr.w lr, [r1, #76]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r10, [r2, #320]
	ldr.w r11, [r2, #324]
	ldr.w r12, [r2, #328]
	ldr.w lr, [r2, #332]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	smlawb.w r11, r4, r6, r5
	smlawt.w r10, r4, r6, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r6, r6, r11
	smlawb.w r11, r4, r7, r5
	smlawt.w r10, r4, r7, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r7, r7, r11
	smlawb.w r11, r4, r8, r5
	smlawt.w r10, r4, r8, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r8, r8, r11
	smlawb.w r11, r4, r9, r5
	smlawt.w r10, r4, r9, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r9, r9, r11
	str.w r6, [r0, #576]
	str.w r7, [r0, #580]
	str.w r8, [r0, #584]
	str.w r9, [r0, #588]
	ldr.w r6, [r0, #592]
	ldr.w r7, [r0, #596]
	ldr.w r8, [r0, #600]
	ldr.w r9, [r0, #604]
	ldr.w r10, [r1, #80]
	ldr.w r11, [r1, #84]
	ldr.w r12, [r1, #88]
	ldr.w lr, [r1, #92]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r10, [r2, #336]
	ldr.w r11, [r2, #340]
	ldr.w r12, [r2, #344]
	ldr.w lr, [r2, #348]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	smlawb.w r11, r4, r6, r5
	smlawt.w r10, r4, r6, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r6, r6, r11
	smlawb.w r11, r4, r7, r5
	smlawt.w r10, r4, r7, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r7, r7, r11
	smlawb.w r11, r4, r8, r5
	smlawt.w r10, r4, r8, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r8, r8, r11
	smlawb.w r11, r4, r9, r5
	smlawt.w r10, r4, r9, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r9, r9, r11
	str.w r6, [r0, #592]
	str.w r7, [r0, #596]
	str.w r8, [r0, #600]
	str.w r9, [r0, #604]
	ldr.w r6, [r0, #608]
	ldr.w r7, [r0, #612]
	ldr.w r8, [r0, #616]
	ldr.w r9, [r0, #620]
	ldr.w r10, [r1, #96]
	ldr.w r11, [r1, #100]
	ldr.w r12, [r1, #104]
	ldr.w lr, [r1, #108]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r10, [r2, #352]
	ldr.w r11, [r2, #356]
	ldr.w r12, [r2, #360]
	ldr.w lr, [r2, #364]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	smlawb.w r11, r4, r6, r5
	smlawt.w r10, r4, r6, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r6, r6, r11
	smlawb.w r11, r4, r7, r5
	smlawt.w r10, r4, r7, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r7, r7, r11
	smlawb.w r11, r4, r8, r5
	smlawt.w r10, r4, r8, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r8, r8, r11
	smlawb.w r11, r4, r9, r5
	smlawt.w r10, r4, r9, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r9, r9, r11
	str.w r6, [r0, #608]
	str.w r7, [r0, #612]
	str.w r8, [r0, #616]
	str.w r9, [r0, #620]
	ldr.w r6, [r0, #624]
	ldr.w r7, [r0, #628]
	ldr.w r8, [r0, #632]
	ldr.w r9, [r0, #636]
	ldr.w r10, [r1, #112]
	ldr.w r11, [r1, #116]
	ldr.w r12, [r1, #120]
	ldr.w lr, [r1, #124]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r10, [r2, #368]
	ldr.w r11, [r2, #372]
	ldr.w r12, [r2, #376]
	ldr.w lr, [r2, #380]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	smlawb.w r11, r4, r6, r5
	smlawt.w r10, r4, r6, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r6, r6, r11
	smlawb.w r11, r4, r7, r5
	smlawt.w r10, r4, r7, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r7, r7, r11
	smlawb.w r11, r4, r8, r5
	smlawt.w r10, r4, r8, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r8, r8, r11
	smlawb.w r11, r4, r9, r5
	smlawt.w r10, r4, r9, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r9, r9, r11
	str.w r6, [r0, #624]
	str.w r7, [r0, #628]
	str.w r8, [r0, #632]
	str.w r9, [r0, #636]
	ldr.w r6, [r0, #640]
	ldr.w r7, [r0, #644]
	ldr.w r8, [r0, #648]
	ldr.w r9, [r0, #652]
	ldr.w r10, [r1, #128]
	ldr.w r11, [r1, #132]
	ldr.w r12, [r1, #136]
	ldr.w lr, [r1, #140]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r10, [r2, #384]
	ldr.w r11, [r2, #388]
	ldr.w r12, [r2, #392]
	ldr.w lr, [r2, #396]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	smlawb.w r11, r4, r6, r5
	smlawt.w r10, r4, r6, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r6, r6, r11
	smlawb.w r11, r4, r7, r5
	smlawt.w r10, r4, r7, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r7, r7, r11
	smlawb.w r11, r4, r8, r5
	smlawt.w r10, r4, r8, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r8, r8, r11
	smlawb.w r11, r4, r9, r5
	smlawt.w r10, r4, r9, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r9, r9, r11
	str.w r6, [r0, #640]
	str.w r7, [r0, #644]
	str.w r8, [r0, #648]
	str.w r9, [r0, #652]
	ldr.w r6, [r0, #656]
	ldr.w r7, [r0, #660]
	ldr.w r8, [r0, #664]
	ldr.w r9, [r0, #668]
	ldr.w r10, [r1, #144]
	ldr.w r11, [r1, #148]
	ldr.w r12, [r1, #152]
	ldr.w lr, [r1, #156]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r10, [r2, #400]
	ldr.w r11, [r2, #404]
	ldr.w r12, [r2, #408]
	ldr.w lr, [r2, #412]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	smlawb.w r11, r4, r6, r5
	smlawt.w r10, r4, r6, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r6, r6, r11
	smlawb.w r11, r4, r7, r5
	smlawt.w r10, r4, r7, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r7, r7, r11
	smlawb.w r11, r4, r8, r5
	smlawt.w r10, r4, r8, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r8, r8, r11
	smlawb.w r11, r4, r9, r5
	smlawt.w r10, r4, r9, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r9, r9, r11
	str.w r6, [r0, #656]
	str.w r7, [r0, #660]
	str.w r8, [r0, #664]
	str.w r9, [r0, #668]
	ldr.w r6, [r0, #672]
	ldr.w r7, [r0, #676]
	ldr.w r8, [r0, #680]
	ldr.w r9, [r0, #684]
	ldr.w r10, [r1, #160]
	ldr.w r11, [r1, #164]
	ldr.w r12, [r1, #168]
	ldr.w lr, [r1, #172]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r10, [r2, #416]
	ldr.w r11, [r2, #420]
	ldr.w r12, [r2, #424]
	ldr.w lr, [r2, #428]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	smlawb.w r11, r4, r6, r5
	smlawt.w r10, r4, r6, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r6, r6, r11
	smlawb.w r11, r4, r7, r5
	smlawt.w r10, r4, r7, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r7, r7, r11
	smlawb.w r11, r4, r8, r5
	smlawt.w r10, r4, r8, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r8, r8, r11
	smlawb.w r11, r4, r9, r5
	smlawt.w r10, r4, r9, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r9, r9, r11
	str.w r6, [r0, #672]
	str.w r7, [r0, #676]
	str.w r8, [r0, #680]
	str.w r9, [r0, #684]
	ldr.w r6, [r0, #688]
	ldr.w r7, [r0, #692]
	ldr.w r8, [r0, #696]
	ldr.w r9, [r0, #700]
	ldr.w r10, [r1, #176]
	ldr.w r11, [r1, #180]
	ldr.w r12, [r1, #184]
	ldr.w lr, [r1, #188]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r10, [r2, #432]
	ldr.w r11, [r2, #436]
	ldr.w r12, [r2, #440]
	ldr.w lr, [r2, #444]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	smlawb.w r11, r4, r6, r5
	smlawt.w r10, r4, r6, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r6, r6, r11
	smlawb.w r11, r4, r7, r5
	smlawt.w r10, r4, r7, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r7, r7, r11
	smlawb.w r11, r4, r8, r5
	smlawt.w r10, r4, r8, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r8, r8, r11
	smlawb.w r11, r4, r9, r5
	smlawt.w r10, r4, r9, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r9, r9, r11
	str.w r6, [r0, #688]
	str.w r7, [r0, #692]
	str.w r8, [r0, #696]
	str.w r9, [r0, #700]
	ldr.w r6, [r0, #704]
	ldr.w r7, [r0, #708]
	ldr.w r8, [r0, #712]
	ldr.w r9, [r0, #716]
	ldr.w r10, [r1, #192]
	ldr.w r11, [r1, #196]
	ldr.w r12, [r1, #200]
	ldr.w lr, [r1, #204]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r10, [r2, #448]
	ldr.w r11, [r2, #452]
	ldr.w r12, [r2, #456]
	ldr.w lr, [r2, #460]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	smlawb.w r11, r4, r6, r5
	smlawt.w r10, r4, r6, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r6, r6, r11
	smlawb.w r11, r4, r7, r5
	smlawt.w r10, r4, r7, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r7, r7, r11
	smlawb.w r11, r4, r8, r5
	smlawt.w r10, r4, r8, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r8, r8, r11
	smlawb.w r11, r4, r9, r5
	smlawt.w r10, r4, r9, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r9, r9, r11
	str.w r6, [r0, #704]
	str.w r7, [r0, #708]
	str.w r8, [r0, #712]
	str.w r9, [r0, #716]
	ldr.w r6, [r0, #720]
	ldr.w r7, [r0, #724]
	ldr.w r8, [r0, #728]
	ldr.w r9, [r0, #732]
	ldr.w r10, [r1, #208]
	ldr.w r11, [r1, #212]
	ldr.w r12, [r1, #216]
	ldr.w lr, [r1, #220]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r10, [r2, #464]
	ldr.w r11, [r2, #468]
	ldr.w r12, [r2, #472]
	ldr.w lr, [r2, #476]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	smlawb.w r11, r4, r6, r5
	smlawt.w r10, r4, r6, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r6, r6, r11
	smlawb.w r11, r4, r7, r5
	smlawt.w r10, r4, r7, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r7, r7, r11
	smlawb.w r11, r4, r8, r5
	smlawt.w r10, r4, r8, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r8, r8, r11
	smlawb.w r11, r4, r9, r5
	smlawt.w r10, r4, r9, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r9, r9, r11
	str.w r6, [r0, #720]
	str.w r7, [r0, #724]
	str.w r8, [r0, #728]
	str.w r9, [r0, #732]
	ldr.w r6, [r0, #736]
	ldr.w r7, [r0, #740]
	ldr.w r8, [r0, #744]
	ldr.w r9, [r0, #748]
	ldr.w r10, [r1, #224]
	ldr.w r11, [r1, #228]
	ldr.w r12, [r1, #232]
	ldr.w lr, [r1, #236]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r10, [r2, #480]
	ldr.w r11, [r2, #484]
	ldr.w r12, [r2, #488]
	ldr.w lr, [r2, #492]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	smlawb.w r11, r4, r6, r5
	smlawt.w r10, r4, r6, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r6, r6, r11
	smlawb.w r11, r4, r7, r5
	smlawt.w r10, r4, r7, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r7, r7, r11
	smlawb.w r11, r4, r8, r5
	smlawt.w r10, r4, r8, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r8, r8, r11
	smlawb.w r11, r4, r9, r5
	smlawt.w r10, r4, r9, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r9, r9, r11
	str.w r6, [r0, #736]
	str.w r7, [r0, #740]
	str.w r8, [r0, #744]
	str.w r9, [r0, #748]
	ldr.w r6, [r0, #752]
	ldr.w r7, [r0, #756]
	ldr.w r8, [r0, #760]
	ldr.w r9, [r0, #764]
	ldr.w r10, [r1, #240]
	ldr.w r11, [r1, #244]
	ldr.w r12, [r1, #248]
	ldr.w lr, [r1, #252]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	ldr.w r10, [r2, #496]
	ldr.w r11, [r2, #500]
	ldr.w r12, [r2, #504]
	ldr.w lr, [r2, #508]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	smlawb.w r11, r4, r6, r5
	smlawt.w r10, r4, r6, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r6, r6, r11
	smlawb.w r11, r4, r7, r5
	smlawt.w r10, r4, r7, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r7, r7, r11
	smlawb.w r11, r4, r8, r5
	smlawt.w r10, r4, r8, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r8, r8, r11
	smlawb.w r11, r4, r9, r5
	smlawt.w r10, r4, r9, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r9, r9, r11
	str.w r6, [r0, #752]
	str.w r7, [r0, #756]
	str.w r8, [r0, #760]
	str.w r9, [r0, #764]
	ldr.w r6, [r0, #768]
	ldr.w r7, [r0, #772]
	ldr.w r8, [r0, #776]
	ldr.w r9, [r0, #780]
	ldr.w r10, [r1, #256]
	ldr.w r11, [r1, #260]
	ldr.w r12, [r1, #264]
	ldr.w lr, [r1, #268]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	smlawb.w r11, r4, r6, r5
	smlawt.w r10, r4, r6, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r6, r6, r11
	smlawb.w r11, r4, r7, r5
	smlawt.w r10, r4, r7, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r7, r7, r11
	smlawb.w r11, r4, r8, r5
	smlawt.w r10, r4, r8, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r8, r8, r11
	smlawb.w r11, r4, r9, r5
	smlawt.w r10, r4, r9, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r9, r9, r11
	str.w r6, [r0, #768]
	str.w r7, [r0, #772]
	str.w r8, [r0, #776]
	str.w r9, [r0, #780]
	ldr.w r6, [r0, #784]
	ldr.w r7, [r0, #788]
	ldr.w r8, [r0, #792]
	ldr.w r9, [r0, #796]
	ldr.w r10, [r1, #272]
	ldr.w r11, [r1, #276]
	ldr.w r12, [r1, #280]
	ldr.w lr, [r1, #284]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	smlawb.w r11, r4, r6, r5
	smlawt.w r10, r4, r6, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r6, r6, r11
	smlawb.w r11, r4, r7, r5
	smlawt.w r10, r4, r7, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r7, r7, r11
	smlawb.w r11, r4, r8, r5
	smlawt.w r10, r4, r8, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r8, r8, r11
	smlawb.w r11, r4, r9, r5
	smlawt.w r10, r4, r9, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r9, r9, r11
	str.w r6, [r0, #784]
	str.w r7, [r0, #788]
	str.w r8, [r0, #792]
	str.w r9, [r0, #796]
	ldr.w r6, [r0, #800]
	ldr.w r7, [r0, #804]
	ldr.w r8, [r0, #808]
	ldr.w r9, [r0, #812]
	ldr.w r10, [r1, #288]
	ldr.w r11, [r1, #292]
	ldr.w r12, [r1, #296]
	ldr.w lr, [r1, #300]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	smlawb.w r11, r4, r6, r5
	smlawt.w r10, r4, r6, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r6, r6, r11
	smlawb.w r11, r4, r7, r5
	smlawt.w r10, r4, r7, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r7, r7, r11
	smlawb.w r11, r4, r8, r5
	smlawt.w r10, r4, r8, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r8, r8, r11
	smlawb.w r11, r4, r9, r5
	smlawt.w r10, r4, r9, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r9, r9, r11
	str.w r6, [r0, #800]
	str.w r7, [r0, #804]
	str.w r8, [r0, #808]
	str.w r9, [r0, #812]
	ldr.w r6, [r0, #816]
	ldr.w r7, [r0, #820]
	ldr.w r8, [r0, #824]
	ldr.w r9, [r0, #828]
	ldr.w r10, [r1, #304]
	ldr.w r11, [r1, #308]
	ldr.w r12, [r1, #312]
	ldr.w lr, [r1, #316]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	smlawb.w r11, r4, r6, r5
	smlawt.w r10, r4, r6, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r6, r6, r11
	smlawb.w r11, r4, r7, r5
	smlawt.w r10, r4, r7, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r7, r7, r11
	smlawb.w r11, r4, r8, r5
	smlawt.w r10, r4, r8, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r8, r8, r11
	smlawb.w r11, r4, r9, r5
	smlawt.w r10, r4, r9, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r9, r9, r11
	str.w r6, [r0, #816]
	str.w r7, [r0, #820]
	str.w r8, [r0, #824]
	str.w r9, [r0, #828]
	ldr.w r6, [r0, #832]
	ldr.w r7, [r0, #836]
	ldr.w r8, [r0, #840]
	ldr.w r9, [r0, #844]
	ldr.w r10, [r1, #320]
	ldr.w r11, [r1, #324]
	ldr.w r12, [r1, #328]
	ldr.w lr, [r1, #332]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	smlawb.w r11, r4, r6, r5
	smlawt.w r10, r4, r6, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r6, r6, r11
	smlawb.w r11, r4, r7, r5
	smlawt.w r10, r4, r7, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r7, r7, r11
	smlawb.w r11, r4, r8, r5
	smlawt.w r10, r4, r8, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r8, r8, r11
	smlawb.w r11, r4, r9, r5
	smlawt.w r10, r4, r9, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r9, r9, r11
	str.w r6, [r0, #832]
	str.w r7, [r0, #836]
	str.w r8, [r0, #840]
	str.w r9, [r0, #844]
	ldr.w r6, [r0, #848]
	ldr.w r7, [r0, #852]
	ldr.w r8, [r0, #856]
	ldr.w r9, [r0, #860]
	ldr.w r10, [r1, #336]
	ldr.w r11, [r1, #340]
	ldr.w r12, [r1, #344]
	ldr.w lr, [r1, #348]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	smlawb.w r11, r4, r6, r5
	smlawt.w r10, r4, r6, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r6, r6, r11
	smlawb.w r11, r4, r7, r5
	smlawt.w r10, r4, r7, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r7, r7, r11
	smlawb.w r11, r4, r8, r5
	smlawt.w r10, r4, r8, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r8, r8, r11
	smlawb.w r11, r4, r9, r5
	smlawt.w r10, r4, r9, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r9, r9, r11
	str.w r6, [r0, #848]
	str.w r7, [r0, #852]
	str.w r8, [r0, #856]
	str.w r9, [r0, #860]
	ldr.w r6, [r0, #864]
	ldr.w r7, [r0, #868]
	ldr.w r8, [r0, #872]
	ldr.w r9, [r0, #876]
	ldr.w r10, [r1, #352]
	ldr.w r11, [r1, #356]
	ldr.w r12, [r1, #360]
	ldr.w lr, [r1, #364]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	smlawb.w r11, r4, r6, r5
	smlawt.w r10, r4, r6, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r6, r6, r11
	smlawb.w r11, r4, r7, r5
	smlawt.w r10, r4, r7, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r7, r7, r11
	smlawb.w r11, r4, r8, r5
	smlawt.w r10, r4, r8, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r8, r8, r11
	smlawb.w r11, r4, r9, r5
	smlawt.w r10, r4, r9, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r9, r9, r11
	str.w r6, [r0, #864]
	str.w r7, [r0, #868]
	str.w r8, [r0, #872]
	str.w r9, [r0, #876]
	ldr.w r6, [r0, #880]
	ldr.w r7, [r0, #884]
	ldr.w r8, [r0, #888]
	ldr.w r9, [r0, #892]
	ldr.w r10, [r1, #368]
	ldr.w r11, [r1, #372]
	ldr.w r12, [r1, #376]
	ldr.w lr, [r1, #380]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	smlawb.w r11, r4, r6, r5
	smlawt.w r10, r4, r6, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r6, r6, r11
	smlawb.w r11, r4, r7, r5
	smlawt.w r10, r4, r7, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r7, r7, r11
	smlawb.w r11, r4, r8, r5
	smlawt.w r10, r4, r8, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r8, r8, r11
	smlawb.w r11, r4, r9, r5
	smlawt.w r10, r4, r9, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r9, r9, r11
	str.w r6, [r0, #880]
	str.w r7, [r0, #884]
	str.w r8, [r0, #888]
	str.w r9, [r0, #892]
	ldr.w r6, [r0, #896]
	ldr.w r7, [r0, #900]
	ldr.w r8, [r0, #904]
	ldr.w r9, [r0, #908]
	ldr.w r10, [r1, #384]
	ldr.w r11, [r1, #388]
	ldr.w r12, [r1, #392]
	ldr.w lr, [r1, #396]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	smlawb.w r11, r4, r6, r5
	smlawt.w r10, r4, r6, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r6, r6, r11
	smlawb.w r11, r4, r7, r5
	smlawt.w r10, r4, r7, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r7, r7, r11
	smlawb.w r11, r4, r8, r5
	smlawt.w r10, r4, r8, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r8, r8, r11
	smlawb.w r11, r4, r9, r5
	smlawt.w r10, r4, r9, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r9, r9, r11
	str.w r6, [r0, #896]
	str.w r7, [r0, #900]
	str.w r8, [r0, #904]
	str.w r9, [r0, #908]
	ldr.w r6, [r0, #912]
	ldr.w r7, [r0, #916]
	ldr.w r8, [r0, #920]
	ldr.w r9, [r0, #924]
	ldr.w r10, [r1, #400]
	ldr.w r11, [r1, #404]
	ldr.w r12, [r1, #408]
	ldr.w lr, [r1, #412]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	smlawb.w r11, r4, r6, r5
	smlawt.w r10, r4, r6, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r6, r6, r11
	smlawb.w r11, r4, r7, r5
	smlawt.w r10, r4, r7, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r7, r7, r11
	smlawb.w r11, r4, r8, r5
	smlawt.w r10, r4, r8, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r8, r8, r11
	smlawb.w r11, r4, r9, r5
	smlawt.w r10, r4, r9, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r9, r9, r11
	str.w r6, [r0, #912]
	str.w r7, [r0, #916]
	str.w r8, [r0, #920]
	str.w r9, [r0, #924]
	ldr.w r6, [r0, #928]
	ldr.w r7, [r0, #932]
	ldr.w r8, [r0, #936]
	ldr.w r9, [r0, #940]
	ldr.w r10, [r1, #416]
	ldr.w r11, [r1, #420]
	ldr.w r12, [r1, #424]
	ldr.w lr, [r1, #428]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	smlawb.w r11, r4, r6, r5
	smlawt.w r10, r4, r6, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r6, r6, r11
	smlawb.w r11, r4, r7, r5
	smlawt.w r10, r4, r7, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r7, r7, r11
	smlawb.w r11, r4, r8, r5
	smlawt.w r10, r4, r8, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r8, r8, r11
	smlawb.w r11, r4, r9, r5
	smlawt.w r10, r4, r9, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r9, r9, r11
	str.w r6, [r0, #928]
	str.w r7, [r0, #932]
	str.w r8, [r0, #936]
	str.w r9, [r0, #940]
	ldr.w r6, [r0, #944]
	ldr.w r7, [r0, #948]
	ldr.w r8, [r0, #952]
	ldr.w r9, [r0, #956]
	ldr.w r10, [r1, #432]
	ldr.w r11, [r1, #436]
	ldr.w r12, [r1, #440]
	ldr.w lr, [r1, #444]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	smlawb.w r11, r4, r6, r5
	smlawt.w r10, r4, r6, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r6, r6, r11
	smlawb.w r11, r4, r7, r5
	smlawt.w r10, r4, r7, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r7, r7, r11
	smlawb.w r11, r4, r8, r5
	smlawt.w r10, r4, r8, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r8, r8, r11
	smlawb.w r11, r4, r9, r5
	smlawt.w r10, r4, r9, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r9, r9, r11
	str.w r6, [r0, #944]
	str.w r7, [r0, #948]
	str.w r8, [r0, #952]
	str.w r9, [r0, #956]
	ldr.w r6, [r0, #960]
	ldr.w r7, [r0, #964]
	ldr.w r8, [r0, #968]
	ldr.w r9, [r0, #972]
	ldr.w r10, [r1, #448]
	ldr.w r11, [r1, #452]
	ldr.w r12, [r1, #456]
	ldr.w lr, [r1, #460]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	smlawb.w r11, r4, r6, r5
	smlawt.w r10, r4, r6, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r6, r6, r11
	smlawb.w r11, r4, r7, r5
	smlawt.w r10, r4, r7, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r7, r7, r11
	smlawb.w r11, r4, r8, r5
	smlawt.w r10, r4, r8, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r8, r8, r11
	smlawb.w r11, r4, r9, r5
	smlawt.w r10, r4, r9, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r9, r9, r11
	str.w r6, [r0, #960]
	str.w r7, [r0, #964]
	str.w r8, [r0, #968]
	str.w r9, [r0, #972]
	ldr.w r6, [r0, #976]
	ldr.w r7, [r0, #980]
	ldr.w r8, [r0, #984]
	ldr.w r9, [r0, #988]
	ldr.w r10, [r1, #464]
	ldr.w r11, [r1, #468]
	ldr.w r12, [r1, #472]
	ldr.w lr, [r1, #476]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	smlawb.w r11, r4, r6, r5
	smlawt.w r10, r4, r6, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r6, r6, r11
	smlawb.w r11, r4, r7, r5
	smlawt.w r10, r4, r7, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r7, r7, r11
	smlawb.w r11, r4, r8, r5
	smlawt.w r10, r4, r8, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r8, r8, r11
	smlawb.w r11, r4, r9, r5
	smlawt.w r10, r4, r9, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r9, r9, r11
	str.w r6, [r0, #976]
	str.w r7, [r0, #980]
	str.w r8, [r0, #984]
	str.w r9, [r0, #988]
	ldr.w r6, [r0, #992]
	ldr.w r7, [r0, #996]
	ldr.w r8, [r0, #1000]
	ldr.w r9, [r0, #1004]
	ldr.w r10, [r1, #480]
	ldr.w r11, [r1, #484]
	ldr.w r12, [r1, #488]
	ldr.w lr, [r1, #492]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	sadd16.w r9,r9,lr
	smlawb.w r11, r4, r6, r5
	smlawt.w r10, r4, r6, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r6, r6, r11
	smlawb.w r11, r4, r7, r5
	smlawt.w r10, r4, r7, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r7, r7, r11
	smlawb.w r11, r4, r8, r5
	smlawt.w r10, r4, r8, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r8, r8, r11
	smlawb.w r11, r4, r9, r5
	smlawt.w r10, r4, r9, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r9, r9, r11
	str.w r6, [r0, #992]
	str.w r7, [r0, #996]
	str.w r8, [r0, #1000]
	str.w r9, [r0, #1004]
	ldr.w r6, [r0, #1008]
	ldr.w r7, [r0, #1012]
	ldr.w r8, [r0, #1016]
	ldrsh.w r9, [r0, #1020]
	ldr.w r10, [r1, #496]
	ldr.w r11, [r1, #500]
	ldr.w r12, [r1, #504]
	ldrsh.w lr, [r1, #508]
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	add.w r9,r9,lr
	smlawb.w r11, r4, r6, r5
	smlawt.w r10, r4, r6, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r6, r6, r11
	smlawb.w r11, r4, r7, r5
	smlawt.w r10, r4, r7, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r7, r7, r11
	smlawb.w r11, r4, r8, r5
	smlawt.w r10, r4, r8, r5
	smulbt.w r11, r3, r11
	smulbt.w r10, r3, r10
	pkhbt.w r11, r11, r10, LSL #16
	ssub16.w r8, r8, r11
	smmulr r10, r9, r4
	mls r9, r10, r3, r9
	str.w r6, [r0, #1008]
	str.w r7, [r0, #1012]
	str.w r8, [r0, #1016]
	strh.w r9, [r0, #1020]
	vpop.w { s16-s25 }
	pop {r1-r12, pc}


.p2align 2,,3
.syntax	unified
.text
__polyadd_256:
	push.w {lr}
	mov.w r2, 4591
	vmov.w r3, s2
	movw.w r4, #32768
	ldr.w r5, [r1, #0]
	ldr.w r6, [r1, #4]
	ldr.w r7, [r1, #8]
	ldr.w r8, [r1, #12]
	ldr.w r9, [r0, #0]
	ldr.w r10, [r0, #4]
	ldr.w r11, [r0, #8]
	ldr.w r12, [r0, #12]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #0]
	str.w r6, [r0, #4]
	str.w r7, [r0, #8]
	str.w r8, [r0, #12]
	ldr.w r5, [r1, #16]
	ldr.w r6, [r1, #20]
	ldr.w r7, [r1, #24]
	ldr.w r8, [r1, #28]
	ldr.w r9, [r0, #16]
	ldr.w r10, [r0, #20]
	ldr.w r11, [r0, #24]
	ldr.w r12, [r0, #28]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #16]
	str.w r6, [r0, #20]
	str.w r7, [r0, #24]
	str.w r8, [r0, #28]
	ldr.w r5, [r1, #32]
	ldr.w r6, [r1, #36]
	ldr.w r7, [r1, #40]
	ldr.w r8, [r1, #44]
	ldr.w r9, [r0, #32]
	ldr.w r10, [r0, #36]
	ldr.w r11, [r0, #40]
	ldr.w r12, [r0, #44]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #32]
	str.w r6, [r0, #36]
	str.w r7, [r0, #40]
	str.w r8, [r0, #44]
	ldr.w r5, [r1, #48]
	ldr.w r6, [r1, #52]
	ldr.w r7, [r1, #56]
	ldr.w r8, [r1, #60]
	ldr.w r9, [r0, #48]
	ldr.w r10, [r0, #52]
	ldr.w r11, [r0, #56]
	ldr.w r12, [r0, #60]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #48]
	str.w r6, [r0, #52]
	str.w r7, [r0, #56]
	str.w r8, [r0, #60]
	ldr.w r5, [r1, #64]
	ldr.w r6, [r1, #68]
	ldr.w r7, [r1, #72]
	ldr.w r8, [r1, #76]
	ldr.w r9, [r0, #64]
	ldr.w r10, [r0, #68]
	ldr.w r11, [r0, #72]
	ldr.w r12, [r0, #76]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #64]
	str.w r6, [r0, #68]
	str.w r7, [r0, #72]
	str.w r8, [r0, #76]
	ldr.w r5, [r1, #80]
	ldr.w r6, [r1, #84]
	ldr.w r7, [r1, #88]
	ldr.w r8, [r1, #92]
	ldr.w r9, [r0, #80]
	ldr.w r10, [r0, #84]
	ldr.w r11, [r0, #88]
	ldr.w r12, [r0, #92]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #80]
	str.w r6, [r0, #84]
	str.w r7, [r0, #88]
	str.w r8, [r0, #92]
	ldr.w r5, [r1, #96]
	ldr.w r6, [r1, #100]
	ldr.w r7, [r1, #104]
	ldr.w r8, [r1, #108]
	ldr.w r9, [r0, #96]
	ldr.w r10, [r0, #100]
	ldr.w r11, [r0, #104]
	ldr.w r12, [r0, #108]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #96]
	str.w r6, [r0, #100]
	str.w r7, [r0, #104]
	str.w r8, [r0, #108]
	ldr.w r5, [r1, #112]
	ldr.w r6, [r1, #116]
	ldr.w r7, [r1, #120]
	ldr.w r8, [r1, #124]
	ldr.w r9, [r0, #112]
	ldr.w r10, [r0, #116]
	ldr.w r11, [r0, #120]
	ldr.w r12, [r0, #124]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #112]
	str.w r6, [r0, #116]
	str.w r7, [r0, #120]
	str.w r8, [r0, #124]
	ldr.w r5, [r1, #128]
	ldr.w r6, [r1, #132]
	ldr.w r7, [r1, #136]
	ldr.w r8, [r1, #140]
	ldr.w r9, [r0, #128]
	ldr.w r10, [r0, #132]
	ldr.w r11, [r0, #136]
	ldr.w r12, [r0, #140]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #128]
	str.w r6, [r0, #132]
	str.w r7, [r0, #136]
	str.w r8, [r0, #140]
	ldr.w r5, [r1, #144]
	ldr.w r6, [r1, #148]
	ldr.w r7, [r1, #152]
	ldr.w r8, [r1, #156]
	ldr.w r9, [r0, #144]
	ldr.w r10, [r0, #148]
	ldr.w r11, [r0, #152]
	ldr.w r12, [r0, #156]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #144]
	str.w r6, [r0, #148]
	str.w r7, [r0, #152]
	str.w r8, [r0, #156]
	ldr.w r5, [r1, #160]
	ldr.w r6, [r1, #164]
	ldr.w r7, [r1, #168]
	ldr.w r8, [r1, #172]
	ldr.w r9, [r0, #160]
	ldr.w r10, [r0, #164]
	ldr.w r11, [r0, #168]
	ldr.w r12, [r0, #172]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #160]
	str.w r6, [r0, #164]
	str.w r7, [r0, #168]
	str.w r8, [r0, #172]
	ldr.w r5, [r1, #176]
	ldr.w r6, [r1, #180]
	ldr.w r7, [r1, #184]
	ldr.w r8, [r1, #188]
	ldr.w r9, [r0, #176]
	ldr.w r10, [r0, #180]
	ldr.w r11, [r0, #184]
	ldr.w r12, [r0, #188]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #176]
	str.w r6, [r0, #180]
	str.w r7, [r0, #184]
	str.w r8, [r0, #188]
	ldr.w r5, [r1, #192]
	ldr.w r6, [r1, #196]
	ldr.w r7, [r1, #200]
	ldr.w r8, [r1, #204]
	ldr.w r9, [r0, #192]
	ldr.w r10, [r0, #196]
	ldr.w r11, [r0, #200]
	ldr.w r12, [r0, #204]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #192]
	str.w r6, [r0, #196]
	str.w r7, [r0, #200]
	str.w r8, [r0, #204]
	ldr.w r5, [r1, #208]
	ldr.w r6, [r1, #212]
	ldr.w r7, [r1, #216]
	ldr.w r8, [r1, #220]
	ldr.w r9, [r0, #208]
	ldr.w r10, [r0, #212]
	ldr.w r11, [r0, #216]
	ldr.w r12, [r0, #220]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #208]
	str.w r6, [r0, #212]
	str.w r7, [r0, #216]
	str.w r8, [r0, #220]
	ldr.w r5, [r1, #224]
	ldr.w r6, [r1, #228]
	ldr.w r7, [r1, #232]
	ldr.w r8, [r1, #236]
	ldr.w r9, [r0, #224]
	ldr.w r10, [r0, #228]
	ldr.w r11, [r0, #232]
	ldr.w r12, [r0, #236]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #224]
	str.w r6, [r0, #228]
	str.w r7, [r0, #232]
	str.w r8, [r0, #236]
	ldr.w r5, [r1, #240]
	ldr.w r6, [r1, #244]
	ldr.w r7, [r1, #248]
	ldr.w r8, [r1, #252]
	ldr.w r9, [r0, #240]
	ldr.w r10, [r0, #244]
	ldr.w r11, [r0, #248]
	ldr.w r12, [r0, #252]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #240]
	str.w r6, [r0, #244]
	str.w r7, [r0, #248]
	str.w r8, [r0, #252]
	ldr.w r5, [r1, #256]
	ldr.w r6, [r1, #260]
	ldr.w r7, [r1, #264]
	ldr.w r8, [r1, #268]
	ldr.w r9, [r0, #256]
	ldr.w r10, [r0, #260]
	ldr.w r11, [r0, #264]
	ldr.w r12, [r0, #268]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #256]
	str.w r6, [r0, #260]
	str.w r7, [r0, #264]
	str.w r8, [r0, #268]
	ldr.w r5, [r1, #272]
	ldr.w r6, [r1, #276]
	ldr.w r7, [r1, #280]
	ldr.w r8, [r1, #284]
	ldr.w r9, [r0, #272]
	ldr.w r10, [r0, #276]
	ldr.w r11, [r0, #280]
	ldr.w r12, [r0, #284]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #272]
	str.w r6, [r0, #276]
	str.w r7, [r0, #280]
	str.w r8, [r0, #284]
	ldr.w r5, [r1, #288]
	ldr.w r6, [r1, #292]
	ldr.w r7, [r1, #296]
	ldr.w r8, [r1, #300]
	ldr.w r9, [r0, #288]
	ldr.w r10, [r0, #292]
	ldr.w r11, [r0, #296]
	ldr.w r12, [r0, #300]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #288]
	str.w r6, [r0, #292]
	str.w r7, [r0, #296]
	str.w r8, [r0, #300]
	ldr.w r5, [r1, #304]
	ldr.w r6, [r1, #308]
	ldr.w r7, [r1, #312]
	ldr.w r8, [r1, #316]
	ldr.w r9, [r0, #304]
	ldr.w r10, [r0, #308]
	ldr.w r11, [r0, #312]
	ldr.w r12, [r0, #316]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #304]
	str.w r6, [r0, #308]
	str.w r7, [r0, #312]
	str.w r8, [r0, #316]
	ldr.w r5, [r1, #320]
	ldr.w r6, [r1, #324]
	ldr.w r7, [r1, #328]
	ldr.w r8, [r1, #332]
	ldr.w r9, [r0, #320]
	ldr.w r10, [r0, #324]
	ldr.w r11, [r0, #328]
	ldr.w r12, [r0, #332]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #320]
	str.w r6, [r0, #324]
	str.w r7, [r0, #328]
	str.w r8, [r0, #332]
	ldr.w r5, [r1, #336]
	ldr.w r6, [r1, #340]
	ldr.w r7, [r1, #344]
	ldr.w r8, [r1, #348]
	ldr.w r9, [r0, #336]
	ldr.w r10, [r0, #340]
	ldr.w r11, [r0, #344]
	ldr.w r12, [r0, #348]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #336]
	str.w r6, [r0, #340]
	str.w r7, [r0, #344]
	str.w r8, [r0, #348]
	ldr.w r5, [r1, #352]
	ldr.w r6, [r1, #356]
	ldr.w r7, [r1, #360]
	ldr.w r8, [r1, #364]
	ldr.w r9, [r0, #352]
	ldr.w r10, [r0, #356]
	ldr.w r11, [r0, #360]
	ldr.w r12, [r0, #364]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #352]
	str.w r6, [r0, #356]
	str.w r7, [r0, #360]
	str.w r8, [r0, #364]
	ldr.w r5, [r1, #368]
	ldr.w r6, [r1, #372]
	ldr.w r7, [r1, #376]
	ldr.w r8, [r1, #380]
	ldr.w r9, [r0, #368]
	ldr.w r10, [r0, #372]
	ldr.w r11, [r0, #376]
	ldr.w r12, [r0, #380]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #368]
	str.w r6, [r0, #372]
	str.w r7, [r0, #376]
	str.w r8, [r0, #380]
	ldr.w r5, [r1, #384]
	ldr.w r6, [r1, #388]
	ldr.w r7, [r1, #392]
	ldr.w r8, [r1, #396]
	ldr.w r9, [r0, #384]
	ldr.w r10, [r0, #388]
	ldr.w r11, [r0, #392]
	ldr.w r12, [r0, #396]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #384]
	str.w r6, [r0, #388]
	str.w r7, [r0, #392]
	str.w r8, [r0, #396]
	ldr.w r5, [r1, #400]
	ldr.w r6, [r1, #404]
	ldr.w r7, [r1, #408]
	ldr.w r8, [r1, #412]
	ldr.w r9, [r0, #400]
	ldr.w r10, [r0, #404]
	ldr.w r11, [r0, #408]
	ldr.w r12, [r0, #412]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #400]
	str.w r6, [r0, #404]
	str.w r7, [r0, #408]
	str.w r8, [r0, #412]
	ldr.w r5, [r1, #416]
	ldr.w r6, [r1, #420]
	ldr.w r7, [r1, #424]
	ldr.w r8, [r1, #428]
	ldr.w r9, [r0, #416]
	ldr.w r10, [r0, #420]
	ldr.w r11, [r0, #424]
	ldr.w r12, [r0, #428]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #416]
	str.w r6, [r0, #420]
	str.w r7, [r0, #424]
	str.w r8, [r0, #428]
	ldr.w r5, [r1, #432]
	ldr.w r6, [r1, #436]
	ldr.w r7, [r1, #440]
	ldr.w r8, [r1, #444]
	ldr.w r9, [r0, #432]
	ldr.w r10, [r0, #436]
	ldr.w r11, [r0, #440]
	ldr.w r12, [r0, #444]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #432]
	str.w r6, [r0, #436]
	str.w r7, [r0, #440]
	str.w r8, [r0, #444]
	ldr.w r5, [r1, #448]
	ldr.w r6, [r1, #452]
	ldr.w r7, [r1, #456]
	ldr.w r8, [r1, #460]
	ldr.w r9, [r0, #448]
	ldr.w r10, [r0, #452]
	ldr.w r11, [r0, #456]
	ldr.w r12, [r0, #460]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #448]
	str.w r6, [r0, #452]
	str.w r7, [r0, #456]
	str.w r8, [r0, #460]
	ldr.w r5, [r1, #464]
	ldr.w r6, [r1, #468]
	ldr.w r7, [r1, #472]
	ldr.w r8, [r1, #476]
	ldr.w r9, [r0, #464]
	ldr.w r10, [r0, #468]
	ldr.w r11, [r0, #472]
	ldr.w r12, [r0, #476]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #464]
	str.w r6, [r0, #468]
	str.w r7, [r0, #472]
	str.w r8, [r0, #476]
	ldr.w r5, [r1, #480]
	ldr.w r6, [r1, #484]
	ldr.w r7, [r1, #488]
	ldr.w r8, [r1, #492]
	ldr.w r9, [r0, #480]
	ldr.w r10, [r0, #484]
	ldr.w r11, [r0, #488]
	ldr.w r12, [r0, #492]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #480]
	str.w r6, [r0, #484]
	str.w r7, [r0, #488]
	str.w r8, [r0, #492]
	ldr.w r5, [r1, #496]
	ldr.w r6, [r1, #500]
	ldr.w r7, [r1, #504]
	ldr.w r8, [r1, #508]
	ldr.w r9, [r0, #496]
	ldr.w r10, [r0, #500]
	ldr.w r11, [r0, #504]
	ldr.w r12, [r0, #508]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #496]
	str.w r6, [r0, #500]
	str.w r7, [r0, #504]
	str.w r8, [r0, #508]
	pop.w {pc}
.p2align 2,,3
.syntax	unified
.data
b256_1_2x2: .space 516
.text
b1_addr_2x2:
	.word b256_1_2x2
	.word b256_1_2x2+2
Toom4Table_4591_2x2:
	.word 4194697214 @ s1
	.word 66848888   @ s2^
	.word 145489918  @ s3^
	.word 4219667963 @ s4^
	.word 87754235   @ s5
	.word 263483     @ s6
	.word 4144690955 @ s7
	.word 16713465   @ s8
	.word 4144758733 @ s9#
	.word 75236093   @ s10^
	.word 4207215357 @ s11
	.word 4294703813 @ s12
	.word 100272375  @ s13
	.word 4261546104 @ s14^
	.word 4149545207 @ s15^
	.word 16777012   @ s16#
.global	__gf_polymul_128x128_2x2_x_2x2
.type 	__gf_polymul_128x128_2x2_x_2x2, %function
@ void __gf_polymul_128x128_2x2_x_2x2(int *M,int *S_M1,int *fh,int *gh)
__gf_polymul_128x128_2x2_x_2x2:
	push {r1-r12, lr}
	vpush.w { s16-s25 }
	adr lr, Toom4Table_4591_2x2
	vldm lr, {s10-s25}
	vmov.w s0, s1, r0, r1
	vmov.w s4, r2
	movw.w r7, #18015
	movt.w r7, #14
	vmov.w s2, r7
	movw.w r11, #0
	ldr.w r7, b1_addr_2x2
	ldr.w r0, b1_addr_2x2+4
	str.w r11, [r7]
	vmov.w s5, s6, r7, r0
	bl	__polymul_128x128
	vmov.w r0, s0
	vmov.w r1, s1
	vmov.w r2, s4
	add.w r1, #512
	add.w r2, #256
	bl	__polymul_128x128
	vmov.w r0, s0
	vmov.w r1, s5
	bl	__polyadd_256
	vmov.w r0, s6
	vmov.w r1, s1
	vmov.w r2, s4
	add.w r1, #256
	bl	__polymul_128x128
	vmov.w r0, s0
	vmov.w r1, s1
	vmov.w r2, s4
	add.w r0, #512
	add.w r1, #768
	add.w r2, #256
	bl	__polymul_128x128
	vmov.w r1, s5
	vmov.w r0, s0
	add.w r0, #512
	bl	__polyadd_256
	vmov.w r0, s6
	vmov.w r1, s1
	vmov.w r2, s4
	add.w r2, #512
	bl	__polymul_128x128
	vmov.w r0, s0
	vmov.w r1, s1
	vmov.w r2, s4
	add.w r0, #1024
	add.w r2, #768
	add.w r1, #512
	bl	__polymul_128x128
	vmov.w r1, s5
	vmov.w r0, s0
	add.w r0, #1024
	bl	__polyadd_256
	vmov.w r0, s6
	vmov.w r1, s1
	vmov.w r2, s4
	add.w r1, #256
	add.w r2, #512
	bl	__polymul_128x128
	vmov.w r0, s0
	vmov.w r1, s1
	vmov.w r2, s4
	add.w r0, #1536
	add.w r1, #768
	add.w r2, #768
	bl	__polymul_128x128
	vmov.w r1, s5
	vmov.w r0, s0
	add.w r0, #1536
	bl	__polyadd_256
	vpop.w { s16-s25 }
	pop {r1-r12, pc}
