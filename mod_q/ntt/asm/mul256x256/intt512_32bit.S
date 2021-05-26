.p2align 2,,3
.syntax unified
.text
wpad:
	.word 518657
	.word -970724865
@ =56=
	.word -31321
	.word -31321
	.word 3916
	.word 3916
	.word 27172
	.word -59219
	.word 27172
	.word 40504
	.word -98277
	.word -59219
	.word -238488
	.word 43711
	.word 40504
	.word -134336
	.word -165871
	.word -98277
	.word -109379
	.word -136982
	.word -238488
	.word -79670
	.word 11501
	.word 43711
	.word 102053
	.word 168715
	.word -134336
	.word 211837
	.word 62455
	.word -165871
	.word -172184
	.word -201577
	.word -109379
	.word -215971
	.word -165186
	.word -136982
	.word 209535
	.word -196743
	.word -79670
	.word 88433
	.word 184808
	.word 11501
	.word 29924
	.word -185547
	.word 102053
	.word -203384
	.word -96167
	.word 168715
	.word 1840
	.word 60278
	.word 211837
	.word -482
	.word 37203
	.word 62455
	.word 75366
	.word 77514
	.word -172184
	.word -147633
	.word 108293
	.word -201577
	.word -25247
	.word 23624
	.word -215971
	.word 149948
	.word 178955
	.word -165186
	.word -218363
	.word -139816
	.word 209535
	.word -34527
	.word 148069
	.word -196743
	.word 209954
	.word 68983
	.word 88433
	.word 59860
	.word 213352
	.word 184808
	.word -247762
	.word -58278
	.word 29924
	.word 59006
	.word -232933
	.word -185547
	.word -223987
	.word -26393
	.word -203384
	.word 210887
	.word 127172
	.word -96167
	.word 122702
	.word -81082
	.word 1840
	.word 71967
	.word 244096
	.word 60278
	.word -137216
	.word 123136
@ =34=
	.word -31321
	.word -31321
	.word 3916
	.word 3916
	.word 27172
	.word -59219
	.word 27172
	.word 40504
	.word -98277
	.word -59219
	.word -238488
	.word 43711
	.word 40504
	.word -134336
	.word -165871
	.word -98277
	.word -109379
	.word -136982
	.word -238488
	.word -79670
	.word 11501
	.word 43711
	.word 102053
	.word 168715
@ =012=
	.word 3916
	.word 27172
	.word -59219
// void intt512_32bit (int *v);
.global intt512_32bit
.type intt512_32bit, %function
intt512_32bit:
	push {r4-r11, lr}
	adr.w r1, wpad
	ldm r1!, {r11-r12}
	vmov.w s0, s1, r0, r1
	add.w lr, r0, #2048
	vmov s2, lr @ lr: flag(r0-end)
	vmov r0, s0
