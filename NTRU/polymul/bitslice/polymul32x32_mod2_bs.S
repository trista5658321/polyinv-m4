// bitslice functions
.p2align	2,,3
.syntax		unified
.text
.global 	polymul_32x32_mod2_bs
.type		polymul_32x32_mod2_bs, %function
// void polymul_32x32_mod2_bs(int *h, int *f, int *g);
polymul_32x32_mod2_bs:
	push	{r4-r11,lr}
	ldr	r4, [r1]
	ldr	r5, [r2]
	and	r6, r4, r5, ASR #31
	rors	r5, r5, #31
	ubfx	r7, r6, #31, #1
	and	r8, r4, r5, ASR #31
	eor	r6, r8, r6, LSL #1
	rors	r5, r5, #31
	ands	r8, r4, r5, ASR #31
	eors	r6, r8, r6, LSL #1
	adc	r7, r7, r7	// RLX
	rors	r5, r5, #31
	ands	r8, r4, r5, ASR #31
	eors	r6, r8, r6, LSL #1
	adc	r7, r7, r7	// RLX
	rors	r5, r5, #31
	ands	r8, r4, r5, ASR #31
	eors	r6, r8, r6, LSL #1
	adc	r7, r7, r7	// RLX
	rors	r5, r5, #31
	ands	r8, r4, r5, ASR #31
	eors	r6, r8, r6, LSL #1
	adc	r7, r7, r7	// RLX
	rors	r5, r5, #31
	ands	r8, r4, r5, ASR #31
	eors	r6, r8, r6, LSL #1
	adc	r7, r7, r7	// RLX
	rors	r5, r5, #31
	ands	r8, r4, r5, ASR #31
	eors	r6, r8, r6, LSL #1
	adc	r7, r7, r7	// RLX
	rors	r5, r5, #31
	ands	r8, r4, r5, ASR #31
	eors	r6, r8, r6, LSL #1
	adc	r7, r7, r7	// RLX
	rors	r5, r5, #31
	ands	r8, r4, r5, ASR #31
	eors	r6, r8, r6, LSL #1
	adc	r7, r7, r7	// RLX
	rors	r5, r5, #31
	ands	r8, r4, r5, ASR #31
	eors	r6, r8, r6, LSL #1
	adc	r7, r7, r7	// RLX
	rors	r5, r5, #31
	ands	r8, r4, r5, ASR #31
	eors	r6, r8, r6, LSL #1
	adc	r7, r7, r7	// RLX
	rors	r5, r5, #31
	ands	r8, r4, r5, ASR #31
	eors	r6, r8, r6, LSL #1
	adc	r7, r7, r7	// RLX
	rors	r5, r5, #31
	ands	r8, r4, r5, ASR #31
	eors	r6, r8, r6, LSL #1
	adc	r7, r7, r7	// RLX
	rors	r5, r5, #31
	ands	r8, r4, r5, ASR #31
	eors	r6, r8, r6, LSL #1
	adc	r7, r7, r7	// RLX
	rors	r5, r5, #31
	ands	r8, r4, r5, ASR #31
	eors	r6, r8, r6, LSL #1
	adc	r7, r7, r7	// RLX
	rors	r5, r5, #31
	ands	r8, r4, r5, ASR #31
	eors	r6, r8, r6, LSL #1
	adc	r7, r7, r7	// RLX
	rors	r5, r5, #31
	ands	r8, r4, r5, ASR #31
	eors	r6, r8, r6, LSL #1
	adc	r7, r7, r7	// RLX
	rors	r5, r5, #31
	ands	r8, r4, r5, ASR #31
	eors	r6, r8, r6, LSL #1
	adc	r7, r7, r7	// RLX
	rors	r5, r5, #31
	ands	r8, r4, r5, ASR #31
	eors	r6, r8, r6, LSL #1
	adc	r7, r7, r7	// RLX
	rors	r5, r5, #31
	ands	r8, r4, r5, ASR #31
	eors	r6, r8, r6, LSL #1
	adc	r7, r7, r7	// RLX
	rors	r5, r5, #31
	ands	r8, r4, r5, ASR #31
	eors	r6, r8, r6, LSL #1
	adc	r7, r7, r7	// RLX
	rors	r5, r5, #31
	ands	r8, r4, r5, ASR #31
	eors	r6, r8, r6, LSL #1
	adc	r7, r7, r7	// RLX
	rors	r5, r5, #31
	ands	r8, r4, r5, ASR #31
	eors	r6, r8, r6, LSL #1
	adc	r7, r7, r7	// RLX
	rors	r5, r5, #31
	ands	r8, r4, r5, ASR #31
	eors	r6, r8, r6, LSL #1
	adc	r7, r7, r7	// RLX
	rors	r5, r5, #31
	ands	r8, r4, r5, ASR #31
	eors	r6, r8, r6, LSL #1
	adc	r7, r7, r7	// RLX
	rors	r5, r5, #31
	ands	r8, r4, r5, ASR #31
	eors	r6, r8, r6, LSL #1
	adc	r7, r7, r7	// RLX
	rors	r5, r5, #31
	ands	r8, r4, r5, ASR #31
	eors	r6, r8, r6, LSL #1
	adc	r7, r7, r7	// RLX
	rors	r5, r5, #31
	ands	r8, r4, r5, ASR #31
	eors	r6, r8, r6, LSL #1
	adc	r7, r7, r7	// RLX
	rors	r5, r5, #31
	ands	r8, r4, r5, ASR #31
	eors	r6, r8, r6, LSL #1
	adc	r7, r7, r7	// RLX
	rors	r5, r5, #31
	ands	r8, r4, r5, ASR #31
	eors	r6, r8, r6, LSL #1
	adc	r7, r7, r7	// RLX
	rors	r5, r5, #31
	ands	r8, r4, r5, ASR #31
	eors	r6, r8, r6, LSL #1
	adc	r7, r7, r7	// RLX
	stm	r0!, {r6-r7}
	pop	{r4-r11,pc}
