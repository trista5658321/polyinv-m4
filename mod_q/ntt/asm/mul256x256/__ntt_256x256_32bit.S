.p2align 2,,3
.syntax unified
.text

wpad:
	.word -970724865
	.word 518657
@ =012=
	.word -3916
	.word 59219
	.word -27172
@ =34=
	.word -31321
	.word -31321
	.word -3916
	.word -3916
	.word 59219
	.word -27172
	.word 59219
	.word -43711
	.word 238488
	.word -27172
	.word 98277
	.word -40504
	.word -43711
	.word -168715
	.word -102053
	.word 238488
	.word -11501
	.word 79670
	.word 98277
	.word 136982
	.word 109379
	.word -40504
	.word 165871
	.word 134336
@ =56=
	.word -31321
	.word -31321
	.word -3916
	.word -3916
	.word 59219
	.word -27172
	.word 59219
	.word -43711
	.word 238488
	.word -27172
	.word 98277
	.word -40504
	.word -43711
	.word -168715
	.word -102053
	.word 238488
	.word -11501
	.word 79670
	.word 98277
	.word 136982
	.word 109379
	.word -40504
	.word 165871
	.word 134336
	.word -168715
	.word -60278
	.word -1840
	.word -102053
	.word 96167
	.word 203384
	.word -11501
	.word 185547
	.word -29924
	.word 79670
	.word -184808
	.word -88433
	.word 136982
	.word 196743
	.word -209535
	.word 109379
	.word 165186
	.word 215971
	.word 165871
	.word 201577
	.word 172184
	.word 134336
	.word -62455
	.word -211837
	.word -60278
	.word -123136
	.word 137216
	.word -1840
	.word -244096
	.word -71967
	.word 96167
	.word 81082
	.word -122702
	.word 203384
	.word -127172
	.word -210887
	.word 185547
	.word 26393
	.word 223987
	.word -29924
	.word 232933
	.word -59006
	.word -184808
	.word 58278
	.word 247762
	.word -88433
	.word -213352
	.word -59860
	.word 196743
	.word -68983
	.word -209954
	.word -209535
	.word -148069
	.word 34527
	.word 165186
	.word 139816
	.word 218363
	.word 215971
	.word -178955
	.word -149948
	.word 201577
	.word -23624
	.word 25247
	.word 172184
	.word -108293
	.word 147633
	.word -62455
	.word -77514
	.word -75366
	.word -211837
	.word -37203
	.word 482

.global ntt512_32bit
.type ntt512_32bit, %function
ntt512_32bit:
	push {r4-r11, lr}
	adr.w lr, wpad
	vmov.w s0, s1, r0, r1
	ldm lr!, {r11-r12}
	vldm lr!, {s4-s6}
	vmov.w s2, lr
	add.w lr, r0, #256
	vmov s3, lr
