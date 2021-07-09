// bitslice functions
.p2align	2,,3
.syntax		unified
.text
.global 	bs2_jump32divsteps
.type		bs2_jump32divsteps, %function
//int bs2_jump32divsteps(int delta, int *f, int *g, int *M);
bs2_jump32divsteps:
	push	{r4-r11,lr}
	vmov	s2, r3		// save result matrix ptr
	vmov	s3, r0		// save delta
	ldr	r4, [r1]
	ldr	r5, [r1, #4]
	ldr	r6, [r1, #8]
	ldr	r7, [r1, #12]
	mov.w r0, #0 // f
	ubfx.w r8, r4, #0, #1
	ubfx.w r9, r4, #4, #1
	ubfx.w r10, r4, #8, #1
	ubfx.w r11, r4, #12, #1
	eor.w r0, r8, r0, LSL #1
	eor.w r0, r9, r0, LSL #1
	eor.w r0, r10, r0, LSL #1
	eor.w r0, r11, r0, LSL #1
	ubfx.w r8, r4, #16, #1
	ubfx.w r9, r4, #20, #1
	ubfx.w r10, r4, #24, #1
	ubfx.w r11, r4, #28, #1
	eor.w r0, r8, r0, LSL #1
	eor.w r0, r9, r0, LSL #1
	eor.w r0, r10, r0, LSL #1
	eor.w r0, r11, r0, LSL #1
	ubfx.w r8, r5, #0, #1
	ubfx.w r9, r5, #4, #1
	ubfx.w r10, r5, #8, #1
	ubfx.w r11, r5, #12, #1
	eor.w r0, r8, r0, LSL #1
	eor.w r0, r9, r0, LSL #1
	eor.w r0, r10, r0, LSL #1
	eor.w r0, r11, r0, LSL #1
	ubfx.w r8, r5, #16, #1
	ubfx.w r9, r5, #20, #1
	ubfx.w r10, r5, #24, #1
	ubfx.w r11, r5, #28, #1
	eor.w r0, r8, r0, LSL #1
	eor.w r0, r9, r0, LSL #1
	eor.w r0, r10, r0, LSL #1
	eor.w r0, r11, r0, LSL #1
	ubfx.w r8, r6, #0, #1
	ubfx.w r9, r6, #4, #1
	ubfx.w r10, r6, #8, #1
	ubfx.w r11, r6, #12, #1
	eor.w r0, r8, r0, LSL #1
	eor.w r0, r9, r0, LSL #1
	eor.w r0, r10, r0, LSL #1
	eor.w r0, r11, r0, LSL #1
	ubfx.w r8, r6, #16, #1
	ubfx.w r9, r6, #20, #1
	ubfx.w r10, r6, #24, #1
	ubfx.w r11, r6, #28, #1
	eor.w r0, r8, r0, LSL #1
	eor.w r0, r9, r0, LSL #1
	eor.w r0, r10, r0, LSL #1
	eor.w r0, r11, r0, LSL #1
	ubfx.w r8, r7, #0, #1
	ubfx.w r9, r7, #4, #1
	ubfx.w r10, r7, #8, #1
	ubfx.w r11, r7, #12, #1
	eor.w r0, r8, r0, LSL #1
	eor.w r0, r9, r0, LSL #1
	eor.w r0, r10, r0, LSL #1
	eor.w r0, r11, r0, LSL #1
	ubfx.w r8, r7, #16, #1
	ubfx.w r9, r7, #20, #1
	ubfx.w r10, r7, #24, #1
	ubfx.w r11, r7, #28, #1
	eor.w r0, r8, r0, LSL #1
	eor.w r0, r9, r0, LSL #1
	eor.w r0, r10, r0, LSL #1
	eor.w r0, r11, r0, LSL #1
	ldr	r4, [r2]
	ldr	r5, [r2, #4]
	ldr	r6, [r2, #8]
	ldr	r7, [r2, #12]
	mov.w r3, #0 // g
	ubfx.w r8, r4, #0, #1
	ubfx.w r9, r4, #4, #1
	ubfx.w r10, r4, #8, #1
	ubfx.w r11, r4, #12, #1
	eor.w r3, r8, r3, LSL #1
	eor.w r3, r9, r3, LSL #1
	eor.w r3, r10, r3, LSL #1
	eor.w r3, r11, r3, LSL #1
	ubfx.w r8, r4, #16, #1
	ubfx.w r9, r4, #20, #1
	ubfx.w r10, r4, #24, #1
	ubfx.w r11, r4, #28, #1
	eor.w r3, r8, r3, LSL #1
	eor.w r3, r9, r3, LSL #1
	eor.w r3, r10, r3, LSL #1
	eor.w r3, r11, r3, LSL #1
	ubfx.w r8, r5, #0, #1
	ubfx.w r9, r5, #4, #1
	ubfx.w r10, r5, #8, #1
	ubfx.w r11, r5, #12, #1
	eor.w r3, r8, r3, LSL #1
	eor.w r3, r9, r3, LSL #1
	eor.w r3, r10, r3, LSL #1
	eor.w r3, r11, r3, LSL #1
	ubfx.w r8, r5, #16, #1
	ubfx.w r9, r5, #20, #1
	ubfx.w r10, r5, #24, #1
	ubfx.w r11, r5, #28, #1
	eor.w r3, r8, r3, LSL #1
	eor.w r3, r9, r3, LSL #1
	eor.w r3, r10, r3, LSL #1
	eor.w r3, r11, r3, LSL #1
	ubfx.w r8, r6, #0, #1
	ubfx.w r9, r6, #4, #1
	ubfx.w r10, r6, #8, #1
	ubfx.w r11, r6, #12, #1
	eor.w r3, r8, r3, LSL #1
	eor.w r3, r9, r3, LSL #1
	eor.w r3, r10, r3, LSL #1
	eor.w r3, r11, r3, LSL #1
	ubfx.w r8, r6, #16, #1
	ubfx.w r9, r6, #20, #1
	ubfx.w r10, r6, #24, #1
	ubfx.w r11, r6, #28, #1
	eor.w r3, r8, r3, LSL #1
	eor.w r3, r9, r3, LSL #1
	eor.w r3, r10, r3, LSL #1
	eor.w r3, r11, r3, LSL #1
	ubfx.w r8, r7, #0, #1
	ubfx.w r9, r7, #4, #1
	ubfx.w r10, r7, #8, #1
	ubfx.w r11, r7, #12, #1
	eor.w r3, r8, r3, LSL #1
	eor.w r3, r9, r3, LSL #1
	eor.w r3, r10, r3, LSL #1
	eor.w r3, r11, r3, LSL #1
	ubfx.w r8, r7, #16, #1
	ubfx.w r9, r7, #20, #1
	ubfx.w r10, r7, #24, #1
	ubfx.w r11, r7, #28, #1
	eor.w r3, r8, r3, LSL #1
	eor.w r3, r9, r3, LSL #1
	eor.w r3, r10, r3, LSL #1
	eor.w r3, r11, r3, LSL #1
	mov	r6, #(1<<31)
	mov	r12, #(1<<31)
	mov	r8, #0
	mov	r10, #0
	vmov.f32 s0, #31.0
	vmov.f32	s1, #1.0	// float 1.0 #112
	vcvt.f32.s32	s3, s3		// convert to float
bs2_jump32divsteps_0:		// first half
	vcmp.f32	s3, s1		// delta > 0?
	vmrs	APSR_nzcv, FPSCR	// move carry
	itttt	cs
	tstcs	r0, r3, LSL #1	// set cs by g0[0], then if cs
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
bs2_jump32divsteps_1:		// second half
	vadd.f32	s3, s3, s1	// delta++
	and	r4, r6, r3, ASR #31	// d0 = a0 & b0
	eors r10, r10, r4	// (a0^b0)
	and	r4, r8, r3, ASR #31	// d0 = a0 & b0
	eors r12, r12, r4	// (a0^b0)
	and	r4, r0, r3, ASR #31	// d0 = a0 & b0
	eors r3, r3, r4	// (a0^b0)
	lsl	r3, r3, #1	// g = g/x
	vsub.f32	s0, s0, s1
	vcmp.f32	s0, #0.0
	vmrs	APSR_nzcv, FPSCR	// move c flag
	ittt	cs	// u = xu, v = xv if ct >= 0
	lsrcs	r6, r6, #1
	lsrcs	r8, r8, #1
	bcs	bs2_jump32divsteps_0
bs2_jump32divsteps_2:	// clean up
	and.w r7, r0, #0x1
	ubfx.w r2, r0, #1, #1
	eor.w r7, r2, r7, LSL #4
	ubfx.w r4, r0, #2, #1
	eor.w r7, r4, r7, LSL #4
	ubfx.w r5, r0, #3, #1
	eor.w r7, r5, r7, LSL #4
	ubfx.w r1, r0, #4, #1
	eor.w r7, r1, r7, LSL #4
	ubfx.w r2, r0, #5, #1
	eor.w r7, r2, r7, LSL #4
	ubfx.w r4, r0, #6, #1
	eor.w r7, r4, r7, LSL #4
	ubfx.w r5, r0, #7, #1
	eor.w r7, r5, r7, LSL #4
	ubfx.w r1, r0, #8, #1
	mov.w r9, r1
	ubfx.w r2, r0, #9, #1
	eor.w r9, r2, r9, LSL #4
	ubfx.w r4, r0, #10, #1
	eor.w r9, r4, r9, LSL #4
	ubfx.w r5, r0, #11, #1
	eor.w r9, r5, r9, LSL #4
	ubfx.w r1, r0, #12, #1
	eor.w r9, r1, r9, LSL #4
	ubfx.w r2, r0, #13, #1
	eor.w r9, r2, r9, LSL #4
	ubfx.w r4, r0, #14, #1
	eor.w r9, r4, r9, LSL #4
	ubfx.w r5, r0, #15, #1
	eor.w r9, r5, r9, LSL #4
	ubfx.w r1, r0, #16, #1
	mov.w r11, r1
	ubfx.w r2, r0, #17, #1
	eor.w r11, r2, r11, LSL #4
	ubfx.w r4, r0, #18, #1
	eor.w r11, r4, r11, LSL #4
	ubfx.w r5, r0, #19, #1
	eor.w r11, r5, r11, LSL #4
	ubfx.w r1, r0, #20, #1
	eor.w r11, r1, r11, LSL #4
	ubfx.w r2, r0, #21, #1
	eor.w r11, r2, r11, LSL #4
	ubfx.w r4, r0, #22, #1
	eor.w r11, r4, r11, LSL #4
	ubfx.w r5, r0, #23, #1
	eor.w r11, r5, r11, LSL #4
	ubfx.w r1, r0, #24, #1
	mov.w lr, r1
	ubfx.w r2, r0, #25, #1
	eor.w lr, r2, lr, LSL #4
	ubfx.w r4, r0, #26, #1
	eor.w lr, r4, lr, LSL #4
	ubfx.w r5, r0, #27, #1
	eor.w lr, r5, lr, LSL #4
	ubfx.w r1, r0, #28, #1
	eor.w lr, r1, lr, LSL #4
	ubfx.w r2, r0, #29, #1
	eor.w lr, r2, lr, LSL #4
	ubfx.w r4, r0, #30, #1
	eor.w lr, r4, lr, LSL #4
	ubfx.w r5, r0, #31, #1
	eor.w lr, r5, lr, LSL #4
	vmov r0, s2	// reload output ptr for results
	str r11, [r0, #4]
	str r9, [r0, #8]
	str r7, [r0, #12]
	str lr, [r0], #16
	and.w r7, r3, #0x1
	ubfx.w r2, r3, #1, #1
	eor.w r7, r2, r7, LSL #4
	ubfx.w r4, r3, #2, #1
	eor.w r7, r4, r7, LSL #4
	ubfx.w r5, r3, #3, #1
	eor.w r7, r5, r7, LSL #4
	ubfx.w r1, r3, #4, #1
	eor.w r7, r1, r7, LSL #4
	ubfx.w r2, r3, #5, #1
	eor.w r7, r2, r7, LSL #4
	ubfx.w r4, r3, #6, #1
	eor.w r7, r4, r7, LSL #4
	ubfx.w r5, r3, #7, #1
	eor.w r7, r5, r7, LSL #4
	ubfx.w r1, r3, #8, #1
	mov.w r9, r1
	ubfx.w r2, r3, #9, #1
	eor.w r9, r2, r9, LSL #4
	ubfx.w r4, r3, #10, #1
	eor.w r9, r4, r9, LSL #4
	ubfx.w r5, r3, #11, #1
	eor.w r9, r5, r9, LSL #4
	ubfx.w r1, r3, #12, #1
	eor.w r9, r1, r9, LSL #4
	ubfx.w r2, r3, #13, #1
	eor.w r9, r2, r9, LSL #4
	ubfx.w r4, r3, #14, #1
	eor.w r9, r4, r9, LSL #4
	ubfx.w r5, r3, #15, #1
	eor.w r9, r5, r9, LSL #4
	ubfx.w r1, r3, #16, #1
	mov.w r11, r1
	ubfx.w r2, r3, #17, #1
	eor.w r11, r2, r11, LSL #4
	ubfx.w r4, r3, #18, #1
	eor.w r11, r4, r11, LSL #4
	ubfx.w r5, r3, #19, #1
	eor.w r11, r5, r11, LSL #4
	ubfx.w r1, r3, #20, #1
	eor.w r11, r1, r11, LSL #4
	ubfx.w r2, r3, #21, #1
	eor.w r11, r2, r11, LSL #4
	ubfx.w r4, r3, #22, #1
	eor.w r11, r4, r11, LSL #4
	ubfx.w r5, r3, #23, #1
	eor.w r11, r5, r11, LSL #4
	ubfx.w r1, r3, #24, #1
	mov.w lr, r1
	ubfx.w r2, r3, #25, #1
	eor.w lr, r2, lr, LSL #4
	ubfx.w r4, r3, #26, #1
	eor.w lr, r4, lr, LSL #4
	ubfx.w r5, r3, #27, #1
	eor.w lr, r5, lr, LSL #4
	ubfx.w r1, r3, #28, #1
	eor.w lr, r1, lr, LSL #4
	ubfx.w r2, r3, #29, #1
	eor.w lr, r2, lr, LSL #4
	ubfx.w r4, r3, #30, #1
	eor.w lr, r4, lr, LSL #4
	ubfx.w r5, r3, #31, #1
	eor.w lr, r5, lr, LSL #4
	str r11, [r0, #4]
	str r9, [r0, #8]
	str r7, [r0, #12]
	str lr, [r0], #16
	and.w r7, r6, #0x1
	ubfx.w r2, r6, #1, #1
	eor.w r7, r2, r7, LSL #4
	ubfx.w r4, r6, #2, #1
	eor.w r7, r4, r7, LSL #4
	ubfx.w r5, r6, #3, #1
	eor.w r7, r5, r7, LSL #4
	ubfx.w r1, r6, #4, #1
	eor.w r7, r1, r7, LSL #4
	ubfx.w r2, r6, #5, #1
	eor.w r7, r2, r7, LSL #4
	ubfx.w r4, r6, #6, #1
	eor.w r7, r4, r7, LSL #4
	ubfx.w r5, r6, #7, #1
	eor.w r7, r5, r7, LSL #4
	ubfx.w r1, r6, #8, #1
	mov.w r9, r1
	ubfx.w r2, r6, #9, #1
	eor.w r9, r2, r9, LSL #4
	ubfx.w r4, r6, #10, #1
	eor.w r9, r4, r9, LSL #4
	ubfx.w r5, r6, #11, #1
	eor.w r9, r5, r9, LSL #4
	ubfx.w r1, r6, #12, #1
	eor.w r9, r1, r9, LSL #4
	ubfx.w r2, r6, #13, #1
	eor.w r9, r2, r9, LSL #4
	ubfx.w r4, r6, #14, #1
	eor.w r9, r4, r9, LSL #4
	ubfx.w r5, r6, #15, #1
	eor.w r9, r5, r9, LSL #4
	ubfx.w r1, r6, #16, #1
	mov.w r11, r1
	ubfx.w r2, r6, #17, #1
	eor.w r11, r2, r11, LSL #4
	ubfx.w r4, r6, #18, #1
	eor.w r11, r4, r11, LSL #4
	ubfx.w r5, r6, #19, #1
	eor.w r11, r5, r11, LSL #4
	ubfx.w r1, r6, #20, #1
	eor.w r11, r1, r11, LSL #4
	ubfx.w r2, r6, #21, #1
	eor.w r11, r2, r11, LSL #4
	ubfx.w r4, r6, #22, #1
	eor.w r11, r4, r11, LSL #4
	ubfx.w r5, r6, #23, #1
	eor.w r11, r5, r11, LSL #4
	ubfx.w r1, r6, #24, #1
	mov.w lr, r1
	ubfx.w r2, r6, #25, #1
	eor.w lr, r2, lr, LSL #4
	ubfx.w r4, r6, #26, #1
	eor.w lr, r4, lr, LSL #4
	ubfx.w r5, r6, #27, #1
	eor.w lr, r5, lr, LSL #4
	ubfx.w r1, r6, #28, #1
	eor.w lr, r1, lr, LSL #4
	ubfx.w r2, r6, #29, #1
	eor.w lr, r2, lr, LSL #4
	ubfx.w r4, r6, #30, #1
	eor.w lr, r4, lr, LSL #4
	ubfx.w r5, r6, #31, #1
	eor.w lr, r5, lr, LSL #4
	str r11, [r0, #4]
	str r9, [r0, #8]
	str r7, [r0, #12]
	str lr, [r0], #16
	and.w r7, r8, #0x1
	ubfx.w r2, r8, #1, #1
	eor.w r7, r2, r7, LSL #4
	ubfx.w r4, r8, #2, #1
	eor.w r7, r4, r7, LSL #4
	ubfx.w r5, r8, #3, #1
	eor.w r7, r5, r7, LSL #4
	ubfx.w r1, r8, #4, #1
	eor.w r7, r1, r7, LSL #4
	ubfx.w r2, r8, #5, #1
	eor.w r7, r2, r7, LSL #4
	ubfx.w r4, r8, #6, #1
	eor.w r7, r4, r7, LSL #4
	ubfx.w r5, r8, #7, #1
	eor.w r7, r5, r7, LSL #4
	ubfx.w r1, r8, #8, #1
	mov.w r9, r1
	ubfx.w r2, r8, #9, #1
	eor.w r9, r2, r9, LSL #4
	ubfx.w r4, r8, #10, #1
	eor.w r9, r4, r9, LSL #4
	ubfx.w r5, r8, #11, #1
	eor.w r9, r5, r9, LSL #4
	ubfx.w r1, r8, #12, #1
	eor.w r9, r1, r9, LSL #4
	ubfx.w r2, r8, #13, #1
	eor.w r9, r2, r9, LSL #4
	ubfx.w r4, r8, #14, #1
	eor.w r9, r4, r9, LSL #4
	ubfx.w r5, r8, #15, #1
	eor.w r9, r5, r9, LSL #4
	ubfx.w r1, r8, #16, #1
	mov.w r11, r1
	ubfx.w r2, r8, #17, #1
	eor.w r11, r2, r11, LSL #4
	ubfx.w r4, r8, #18, #1
	eor.w r11, r4, r11, LSL #4
	ubfx.w r5, r8, #19, #1
	eor.w r11, r5, r11, LSL #4
	ubfx.w r1, r8, #20, #1
	eor.w r11, r1, r11, LSL #4
	ubfx.w r2, r8, #21, #1
	eor.w r11, r2, r11, LSL #4
	ubfx.w r4, r8, #22, #1
	eor.w r11, r4, r11, LSL #4
	ubfx.w r5, r8, #23, #1
	eor.w r11, r5, r11, LSL #4
	ubfx.w r1, r8, #24, #1
	mov.w lr, r1
	ubfx.w r2, r8, #25, #1
	eor.w lr, r2, lr, LSL #4
	ubfx.w r4, r8, #26, #1
	eor.w lr, r4, lr, LSL #4
	ubfx.w r5, r8, #27, #1
	eor.w lr, r5, lr, LSL #4
	ubfx.w r1, r8, #28, #1
	eor.w lr, r1, lr, LSL #4
	ubfx.w r2, r8, #29, #1
	eor.w lr, r2, lr, LSL #4
	ubfx.w r4, r8, #30, #1
	eor.w lr, r4, lr, LSL #4
	ubfx.w r5, r8, #31, #1
	eor.w lr, r5, lr, LSL #4
	str r11, [r0, #4]
	str r9, [r0, #8]
	str r7, [r0, #12]
	str lr, [r0], #16
	and.w r7, r10, #0x1
	ubfx.w r2, r10, #1, #1
	eor.w r7, r2, r7, LSL #4
	ubfx.w r4, r10, #2, #1
	eor.w r7, r4, r7, LSL #4
	ubfx.w r5, r10, #3, #1
	eor.w r7, r5, r7, LSL #4
	ubfx.w r1, r10, #4, #1
	eor.w r7, r1, r7, LSL #4
	ubfx.w r2, r10, #5, #1
	eor.w r7, r2, r7, LSL #4
	ubfx.w r4, r10, #6, #1
	eor.w r7, r4, r7, LSL #4
	ubfx.w r5, r10, #7, #1
	eor.w r7, r5, r7, LSL #4
	ubfx.w r1, r10, #8, #1
	mov.w r9, r1
	ubfx.w r2, r10, #9, #1
	eor.w r9, r2, r9, LSL #4
	ubfx.w r4, r10, #10, #1
	eor.w r9, r4, r9, LSL #4
	ubfx.w r5, r10, #11, #1
	eor.w r9, r5, r9, LSL #4
	ubfx.w r1, r10, #12, #1
	eor.w r9, r1, r9, LSL #4
	ubfx.w r2, r10, #13, #1
	eor.w r9, r2, r9, LSL #4
	ubfx.w r4, r10, #14, #1
	eor.w r9, r4, r9, LSL #4
	ubfx.w r5, r10, #15, #1
	eor.w r9, r5, r9, LSL #4
	ubfx.w r1, r10, #16, #1
	mov.w r11, r1
	ubfx.w r2, r10, #17, #1
	eor.w r11, r2, r11, LSL #4
	ubfx.w r4, r10, #18, #1
	eor.w r11, r4, r11, LSL #4
	ubfx.w r5, r10, #19, #1
	eor.w r11, r5, r11, LSL #4
	ubfx.w r1, r10, #20, #1
	eor.w r11, r1, r11, LSL #4
	ubfx.w r2, r10, #21, #1
	eor.w r11, r2, r11, LSL #4
	ubfx.w r4, r10, #22, #1
	eor.w r11, r4, r11, LSL #4
	ubfx.w r5, r10, #23, #1
	eor.w r11, r5, r11, LSL #4
	ubfx.w r1, r10, #24, #1
	mov.w lr, r1
	ubfx.w r2, r10, #25, #1
	eor.w lr, r2, lr, LSL #4
	ubfx.w r4, r10, #26, #1
	eor.w lr, r4, lr, LSL #4
	ubfx.w r5, r10, #27, #1
	eor.w lr, r5, lr, LSL #4
	ubfx.w r1, r10, #28, #1
	eor.w lr, r1, lr, LSL #4
	ubfx.w r2, r10, #29, #1
	eor.w lr, r2, lr, LSL #4
	ubfx.w r4, r10, #30, #1
	eor.w lr, r4, lr, LSL #4
	ubfx.w r5, r10, #31, #1
	eor.w lr, r5, lr, LSL #4
	str r11, [r0, #4]
	str r9, [r0, #8]
	str r7, [r0, #12]
	str lr, [r0], #16
	and.w r7, r12, #0x1
	ubfx.w r2, r12, #1, #1
	eor.w r7, r2, r7, LSL #4
	ubfx.w r4, r12, #2, #1
	eor.w r7, r4, r7, LSL #4
	ubfx.w r5, r12, #3, #1
	eor.w r7, r5, r7, LSL #4
	ubfx.w r1, r12, #4, #1
	eor.w r7, r1, r7, LSL #4
	ubfx.w r2, r12, #5, #1
	eor.w r7, r2, r7, LSL #4
	ubfx.w r4, r12, #6, #1
	eor.w r7, r4, r7, LSL #4
	ubfx.w r5, r12, #7, #1
	eor.w r7, r5, r7, LSL #4
	ubfx.w r1, r12, #8, #1
	mov.w r9, r1
	ubfx.w r2, r12, #9, #1
	eor.w r9, r2, r9, LSL #4
	ubfx.w r4, r12, #10, #1
	eor.w r9, r4, r9, LSL #4
	ubfx.w r5, r12, #11, #1
	eor.w r9, r5, r9, LSL #4
	ubfx.w r1, r12, #12, #1
	eor.w r9, r1, r9, LSL #4
	ubfx.w r2, r12, #13, #1
	eor.w r9, r2, r9, LSL #4
	ubfx.w r4, r12, #14, #1
	eor.w r9, r4, r9, LSL #4
	ubfx.w r5, r12, #15, #1
	eor.w r9, r5, r9, LSL #4
	ubfx.w r1, r12, #16, #1
	mov.w r11, r1
	ubfx.w r2, r12, #17, #1
	eor.w r11, r2, r11, LSL #4
	ubfx.w r4, r12, #18, #1
	eor.w r11, r4, r11, LSL #4
	ubfx.w r5, r12, #19, #1
	eor.w r11, r5, r11, LSL #4
	ubfx.w r1, r12, #20, #1
	eor.w r11, r1, r11, LSL #4
	ubfx.w r2, r12, #21, #1
	eor.w r11, r2, r11, LSL #4
	ubfx.w r4, r12, #22, #1
	eor.w r11, r4, r11, LSL #4
	ubfx.w r5, r12, #23, #1
	eor.w r11, r5, r11, LSL #4
	ubfx.w r1, r12, #24, #1
	mov.w lr, r1
	ubfx.w r2, r12, #25, #1
	eor.w lr, r2, lr, LSL #4
	ubfx.w r4, r12, #26, #1
	eor.w lr, r4, lr, LSL #4
	ubfx.w r5, r12, #27, #1
	eor.w lr, r5, lr, LSL #4
	ubfx.w r1, r12, #28, #1
	eor.w lr, r1, lr, LSL #4
	ubfx.w r2, r12, #29, #1
	eor.w lr, r2, lr, LSL #4
	ubfx.w r4, r12, #30, #1
	eor.w lr, r4, lr, LSL #4
	ubfx.w r5, r12, #31, #1
	eor.w lr, r5, lr, LSL #4
	str r11, [r0, #4]
	str r9, [r0, #8]
	str r7, [r0, #12]
	str lr, [r0], #16
	vcvt.s32.f32	s3, s3	// back to int
	vmov	r0, s3		// restore delta
	pop	{r4-r11,pc}
