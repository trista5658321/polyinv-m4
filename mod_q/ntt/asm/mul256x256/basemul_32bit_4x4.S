.p2align 2,,3
.syntax unified
.text
wpad:
	.word 518657
	.word -970724865
	.word -31321
	.word 31321
	.word -3916
	.word 3916
	.word 59219
	.word -59219
	.word -27172
	.word 27172
	.word -43711
	.word 43711
	.word 238488
	.word -238488
	.word 98277
	.word -98277
	.word -40504
	.word 40504
	.word -168715
	.word 168715
	.word -102053
	.word 102053
	.word -11501
	.word 11501
	.word 79670
	.word -79670
	.word 136982
	.word -136982
	.word 109379
	.word -109379
	.word 165871
	.word -165871
	.word 134336
	.word -134336
	.word -60278
	.word 60278
	.word -1840
	.word 1840
	.word 96167
	.word -96167
	.word 203384
	.word -203384
	.word 185547
	.word -185547
	.word -29924
	.word 29924
	.word -184808
	.word 184808
	.word -88433
	.word 88433
	.word 196743
	.word -196743
	.word -209535
	.word 209535
	.word 165186
	.word -165186
	.word 215971
	.word -215971
	.word 201577
	.word -201577
	.word 172184
	.word -172184
	.word -62455
	.word 62455
	.word -211837
	.word 211837
	.word -123136
	.word 123136
	.word 137216
	.word -137216
	.word -244096
	.word 244096
	.word -71967
	.word 71967
	.word 81082
	.word -81082
	.word -122702
	.word 122702
	.word -127172
	.word 127172
	.word -210887
	.word 210887
	.word 26393
	.word -26393
	.word 223987
	.word -223987
	.word 232933
	.word -232933
	.word -59006
	.word 59006
	.word 58278
	.word -58278
	.word 247762
	.word -247762
	.word -213352
	.word 213352
	.word -59860
	.word 59860
	.word -68983
	.word 68983
	.word -209954
	.word 209954
	.word -148069
	.word 148069
	.word 34527
	.word -34527
	.word 139816
	.word -139816
	.word 218363
	.word -218363
	.word -178955
	.word 178955
	.word -149948
	.word 149948
	.word -23624
	.word 23624
	.word 25247
	.word -25247
	.word -108293
	.word 108293
	.word 147633
	.word -147633
	.word -77514
	.word 77514
	.word -75366
	.word 75366
	.word -37203
	.word 37203
	.word 482
	.word -482
// void basemul_32bit_4x4 (int *h, int *f, int *g);
.global basemul_32bit_4x4
.type basemul_32bit_4x4, %function
basemul_32bit_4x4:
	push {r4-r11, lr}
	adr.w lr, wpad
	ldm lr!, {r11-r12}
	add.w r10, r0, #2048
	vmov s4, r10
	vmov s0, s1, r0, r1
	vmov s2, s3, r2, lr
start:
	vmov r1, r2, s1, s2
	vmov lr, s3
	ldr.w r10, [lr], #4
	ldr.w r7, [r2, #4]
	ldr.w r8, [r2, #8]
	ldr.w r9, [r2, #12]
	ldr.w r6, [r2], #16
	vmov s2, r2
	vmov s3, lr
	ldr.w r3, [r1, #4]
	ldr.w r4, [r1, #8]
	ldr.w r5, [r1, #12]
	ldr.w r2, [r1], #16
	vmov s1, r1
	smull r0, r1, r5, r9 @ 33
	mul.w lr, r0, r12
	smlal r0, r1, lr, r11
	smull r0, r1, r10, r1 @ 33 * w = r1 * (2**32 * w)
	smlal r0, r1, r2, r8 @ 33 + 02
	smlal r0, r1, r3, r7 @ + 11
	smlal r0, r1, r4, r6 @ + 20
	mul.w lr, r0, r12
	smlal r0, r1, lr, r11
	vmov r0, s0
	str.w r1, [r0, #8]
	smull r0, r1, r4, r9 @ 23
	smlal r0, r1, r5, r8 @ + 32
	mul.w lr, r0, r12
	smlal r0, r1, lr, r11
	smull r0, r1, r10, r1 @ = r1 * (2**32 * w)
	smlal r0, r1, r2, r7 @ + 01
	smlal r0, r1, r3, r6 @ + 10
	mul.w lr, r0, r12
	smlal r0, r1, lr, r11
	vmov r0, s0
	str.w r1, [r0, #4]
	smull r0, r1, r2, r9 @ 03
	smlal r0, r1, r3, r8 @ + 12
	smlal r0, r1, r4, r7 @ + 21
	smlal r0, r1, r5, r6 @ + 30
	mul.w lr, r0, r12
	smlal r0, r1, lr, r11
	vmov r0, s0
	str.w r1, [r0, #12]
	smull r0, r1, r3, r9 @ 13
	smlal r0, r1, r4, r8 @ + 22
	smlal r0, r1, r5, r7 @ + 31
	mul.w lr, r0, r12
	smlal r0, r1, lr, r11
	smull r0, r1, r10, r1 @ = r1 * (2**32 * w)
	smlal r0, r1, r2, r6 @ + 00
	mul.w lr, r0, r12
	smlal r0, r1, lr, r11
	vmov r0, s0
	str.w r1, [r0], #16
	vmov s0, r0
	vmov r10, s4
	cmp.w r0, r10
	bne.w start
	pop {r4-r11, pc}
