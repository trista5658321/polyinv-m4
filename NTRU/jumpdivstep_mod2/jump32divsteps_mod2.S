// void __gf_polymul_16x16_2x2_x2p2_mod2 (int *V, int *M, int *fh, int *gh);
.p2align 2,,3
.syntax unified
.text
.global __gf_polymul_16x16_2x2_x2p2_mod2
.type __gf_polymul_16x16_2x2_x2p2_mod2, %function
__gf_polymul_16x16_2x2_x2p2_mod2:
	push.w {r4-r11,lr}
	add.w r1, #16
	ldr.w r8, [r2]
	ldr.w r9, [r2, #4]
	ldr.w r6, [r1], #4
	ldr.w r7, [r1], #4
	umull.w r2, r3, r6, r8
	umull.w r4, r5, r7, r9
	umlal.w r3, r4, r7, r8
	and.w r3, r3, #0x11111111
	and.w r4, r4, #0x11111111
	umlal.w r3, r4, r6, r9
	and.w r2, r2, #0x11111111
	and.w r3, r3, #0x11111111
	and.w r4, r4, #0x11111111
	and.w r5, r5, #0x11111111
	ldr.w r12, [r3]
	ldr.w lr, [r3, #4]
	ldr.w r10, [r1], #4
	ldr.w r11, [r1], #4
	umull.w r6, r7, r10, r12
	umull.w r8, r9, r11, lr
	umlal.w r7, r8, r11, r12
	and.w r7, r7, #0x11111111
	and.w r8, r8, #0x11111111
	umlal.w r7, r8, r10, lr
	and.w r6, r6, #0x11111111
	and.w r7, r7, #0x11111111
	and.w r8, r8, #0x11111111
	and.w r9, r9, #0x11111111
	eor.w r2, r6
	eor.w r3, r7
	eor.w r4, r8
	eor.w r5, r9
	ldr.w r6, [r1, #-32]
	ldr.w r7, [r1, #-28]
	eor.w r6, r6, r2, LSL #4
	eor.w r7, r7, r3, LSL #4
	eor.w r7, r7, r2, LSR #28
	ubfx.w r10, r3, #28, #4
	eor.w r8, r10, r4, LSL #4
	ubfx.w r10, r4, #28, #4
	eor.w r9, r10, r5, LSL #4
	str r7, [r0, #4]
	str r8, [r0, #8]
	str r9, [r0, #12]
	str r6, [r0], #16
	ldr.w r8, [r2]
	ldr.w r9, [r2, #4]
	ldr.w r6, [r1], #4
	ldr.w r7, [r1], #4
	umull.w r2, r3, r6, r8
	umull.w r4, r5, r7, r9
	umlal.w r3, r4, r7, r8
	and.w r3, r3, #0x11111111
	and.w r4, r4, #0x11111111
	umlal.w r3, r4, r6, r9
	and.w r2, r2, #0x11111111
	and.w r3, r3, #0x11111111
	and.w r4, r4, #0x11111111
	and.w r5, r5, #0x11111111
	ldr.w r12, [r3]
	ldr.w lr, [r3, #4]
	ldr.w r10, [r1], #4
	ldr.w r11, [r1], #4
	umull.w r6, r7, r10, r12
	umull.w r8, r9, r11, lr
	umlal.w r7, r8, r11, r12
	and.w r7, r7, #0x11111111
	and.w r8, r8, #0x11111111
	umlal.w r7, r8, r10, lr
	and.w r6, r6, #0x11111111
	and.w r7, r7, #0x11111111
	and.w r8, r8, #0x11111111
	and.w r9, r9, #0x11111111
	eor.w r2, r6
	eor.w r3, r7
	eor.w r4, r8
	eor.w r5, r9
	ldr.w r6, [r1, #-40]
	eor.w r2, r6
	eor.w r3, r7
	str r3, [r0, #4]
	str r4, [r0, #8]
	str r5, [r0, #12]
	str r2, [r0], #16
	pop.w {r4-r11,pc}

// void __gf_polymul_16x16_2x2_x_2x2_mod2 (int *M,int *M1,int *M2);
.p2align 2,,3
.syntax unified
.text
.global __gf_polymul_16x16_2x2_x_2x2_mod2
.type __gf_polymul_16x16_2x2_x_2x2_mod2, %function
__gf_polymul_16x16_2x2_x_2x2_mod2:
	push.w {r4-r11,lr}
	vmov.w s0, r0
	ldr.w r7, [r2]
	ldr.w r8, [r2, #4]
	ldr.w r9, [r1]
	ldr.w r10, [r1, #4]
	umull.w r3, r4, r7, r9
	umull.w r5, r6, r8, r10
	umlal.w r4, r5, r8, r9
	and.w r4, r4, #0x11111111
	and.w r5, r5, #0x11111111
	umlal.w r4, r5, r7, r10
	and.w r3, r3, #0x11111111
	and.w r4, r4, #0x11111111
	and.w r5, r5, #0x11111111
	and.w r6, r6, #0x11111111
	ldr.w r11, [r2, #8]
	ldr.w r12, [r2, #12]
	ldr.w lr, [r1, #16]
	ldr.w r0, [r1, #20]
	umull.w r7, r8, r11, lr
	umull.w r9, r10, r12, r0
	umlal.w r8, r9, r12, lr
	and.w r8, r8, #0x11111111
	and.w r9, r9, #0x11111111
	umlal.w r8, r9, r11, r0
	and.w r7, r7, #0x11111111
	and.w r8, r8, #0x11111111
	and.w r9, r9, #0x11111111
	and.w r10, r10, #0x11111111
	eor.w r7, r7, r3, LSL #4
	eor.w r8, r8, r4, LSL #4
	eor.w r9, r9, r5, LSL #4
	eor.w r10, r10, r6, LSL #4
	eor.w r8, r8, r3, LSR #28
	eor.w r9, r9, r4, LSR #28
	eor.w r10, r10, r5, LSR #28
	vmov.w r0, s0
	str r8, [r0, #4]
	str r9, [r0, #8]
	str r10, [r0, #12]
	str r7, [r0], #16
	ldr.w r7, [r2]
	ldr.w r8, [r2, #4]
	ldr.w r9, [r1, #8]
	ldr.w r10, [r1, #12]
	umull.w r3, r4, r7, r9
	umull.w r5, r6, r8, r10
	umlal.w r4, r5, r8, r9
	and.w r4, r4, #0x11111111
	and.w r5, r5, #0x11111111
	umlal.w r4, r5, r7, r10
	and.w r3, r3, #0x11111111
	and.w r4, r4, #0x11111111
	and.w r5, r5, #0x11111111
	and.w r6, r6, #0x11111111
	ldr.w r11, [r2, #8]
	ldr.w r12, [r2, #12]
	ldr.w lr, [r1, #24]
	ldr.w r0, [r1, #28]
	umull.w r7, r8, r11, lr
	umull.w r9, r10, r12, r0
	umlal.w r8, r9, r12, lr
	and.w r8, r8, #0x11111111
	and.w r9, r9, #0x11111111
	umlal.w r8, r9, r11, r0
	and.w r7, r7, #0x11111111
	and.w r8, r8, #0x11111111
	and.w r9, r9, #0x11111111
	and.w r10, r10, #0x11111111
	eor.w r7, r7, r3, LSL #4
	eor.w r8, r8, r4, LSL #4
	eor.w r9, r9, r5, LSL #4
	eor.w r10, r10, r6, LSL #4
	eor.w r8, r8, r3, LSR #28
	eor.w r9, r9, r4, LSR #28
	eor.w r10, r10, r5, LSR #28
	vmov.w r0, s0
	str r8, [r0, #4]
	str r9, [r0, #8]
	str r10, [r0, #12]
	str r7, [r0], #16
	ldr.w r7, [r2, #16]
	ldr.w r8, [r2, #20]
	ldr.w r9, [r1]
	ldr.w r10, [r1, #4]
	umull.w r3, r4, r7, r9
	umull.w r5, r6, r8, r10
	umlal.w r4, r5, r8, r9
	and.w r4, r4, #0x11111111
	and.w r5, r5, #0x11111111
	umlal.w r4, r5, r7, r10
	and.w r3, r3, #0x11111111
	and.w r4, r4, #0x11111111
	and.w r5, r5, #0x11111111
	and.w r6, r6, #0x11111111
	ldr.w r11, [r2, #24]
	ldr.w r12, [r2, #28]
	ldr.w lr, [r1, #16]
	ldr.w r0, [r1, #20]
	umull.w r7, r8, r11, lr
	umull.w r9, r10, r12, r0
	umlal.w r8, r9, r12, lr
	and.w r8, r8, #0x11111111
	and.w r9, r9, #0x11111111
	umlal.w r8, r9, r11, r0
	and.w r7, r7, #0x11111111
	and.w r8, r8, #0x11111111
	and.w r9, r9, #0x11111111
	and.w r10, r10, #0x11111111
	eor.w r7, r7, r3, LSL #4
	eor.w r8, r8, r4, LSL #4
	eor.w r9, r9, r5, LSL #4
	eor.w r10, r10, r6, LSL #4
	eor.w r8, r8, r3, LSR #28
	eor.w r9, r9, r4, LSR #28
	eor.w r10, r10, r5, LSR #28
	vmov.w r0, s0
	str r8, [r0, #4]
	str r9, [r0, #8]
	str r10, [r0, #12]
	str r7, [r0], #16
	ldr.w r7, [r2, #16]
	ldr.w r8, [r2, #20]
	ldr.w r9, [r1, #8]
	ldr.w r10, [r1, #12]
	umull.w r3, r4, r7, r9
	umull.w r5, r6, r8, r10
	umlal.w r4, r5, r8, r9
	and.w r4, r4, #0x11111111
	and.w r5, r5, #0x11111111
	umlal.w r4, r5, r7, r10
	and.w r3, r3, #0x11111111
	and.w r4, r4, #0x11111111
	and.w r5, r5, #0x11111111
	and.w r6, r6, #0x11111111
	ldr.w r11, [r2, #24]
	ldr.w r12, [r2, #28]
	ldr.w lr, [r1, #24]
	ldr.w r0, [r1, #28]
	umull.w r7, r8, r11, lr
	umull.w r9, r10, r12, r0
	umlal.w r8, r9, r12, lr
	and.w r8, r8, #0x11111111
	and.w r9, r9, #0x11111111
	umlal.w r8, r9, r11, r0
	and.w r7, r7, #0x11111111
	and.w r8, r8, #0x11111111
	and.w r9, r9, #0x11111111
	and.w r10, r10, #0x11111111
	eor.w r7, r7, r3, LSL #4
	eor.w r8, r8, r4, LSL #4
	eor.w r9, r9, r5, LSL #4
	eor.w r10, r10, r6, LSL #4
	eor.w r8, r8, r3, LSR #28
	eor.w r9, r9, r4, LSR #28
	eor.w r10, r10, r5, LSR #28
	vmov.w r0, s0
	str r8, [r0, #4]
	str r9, [r0, #8]
	str r10, [r0, #12]
	str r7, [r0], #16
	pop.w {r4-r11,pc}
