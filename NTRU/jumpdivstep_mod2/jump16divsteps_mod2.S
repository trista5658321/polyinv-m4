// void __gf_polymul_8x8_2x2_x2p2_mod2 (int *V, int *M, int *fh, int *gh);
.p2align 2,,3
.syntax unified
.text
.global __gf_polymul_8x8_2x2_x2p2_mod2
.type __gf_polymul_8x8_2x2_x2p2_mod2, %function
__gf_polymul_8x8_2x2_x2p2_mod2:
	push.w {r4-r11,lr}
	add.w r1, #8
	ldr.w r6, [r2]
	ldr.w r7, [r1], #4
	umull.w r4, r5, r6, r7
	and.w r4, r4, #0x11111111
	and.w r5, r5, #0x11111111
	ldr.w r12, [r3]
	ldr.w lr, [r1], #4
	umull.w r6, r7, r12, lr
	and.w r6, r6, #0x11111111
	and.w r7, r7, #0x11111111
	eor.w r4, r6
	eor.w r5, r7
	ldr.w r6, [r1, #-16]
	eor.w r6, r6, r4, LSL #4
	ubfx.w r12, r4, #28, #4
	eor.w r7, r12, r5, LSL #4
	str r7, [r0, #4]
	str r6, [r0], #8
	ldr.w r6, [r2]
	ldr.w r7, [r1], #4
	umull.w r4, r5, r6, r7
	and.w r4, r4, #0x11111111
	and.w r5, r5, #0x11111111
	ldr.w r12, [r3]
	ldr.w lr, [r1], #4
	umull.w r6, r7, r12, lr
	and.w r6, r6, #0x11111111
	and.w r7, r7, #0x11111111
	eor.w r4, r6
	eor.w r5, r7
	ldr.w r6, [r1, #-20]
	eor.w r4, r6
	str r5, [r0, #4]
	str r4, [r0], #8
	pop.w {r4-r11,pc}

// void __gf_polymul_8x8_2x2_x_2x2_mod2 (int *M,int *M1,int *M2);
.p2align 2,,3
.syntax unified
.text
.global __gf_polymul_8x8_2x2_x_2x2_mod2
.type __gf_polymul_8x8_2x2_x_2x2_mod2, %function
__gf_polymul_8x8_2x2_x_2x2_mod2:
	push.w {r4-r11,lr}
	ldr.w r6, [r2]
	ldr.w r7, [r1]
	umull.w r4, r5, r6, r7
	and.w r4, r4, #0x11111111
	and.w r5, r5, #0x11111111
	ldr.w r12, [r2, #4]
	ldr.w lr, [r1, #8]
	umull.w r6, r7, r12, lr
	and.w r6, r6, #0x11111111
	and.w r7, r7, #0x11111111
	eor.w r6, r6, r4, LSL #4
	eor.w r7, r7, r5, LSL #4
	eor.w r7, r7, r4, LSR #28
	str r7, [r0, #4]
	str r6, [r0], #8
	ldr.w r6, [r2]
	ldr.w r7, [r1, #4]
	umull.w r4, r5, r6, r7
	and.w r4, r4, #0x11111111
	and.w r5, r5, #0x11111111
	ldr.w r12, [r2, #4]
	ldr.w lr, [r1, #12]
	umull.w r6, r7, r12, lr
	and.w r6, r6, #0x11111111
	and.w r7, r7, #0x11111111
	eor.w r6, r6, r4, LSL #4
	eor.w r7, r7, r5, LSL #4
	eor.w r7, r7, r4, LSR #28
	str r7, [r0, #4]
	str r6, [r0], #8
	ldr.w r6, [r2, #8]
	ldr.w r7, [r1]
	umull.w r4, r5, r6, r7
	and.w r4, r4, #0x11111111
	and.w r5, r5, #0x11111111
	ldr.w r12, [r2, #12]
	ldr.w lr, [r1, #8]
	umull.w r6, r7, r12, lr
	and.w r6, r6, #0x11111111
	and.w r7, r7, #0x11111111
	eor.w r6, r6, r4, LSL #4
	eor.w r7, r7, r5, LSL #4
	eor.w r7, r7, r4, LSR #28
	str r7, [r0, #4]
	str r6, [r0], #8
	ldr.w r6, [r2, #8]
	ldr.w r7, [r1, #4]
	umull.w r4, r5, r6, r7
	and.w r4, r4, #0x11111111
	and.w r5, r5, #0x11111111
	ldr.w r12, [r2, #12]
	ldr.w lr, [r1, #12]
	umull.w r6, r7, r12, lr
	and.w r6, r6, #0x11111111
	and.w r7, r7, #0x11111111
	eor.w r6, r6, r4, LSL #4
	eor.w r7, r7, r5, LSL #4
	eor.w r7, r7, r4, LSR #28
	str r7, [r0, #4]
	str r6, [r0], #8
	pop.w {r4-r11,pc}