ntt2_layer_0_1_2:
	vmov r10, s4
	ldrsh.w r3, [r1, #128]
	ldrsh.w r4, [r1, #256]
	ldrsh.w r5, [r1, #384]
	ldrsh.w r2, [r1], #2
	smull r6, r7, r4, r10 @ c2
	mul.w lr, r6, r11
	smlal r6, r7, lr, r12
	add.w r8, r2, r7 @ r8: f'0
	sub.w r9, r2, r7 @ r9: f'128
	smull r6, r7, r5, r10 @ c2
	mul.w lr, r6, r11
	smlal r6, r7, lr, r12
	add.w r6, r3, r7 @ r6: f'64
	sub.w r7, r3, r7 @ r7: f'192
	add.w r2, r2, r4 @ r2: f0+f128 = f'0
	sub.w r4, r2, r4, lsl #1 @ r4: f0-f128 = f'128
	add.w r3, r3, r5 @ r3: f64+f192 = f'64
	sub.w r5, r3, r5, lsl #1 @ r5: f64-f192 = f'192
	smull r5, r10, r5, r10 @ c4 = -1
	mul.w lr, r5, r11
	smlal r5, r10, lr, r12
	sub.w r5, r4, r10
	add.w r4, r4, r10
	add.w r2, r2, r3 @ r2: f'0 + f'64 = f''0
	sub.w r3, r2, r3, lsl #1 @ r3 = f'0 - f'64 = f''64
	str.w r2, [r0]
	str.w r3, [r0, #256]
	str.w r4, [r0, #512]
	str.w r5, [r0, #768]
	vmov.w r2, r3, s5, s6
	smull r4, r5, r6, r2 @ c5
	mul.w lr, r4, r11
	smlal r4, r5, lr, r12
	sub.w r6, r8, r5
	add.w r8, r8, r5
	smull r4, r5, r7, r3 @ c6
	mul.w lr, r4, r11
	smlal r4, r5, lr, r12
	sub.w r7, r9, r5
	add.w r9, r9, r5
	str.w r8, [r0, #1024]
	str.w r6, [r0, #1280]
	str.w r9, [r0, #1536]
	str.w r7, [r0, #1792]
	add.w r0, r0, #4
	vmov r10, s3
	cmp.w r0, r10
	bne.w ntt2_layer_0_1_2
	vmov r0, s0
	add.w lr, r0, #2048 @ 512
	vmov s1, lr
ntt2_layer_3_4:
	add.w lr, r0, #64 @ 16
	vmov r10, s2
	ldm r10!, {r1-r3}
	vmov s2, r10
ntt2_layer_3_4_inner:
	ldr.w r4, [r0]
	ldr.w r5, [r0, #64]
	ldr.w r6, [r0, #128]
	ldr.w r7, [r0, #192]
	smull r8, r9, r6, r1 @ c0
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r6, r4, r9 @ r6: f'32
	add.w r4, r4, r9 @ r4: f'0
	smull r8, r9, r7, r1 @ c0
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r7, r5, r9 @ r7: f'48
	add.w r5, r5, r9 @ r5: f'16
	smull r8, r9, r5, r2 @ c1
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r5, r4, r9 @ r5: f''16
	add.w r4, r4, r9 @ r4: f''0
	smull r8, r9, r7, r3 @ c2
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r7, r6, r9 @ r7: f''48
	add.w r6, r6, r9 @ r6: f''32
	str.w r5, [r0, #64]
	str.w r6, [r0, #128]
	str.w r7, [r0, #192]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #64]
	ldr.w r6, [r0, #128]
	ldr.w r7, [r0, #192]
	smull r8, r9, r6, r1
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r6, r4, r9
	add.w r4, r4, r9
	smull r8, r9, r7, r1
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r7, r5, r9
	add.w r5, r5, r9
	smull r8, r9, r5, r2
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r5, r4, r9
	add.w r4, r4, r9
	smull r8, r9, r7, r3
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r7, r6, r9
	add.w r6, r6, r9
	str.w r5, [r0, #64]
	str.w r6, [r0, #128]
	str.w r7, [r0, #192]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #64]
	ldr.w r6, [r0, #128]
	ldr.w r7, [r0, #192]
	smull r8, r9, r6, r1
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r6, r4, r9
	add.w r4, r4, r9
	smull r8, r9, r7, r1
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r7, r5, r9
	add.w r5, r5, r9
	smull r8, r9, r5, r2
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r5, r4, r9
	add.w r4, r4, r9
	smull r8, r9, r7, r3
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r7, r6, r9
	add.w r6, r6, r9
	str.w r5, [r0, #64]
	str.w r6, [r0, #128]
	str.w r7, [r0, #192]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #64]
	ldr.w r6, [r0, #128]
	ldr.w r7, [r0, #192]
	smull r8, r9, r6, r1
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r6, r4, r9
	add.w r4, r4, r9
	smull r8, r9, r7, r1
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r7, r5, r9
	add.w r5, r5, r9
	smull r8, r9, r5, r2
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r5, r4, r9
	add.w r4, r4, r9
	smull r8, r9, r7, r3
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r7, r6, r9
	add.w r6, r6, r9
	str.w r5, [r0, #64]
	str.w r6, [r0, #128]
	str.w r7, [r0, #192]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #64]
	ldr.w r6, [r0, #128]
	ldr.w r7, [r0, #192]
	smull r8, r9, r6, r1
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r6, r4, r9
	add.w r4, r4, r9
	smull r8, r9, r7, r1
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r7, r5, r9
	add.w r5, r5, r9
	smull r8, r9, r5, r2
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r5, r4, r9
	add.w r4, r4, r9
	smull r8, r9, r7, r3
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r7, r6, r9
	add.w r6, r6, r9
	str.w r5, [r0, #64]
	str.w r6, [r0, #128]
	str.w r7, [r0, #192]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #64]
	ldr.w r6, [r0, #128]
	ldr.w r7, [r0, #192]
	smull r8, r9, r6, r1
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r6, r4, r9
	add.w r4, r4, r9
	smull r8, r9, r7, r1
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r7, r5, r9
	add.w r5, r5, r9
	smull r8, r9, r5, r2
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r5, r4, r9
	add.w r4, r4, r9
	smull r8, r9, r7, r3
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r7, r6, r9
	add.w r6, r6, r9
	str.w r5, [r0, #64]
	str.w r6, [r0, #128]
	str.w r7, [r0, #192]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #64]
	ldr.w r6, [r0, #128]
	ldr.w r7, [r0, #192]
	smull r8, r9, r6, r1
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r6, r4, r9
	add.w r4, r4, r9
	smull r8, r9, r7, r1
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r7, r5, r9
	add.w r5, r5, r9
	smull r8, r9, r5, r2
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r5, r4, r9
	add.w r4, r4, r9
	smull r8, r9, r7, r3
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r7, r6, r9
	add.w r6, r6, r9
	str.w r5, [r0, #64]
	str.w r6, [r0, #128]
	str.w r7, [r0, #192]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #64]
	ldr.w r6, [r0, #128]
	ldr.w r7, [r0, #192]
	smull r8, r9, r6, r1
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r6, r4, r9
	add.w r4, r4, r9
	smull r8, r9, r7, r1
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r7, r5, r9
	add.w r5, r5, r9
	smull r8, r9, r5, r2
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r5, r4, r9
	add.w r4, r4, r9
	smull r8, r9, r7, r3
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r7, r6, r9
	add.w r6, r6, r9
	str.w r5, [r0, #64]
	str.w r6, [r0, #128]
	str.w r7, [r0, #192]
	str.w r4, [r0], #4
	cmp.w r0, lr
	bne.w ntt2_layer_3_4_inner
	add.w r0, r0, #192
	vmov r10, s1
	cmp.w r0, r10
	bne.w ntt2_layer_3_4
	vmov r0, s0
	vmov lr, s1
ntt2_layer_5_6:
	vmov r10, s2
	ldm r10!, {r1-r3}
	vmov s2, r10
	ldr.w r4, [r0]
	ldr.w r5, [r0, #16]
	ldr.w r6, [r0, #32]
	ldr.w r7, [r0, #48]
	smull r8, r9, r6, r1
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r6, r4, r9
	add.w r4, r4, r9
	smull r8, r9, r7, r1
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r7, r5, r9
	add.w r5, r5, r9
	smull r8, r9, r5, r2
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r5, r4, r9
	add.w r4, r4, r9
	smull r8, r9, r7, r3
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r7, r6, r9
	add.w r6, r6, r9
	str.w r5, [r0, #16]
	str.w r6, [r0, #32]
	str.w r7, [r0, #48]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #16]
	ldr.w r6, [r0, #32]
	ldr.w r7, [r0, #48]
	smull r8, r9, r6, r1
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r6, r4, r9
	add.w r4, r4, r9
	smull r8, r9, r7, r1
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r7, r5, r9
	add.w r5, r5, r9
	smull r8, r9, r5, r2
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r5, r4, r9
	add.w r4, r4, r9
	smull r8, r9, r7, r3
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r7, r6, r9
	add.w r6, r6, r9
	str.w r5, [r0, #16]
	str.w r6, [r0, #32]
	str.w r7, [r0, #48]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #16]
	ldr.w r6, [r0, #32]
	ldr.w r7, [r0, #48]
	smull r8, r9, r6, r1
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r6, r4, r9
	add.w r4, r4, r9
	smull r8, r9, r7, r1
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r7, r5, r9
	add.w r5, r5, r9
	smull r8, r9, r5, r2
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r5, r4, r9
	add.w r4, r4, r9
	smull r8, r9, r7, r3
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r7, r6, r9
	add.w r6, r6, r9
	str.w r5, [r0, #16]
	str.w r6, [r0, #32]
	str.w r7, [r0, #48]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #16]
	ldr.w r6, [r0, #32]
	ldr.w r7, [r0, #48]
	smull r8, r9, r6, r1
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r6, r4, r9
	add.w r4, r4, r9
	smull r8, r9, r7, r1
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r7, r5, r9
	add.w r5, r5, r9
	smull r8, r9, r5, r2
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r5, r4, r9
	add.w r4, r4, r9
	smull r8, r9, r7, r3
	mul.w r10, r8, r11
	smlal r8, r9, r10, r12
	sub.w r7, r6, r9
	add.w r6, r6, r9
	str.w r5, [r0, #16]
	str.w r6, [r0, #32]
	str.w r7, [r0, #48]
	str.w r4, [r0], #52
	cmp.w r0, lr
	bne.w ntt2_layer_5_6
    vmov r0, s0
	pop {r4-r11, pc}
