.p2align 2,,3
.syntax unified
.text
wpad:
	.word 5168129
	.word -213984257
@ =012=
	.word -2341804
	.word -1264911
	.word 1379661
@ =34=
	.word 252097
	.word 252097
	.word -2341804
	.word -2341804
	.word -1264911
	.word 1379661
	.word -1264911
	.word -1185955
	.word -852232
	.word 1379661
	.word -1166951
	.word 1778109
	.word -1185955
	.word -588241
	.word -221566
	.word -852232
	.word -1447477
	.word -984052
	.word -1166951
	.word 327403
	.word 1679053
	.word 1778109
	.word 348251
	.word 796489
@ =56=
	.word 252097
	.word 252097
	.word -2341804
	.word -2341804
	.word -1264911
	.word 1379661
	.word -1264911
	.word -1185955
	.word -852232
	.word 1379661
	.word -1166951
	.word 1778109
	.word -1185955
	.word -588241
	.word -221566
	.word -852232
	.word -1447477
	.word -984052
	.word -1166951
	.word 327403
	.word 1679053
	.word 1778109
	.word 348251
	.word 796489
	.word -588241
	.word -608053
	.word -830570
	.word -221566
	.word 2557123
	.word -820333
	.word -1447477
	.word -1925355
	.word -1523605
	.word -984052
	.word 2526507
	.word 1574416
	.word 327403
	.word -1678706
	.word -2107740
	.word 1679053
	.word -1493732
	.word -1674444
	.word 348251
	.word -1430127
	.word 1293894
	.word 796489
	.word 1093187
	.word -2352058
	.word -608053
	.word 719363
	.word -1888465
	.word -830570
	.word -1396348
	.word -2342353
	.word 2557123
	.word -279579
	.word 4920
	.word -820333
	.word -2404109
	.word -562498
	.word -1925355
	.word -868640
	.word 2320822
	.word -1523605
	.word -312417
	.word -1085880
	.word 2526507
	.word 182802
	.word 826685
	.word 1574416
	.word -2281675
	.word -1098973
	.word -1678706
	.word 2178385
	.word 1689680
	.word -2107740
	.word -2568239
	.word 1739105
	.word -1493732
	.word -761807
	.word -2073854
	.word -1674444
	.word 1786684
	.word -283823
	.word -1430127
	.word -372161
	.word 1720922
	.word 1293894
	.word -521099
	.word 1784933
	.word 1093187
	.word 1741267
	.word -1701815
	.word -2352058
	.word -1160843
	.word -2526120
// void ntt256_32bit (int *v);
.global ntt256_32bit
.type ntt256_32bit, %function
ntt256_32bit:
	push {r4-r11, lr}
	add.w lr, r0, #1024
	add.w r9, r0, #128
	adr.w r10, wpad
	ldm r10!, {r11-r12}
	vldm r10!, {s4-s6}
	vmov s0, s1, r0, lr
	vmov s2, s3, r10, r9
@ degree = 32
ntt2_layer_0_1_2:
	vmov.w r10, s4
	ldrsh.w r3, [r1, #64]
	ldrsh.w r4, [r1, #128]
	ldrsh.w r5, [r1, #192]
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
	str.w r3, [r0, #128]
	str.w r4, [r0, #256]
	str.w r5, [r0, #384]
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
	str.w r6, [r0, #512]
	str.w r7, [r0, #640]
	str.w r8, [r0, #768]
	str.w r9, [r0, #896]
	add.w r0, r0, #4
	vmov.w lr, s3
	cmp.w r0, lr
	bne.w ntt2_layer_0_1_2
	vmov r10, s2
	vmov r0, lr, s0, s1
ntt2_layer_3_4:
	ldm r10!, {r1-r3}
	ldr.w r4, [r0]
	ldr.w r5, [r0, #32]
	ldr.w r6, [r0, #64]
	ldr.w r7, [r0, #96]
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
	str.w r5, [r0, #32]
	str.w r6, [r0, #64]
	str.w r7, [r0, #96]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #32]
	ldr.w r6, [r0, #64]
	ldr.w r7, [r0, #96]
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
	str.w r5, [r0, #32]
	str.w r6, [r0, #64]
	str.w r7, [r0, #96]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #32]
	ldr.w r6, [r0, #64]
	ldr.w r7, [r0, #96]
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
	str.w r5, [r0, #32]
	str.w r6, [r0, #64]
	str.w r7, [r0, #96]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #32]
	ldr.w r6, [r0, #64]
	ldr.w r7, [r0, #96]
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
	str.w r5, [r0, #32]
	str.w r6, [r0, #64]
	str.w r7, [r0, #96]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #32]
	ldr.w r6, [r0, #64]
	ldr.w r7, [r0, #96]
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
	str.w r5, [r0, #32]
	str.w r6, [r0, #64]
	str.w r7, [r0, #96]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #32]
	ldr.w r6, [r0, #64]
	ldr.w r7, [r0, #96]
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
	str.w r5, [r0, #32]
	str.w r6, [r0, #64]
	str.w r7, [r0, #96]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #32]
	ldr.w r6, [r0, #64]
	ldr.w r7, [r0, #96]
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
	str.w r5, [r0, #32]
	str.w r6, [r0, #64]
	str.w r7, [r0, #96]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #32]
	ldr.w r6, [r0, #64]
	ldr.w r7, [r0, #96]
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
	str.w r5, [r0, #32]
	str.w r6, [r0, #64]
	str.w r7, [r0, #96]
	str.w r4, [r0], #100
	cmp.w r0, lr
	bne.w ntt2_layer_3_4
	vmov r0, lr, s0, s1
ntt2_layer_5_6:
	ldm r10!, {r1-r3}
	ldr.w r4, [r0]
	ldr.w r5, [r0, #8]
	ldr.w r6, [r0, #16]
	ldr.w r7, [r0, #24]
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
	str.w r5, [r0, #8]
	str.w r6, [r0, #16]
	str.w r7, [r0, #24]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #8]
	ldr.w r6, [r0, #16]
	ldr.w r7, [r0, #24]
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
	str.w r5, [r0, #8]
	str.w r6, [r0, #16]
	str.w r7, [r0, #24]
	str.w r4, [r0], #28
	cmp.w r0, lr
	bne.w ntt2_layer_5_6
	pop {r4-r11, pc}
