.p2align 2,,3
.syntax unified
.text
__polymul_256x512:
	push.w {lr}
	sub.w sp, sp, #6144
	add.w r3, r2, #512
	vmov.w s4, r3
	vmov.w s3, r2
	vmov.w s1, r0
	mov.w r0, sp
	mov.w r3, #0
	vmov.w s9, r3
gf_polymul_256x256_begin:
	movw.w r2, #4591
	movw.w r3, #32768
	vmov.w r4, s2
	add.w lr, r0, #128
gf_polymul_256x256_eval_input_c_body:
	ldr.w r8, [r1, #384]
	ldr.w r7, [r1, #128]
	ldr.w r6, [r1, #256]
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
	str.w r10, [r0, #512]
	str.w r11, [r0, #384]
	str.w r8, [r0, #256]
	str.w r7, [r0, #128]
	str.w r9, [r0], #4
	cmp.w r0, lr
	bne.w gf_polymul_256x256_eval_input_c_body
	vmov.w r2, s3
	add.w r0, r0, #512
	vmov.w s3, r1
	movw.w r1, #4591
	movw.w r3, #32768
	vmov.w r4, s2
	add.w lr, r0, #128
gf_polymul_256x256_eval_input_d_body:
	ldr.w r8, [r2, #384]
	ldr.w r7, [r2, #128]
	ldr.w r6, [r2, #256]
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
	str.w r10, [r0, #512]
	str.w r11, [r0, #384]
	str.w r8, [r0, #256]
	str.w r7, [r0, #128]
	str.w r9, [r0], #4
	cmp.w r0, lr
	bne.w gf_polymul_256x256_eval_input_d_body
	vmov.w r1, s3
	add.w r0, r0, #512
	vmov.w r4, s3
	mov.w r5, r0
	sub.w r6, r1, #128
	sub.w r7, r2, #128
	mov.w r1, r6
	mov.w r2, r7
	bl.w gf_polymul_64x64
	add.w r0, r5, #1024
	sub.w r1, r5, #1280
	sub.w r2, r5, #640
	bl.w gf_polymul_64x64
	add.w r0, r5, #256
	sub.w r1, r5, #1152
	sub.w r2, r5, #512
	bl.w gf_polymul_64x64
	add.w r0, r5, #1280
	sub.w r1, r5, #1024
	sub.w r2, r5, #384
	bl.w gf_polymul_64x64
	add.w r0, r5, #512
	sub.w r1, r5, #896
	sub.w r2, r5, #256
	bl.w gf_polymul_64x64
	add.w r0, r5, #1536
	sub.w r1, r5, #768
	sub.w r2, r5, #128
	bl.w gf_polymul_64x64
	add.w r0, r5, #768
	add.w r1, r6, #384
	add.w r2, r7, #384
	bl.w gf_polymul_64x64
	vmov.w s3, r4
	mov.w r0, r5
	add.w lr, r0, #256
	vmov.w r12, s2
	movw.w r11, #4591
	add.w r1, r0, #1536
gf_polymul_256x256_interpol_output_body:
	ldr.w r10, [r0, #768]
	ldr.w r9, [r1]
	ldr.w r8, [r0, #512]
	ldr.w r7, [r0, #1280]
	ldr.w r6, [r0, #256]
	ldr.w r3, [r0, #1024]
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
	str.w r8, [r0, #1020]
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
	str.w r8, [r0, #252]
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
	str.w r8, [r0, #1276]
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
	str.w r8, [r0, #508]
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
	add.w r1, r0, #1536
	str.w r8, [r1, #-4]
	cmp.w r0, lr
	bne.w gf_polymul_256x256_interpol_output_body
	vmov.w r10, s9
	cmp.w r10, #1
	beq.w output
	sub.w r1, r0, #256
	vmov.w s26, r1
	add.w r10, #1
	vmov.w s9, r10
	add.w r0, r1, #1792
	vmov.w r1, s3
	sub.w r1, r1, #128
	vmov.w s3, s4
	b.w gf_polymul_256x256_begin
output:
	sub.w r1, r0, #256
	vmov.w s27, r1
	vmov.w r1, s26
	vmov.w r0, s1
	add.w lr, r0, #88
gf_polymul_256x256_copy_output_A:
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
	ldr.w r2, [r1], #44
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
	str.w r2, [r0], #44
	cmp.w r0, lr
	bne.w gf_polymul_256x256_copy_output_A
	ldr.w r3, [r1, #4]
	ldr.w r4, [r1, #8]
	ldr.w r5, [r1, #12]
	ldr.w r6, [r1, #16]
	ldr.w r7, [r1, #20]
	ldr.w r8, [r1, #24]
	ldr.w r9, [r1, #28]
	ldr.w r10, [r1, #32]
	ldr.w r11, [r1, #36]
	ldr.w r2, [r1], #40
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r5, [r0, #12]
	str.w r6, [r0, #16]
	str.w r7, [r0, #20]
	str.w r8, [r0, #24]
	str.w r9, [r0, #28]
	str.w r10, [r0, #32]
	str.w r11, [r0, #36]
	str.w r2, [r0], #40
	add.w lr, r0, #380
gf_polymul_256x256_copy_output_B:
	ldr.w r8, [r1, #900]
	ldr.w r3, [r1, #4]
	ldr.w r9, [r1, #904]
	ldr.w r4, [r1, #8]
	ldr.w r10, [r1, #908]
	ldr.w r5, [r1, #12]
	ldr.w r11, [r1, #912]
	ldr.w r6, [r1, #16]
	ldr.w r7, [r1, #896]
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
	bne.w gf_polymul_256x256_copy_output_B
	ldr.w r4, [r1, #896]
	ldr.w r2, [r1], #4
	sadd16.w r2, r2, r4
	str.w r2, [r0], #4
	vmov.w r12, s27
	add.w lr, r0, #120
gf_polymul_256x256_copy_output_overlap_A:
	ldr.w r3, [r1, #4]
	ldr.w r4, [r1, #8]
	ldr.w r8, [r1, #896]
	ldr.w r9, [r1, #900]
	ldr.w r10, [r1, #904]
	ldr.w r2, [r1], #12
	ldr.w r6, [r12, #4]
	ldr.w r7, [r12, #8]
	ldr.w r5, [r12], #12
	sadd16.w r2, r2, r5
	sadd16.w r3, r3, r6
	sadd16.w r4, r4, r7
	sadd16.w r2, r2, r8
	sadd16.w r3, r3, r9
	sadd16.w r4, r4, r10
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r2, [r0], #12
	cmp.w r0, lr
	bne.w gf_polymul_256x256_copy_output_overlap_A
	ldr.w r3, [r1, #4]
	ldr.w r8, [r1, #896]
	ldr.w r9, [r1, #900]
	ldr.w r2, [r1], #8
	ldr.w r6, [r12, #4]
	ldr.w r5, [r12], #8
	sadd16.w r2, r2, r5
	sadd16.w r3, r3, r6
	sadd16.w r2, r2, r8
	sadd16.w r3, r3, r9
	str.w r3, [r0, #4]
	str.w r2, [r0], #8
	add.w lr, r0, #256
gf_polymul_256x256_copy_output_overlap_B:
	ldr.w r3, [r1, #4]
	ldr.w r4, [r1, #896]
	ldr.w r5, [r1, #900]
	ldr.w r2, [r1], #8
	ldr.w r7, [r12, #4]
	ldr.w r8, [r12, #896]
	ldr.w r9, [r12, #900]
	ldr.w r6, [r12], #8
	sadd16.w r2, r2, r4
	sadd16.w r3, r3, r5
	sadd16.w r2, r2, r6
	sadd16.w r3, r3, r7
	sadd16.w r2, r2, r8
	sadd16.w r3, r3, r9
	str.w r3, [r0, #4]
	str.w r2, [r0], #8
	cmp.w r0, lr
	bne.w gf_polymul_256x256_copy_output_overlap_B
	add.w lr, r0, #120
gf_polymul_256x256_copy_output_overlap_A_0:
	ldr.w r3, [r12, #4]
	ldr.w r4, [r12, #8]
	ldr.w r8, [r12, #896]
	ldr.w r9, [r12, #900]
	ldr.w r10, [r12, #904]
	ldr.w r2, [r12], #12
	ldr.w r6, [r1, #4]
	ldr.w r7, [r1, #8]
	ldr.w r5, [r1], #12
	sadd16.w r2, r2, r5
	sadd16.w r3, r3, r6
	sadd16.w r4, r4, r7
	sadd16.w r2, r2, r8
	sadd16.w r3, r3, r9
	sadd16.w r4, r4, r10
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r2, [r0], #12
	cmp.w r0, lr
	bne.w gf_polymul_256x256_copy_output_overlap_A_0
	ldr.w r3, [r12, #4]
	ldr.w r8, [r12, #896]
	ldr.w r9, [r12, #900]
	ldr.w r2, [r12], #8
	ldr.w r6, [r1, #4]
	ldr.w r5, [r1], #8
	sadd16.w r2, r2, r5
	sadd16.w r3, r3, r6
	sadd16.w r2, r2, r8
	sadd16.w r3, r3, r9
	str.w r3, [r0, #4]
	str.w r2, [r0], #8
	add.w lr, r0, #380
gf_polymul_256x256_copy_output_B_0:
	ldr.w r8, [r12, #900]
	ldr.w r3, [r12, #4]
	ldr.w r9, [r12, #904]
	ldr.w r4, [r12, #8]
	ldr.w r10, [r12, #908]
	ldr.w r5, [r12, #12]
	ldr.w r11, [r12, #912]
	ldr.w r6, [r12, #16]
	ldr.w r7, [r12, #896]
	ldr.w r2, [r12], #20
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
	bne.w gf_polymul_256x256_copy_output_B_0
	ldr.w r4, [r12, #896]
	ldr.w r2, [r12], #4
	sadd16.w r2, r2, r4
	str.w r2, [r0], #4
	add.w lr, r0, #88
gf_polymul_256x256_copy_output_C:
	ldr.w r3, [r12, #4]
	ldr.w r4, [r12, #8]
	ldr.w r5, [r12, #12]
	ldr.w r6, [r12, #16]
	ldr.w r7, [r12, #20]
	ldr.w r8, [r12, #24]
	ldr.w r9, [r12, #28]
	ldr.w r10, [r12, #32]
	ldr.w r11, [r12, #36]
	ldr.w r1, [r12, #40]
	ldr.w r2, [r12], #44
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r5, [r0, #12]
	str.w r6, [r0, #16]
	str.w r7, [r0, #20]
	str.w r8, [r0, #24]
	str.w r9, [r0, #28]
	str.w r10, [r0, #32]
	str.w r11, [r0, #36]
	str.w r1, [r0, #40]
	str.w r2, [r0], #44
	cmp.w r0, lr
	bne.w gf_polymul_256x256_copy_output_C
	ldr.w r3, [r12, #4]
	ldr.w r4, [r12, #8]
	ldr.w r5, [r12, #12]
	ldr.w r6, [r12, #16]
	ldr.w r7, [r12, #20]
	ldr.w r8, [r12, #24]
	ldr.w r9, [r12, #28]
	ldr.w r10, [r12, #32]
	ldr.w r11, [r12, #36]
	ldr.w r2, [r12], #40
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r5, [r0, #12]
	str.w r6, [r0, #16]
	str.w r7, [r0, #20]
	str.w r8, [r0, #24]
	str.w r9, [r0, #28]
	str.w r10, [r0, #32]
	str.w r11, [r0, #36]
	str.w r2, [r0], #40
	add.w sp, sp, #6144
	pop.w {pc}
.p2align 2,,3
.syntax unified
.text
__polyadd_x2p2_512_768:
	push.w {lr}
	add.w lr, r0, #1024
	add_3_512:
	ldr.w r4, [r2, #4]
	ldr.w r3, [r2], #8
	ldr.w r6, [r1, #4]
	ldr.w r7, [r1, #1536]
	ldr.w r8, [r1, #1540]
	ldr.w r5, [r1], #8
	sadd16.w r3, r3, r5
	sadd16.w r4, r4, r6
	sadd16.w r3, r3, r7
	sadd16.w r4, r4, r8
	smlawb.w r6, r11, r3, r12
	smlawt.w r5, r11, r3, r12
	smulbt.w r6, r10, r6
	smulbt.w r5, r10, r5
	pkhbt.w r6, r6, r5, LSL #16
	ssub16.w r3, r3, r6
	smlawb.w r6, r11, r4, r12
	smlawt.w r5, r11, r4, r12
	smulbt.w r6, r10, r6
	smulbt.w r5, r10, r5
	pkhbt.w r6, r6, r5, LSL #16
	ssub16.w r4, r4, r6
	str.w r4, [r0, #4]
	str.w r3, [r0], #8
	cmp.w lr, r0
	bne.w add_3_512
	add.w lr, r0, #512
	add_2_256:
	ldr.w r3, [r1, #4]
	ldr.w r4, [r1, #8]
	ldr.w r5, [r1, #12]
	ldr.w r6, [r1, #1536]
	ldr.w r7, [r1, #1540]
	ldr.w r8, [r1, #1544]
	ldr.w r9, [r1, #1548]
	ldr.w r2, [r1], #16
	sadd16.w r2, r2, r6
	sadd16.w r3, r3, r7
	sadd16.w r4, r4, r8
	sadd16.w r5, r5, r9
	smlawb.w r7, r11, r2, r12
	smlawt.w r6, r11, r2, r12
	smulbt.w r7, r10, r7
	smulbt.w r6, r10, r6
	pkhbt.w r7, r7, r6, LSL #16
	ssub16.w r2, r2, r7
	smlawb.w r7, r11, r3, r12
	smlawt.w r6, r11, r3, r12
	smulbt.w r7, r10, r7
	smulbt.w r6, r10, r6
	pkhbt.w r7, r7, r6, LSL #16
	ssub16.w r3, r3, r7
	smlawb.w r7, r11, r4, r12
	smlawt.w r6, r11, r4, r12
	smulbt.w r7, r10, r7
	smulbt.w r6, r10, r6
	pkhbt.w r7, r7, r6, LSL #16
	ssub16.w r4, r4, r7
	smlawb.w r7, r11, r5, r12
	smlawt.w r6, r11, r5, r12
	smulbt.w r7, r10, r7
	smulbt.w r6, r10, r6
	pkhbt.w r7, r7, r6, LSL #16
	ssub16.w r5, r5, r7
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r5, [r0, #12]
	str.w r2, [r0], #16
	cmp.w lr, r0
	bne.w add_2_256
	pop.w {pc}
.p2align 2,,3
.syntax unified
.text
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
.global __gf_polymul_512x256_2x2_x2p2
.type  __gf_polymul_512x256_2x2_x2p2, %function
@ void __gf_polymul_512x256_2x2_x2p2(int *V,int *M,int *fh,int *gh)
__gf_polymul_512x256_2x2_x2p2:
	push {r1-r12, lr}
	vpush.w { s16-s27 }
	adr lr, Toom4Table_4591
	vldm lr, {s10-s25}
	vmov.w s5, s6, r0, r1
	vmov.w s7, s8, r2, r3
	movw.w r7, #18015
	movt.w r7, #14
	vmov.w s2, r7
	movw.w r11, #0
	sub.w sp, #6144
	mov.w r0, sp
	str.w r11, [r0]
	add.w r0, #2
	vmov.w r2, r1, s6, s7
	add.w r2, #2048
	bl __polymul_256x512
	vmov.w r2, s6
	add.w r2, #3072
	vmov.w r1, s8
	bl __polymul_256x512
	sub.w r0, r0, #2
	vmov.w r2, r1, s6, s7
	add.w r2, #4096
	bl __polymul_256x512
	vmov.w r2, s6
	add.w r2, #5120
	vmov.w r1, s8
	bl __polymul_256x512
	mov.w r10, 4591
	movw.w r12, #32768
	vmov.w r0, r2, s5, s6
	mov.w r1, sp
	vmov.w r11, s2
	bl __polyadd_x2p2_512_768
	vmov.w r2, s6
	add.w r1, #1536
	add.w r2, #1024
	bl __polyadd_x2p2_512_768
	add.w sp, #6144
	vpop.w { s16-s27 }
	pop {r1-r12, pc}
.p2align 2,,3
.syntax unified
.text
__polyadd_x2p2_256_768:
	push.w {lr}
	add.w lr, r0, #512
	add_3_256:
	ldr.w r4, [r2, #4]
	ldr.w r3, [r2], #8
	ldr.w r6, [r1, #4]
	ldr.w r7, [r1, #1536]
	ldr.w r8, [r1, #1540]
	ldr.w r5, [r1], #8
	sadd16.w r3, r3, r5
	sadd16.w r4, r4, r6
	sadd16.w r3, r3, r7
	sadd16.w r4, r4, r8
	smlawb.w r6, r11, r3, r12
	smlawt.w r5, r11, r3, r12
	smulbt.w r6, r10, r6
	smulbt.w r5, r10, r5
	pkhbt.w r6, r6, r5, LSL #16
	ssub16.w r3, r3, r6
	smlawb.w r6, r11, r4, r12
	smlawt.w r5, r11, r4, r12
	smulbt.w r6, r10, r6
	smulbt.w r5, r10, r5
	pkhbt.w r6, r6, r5, LSL #16
	ssub16.w r4, r4, r6
	str.w r4, [r0, #4]
	str.w r3, [r0], #8
	cmp.w lr, r0
	bne.w add_3_256
	add.w lr, r0, #1024
	add_2_512:
	ldr.w r3, [r1, #4]
	ldr.w r4, [r1, #8]
	ldr.w r5, [r1, #12]
	ldr.w r6, [r1, #1536]
	ldr.w r7, [r1, #1540]
	ldr.w r8, [r1, #1544]
	ldr.w r9, [r1, #1548]
	ldr.w r2, [r1], #16
	sadd16.w r2, r2, r6
	sadd16.w r3, r3, r7
	sadd16.w r4, r4, r8
	sadd16.w r5, r5, r9
	smlawb.w r7, r11, r2, r12
	smlawt.w r6, r11, r2, r12
	smulbt.w r7, r10, r7
	smulbt.w r6, r10, r6
	pkhbt.w r7, r7, r6, LSL #16
	ssub16.w r2, r2, r7
	smlawb.w r7, r11, r3, r12
	smlawt.w r6, r11, r3, r12
	smulbt.w r7, r10, r7
	smulbt.w r6, r10, r6
	pkhbt.w r7, r7, r6, LSL #16
	ssub16.w r3, r3, r7
	smlawb.w r7, r11, r4, r12
	smlawt.w r6, r11, r4, r12
	smulbt.w r7, r10, r7
	smulbt.w r6, r10, r6
	pkhbt.w r7, r7, r6, LSL #16
	ssub16.w r4, r4, r7
	smlawb.w r7, r11, r5, r12
	smlawt.w r6, r11, r5, r12
	smulbt.w r7, r10, r7
	smulbt.w r6, r10, r6
	pkhbt.w r7, r7, r6, LSL #16
	ssub16.w r5, r5, r7
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r5, [r0, #12]
	str.w r2, [r0], #16
	cmp.w lr, r0
	bne.w add_2_512
	pop.w {pc}
.p2align 2,,3
.syntax unified
.text
.global __gf_polymul_256x512_2x2_x2p2
.type  __gf_polymul_256x512_2x2_x2p2, %function
@ void __gf_polymul_256x512_2x2_x2p2(int *V,int *M,int *fh,int *gh)
__gf_polymul_256x512_2x2_x2p2:
	push {r1-r12, lr}
	vpush.w { s16-s27 }
	adr lr, Toom4Table_4591
	vldm lr, {s10-s25}
	vmov.w s5, s6, r0, r1
	vmov.w s7, s8, r2, r3
	movw.w r7, #18015
	movt.w r7, #14
	vmov.w s2, r7
	movw.w r11, #0
	sub.w sp, #6144
	mov.w r0, sp
	str.w r11, [r0]
	add.w r0, #2
	add.w r1, #1024
	bl __polymul_256x512
	vmov.w r1, s6
	add.w r1, #1536
	vmov.w r2, s8
	bl __polymul_256x512
	sub.w r0, r0, #2
	vmov.w r1, r2, s6, s7
	add.w r1, #2048
	bl __polymul_256x512
	vmov.w r1, s6
	add.w r1, #2560
	vmov.w r2, s8
	bl __polymul_256x512
	mov.w r10, 4591
	movw.w r12, #32768
	vmov.w r0, r2, s5, s6
	mov.w r1, sp
	vmov.w r11, s2
	bl __polyadd_x2p2_256_768
	vmov.w r2, s6
	add.w r1, #1536
	add.w r2, #512
	bl __polyadd_x2p2_256_768
	add.w sp, #6144
	vpop.w { s16-s27 }
	pop {r1-r12, pc}
.p2align 2,,3
.syntax unified
.text
__polyadd_768:
	push.w {lr}
	mov.w r2, 4591
	vmov.w r3, s2
	movw.w r4, #32768
	add.w lr, r0, #1536
_add:
	ldr.w r6, [r1, #4]
	ldr.w r7, [r1, #8]
	ldr.w r8, [r1, #12]
	ldr.w r5, [r1], #16
	ldr.w r9, [r0]
	ldr.w r10, [r0, #4]
	ldr.w r11, [r0, #8]
	ldr.w r12, [r0, #12]
	sadd16.w r5, r5, r9
	sadd16.w r6, r6, r10
	sadd16.w r7, r7, r11
	sadd16.w r8, r8, r12
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
	str.w r6, [r0, #4]
	str.w r7, [r0, #8]
	str.w r8, [r0, #12]
	str.w r5, [r0], #16
	cmp.w lr, r0
	bne.w _add
	pop.w {pc}
.p2align 2,,3
.syntax unified
.data
b768_1_2x2: .space 1540
.text
b1_addr_2x2:
	.word b768_1_2x2
	.word b768_1_2x2+2
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
.global __gf_polymul_256x512_2x2_x_2x2
.type  __gf_polymul_256x512_2x2_x_2x2, %function
@ void __gf_polymul_256x512_2x2_x_2x2(int *M,int *S_M1,int *fh,int *gh)
__gf_polymul_256x512_2x2_x_2x2:
	push {r1-r12, lr}
	vpush.w { s16-s27 }
	adr lr, Toom4Table_4591_2x2
	vldm lr, {s10-s25}
	vmov.w s0, r0
	vmov.w s5, s6, r1, r2
	movw.w r7, #18015
	movt.w r7, #14
	vmov.w s2, r7
	movw.w r11, #0
	ldr.w r7, b1_addr_2x2
	ldr.w r0, b1_addr_2x2+4
	str.w r11, [r7]
	vmov.w s7, s8, r7, r0
	vmov.w r2, r1, s5, s6
	bl	__polymul_256x512
	vmov.w r0, s0
	vmov.w r2, r1, s5, s6
	add.w r1, #512
	add.w r2, #2048
	bl	__polymul_256x512
	vmov.w r0, s0
	vmov.w r1, s7
	bl	__polyadd_768
	vmov.w r0, s8
	vmov.w r2, r1, s5, s6
	add.w r2, #1024
	bl	__polymul_256x512
	vmov.w r0, s0
	vmov.w r2, r1, s5, s6
	add.w r0, #1536
	add.w r1, #512
	add.w r2, #3072
	bl	__polymul_256x512
	vmov.w r1, s7
	vmov.w r0, s0
	add.w r0, #1536
	bl	__polyadd_768
	vmov.w r0, s8
	vmov.w r2, r1, s5, s6
	add.w r1, #1024
	bl	__polymul_256x512
	vmov.w r0, s0
	vmov.w r2, r1, s5, s6
	add.w r0, #3072
	add.w r1, #1536
	add.w r2, #2048
	bl	__polymul_256x512
	vmov.w r1, s7
	vmov.w r0, s0
	add.w r0, #3072
	bl	__polyadd_768
	vmov.w r0, s8
	vmov.w r2, r1, s5, s6
	add.w r1, #1024
	add.w r2, #1024
	bl	__polymul_256x512
	vmov.w r0, s0
	vmov.w r2, r1, s5, s6
	add.w r0, #4608
	add.w r1, #1536
	add.w r2, #3072
	bl	__polymul_256x512
	vmov.w r1, s7
	vmov.w r0, s0
	add.w r0, #4608
	bl	__polyadd_768
	vpop.w { s16-s27 }
	pop {r1-r12, pc}
