.p2align 2,,3
.syntax unified
.text
wpad:
	.word 1038337
	.word -103819265
@ =012=
	.word 94414
	.word -150027
	.word 490416
@ =34=
	.word 405464
	.word 405464
	.word 94414
	.word 94414
	.word -150027
	.word 490416
	.word -150027
	.word -195965
	.word -382994
	.word 490416
	.word -442856
	.word -411551
	.word -195965
	.word -489231
	.word -35593
	.word -382994
	.word 235832
	.word 479116
	.word -442856
	.word -301420
	.word -227096
	.word -411551
	.word 103099
	.word -237083
@ =56=
	.word 405464
	.word 405464
	.word 94414
	.word 94414
	.word -150027
	.word 490416
	.word -150027
	.word -195965
	.word -382994
	.word 490416
	.word -442856
	.word -411551
	.word -195965
	.word -489231
	.word -35593
	.word -382994
	.word 235832
	.word 479116
	.word -442856
	.word -301420
	.word -227096
	.word -411551
	.word 103099
	.word -237083
	.word -489231
	.word 499710
	.word -6572
	.word -35593
	.word -453088
	.word 233657
	.word 235832
	.word -130891
	.word 321266
	.word 479116
	.word 238793
	.word 44792
	.word -301420
	.word 113238
	.word 139179
	.word -227096
	.word 51198
	.word 141491
	.word 103099
	.word -302769
	.word 153477
	.word -237083
	.word 511761
	.word 68896
	.word 499710
	.word -129478
	.word -125854
	.word -6572
	.word -263149
	.word -353444
	.word -453088
	.word 5855
	.word -166245
	.word 233657
	.word 292202
	.word -149602
	.word -130891
	.word -143890
	.word -261084
	.word 321266
	.word -24399
	.word 498588
	.word 238793
	.word 470221
	.word 495553
	.word 44792
	.word 474481
	.word -105114
	.word 113238
	.word 414520
	.word -496122
	.word 139179
	.word 149234
	.word 415263
	.word 51198
	.word -318879
	.word -390196
	.word 141491
	.word 110335
	.word -298006
	.word -302769
	.word -124244
	.word 499631
	.word 153477
	.word 414992
	.word 181223
	.word 511761
	.word -306882
	.word -291027
	.word 68896
	.word -242732
	.word 11188
// void ntt512_32bit (int *v);
.global ntt512_32bit
.type ntt512_32bit, %function
ntt512_32bit:
	push {r4-r11, lr}
	add.w lr, r0, #2048
	add.w r9, r0, #256
	adr.w r10, wpad
	ldm r10!, {r11-r12}
	vldm r10!, {s4-s6}
	vmov s0, s1, r0, lr
	vmov s2, s3, r10, r9
