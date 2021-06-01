.p2align 2,,3
.syntax unified
.text
wpad:
	.word 1038337
	.word -103819265
	.word 405464
	.word -405464
	.word 94414
	.word -94414
	.word -150027
	.word 150027
	.word 490416
	.word -490416
	.word -195965
	.word 195965
	.word -382994
	.word 382994
	.word -442856
	.word 442856
	.word -411551
	.word 411551
	.word -489231
	.word 489231
	.word -35593
	.word 35593
	.word 235832
	.word -235832
	.word 479116
	.word -479116
	.word -301420
	.word 301420
	.word -227096
	.word 227096
	.word 103099
	.word -103099
	.word -237083
	.word 237083
	.word 499710
	.word -499710
	.word -6572
	.word 6572
	.word -453088
	.word 453088
	.word 233657
	.word -233657
	.word -130891
	.word 130891
	.word 321266
	.word -321266
	.word 238793
	.word -238793
	.word 44792
	.word -44792
	.word 113238
	.word -113238
	.word 139179
	.word -139179
	.word 51198
	.word -51198
	.word 141491
	.word -141491
	.word -302769
	.word 302769
	.word 153477
	.word -153477
	.word 511761
	.word -511761
	.word 68896
	.word -68896
	.word -129478
	.word 129478
	.word -125854
	.word 125854
	.word -263149
	.word 263149
	.word -353444
	.word 353444
	.word 5855
	.word -5855
	.word -166245
	.word 166245
	.word 292202
	.word -292202
	.word -149602
	.word 149602
	.word -143890
	.word 143890
	.word -261084
	.word 261084
	.word -24399
	.word 24399
	.word 498588
	.word -498588
	.word 470221
	.word -470221
	.word 495553
	.word -495553
	.word 474481
	.word -474481
	.word -105114
	.word 105114
	.word 414520
	.word -414520
	.word -496122
	.word 496122
	.word 149234
	.word -149234
	.word 415263
	.word -415263
	.word -318879
	.word 318879
	.word -390196
	.word 390196
	.word 110335
	.word -110335
	.word -298006
	.word 298006
	.word -124244
	.word 124244
	.word 499631
	.word -499631
	.word 414992
	.word -414992
	.word 181223
	.word -181223
	.word -306882
	.word 306882
	.word -291027
	.word 291027
	.word -242732
	.word 242732
	.word 11188
	.word -11188
// void basemul_x_512_32bit_4x4 (int *h);
.global basemul_x_512_32bit_4x4
.type basemul_x_512_32bit_4x4, %function
basemul_x_512_32bit_4x4:
	push {r4-r11, lr}
	adr.w r10, wpad
	ldm r10!, {r11-r12}
	add.w lr, r0, #2048
start:
	ldr.w r8, [r10], #4
	ldr.w r3, [r0, #4]
	ldr.w r4, [r0, #8]
	ldr.w r5, [r0, #12]
	ldr.w r2, [r0]
	smull r7, r1, r5, r8 @ * (2**32 * w)
	mul.w r8, r7, r12
	smlal r7, r1, r8, r11
	str.w r2, [r0, #4]
	str.w r3, [r0, #8]
	str.w r4, [r0, #12]
	str.w r1, [r0], #16
	cmp.w r0, lr
	bne.w start
	pop {r4-r11, pc}
