.p2align 2,,3
.syntax unified
.text
wpad:
	.word 5168129
	.word -213984257
	.word 252097
	.word -252097
	.word -2341804
	.word 2341804
	.word -1264911
	.word 1264911
	.word 1379661
	.word -1379661
	.word -1185955
	.word 1185955
	.word -852232
	.word 852232
	.word -1166951
	.word 1166951
	.word 1778109
	.word -1778109
	.word -588241
	.word 588241
	.word -221566
	.word 221566
	.word -1447477
	.word 1447477
	.word -984052
	.word 984052
	.word 327403
	.word -327403
	.word 1679053
	.word -1679053
	.word 348251
	.word -348251
	.word 796489
	.word -796489
	.word -608053
	.word 608053
	.word -830570
	.word 830570
	.word 2557123
	.word -2557123
	.word -820333
	.word 820333
	.word -1925355
	.word 1925355
	.word -1523605
	.word 1523605
	.word 2526507
	.word -2526507
	.word 1574416
	.word -1574416
	.word -1678706
	.word 1678706
	.word -2107740
	.word 2107740
	.word -1493732
	.word 1493732
	.word -1674444
	.word 1674444
	.word -1430127
	.word 1430127
	.word 1293894
	.word -1293894
	.word 1093187
	.word -1093187
	.word -2352058
	.word 2352058
	.word 719363
	.word -719363
	.word -1888465
	.word 1888465
	.word -1396348
	.word 1396348
	.word -2342353
	.word 2342353
	.word -279579
	.word 279579
	.word 4920
	.word -4920
	.word -2404109
	.word 2404109
	.word -562498
	.word 562498
	.word -868640
	.word 868640
	.word 2320822
	.word -2320822
	.word -312417
	.word 312417
	.word -1085880
	.word 1085880
	.word 182802
	.word -182802
	.word 826685
	.word -826685
	.word -2281675
	.word 2281675
	.word -1098973
	.word 1098973
	.word 2178385
	.word -2178385
	.word 1689680
	.word -1689680
	.word -2568239
	.word 2568239
	.word 1739105
	.word -1739105
	.word -761807
	.word 761807
	.word -2073854
	.word 2073854
	.word 1786684
	.word -1786684
	.word -283823
	.word 283823
	.word -372161
	.word 372161
	.word 1720922
	.word -1720922
	.word -521099
	.word 521099
	.word 1784933
	.word -1784933
	.word 1741267
	.word -1741267
	.word -1701815
	.word 1701815
	.word -1160843
	.word 1160843
	.word -2526120
	.word 2526120
// void basemul256_32bit_2x2 (int *h, int *f, int *g);
.global basemul256_32bit_2x2
.type basemul256_32bit_2x2, %function
basemul256_32bit_2x2:
	push {r4-r11, lr}
	adr.w r10, wpad
	ldm r10!, {r11-r12}
	add.w lr, r0, #1024
	vmov s1, lr
start:
	ldr.w r9, [r10], #4
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #8
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #8
	smull r7, r8, r3, r6 @ 01
	smlal r7, r8, r4, r5 @ + 10
	mul.w lr, r7, r12
	smlal r7, r8, lr, r11
	smull r6, r7, r4, r6 @ 11
	mul.w lr, r6, r12
	smlal r6, r7, lr, r11
	smull r6, r7, r9, r7 @ = 11 * (2**32 * w)
	smlal r6, r7, r3, r5 @ + 00
	mul.w lr, r6, r12
	smlal r6, r7, lr, r11
	str.w r8, [r0, #4]
	str.w r7, [r0], #8
	ldr.w r9, [r10], #4
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #8
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #8
	smull r7, r8, r3, r6 @ 01
	smlal r7, r8, r4, r5 @ + 10
	mul.w lr, r7, r12
	smlal r7, r8, lr, r11
	smull r6, r7, r4, r6 @ 11
	mul.w lr, r6, r12
	smlal r6, r7, lr, r11
	smull r6, r7, r9, r7 @ = 11 * (2**32 * w)
	smlal r6, r7, r3, r5 @ + 00
	mul.w lr, r6, r12
	smlal r6, r7, lr, r11
	str.w r8, [r0, #4]
	str.w r7, [r0], #8
	ldr.w r9, [r10], #4
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #8
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #8
	smull r7, r8, r3, r6 @ 01
	smlal r7, r8, r4, r5 @ + 10
	mul.w lr, r7, r12
	smlal r7, r8, lr, r11
	smull r6, r7, r4, r6 @ 11
	mul.w lr, r6, r12
	smlal r6, r7, lr, r11
	smull r6, r7, r9, r7 @ = 11 * (2**32 * w)
	smlal r6, r7, r3, r5 @ + 00
	mul.w lr, r6, r12
	smlal r6, r7, lr, r11
	str.w r8, [r0, #4]
	str.w r7, [r0], #8
	ldr.w r9, [r10], #4
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #8
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #8
	smull r7, r8, r3, r6 @ 01
	smlal r7, r8, r4, r5 @ + 10
	mul.w lr, r7, r12
	smlal r7, r8, lr, r11
	smull r6, r7, r4, r6 @ 11
	mul.w lr, r6, r12
	smlal r6, r7, lr, r11
	smull r6, r7, r9, r7 @ = 11 * (2**32 * w)
	smlal r6, r7, r3, r5 @ + 00
	mul.w lr, r6, r12
	smlal r6, r7, lr, r11
	str.w r8, [r0, #4]
	str.w r7, [r0], #8
	vmov lr, s1
	cmp.w r0, lr
	bne.w start
	pop {r4-r11, pc}
