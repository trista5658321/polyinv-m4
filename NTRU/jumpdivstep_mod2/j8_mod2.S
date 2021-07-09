// bitslice functions
.p2align	2,,3
.syntax		unified
.text
.global 	jump8divsteps
.type		jump8divsteps, %function
//int jump8divsteps(int delta, int *f, int *g, int *M);
jump8divsteps_mod2:
	push	{r4-r11,lr}
	vmov	s2, r3		// save result matrix ptr
	vmov	s3, r0		// save delta
	ldr	r0, [r1]
	ldr	r3, [r2]
	mov	r6, #1
	mov	r12, #1
	mov	r8, #0
	mov	r10, #0
	vmov.f32 s0, #7.0
	vmov.f32	s1, #1.0	// float 1.0 #112
	vcvt.f32.s32	s3, s3		// convert to float
jump8divsteps_0:		// first half
	vcmp.f32	s3, s1		// delta > 0?
	vmrs	APSR_nzcv, FPSCR	// move carry
	itttt	cs
	tstcs	r0, r3, LSR #1	// set cs by g0[0], then if cs
	movcs	r5, r0	// f0<->g0
	movcs	r0, r3
	movcs	r3, r5
	ittt	cs
	movcs	r5, r6	// u0<->r0
	movcs	r6, r10
	movcs	r10, r5
	itttt	cs
	movcs	r5, r8	// v0<->s0
	movcs	r8, r12
	movcs	r12, r5
	vnegcs.f32	s3, s3
jump8divsteps_1:		// second half
	vadd.f32	s3, s3, s1	// delta++
	and	r7, r3, #0x1	// g[0]
	mul	r4, r6, r7	// d0 = a * g[0]
	eors r10, r10, r4	// (a0^b0)
	mul	r4, r8, r7	// d0 = a * g[0]
	eors r12, r12, r4	// (a0^b0)
	mul	r4, r0, r7	// d0 = a * g[0]
	eors r3, r3, r4	// (a0^b0)
	lsr	r3, r3, #4	// g = g/x
	vsub.f32	s0, s0, s1
	vcmp.f32	s0, #0.0
	vmrs	APSR_nzcv, FPSCR	// move c flag
	ittt	cs	// u = xu, v = xv if ct >= 0
	lslcs	r6, r6, #4
	lslcs	r8, r8, #4
	bcs	jump8divsteps_0
jump8divsteps_2:	// clean up
	vmov	r4, s2		// reload output ptr for results
	stm	r4,{r0,r3,r6,r8,r10,r12}
	vcvt.s32.f32	s3, s3	// back to int
	vmov	r0, s3		// restore delta
	pop	{r4-r11,pc}
