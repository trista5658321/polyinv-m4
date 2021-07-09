.p2align 2,,3
.syntax unified
.text
polymul_32x32_mod2:
	push.w {lr}
sch3_0:			// increasing thread length
	mov	r6, #0
	mov	r12, r1
	mov	r14, r2
sch3_1:			// later blocks
	// ([0-3], 0) blocks
	ldr	r5, [r12]
	ldr	r4, [r14, #12]
	ldr	r3, [r14, #8]
	ldr	r2, [r14, #4]
	ldr	r1, [r14, #0]
	umull	r7, r8, r2, r5
	umull	r9, r10, r4, r5
	umlal	r6, r7, r1, r5
	umlal	r8, r9, r3, r5
    and.w r6, r6, #0x11111111
    and.w r7, r7, #0x11111111
    and.w r8, r8, #0x11111111
    and.w r9, r9, #0x11111111
    and.w r10, r10, #0x11111111

	// ([0-2],1), ([0-1],2), (0,3) blocks
	ldr	r5, [r12, #4]
	umlal	r9, r10, r3, r5
	umlal	r8, r9, r2, r5
	umlal	r7, r8, r1, r5
    and.w r7, r7, #0x11111111
    and.w r8, r8, #0x11111111
    and.w r9, r9, #0x11111111
    and.w r10, r10, #0x11111111

	ldr	r5, [r12, #8]
	umlal	r9, r10, r2, r5
	umlal	r8, r9, r1, r5
    and.w r8, r8, #0x11111111
    and.w r9, r9, #0x11111111
    and.w r10, r10, #0x11111111

	ldr	r5, [r12, #12]
	umlal	r9, r10, r1, r5
    and.w r9, r9, #0x11111111
    and.w r10, r10, #0x11111111

	str.w r7, [r0, #4]
	str.w r8, [r0, #8]
	str.w r9, [r0, #12]
	str.w r6, [r0], #16

sch3_20:			// mv hh back to h
	ldr	r1, [r14, #4]
	ldr	r2, [r14, #8]
	ldr	r3, [r14, #12]
	// ([1-3],3),([2-3],2),(3,1) blocks
	ldr	r4, [r12, #12]
    mov	r6, #0
    umull r7, r8, r3, r4
    umlal	r6, r7, r2, r4
    umlal	r10, r6, r1, r4
    and.w r10, r10, #0x11111111
    and.w r6, r6, #0x11111111
    and.w r7, r7, #0x11111111
    and.w r8, r8, #0x11111111

	ldr	r4, [r12, #8]
	umlal	r6, r7, r3, r4
	umlal	r10, r6, r2, r4
    and.w r10, r10, #0x11111111
    and.w r6, r6, #0x11111111
    and.w r7, r7, #0x11111111

	ldr	r4, [r12, #4]
	umlal	r10, r6, r3, r4
    and.w r10, r10, #0x11111111
    and.w r6, r6, #0x11111111

	str.w r6, [r0, #4]
	str.w r7, [r0, #8]
	str.w r8, [r0, #12]
	str.w r10, [r0], #16
	pop.w {pc}