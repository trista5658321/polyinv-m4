.p2align 2,,3
.syntax unified
.text
wpad:
	.word 1038337
	.word -103819265
@ =56=
	.word 405464
	.word 405464
	.word -94414
	.word -94414
	.word -490416
	.word 150027
	.word -490416
	.word 411551
	.word 442856
	.word 150027
	.word 382994
	.word 195965
	.word 411551
	.word 237083
	.word -103099
	.word 442856
	.word 227096
	.word 301420
	.word 382994
	.word -479116
	.word -235832
	.word 195965
	.word 35593
	.word 489231
	.word 237083
	.word -68896
	.word -511761
	.word -103099
	.word -153477
	.word 302769
	.word 227096
	.word -141491
	.word -51198
	.word 301420
	.word -139179
	.word -113238
	.word -479116
	.word -44792
	.word -238793
	.word -235832
	.word -321266
	.word 130891
	.word 35593
	.word -233657
	.word 453088
	.word 489231
	.word 6572
	.word -499710
	.word -68896
	.word -11188
	.word 242732
	.word -511761
	.word 291027
	.word 306882
	.word -153477
	.word -181223
	.word -414992
	.word 302769
	.word -499631
	.word 124244
	.word -141491
	.word 298006
	.word -110335
	.word -51198
	.word 390196
	.word 318879
	.word -139179
	.word -415263
	.word -149234
	.word -113238
	.word 496122
	.word -414520
	.word -44792
	.word 105114
	.word -474481
	.word -238793
	.word -495553
	.word -470221
	.word -321266
	.word -498588
	.word 24399
	.word 130891
	.word 261084
	.word 143890
	.word -233657
	.word 149602
	.word -292202
	.word 453088
	.word 166245
	.word -5855
	.word 6572
	.word 353444
	.word 263149
	.word -499710
	.word 125854
	.word 129478
@ =34=
	.word 405464
	.word 405464
	.word -94414
	.word -94414
	.word -490416
	.word 150027
	.word -490416
	.word 411551
	.word 442856
	.word 150027
	.word 382994
	.word 195965
	.word 411551
	.word 237083
	.word -103099
	.word 442856
	.word 227096
	.word 301420
	.word 382994
	.word -479116
	.word -235832
	.word 195965
	.word 35593
	.word 489231
@ =012=
	.word -94414
	.word -490416
	.word 150027
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