intt2_layer_5_6:
	vmov r10, s1
	ldm r10!, {r1-r3}
	vmov s1, r10
	ldr.w r4, [r0]
	ldr.w r5, [r0, #16]
	ldr.w r6, [r0, #32]
	ldr.w r7, [r0, #48]
	sub.w r10, r4, r5
	add.w r4, r4, r5
	smull r8, r5, r10, r2
	mul.w r9, r8, r12
	smlal r8, r5, r9, r11
	sub.w r10, r6, r7
	add.w r6, r6, r7
	smull r8, r7, r10, r3
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	sub.w r10, r4, r6
	add.w r4, r4, r6
	smull r8, r6, r10, r1
	mul.w r9, r8, r12
	smlal r8, r6, r9, r11
	sub.w r10, r5, r7
	add.w r5, r5, r7
	smull r8, r7, r10, r1
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	str.w r5, [r0, #16]
	str.w r6, [r0, #32]
	str.w r7, [r0, #48]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #16]
	ldr.w r6, [r0, #32]
	ldr.w r7, [r0, #48]
	sub.w r10, r4, r5
	add.w r4, r4, r5
	smull r8, r5, r10, r2
	mul.w r9, r8, r12
	smlal r8, r5, r9, r11
	sub.w r10, r6, r7
	add.w r6, r6, r7
	smull r8, r7, r10, r3
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	sub.w r10, r4, r6
	add.w r4, r4, r6
	smull r8, r6, r10, r1
	mul.w r9, r8, r12
	smlal r8, r6, r9, r11
	sub.w r10, r5, r7
	add.w r5, r5, r7
	smull r8, r7, r10, r1
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	str.w r5, [r0, #16]
	str.w r6, [r0, #32]
	str.w r7, [r0, #48]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #16]
	ldr.w r6, [r0, #32]
	ldr.w r7, [r0, #48]
	sub.w r10, r4, r5
	add.w r4, r4, r5
	smull r8, r5, r10, r2
	mul.w r9, r8, r12
	smlal r8, r5, r9, r11
	sub.w r10, r6, r7
	add.w r6, r6, r7
	smull r8, r7, r10, r3
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	sub.w r10, r4, r6
	add.w r4, r4, r6
	smull r8, r6, r10, r1
	mul.w r9, r8, r12
	smlal r8, r6, r9, r11
	sub.w r10, r5, r7
	add.w r5, r5, r7
	smull r8, r7, r10, r1
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	str.w r5, [r0, #16]
	str.w r6, [r0, #32]
	str.w r7, [r0, #48]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #16]
	ldr.w r6, [r0, #32]
	ldr.w r7, [r0, #48]
	sub.w r10, r4, r5
	add.w r4, r4, r5
	smull r8, r5, r10, r2
	mul.w r9, r8, r12
	smlal r8, r5, r9, r11
	sub.w r10, r6, r7
	add.w r6, r6, r7
	smull r8, r7, r10, r3
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	sub.w r10, r4, r6
	add.w r4, r4, r6
	smull r8, r6, r10, r1
	mul.w r9, r8, r12
	smlal r8, r6, r9, r11
	sub.w r10, r5, r7
	add.w r5, r5, r7
	smull r8, r7, r10, r1
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	str.w r5, [r0, #16]
	str.w r6, [r0, #32]
	str.w r7, [r0, #48]
	str.w r4, [r0], #52
	cmp.w r0, lr
	bne.w intt2_layer_5_6
	vmov r0, s0
intt2_layer_3_4:
	vmov r10, s1
	ldm r10!, {r1-r3}
	vmov s1, r10
	ldr.w r4, [r0]
	ldr.w r5, [r0, #64]
	ldr.w r6, [r0, #128]
	ldr.w r7, [r0, #192]
	sub.w r10, r4, r5
	add.w r4, r4, r5
	smull r8, r5, r10, r2
	mul.w r9, r8, r12
	smlal r8, r5, r9, r11
	sub.w r10, r6, r7
	add.w r6, r6, r7
	smull r8, r7, r10, r3
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	sub.w r10, r4, r6
	add.w r4, r4, r6
	smull r8, r6, r10, r1
	mul.w r9, r8, r12
	smlal r8, r6, r9, r11
	sub.w r10, r5, r7
	add.w r5, r5, r7
	smull r8, r7, r10, r1
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	str.w r5, [r0, #64]
	str.w r6, [r0, #128]
	str.w r7, [r0, #192]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #64]
	ldr.w r6, [r0, #128]
	ldr.w r7, [r0, #192]
	sub.w r10, r4, r5
	add.w r4, r4, r5
	smull r8, r5, r10, r2
	mul.w r9, r8, r12
	smlal r8, r5, r9, r11
	sub.w r10, r6, r7
	add.w r6, r6, r7
	smull r8, r7, r10, r3
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	sub.w r10, r4, r6
	add.w r4, r4, r6
	smull r8, r6, r10, r1
	mul.w r9, r8, r12
	smlal r8, r6, r9, r11
	sub.w r10, r5, r7
	add.w r5, r5, r7
	smull r8, r7, r10, r1
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	str.w r5, [r0, #64]
	str.w r6, [r0, #128]
	str.w r7, [r0, #192]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #64]
	ldr.w r6, [r0, #128]
	ldr.w r7, [r0, #192]
	sub.w r10, r4, r5
	add.w r4, r4, r5
	smull r8, r5, r10, r2
	mul.w r9, r8, r12
	smlal r8, r5, r9, r11
	sub.w r10, r6, r7
	add.w r6, r6, r7
	smull r8, r7, r10, r3
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	sub.w r10, r4, r6
	add.w r4, r4, r6
	smull r8, r6, r10, r1
	mul.w r9, r8, r12
	smlal r8, r6, r9, r11
	sub.w r10, r5, r7
	add.w r5, r5, r7
	smull r8, r7, r10, r1
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	str.w r5, [r0, #64]
	str.w r6, [r0, #128]
	str.w r7, [r0, #192]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #64]
	ldr.w r6, [r0, #128]
	ldr.w r7, [r0, #192]
	sub.w r10, r4, r5
	add.w r4, r4, r5
	smull r8, r5, r10, r2
	mul.w r9, r8, r12
	smlal r8, r5, r9, r11
	sub.w r10, r6, r7
	add.w r6, r6, r7
	smull r8, r7, r10, r3
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	sub.w r10, r4, r6
	add.w r4, r4, r6
	smull r8, r6, r10, r1
	mul.w r9, r8, r12
	smlal r8, r6, r9, r11
	sub.w r10, r5, r7
	add.w r5, r5, r7
	smull r8, r7, r10, r1
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	str.w r5, [r0, #64]
	str.w r6, [r0, #128]
	str.w r7, [r0, #192]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #64]
	ldr.w r6, [r0, #128]
	ldr.w r7, [r0, #192]
	sub.w r10, r4, r5
	add.w r4, r4, r5
	smull r8, r5, r10, r2
	mul.w r9, r8, r12
	smlal r8, r5, r9, r11
	sub.w r10, r6, r7
	add.w r6, r6, r7
	smull r8, r7, r10, r3
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	sub.w r10, r4, r6
	add.w r4, r4, r6
	smull r8, r6, r10, r1
	mul.w r9, r8, r12
	smlal r8, r6, r9, r11
	sub.w r10, r5, r7
	add.w r5, r5, r7
	smull r8, r7, r10, r1
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	str.w r5, [r0, #64]
	str.w r6, [r0, #128]
	str.w r7, [r0, #192]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #64]
	ldr.w r6, [r0, #128]
	ldr.w r7, [r0, #192]
	sub.w r10, r4, r5
	add.w r4, r4, r5
	smull r8, r5, r10, r2
	mul.w r9, r8, r12
	smlal r8, r5, r9, r11
	sub.w r10, r6, r7
	add.w r6, r6, r7
	smull r8, r7, r10, r3
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	sub.w r10, r4, r6
	add.w r4, r4, r6
	smull r8, r6, r10, r1
	mul.w r9, r8, r12
	smlal r8, r6, r9, r11
	sub.w r10, r5, r7
	add.w r5, r5, r7
	smull r8, r7, r10, r1
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	str.w r5, [r0, #64]
	str.w r6, [r0, #128]
	str.w r7, [r0, #192]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #64]
	ldr.w r6, [r0, #128]
	ldr.w r7, [r0, #192]
	sub.w r10, r4, r5
	add.w r4, r4, r5
	smull r8, r5, r10, r2
	mul.w r9, r8, r12
	smlal r8, r5, r9, r11
	sub.w r10, r6, r7
	add.w r6, r6, r7
	smull r8, r7, r10, r3
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	sub.w r10, r4, r6
	add.w r4, r4, r6
	smull r8, r6, r10, r1
	mul.w r9, r8, r12
	smlal r8, r6, r9, r11
	sub.w r10, r5, r7
	add.w r5, r5, r7
	smull r8, r7, r10, r1
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	str.w r5, [r0, #64]
	str.w r6, [r0, #128]
	str.w r7, [r0, #192]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #64]
	ldr.w r6, [r0, #128]
	ldr.w r7, [r0, #192]
	sub.w r10, r4, r5
	add.w r4, r4, r5
	smull r8, r5, r10, r2
	mul.w r9, r8, r12
	smlal r8, r5, r9, r11
	sub.w r10, r6, r7
	add.w r6, r6, r7
	smull r8, r7, r10, r3
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	sub.w r10, r4, r6
	add.w r4, r4, r6
	smull r8, r6, r10, r1
	mul.w r9, r8, r12
	smlal r8, r6, r9, r11
	sub.w r10, r5, r7
	add.w r5, r5, r7
	smull r8, r7, r10, r1
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	str.w r5, [r0, #64]
	str.w r6, [r0, #128]
	str.w r7, [r0, #192]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #64]
	ldr.w r6, [r0, #128]
	ldr.w r7, [r0, #192]
	sub.w r10, r4, r5
	add.w r4, r4, r5
	smull r8, r5, r10, r2
	mul.w r9, r8, r12
	smlal r8, r5, r9, r11
	sub.w r10, r6, r7
	add.w r6, r6, r7
	smull r8, r7, r10, r3
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	sub.w r10, r4, r6
	add.w r4, r4, r6
	smull r8, r6, r10, r1
	mul.w r9, r8, r12
	smlal r8, r6, r9, r11
	sub.w r10, r5, r7
	add.w r5, r5, r7
	smull r8, r7, r10, r1
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	str.w r5, [r0, #64]
	str.w r6, [r0, #128]
	str.w r7, [r0, #192]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #64]
	ldr.w r6, [r0, #128]
	ldr.w r7, [r0, #192]
	sub.w r10, r4, r5
	add.w r4, r4, r5
	smull r8, r5, r10, r2
	mul.w r9, r8, r12
	smlal r8, r5, r9, r11
	sub.w r10, r6, r7
	add.w r6, r6, r7
	smull r8, r7, r10, r3
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	sub.w r10, r4, r6
	add.w r4, r4, r6
	smull r8, r6, r10, r1
	mul.w r9, r8, r12
	smlal r8, r6, r9, r11
	sub.w r10, r5, r7
	add.w r5, r5, r7
	smull r8, r7, r10, r1
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	str.w r5, [r0, #64]
	str.w r6, [r0, #128]
	str.w r7, [r0, #192]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #64]
	ldr.w r6, [r0, #128]
	ldr.w r7, [r0, #192]
	sub.w r10, r4, r5
	add.w r4, r4, r5
	smull r8, r5, r10, r2
	mul.w r9, r8, r12
	smlal r8, r5, r9, r11
	sub.w r10, r6, r7
	add.w r6, r6, r7
	smull r8, r7, r10, r3
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	sub.w r10, r4, r6
	add.w r4, r4, r6
	smull r8, r6, r10, r1
	mul.w r9, r8, r12
	smlal r8, r6, r9, r11
	sub.w r10, r5, r7
	add.w r5, r5, r7
	smull r8, r7, r10, r1
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	str.w r5, [r0, #64]
	str.w r6, [r0, #128]
	str.w r7, [r0, #192]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #64]
	ldr.w r6, [r0, #128]
	ldr.w r7, [r0, #192]
	sub.w r10, r4, r5
	add.w r4, r4, r5
	smull r8, r5, r10, r2
	mul.w r9, r8, r12
	smlal r8, r5, r9, r11
	sub.w r10, r6, r7
	add.w r6, r6, r7
	smull r8, r7, r10, r3
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	sub.w r10, r4, r6
	add.w r4, r4, r6
	smull r8, r6, r10, r1
	mul.w r9, r8, r12
	smlal r8, r6, r9, r11
	sub.w r10, r5, r7
	add.w r5, r5, r7
	smull r8, r7, r10, r1
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	str.w r5, [r0, #64]
	str.w r6, [r0, #128]
	str.w r7, [r0, #192]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #64]
	ldr.w r6, [r0, #128]
	ldr.w r7, [r0, #192]
	sub.w r10, r4, r5
	add.w r4, r4, r5
	smull r8, r5, r10, r2
	mul.w r9, r8, r12
	smlal r8, r5, r9, r11
	sub.w r10, r6, r7
	add.w r6, r6, r7
	smull r8, r7, r10, r3
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	sub.w r10, r4, r6
	add.w r4, r4, r6
	smull r8, r6, r10, r1
	mul.w r9, r8, r12
	smlal r8, r6, r9, r11
	sub.w r10, r5, r7
	add.w r5, r5, r7
	smull r8, r7, r10, r1
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	str.w r5, [r0, #64]
	str.w r6, [r0, #128]
	str.w r7, [r0, #192]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #64]
	ldr.w r6, [r0, #128]
	ldr.w r7, [r0, #192]
	sub.w r10, r4, r5
	add.w r4, r4, r5
	smull r8, r5, r10, r2
	mul.w r9, r8, r12
	smlal r8, r5, r9, r11
	sub.w r10, r6, r7
	add.w r6, r6, r7
	smull r8, r7, r10, r3
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	sub.w r10, r4, r6
	add.w r4, r4, r6
	smull r8, r6, r10, r1
	mul.w r9, r8, r12
	smlal r8, r6, r9, r11
	sub.w r10, r5, r7
	add.w r5, r5, r7
	smull r8, r7, r10, r1
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	str.w r5, [r0, #64]
	str.w r6, [r0, #128]
	str.w r7, [r0, #192]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #64]
	ldr.w r6, [r0, #128]
	ldr.w r7, [r0, #192]
	sub.w r10, r4, r5
	add.w r4, r4, r5
	smull r8, r5, r10, r2
	mul.w r9, r8, r12
	smlal r8, r5, r9, r11
	sub.w r10, r6, r7
	add.w r6, r6, r7
	smull r8, r7, r10, r3
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	sub.w r10, r4, r6
	add.w r4, r4, r6
	smull r8, r6, r10, r1
	mul.w r9, r8, r12
	smlal r8, r6, r9, r11
	sub.w r10, r5, r7
	add.w r5, r5, r7
	smull r8, r7, r10, r1
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	str.w r5, [r0, #64]
	str.w r6, [r0, #128]
	str.w r7, [r0, #192]
	str.w r4, [r0], #4
	ldr.w r4, [r0]
	ldr.w r5, [r0, #64]
	ldr.w r6, [r0, #128]
	ldr.w r7, [r0, #192]
	sub.w r10, r4, r5
	add.w r4, r4, r5
	smull r8, r5, r10, r2
	mul.w r9, r8, r12
	smlal r8, r5, r9, r11
	sub.w r10, r6, r7
	add.w r6, r6, r7
	smull r8, r7, r10, r3
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	sub.w r10, r4, r6
	add.w r4, r4, r6
	smull r8, r6, r10, r1
	mul.w r9, r8, r12
	smlal r8, r6, r9, r11
	sub.w r10, r5, r7
	add.w r5, r5, r7
	smull r8, r7, r10, r1
	mul.w r9, r8, r12
	smlal r8, r7, r9, r11
	str.w r5, [r0, #64]
	str.w r6, [r0, #128]
	str.w r7, [r0, #192]
	str.w r4, [r0], #196
	cmp.w r0, lr
	bne.w intt2_layer_3_4
	vmov r0, s0
	vmov r10, s1
	ldm r10!, {r1-r3}
	vmov s1, r10
	vmov s4, s5, r1, r2
	vmov s6, r3
	add.w lr, r0, #256 @ 64
intt2_layer_0_1_2:
	vmov r1, r2, s4, s5
	vmov r3, s6
	ldr.w r7, [r0, #1024]
	ldr.w r8, [r0, #1280]
	ldr.w r9, [r0, #1536]
	ldr.w r10, [r0, #1792]
	sub.w r6, r7, r8
	add.w r7, r7, r8
	smull r4, r8, r6, r2
	mul.w r5, r4, r12
	smlal r4, r8, r5, r11
	sub.w r6, r9, r10
	add.w r9, r9, r10
	smull r4, r10, r6, r3
	mul.w r5, r4, r12
	smlal r4, r10, r5, r11
	sub.w r6, r7, r9
	add.w r7, r7, r9
	smull r4, r9, r6, r1
	mul.w r5, r4, r12
	smlal r4, r9, r5, r11
	sub.w r6, r8, r10
	add.w r8, r8, r10
	smull r4, r10, r6, r1
	mul.w r5, r4, r12
	smlal r4, r10, r5, r11
	ldr.w r3, [r0]
	ldr.w r4, [r0, #256]
	ldr.w r5, [r0, #512]
	ldr.w r6, [r0, #768]
	add.w r3, r3, r4
	sub.w r4, r3, r4, lsl #1
	sub.w r2, r5, r6
	add.w r5, r5, r6
	smull r1, r6, r2, r1
	mul.w r2, r1, r12
	smlal r1, r6, r2, r11
	add.w r3, r3, r5
	sub.w r5, r3, r5, lsl #1
	add.w r4, r4, r6
	sub.w r6, r4, r6, lsl #1
	@ layer 0
	add.w r3, r3, r7
	sub.w r7, r3, r7, lsl #1
	add.w r4, r4, r8
	sub.w r8, r4, r8, lsl #1
	add.w r5, r5, r9
	sub.w r9, r5, r9, lsl #1
	add.w r6, r6, r10
	sub.w r10, r6, r10, lsl #1
	str.w r4, [r0, #256]
	str.w r5, [r0, #512]
	str.w r6, [r0, #768]
	str.w r7, [r0, #1024]
	str.w r8, [r0, #1280]
	str.w r9, [r0, #1536]
	str.w r10, [r0, #1792]
	str.w r3, [r0], #4
	cmp.w r0, lr
	bne.w intt2_layer_0_1_2
	pop {r4-r11, pc}