@ degree = 64
ntt2_layer_0_1_2:
	vmov.w r10, s4
	ldrsh.w r3, [r1, #128]
	ldrsh.w r4, [r1, #256]
	ldrsh.w r5, [r1, #384]
	ldrsh.w r2, [r1], #2
	smull r7, r9, r4, r10
	mul.w lr, r7, r12
	smlal r7, r9, lr, r11
	add.w r6, r2, r9
	sub.w r8, r2, r9
	smull r7, r9, r5, r10
	mul.w lr, r7, r12
	smlal r7, r9, lr, r11
	add.w r7, r3, r9
	sub.w r9, r3, r9
	add.w r2, r2, r4
	sub.w r4, r2, r4, lsl #1
	add.w r3, r3, r5
	sub.w r5, r3, r5, lsl #1
	smull r10, r5, r5, r10
	mul.w lr, r10, r12
	smlal r10, r5, lr, r11
	add.w r4, r4, r5
	sub.w r5, r4, r5, lsl #1
	add.w r2, r2, r3
	sub.w r3, r2, r3, lsl #1
	str.w r2, [r0]
	str.w r3, [r0, #256]
	str.w r4, [r0, #512]
	str.w r5, [r0, #768]
	vmov r2, r3, s5, s6
	smull r4, r7, r7, r2
	mul.w r5, r4, r12
	smlal r4, r7, r5, r11
	add.w r6, r6, r7
	sub.w r7, r6, r7, lsl #1
	smull r4, r9, r9, r3
	mul.w r5, r4, r12
	smlal r4, r9, r5, r11
	add.w r8, r8, r9
	sub.w r9, r8, r9, lsl #1
	str.w r6, [r0, #1024]
	str.w r7, [r0, #1280]
	str.w r8, [r0, #1536]
	str.w r9, [r0, #1792]
	add.w r0, r0, #4
	vmov.w lr, s3
	cmp.w r0, lr
	bne.w ntt2_layer_0_1_2
	vmov r0, s0
	vmov r10, s2
ntt2_layer_3_4:
	add.w lr, r0, #64 @ 16
	ldm r10!, {r1-r3}
ntt2_layer_3_4inner:
	ldr.w r4, [r0]
	ldr.w r5, [r0, #64]
	ldr.w r6, [r0, #128]
	ldr.w r7, [r0, #192]
	smull r8, r6, r6, r1
	mul.w r9, r8, r12
	smlal r8, r6, r9, r11
	add.w r4, r4, r6
	sub.w r6, r4, r6, lsl #1
	smull r8, r7, r7, r1
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	add.w r5, r5, r7
	sub.w r7, r5, r7, lsl #1
	smull r8, r5, r5, r2
	mul.w r9, r8, r12
	smlal r8, r5, r9, r11
	add.w r4, r4, r5
	sub.w r5, r4, r5, lsl #1
	smull r8, r7, r7, r3
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	add.w r6, r6, r7
	sub.w r7, r6, r7, lsl #1
	str.w r5, [r0, #64]
	str.w r6, [r0, #128]
	str.w r7, [r0, #192]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #64]
	ldr.w r6, [r0, #128]
	ldr.w r7, [r0, #192]
	smull r8, r6, r6, r1
	mul.w r9, r8, r12
	smlal r8, r6, r9, r11
	add.w r4, r4, r6
	sub.w r6, r4, r6, lsl #1
	smull r8, r7, r7, r1
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	add.w r5, r5, r7
	sub.w r7, r5, r7, lsl #1
	smull r8, r5, r5, r2
	mul.w r9, r8, r12
	smlal r8, r5, r9, r11
	add.w r4, r4, r5
	sub.w r5, r4, r5, lsl #1
	smull r8, r7, r7, r3
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	add.w r6, r6, r7
	sub.w r7, r6, r7, lsl #1
	str.w r5, [r0, #64]
	str.w r6, [r0, #128]
	str.w r7, [r0, #192]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #64]
	ldr.w r6, [r0, #128]
	ldr.w r7, [r0, #192]
	smull r8, r6, r6, r1
	mul.w r9, r8, r12
	smlal r8, r6, r9, r11
	add.w r4, r4, r6
	sub.w r6, r4, r6, lsl #1
	smull r8, r7, r7, r1
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	add.w r5, r5, r7
	sub.w r7, r5, r7, lsl #1
	smull r8, r5, r5, r2
	mul.w r9, r8, r12
	smlal r8, r5, r9, r11
	add.w r4, r4, r5
	sub.w r5, r4, r5, lsl #1
	smull r8, r7, r7, r3
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	add.w r6, r6, r7
	sub.w r7, r6, r7, lsl #1
	str.w r5, [r0, #64]
	str.w r6, [r0, #128]
	str.w r7, [r0, #192]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #64]
	ldr.w r6, [r0, #128]
	ldr.w r7, [r0, #192]
	smull r8, r6, r6, r1
	mul.w r9, r8, r12
	smlal r8, r6, r9, r11
	add.w r4, r4, r6
	sub.w r6, r4, r6, lsl #1
	smull r8, r7, r7, r1
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	add.w r5, r5, r7
	sub.w r7, r5, r7, lsl #1
	smull r8, r5, r5, r2
	mul.w r9, r8, r12
	smlal r8, r5, r9, r11
	add.w r4, r4, r5
	sub.w r5, r4, r5, lsl #1
	smull r8, r7, r7, r3
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	add.w r6, r6, r7
	sub.w r7, r6, r7, lsl #1
	str.w r5, [r0, #64]
	str.w r6, [r0, #128]
	str.w r7, [r0, #192]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #64]
	ldr.w r6, [r0, #128]
	ldr.w r7, [r0, #192]
	smull r8, r6, r6, r1
	mul.w r9, r8, r12
	smlal r8, r6, r9, r11
	add.w r4, r4, r6
	sub.w r6, r4, r6, lsl #1
	smull r8, r7, r7, r1
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	add.w r5, r5, r7
	sub.w r7, r5, r7, lsl #1
	smull r8, r5, r5, r2
	mul.w r9, r8, r12
	smlal r8, r5, r9, r11
	add.w r4, r4, r5
	sub.w r5, r4, r5, lsl #1
	smull r8, r7, r7, r3
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	add.w r6, r6, r7
	sub.w r7, r6, r7, lsl #1
	str.w r5, [r0, #64]
	str.w r6, [r0, #128]
	str.w r7, [r0, #192]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #64]
	ldr.w r6, [r0, #128]
	ldr.w r7, [r0, #192]
	smull r8, r6, r6, r1
	mul.w r9, r8, r12
	smlal r8, r6, r9, r11
	add.w r4, r4, r6
	sub.w r6, r4, r6, lsl #1
	smull r8, r7, r7, r1
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	add.w r5, r5, r7
	sub.w r7, r5, r7, lsl #1
	smull r8, r5, r5, r2
	mul.w r9, r8, r12
	smlal r8, r5, r9, r11
	add.w r4, r4, r5
	sub.w r5, r4, r5, lsl #1
	smull r8, r7, r7, r3
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	add.w r6, r6, r7
	sub.w r7, r6, r7, lsl #1
	str.w r5, [r0, #64]
	str.w r6, [r0, #128]
	str.w r7, [r0, #192]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #64]
	ldr.w r6, [r0, #128]
	ldr.w r7, [r0, #192]
	smull r8, r6, r6, r1
	mul.w r9, r8, r12
	smlal r8, r6, r9, r11
	add.w r4, r4, r6
	sub.w r6, r4, r6, lsl #1
	smull r8, r7, r7, r1
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	add.w r5, r5, r7
	sub.w r7, r5, r7, lsl #1
	smull r8, r5, r5, r2
	mul.w r9, r8, r12
	smlal r8, r5, r9, r11
	add.w r4, r4, r5
	sub.w r5, r4, r5, lsl #1
	smull r8, r7, r7, r3
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	add.w r6, r6, r7
	sub.w r7, r6, r7, lsl #1
	str.w r5, [r0, #64]
	str.w r6, [r0, #128]
	str.w r7, [r0, #192]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #64]
	ldr.w r6, [r0, #128]
	ldr.w r7, [r0, #192]
	smull r8, r6, r6, r1
	mul.w r9, r8, r12
	smlal r8, r6, r9, r11
	add.w r4, r4, r6
	sub.w r6, r4, r6, lsl #1
	smull r8, r7, r7, r1
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	add.w r5, r5, r7
	sub.w r7, r5, r7, lsl #1
	smull r8, r5, r5, r2
	mul.w r9, r8, r12
	smlal r8, r5, r9, r11
	add.w r4, r4, r5
	sub.w r5, r4, r5, lsl #1
	smull r8, r7, r7, r3
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	add.w r6, r6, r7
	sub.w r7, r6, r7, lsl #1
	str.w r5, [r0, #64]
	str.w r6, [r0, #128]
	str.w r7, [r0, #192]
	str.w r4, [r0], #4
	cmp.w r0, lr
	bne.w ntt2_layer_3_4inner
	add.w r0, r0, #192
	vmov lr, s1
	cmp.w r0, lr
	bne.w ntt2_layer_3_4
	vmov r0, lr, s0, s1
ntt2_layer_5_6:
	ldm r10!, {r1-r3}
	ldr.w r4, [r0]
	ldr.w r5, [r0, #16]
	ldr.w r6, [r0, #32]
	ldr.w r7, [r0, #48]
	smull r8, r6, r6, r1
	mul.w r9, r8, r12
	smlal r8, r6, r9, r11
	add.w r4, r4, r6
	sub.w r6, r4, r6, lsl #1
	smull r8, r7, r7, r1
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	add.w r5, r5, r7
	sub.w r7, r5, r7, lsl #1
	smull r8, r5, r5, r2
	mul.w r9, r8, r12
	smlal r8, r5, r9, r11
	add.w r4, r4, r5
	sub.w r5, r4, r5, lsl #1
	smull r8, r7, r7, r3
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	add.w r6, r6, r7
	sub.w r7, r6, r7, lsl #1
	str.w r5, [r0, #16]
	str.w r6, [r0, #32]
	str.w r7, [r0, #48]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #16]
	ldr.w r6, [r0, #32]
	ldr.w r7, [r0, #48]
	smull r8, r6, r6, r1
	mul.w r9, r8, r12
	smlal r8, r6, r9, r11
	add.w r4, r4, r6
	sub.w r6, r4, r6, lsl #1
	smull r8, r7, r7, r1
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	add.w r5, r5, r7
	sub.w r7, r5, r7, lsl #1
	smull r8, r5, r5, r2
	mul.w r9, r8, r12
	smlal r8, r5, r9, r11
	add.w r4, r4, r5
	sub.w r5, r4, r5, lsl #1
	smull r8, r7, r7, r3
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	add.w r6, r6, r7
	sub.w r7, r6, r7, lsl #1
	str.w r5, [r0, #16]
	str.w r6, [r0, #32]
	str.w r7, [r0, #48]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #16]
	ldr.w r6, [r0, #32]
	ldr.w r7, [r0, #48]
	smull r8, r6, r6, r1
	mul.w r9, r8, r12
	smlal r8, r6, r9, r11
	add.w r4, r4, r6
	sub.w r6, r4, r6, lsl #1
	smull r8, r7, r7, r1
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	add.w r5, r5, r7
	sub.w r7, r5, r7, lsl #1
	smull r8, r5, r5, r2
	mul.w r9, r8, r12
	smlal r8, r5, r9, r11
	add.w r4, r4, r5
	sub.w r5, r4, r5, lsl #1
	smull r8, r7, r7, r3
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	add.w r6, r6, r7
	sub.w r7, r6, r7, lsl #1
	str.w r5, [r0, #16]
	str.w r6, [r0, #32]
	str.w r7, [r0, #48]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #16]
	ldr.w r6, [r0, #32]
	ldr.w r7, [r0, #48]
	smull r8, r6, r6, r1
	mul.w r9, r8, r12
	smlal r8, r6, r9, r11
	add.w r4, r4, r6
	sub.w r6, r4, r6, lsl #1
	smull r8, r7, r7, r1
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	add.w r5, r5, r7
	sub.w r7, r5, r7, lsl #1
	smull r8, r5, r5, r2
	mul.w r9, r8, r12
	smlal r8, r5, r9, r11
	add.w r4, r4, r5
	sub.w r5, r4, r5, lsl #1
	smull r8, r7, r7, r3
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	add.w r6, r6, r7
	sub.w r7, r6, r7, lsl #1
	str.w r5, [r0, #16]
	str.w r6, [r0, #32]
	str.w r7, [r0, #48]
	str.w r4, [r0], #52
	cmp.w r0, lr
	bne.w ntt2_layer_5_6
	pop {r4-r11, pc}
