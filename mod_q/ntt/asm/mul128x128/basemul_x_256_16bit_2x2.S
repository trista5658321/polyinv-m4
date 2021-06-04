.p2align 2,,3
.syntax unified
.text
wpad:
	.word 769
	.word 5585133
	.word 4294901761
	.word 4290904126
	.word 4292345896
	.word 4283629741
	.word 8978296
	.word 4293197851
	.word 3801031
	.word 4274585911
	.word 4270260601
	.word 4275044656
	.word 19726036
	.word 9502576
	.word 4278518011
	.word 4283039926
	.word 4292149291
	.word 4271440231
	.word 4288807006
	.word 21298876
	.word 5636011
	.word 4287561841
	.word 4276027681
	.word 4279828711
	.word 4293328921
	.word 4294180876
	.word 4290773056
	.word 4286906491
	.word 4278386941
	.word 4274913586
	.word 16121611
	.word 4282515646
	.word 4282056901
	.word 5963686
	.word 4291756081
	.word 2555866
	.word 22806181
	.word 4293787666
	.word 4278124801
	.word 14155561
	.word 4276420891
	.word 9305971
	.word 4293853201
	.word 4276289821
	.word 5898151
	.word 8912761
	.word 393211
	.word 20381386
	.word 13172536
	.word 6356896
	.word 589816
	.word 4277076241
	.word 21036736
	.word 4284874906
	.word 4274061631
	.word 14221096
	.word 20577991
	.word 11927371
	.word 4291035196
	.word 8257411
	.word 4288872541
	.word 4269867391
	.word 4275372331
	.word 4289593426
	.word 22609576
	.word 4281598156
// void basemul_x_256_16bit_2x2 (int *h);
.global basemul_x_256_16bit_2x2
.type basemul_x_256_16bit_2x2, %function
basemul_x_256_16bit_2x2:
	push {r4-r11, lr}
	adr.w r10, wpad
	ldm r10!, {r11-r12}
	add.w lr, r0, #512
start_0:
	ldr.w r9, [r10], #4
	ldrsh.w r2, [r0, #2]
	ldrsh.w r3, [r0, #4]
	ldrsh.w r4, [r0, #6]
	ldrsh.w r1, [r0]
	smulbb r5, r9, r2
	smultb r6, r9, r4
	smmulr r7, r5, r12
	mls r5, r7, r11, r5
	smmulr r7, r1, r12
	mls r1, r7, r11, r1
	pkhbt r5, r5, r1, lsl #16
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	smmulr r7, r3, r12
	mls r3, r7, r11, r3
	pkhbt r6, r6, r3, lsl #16
	str.w r6, [r0, #4]
	str.w r5, [r0], #8
	ldr.w r9, [r10], #4
	ldrsh.w r2, [r0, #2]
	ldrsh.w r3, [r0, #4]
	ldrsh.w r4, [r0, #6]
	ldrsh.w r1, [r0]
	smulbb r5, r9, r2
	smultb r6, r9, r4
	smmulr r7, r5, r12
	mls r5, r7, r11, r5
	smmulr r7, r1, r12
	mls r1, r7, r11, r1
	pkhbt r5, r5, r1, lsl #16
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	smmulr r7, r3, r12
	mls r3, r7, r11, r3
	pkhbt r6, r6, r3, lsl #16
	str.w r6, [r0, #4]
	str.w r5, [r0], #8
	ldr.w r9, [r10], #4
	ldrsh.w r2, [r0, #2]
	ldrsh.w r3, [r0, #4]
	ldrsh.w r4, [r0, #6]
	ldrsh.w r1, [r0]
	smulbb r5, r9, r2
	smultb r6, r9, r4
	smmulr r7, r5, r12
	mls r5, r7, r11, r5
	smmulr r7, r1, r12
	mls r1, r7, r11, r1
	pkhbt r5, r5, r1, lsl #16
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	smmulr r7, r3, r12
	mls r3, r7, r11, r3
	pkhbt r6, r6, r3, lsl #16
	str.w r6, [r0, #4]
	str.w r5, [r0], #8
	ldr.w r9, [r10], #4
	ldrsh.w r2, [r0, #2]
	ldrsh.w r3, [r0, #4]
	ldrsh.w r4, [r0, #6]
	ldrsh.w r1, [r0]
	smulbb r5, r9, r2
	smultb r6, r9, r4
	smmulr r7, r5, r12
	mls r5, r7, r11, r5
	smmulr r7, r1, r12
	mls r1, r7, r11, r1
	pkhbt r5, r5, r1, lsl #16
	smmulr r7, r6, r12
	mls r6, r7, r11, r6
	smmulr r7, r3, r12
	mls r3, r7, r11, r3
	pkhbt r6, r6, r3, lsl #16
	str.w r6, [r0, #4]
	str.w r5, [r0], #8
	cmp.w r0, lr
	bne.w start_0
	pop {r4-r11, pc}
