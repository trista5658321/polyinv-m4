.p2align 2,,3
.syntax unified
.text
mul_head:
 // increasing thread length
	push.w {lr}
	mov	r6, #0
	mov	r12, r1
	mov	r14, r2
	ldr	r11, =0x03030303
 // later blocks
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
	// ([0-2],1), ([0-1],2), (0,3) blocks
	ldr	r5, [r12, #4]
	umlal	r9, r10, r3, r5
	umlal	r8, r9, r2, r5
	umlal	r7, r8, r1, r5
	ldr	r5, [r12, #8]
	umlal	r9, r10, r2, r5
	umlal	r8, r9, r1, r5
	ldr	r5, [r12, #12]
	umlal	r9, r10, r1, r5
	str.w r7, [r0, #4]
	str.w r8, [r0, #8]
	str.w r9, [r0, #12]
	str.w r6, [r0], #16
	// ([4-7], 0) blocks
	ldr	r4, [r12]
	ldr	r3, [r14, #28]
	ldr	r2, [r14, #24]
	ldr	r1, [r14, #20]
	ldr	r5, [r14, #16]
	umull	r6, r7, r1, r4
	umull	r8, r9, r3, r4
	umlal	r10, r6, r5, r4
	umlal	r7, r8, r2, r4
	// ([3-6], 1) blocks
	ldr	r3, [r12, #4]
	ldr	r4, [r14, #12]
	umlal	r10, r6, r4, r3
	umlal	r6, r7, r5, r3
	umlal	r7, r8, r1, r3
	umlal	r8, r9, r2, r3
	// ([2-5], 2) blocks
	ldr	r2, [r12, #8]
	ldr	r3, [r14, #8]
	umlal	r10, r6, r3, r2
	umlal	r6, r7, r4, r2
	umlal	r7, r8, r5, r2
	umlal	r8, r9, r1, r2
	// ([1-4], 3) blocks
	ldr	r1, [r12, #12]
	ldr	r2, [r14, #4]
	umlal	r10, r6, r2, r1
	umlal	r6, r7, r3, r1
	umlal	r7, r8, r4, r1
	umlal	r8, r9, r5, r1
	// ([0-3], 4) blocks
	ldr	r5, [r12, #16]
	ldr	r1, [r14, #0]
	umlal	r10, r6, r1, r5
	umlal	r6, r7, r2, r5
	umlal	r7, r8, r3, r5
	umlal	r8, r9, r4, r5
	// ([0-2],5), ([0-1],6), (0,7) blocks
	ldr	r5, [r12, #20]
	umlal	r8, r9, r3, r5
	umlal	r7, r8, r2, r5
	umlal	r6, r7, r1, r5
	ldr	r5, [r12, #24]
	umlal	r8, r9, r2, r5
	umlal	r7, r8, r1, r5
	ldr	r5, [r12, #28]
	umlal	r8, r9, r1, r5
	and	r5, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r5, LSR #4	// range < 31
	str.w r6, [r0, #4]
	str.w r7, [r0, #8]
	str.w r8, [r0, #12]
	str.w r10, [r0], #16
	// ([8-11], 0) blocks
	ldr	r3, [r12]
	ldr	r2, [r14, #44]
	ldr	r1, [r14, #40]
	ldr	r5, [r14, #36]
	ldr	r4, [r14, #32]
	umull	r10, r6, r5, r3
	umull	r7, r8, r2, r3
	umlal	r9, r10, r4, r3
	umlal	r6, r7, r1, r3
	// ([7-10], 1) blocks
	ldr	r2, [r12, #4]
	ldr	r3, [r14, #28]
	umlal	r9, r10, r3, r2
	umlal	r10, r6, r4, r2
	umlal	r6, r7, r5, r2
	umlal	r7, r8, r1, r2
	// ([6-9], 2) blocks
	ldr	r1, [r12, #8]
	ldr	r2, [r14, #24]
	umlal	r9, r10, r2, r1
	umlal	r10, r6, r3, r1
	umlal	r6, r7, r4, r1
	umlal	r7, r8, r5, r1
	// ([5-8], 3) blocks
	ldr	r5, [r12, #12]
	ldr	r1, [r14, #20]
	umlal	r9, r10, r1, r5
	umlal	r10, r6, r2, r5
	umlal	r6, r7, r3, r5
	umlal	r7, r8, r4, r5
	// ([4-7], 4) blocks
	ldr	r4, [r12, #16]
	ldr	r5, [r14, #16]
	umlal	r9, r10, r5, r4
	umlal	r10, r6, r1, r4
	umlal	r6, r7, r2, r4
	umlal	r7, r8, r3, r4
	// ([3-6], 5) blocks
	ldr	r3, [r12, #20]
	ldr	r4, [r14, #12]
	umlal	r9, r10, r4, r3
	umlal	r10, r6, r5, r3
	umlal	r6, r7, r1, r3
	umlal	r7, r8, r2, r3
	// ([2-5], 6) blocks
	ldr	r2, [r12, #24]
	ldr	r3, [r14, #8]
	umlal	r9, r10, r3, r2
	umlal	r10, r6, r4, r2
	umlal	r6, r7, r5, r2
	umlal	r7, r8, r1, r2
	// ([1-4], 7) blocks
	ldr	r1, [r12, #28]
	ldr	r2, [r14, #4]
	umlal	r9, r10, r2, r1
	umlal	r10, r6, r3, r1
	umlal	r6, r7, r4, r1
	umlal	r7, r8, r5, r1
	// ([0-3], 8) blocks
	ldr	r5, [r12, #32]
	ldr	r1, [r14, #0]
	umlal	r9, r10, r1, r5
	umlal	r10, r6, r2, r5
	umlal	r6, r7, r3, r5
	umlal	r7, r8, r4, r5
	// ([0-2],9), ([0-1],10), (0,11) blocks
	and	r5, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r5, LSR #4	// range < 31
	ldr	r5, [r12, #36]
	umlal	r7, r8, r3, r5
	umlal	r6, r7, r2, r5
	umlal	r10, r6, r1, r5
	and	r5, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r5, LSR #4	// range < 31
	ldr	r5, [r12, #40]
	umlal	r7, r8, r2, r5
	umlal	r6, r7, r1, r5
	and	r5, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r5, LSR #4	// range < 31
	ldr	r5, [r12, #44]
	umlal	r7, r8, r1, r5
	and	r5, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r5, LSR #4	// range < 31
	str.w r10, [r0, #4]
	str.w r6, [r0, #8]
	str.w r7, [r0, #12]
	str.w r9, [r0], #16
	// ([12-15], 0) blocks
	ldr	r2, [r12]
	ldr	r1, [r14, #60]
	ldr	r5, [r14, #56]
	ldr	r4, [r14, #52]
	ldr	r3, [r14, #48]
	umull	r9, r10, r4, r2
	umull	r6, r7, r1, r2
	umlal	r8, r9, r3, r2
	umlal	r10, r6, r5, r2
	// ([11-14], 1) blocks
	ldr	r1, [r12, #4]
	ldr	r2, [r14, #44]
	umlal	r8, r9, r2, r1
	umlal	r9, r10, r3, r1
	umlal	r10, r6, r4, r1
	umlal	r6, r7, r5, r1
	// ([10-13], 2) blocks
	ldr	r5, [r12, #8]
	ldr	r1, [r14, #40]
	umlal	r8, r9, r1, r5
	umlal	r9, r10, r2, r5
	umlal	r10, r6, r3, r5
	umlal	r6, r7, r4, r5
	// ([9-12], 3) blocks
	ldr	r4, [r12, #12]
	ldr	r5, [r14, #36]
	umlal	r8, r9, r5, r4
	umlal	r9, r10, r1, r4
	umlal	r10, r6, r2, r4
	umlal	r6, r7, r3, r4
	// ([8-11], 4) blocks
	ldr	r3, [r12, #16]
	ldr	r4, [r14, #32]
	umlal	r8, r9, r4, r3
	umlal	r9, r10, r5, r3
	umlal	r10, r6, r1, r3
	umlal	r6, r7, r2, r3
	// ([7-10], 5) blocks
	ldr	r2, [r12, #20]
	ldr	r3, [r14, #28]
	umlal	r8, r9, r3, r2
	umlal	r9, r10, r4, r2
	umlal	r10, r6, r5, r2
	umlal	r6, r7, r1, r2
	// ([6-9], 6) blocks
	ldr	r1, [r12, #24]
	ldr	r2, [r14, #24]
	umlal	r8, r9, r2, r1
	umlal	r9, r10, r3, r1
	umlal	r10, r6, r4, r1
	umlal	r6, r7, r5, r1
	// ([5-8], 7) blocks
	ldr	r5, [r12, #28]
	ldr	r1, [r14, #20]
	umlal	r8, r9, r1, r5
	umlal	r9, r10, r2, r5
	umlal	r10, r6, r3, r5
	umlal	r6, r7, r4, r5
	// ([4-7], 8) blocks
	ldr	r4, [r12, #32]
	ldr	r5, [r14, #16]
	umlal	r8, r9, r5, r4
	umlal	r9, r10, r1, r4
	umlal	r10, r6, r2, r4
	umlal	r6, r7, r3, r4
	// ([3-6], 9) blocks
	ldr	r3, [r12, #36]
	ldr	r4, [r14, #12]
	umlal	r8, r9, r4, r3
	umlal	r9, r10, r5, r3
	umlal	r10, r6, r1, r3
	umlal	r6, r7, r2, r3
	// ([2-5], 10) blocks
	ldr	r2, [r12, #40]
	ldr	r3, [r14, #8]
	umlal	r8, r9, r3, r2
	umlal	r9, r10, r4, r2
	umlal	r10, r6, r5, r2
	umlal	r6, r7, r1, r2
	// ([1-4], 11) blocks
	ldr	r1, [r12, #44]
	ldr	r2, [r14, #4]
	umlal	r8, r9, r2, r1
	umlal	r9, r10, r3, r1
	umlal	r10, r6, r4, r1
	umlal	r6, r7, r5, r1
	// ([0-3], 12) blocks
	ldr	r5, [r12, #48]
	ldr	r1, [r14, #0]
	umlal	r8, r9, r1, r5
	umlal	r9, r10, r2, r5
	umlal	r10, r6, r3, r5
	umlal	r6, r7, r4, r5
	// ([0-2],13), ([0-1],14), (0,15) blocks
	and	r5, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r5, LSR #4	// range < 31
	ldr	r5, [r12, #52]
	umlal	r6, r7, r3, r5
	umlal	r10, r6, r2, r5
	umlal	r9, r10, r1, r5
	and	r5, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r5, LSR #4	// range < 31
	ldr	r5, [r12, #56]
	umlal	r6, r7, r2, r5
	umlal	r10, r6, r1, r5
	and	r5, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r5, LSR #4	// range < 31
	and	r5, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r5, LSR #4	// range < 31
	ldr	r5, [r12, #60]
	umlal	r6, r7, r1, r5
	str.w r9, [r0, #4]
	str.w r10, [r0, #8]
	str.w r6, [r0, #12]
	str.w r8, [r0], #16
	pop.w {pc}
mul_800:
	// ([16-19], 0) blocks
	ldr	r1, [r12]
	ldr	r5, [r14, #76]
	ldr	r4, [r14, #72]
	ldr	r3, [r14, #68]
	ldr	r2, [r14, #64]
	umull	r8, r9, r3, r1
	umull	r10, r6, r5, r1
	umlal	r7, r8, r2, r1
	umlal	r9, r10, r4, r1
	// ([15-18], 1) blocks
	ldr	r5, [r12, #4]
	ldr	r1, [r14, #60]
	umlal	r7, r8, r1, r5
	umlal	r8, r9, r2, r5
	umlal	r9, r10, r3, r5
	umlal	r10, r6, r4, r5
	// ([14-17], 2) blocks
	ldr	r4, [r12, #8]
	ldr	r5, [r14, #56]
	umlal	r7, r8, r5, r4
	umlal	r8, r9, r1, r4
	umlal	r9, r10, r2, r4
	umlal	r10, r6, r3, r4
	// ([13-16], 3) blocks
	ldr	r3, [r12, #12]
	ldr	r4, [r14, #52]
	umlal	r7, r8, r4, r3
	umlal	r8, r9, r5, r3
	umlal	r9, r10, r1, r3
	umlal	r10, r6, r2, r3
	// ([12-15], 4) blocks
	ldr	r2, [r12, #16]
	ldr	r3, [r14, #48]
	umlal	r7, r8, r3, r2
	umlal	r8, r9, r4, r2
	umlal	r9, r10, r5, r2
	umlal	r10, r6, r1, r2
	// ([11-14], 5) blocks
	ldr	r1, [r12, #20]
	ldr	r2, [r14, #44]
	umlal	r7, r8, r2, r1
	umlal	r8, r9, r3, r1
	umlal	r9, r10, r4, r1
	umlal	r10, r6, r5, r1
	// ([10-13], 6) blocks
	ldr	r5, [r12, #24]
	ldr	r1, [r14, #40]
	umlal	r7, r8, r1, r5
	umlal	r8, r9, r2, r5
	umlal	r9, r10, r3, r5
	umlal	r10, r6, r4, r5
	// ([9-12], 7) blocks
	ldr	r4, [r12, #28]
	ldr	r5, [r14, #36]
	umlal	r7, r8, r5, r4
	umlal	r8, r9, r1, r4
	umlal	r9, r10, r2, r4
	umlal	r10, r6, r3, r4
	// ([8-11], 8) blocks
	ldr	r3, [r12, #32]
	ldr	r4, [r14, #32]
	umlal	r7, r8, r4, r3
	umlal	r8, r9, r5, r3
	umlal	r9, r10, r1, r3
	umlal	r10, r6, r2, r3
	// ([7-10], 9) blocks
	ldr	r2, [r12, #36]
	ldr	r3, [r14, #28]
	umlal	r7, r8, r3, r2
	umlal	r8, r9, r4, r2
	umlal	r9, r10, r5, r2
	umlal	r10, r6, r1, r2
	// ([6-9], 10) blocks
	ldr	r1, [r12, #40]
	ldr	r2, [r14, #24]
	umlal	r7, r8, r2, r1
	umlal	r8, r9, r3, r1
	umlal	r9, r10, r4, r1
	umlal	r10, r6, r5, r1
	// ([5-8], 11) blocks
	ldr	r5, [r12, #44]
	ldr	r1, [r14, #20]
	umlal	r7, r8, r1, r5
	umlal	r8, r9, r2, r5
	umlal	r9, r10, r3, r5
	umlal	r10, r6, r4, r5
	// ([4-7], 12) blocks
	ldr	r4, [r12, #48]
	ldr	r5, [r14, #16]
	umlal	r7, r8, r5, r4
	umlal	r8, r9, r1, r4
	umlal	r9, r10, r2, r4
	umlal	r10, r6, r3, r4
	// ([3-6], 13) blocks
	ldr	r3, [r12, #52]
	ldr	r4, [r14, #12]
	umlal	r7, r8, r4, r3
	umlal	r8, r9, r5, r3
	umlal	r9, r10, r1, r3
	umlal	r10, r6, r2, r3
	// ([2-5], 14) blocks
	ldr	r2, [r12, #56]
	ldr	r3, [r14, #8]
	umlal	r7, r8, r3, r2
	umlal	r8, r9, r4, r2
	umlal	r9, r10, r5, r2
	umlal	r10, r6, r1, r2
	and	r2, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r2, LSR #4	// range < 31
	and	r2, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r2, LSR #4	// range < 31
	and	r2, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r2, LSR #4	// range < 31
	and	r2, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r2, LSR #4	// range < 31
	// ([1-4], 15) blocks
	ldr	r1, [r12, #60]
	ldr	r2, [r14, #4]
	umlal	r7, r8, r2, r1
	umlal	r8, r9, r3, r1
	umlal	r9, r10, r4, r1
	umlal	r10, r6, r5, r1
	str.w r8, [r0, #4]
	str.w r9, [r0, #8]
	str.w r10, [r0, #12]
	str.w r7, [r0], #16
	// ([20-23], 0) blocks
	ldr	r5, [r12]
	ldr	r4, [r14, #92]
	ldr	r3, [r14, #88]
	ldr	r2, [r14, #84]
	ldr	r1, [r14, #80]
	umull	r7, r8, r2, r5
	umull	r9, r10, r4, r5
	umlal	r6, r7, r1, r5
	umlal	r8, r9, r3, r5
	// ([19-22], 1) blocks
	ldr	r4, [r12, #4]
	ldr	r5, [r14, #76]
	umlal	r6, r7, r5, r4
	umlal	r7, r8, r1, r4
	umlal	r8, r9, r2, r4
	umlal	r9, r10, r3, r4
	// ([18-21], 2) blocks
	ldr	r3, [r12, #8]
	ldr	r4, [r14, #72]
	umlal	r6, r7, r4, r3
	umlal	r7, r8, r5, r3
	umlal	r8, r9, r1, r3
	umlal	r9, r10, r2, r3
	// ([17-20], 3) blocks
	ldr	r2, [r12, #12]
	ldr	r3, [r14, #68]
	umlal	r6, r7, r3, r2
	umlal	r7, r8, r4, r2
	umlal	r8, r9, r5, r2
	umlal	r9, r10, r1, r2
	// ([16-19], 4) blocks
	ldr	r1, [r12, #16]
	ldr	r2, [r14, #64]
	umlal	r6, r7, r2, r1
	umlal	r7, r8, r3, r1
	umlal	r8, r9, r4, r1
	umlal	r9, r10, r5, r1
	// ([15-18], 5) blocks
	ldr	r5, [r12, #20]
	ldr	r1, [r14, #60]
	umlal	r6, r7, r1, r5
	umlal	r7, r8, r2, r5
	umlal	r8, r9, r3, r5
	umlal	r9, r10, r4, r5
	// ([14-17], 6) blocks
	ldr	r4, [r12, #24]
	ldr	r5, [r14, #56]
	umlal	r6, r7, r5, r4
	umlal	r7, r8, r1, r4
	umlal	r8, r9, r2, r4
	umlal	r9, r10, r3, r4
	// ([13-16], 7) blocks
	ldr	r3, [r12, #28]
	ldr	r4, [r14, #52]
	umlal	r6, r7, r4, r3
	umlal	r7, r8, r5, r3
	umlal	r8, r9, r1, r3
	umlal	r9, r10, r2, r3
	// ([12-15], 8) blocks
	ldr	r2, [r12, #32]
	ldr	r3, [r14, #48]
	umlal	r6, r7, r3, r2
	umlal	r7, r8, r4, r2
	umlal	r8, r9, r5, r2
	umlal	r9, r10, r1, r2
	// ([11-14], 9) blocks
	ldr	r1, [r12, #36]
	ldr	r2, [r14, #44]
	umlal	r6, r7, r2, r1
	umlal	r7, r8, r3, r1
	umlal	r8, r9, r4, r1
	umlal	r9, r10, r5, r1
	// ([10-13], 10) blocks
	ldr	r5, [r12, #40]
	ldr	r1, [r14, #40]
	umlal	r6, r7, r1, r5
	umlal	r7, r8, r2, r5
	umlal	r8, r9, r3, r5
	umlal	r9, r10, r4, r5
	// ([9-12], 11) blocks
	ldr	r4, [r12, #44]
	ldr	r5, [r14, #36]
	umlal	r6, r7, r5, r4
	umlal	r7, r8, r1, r4
	umlal	r8, r9, r2, r4
	umlal	r9, r10, r3, r4
	// ([8-11], 12) blocks
	ldr	r3, [r12, #48]
	ldr	r4, [r14, #32]
	umlal	r6, r7, r4, r3
	umlal	r7, r8, r5, r3
	umlal	r8, r9, r1, r3
	umlal	r9, r10, r2, r3
	// ([7-10], 13) blocks
	ldr	r2, [r12, #52]
	ldr	r3, [r14, #28]
	umlal	r6, r7, r3, r2
	umlal	r7, r8, r4, r2
	umlal	r8, r9, r5, r2
	umlal	r9, r10, r1, r2
	// ([6-9], 14) blocks
	ldr	r1, [r12, #56]
	ldr	r2, [r14, #24]
	umlal	r6, r7, r2, r1
	umlal	r7, r8, r3, r1
	umlal	r8, r9, r4, r1
	umlal	r9, r10, r5, r1
	and	r1, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r1, LSR #4	// range < 31
	and	r1, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r1, LSR #4	// range < 31
	and	r1, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r1, LSR #4	// range < 31
	and	r1, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r1, LSR #4	// range < 31
	// ([5-8], 15) blocks
	ldr	r5, [r12, #60]
	ldr	r1, [r14, #20]
	umlal	r6, r7, r1, r5
	umlal	r7, r8, r2, r5
	umlal	r8, r9, r3, r5
	umlal	r9, r10, r4, r5
	str.w r7, [r0, #4]
	str.w r8, [r0, #8]
	str.w r9, [r0, #12]
	str.w r6, [r0], #16
mul_768:
	// ([24-27], 0) blocks
	ldr	r4, [r12]
	ldr	r3, [r14, #108]
	ldr	r2, [r14, #104]
	ldr	r1, [r14, #100]
	ldr	r5, [r14, #96]
	umull	r6, r7, r1, r4
	umull	r8, r9, r3, r4
	umlal	r10, r6, r5, r4
	umlal	r7, r8, r2, r4
	// ([23-26], 1) blocks
	ldr	r3, [r12, #4]
	ldr	r4, [r14, #92]
	umlal	r10, r6, r4, r3
	umlal	r6, r7, r5, r3
	umlal	r7, r8, r1, r3
	umlal	r8, r9, r2, r3
	// ([22-25], 2) blocks
	ldr	r2, [r12, #8]
	ldr	r3, [r14, #88]
	umlal	r10, r6, r3, r2
	umlal	r6, r7, r4, r2
	umlal	r7, r8, r5, r2
	umlal	r8, r9, r1, r2
	// ([21-24], 3) blocks
	ldr	r1, [r12, #12]
	ldr	r2, [r14, #84]
	umlal	r10, r6, r2, r1
	umlal	r6, r7, r3, r1
	umlal	r7, r8, r4, r1
	umlal	r8, r9, r5, r1
	// ([20-23], 4) blocks
	ldr	r5, [r12, #16]
	ldr	r1, [r14, #80]
	umlal	r10, r6, r1, r5
	umlal	r6, r7, r2, r5
	umlal	r7, r8, r3, r5
	umlal	r8, r9, r4, r5
	// ([19-22], 5) blocks
	ldr	r4, [r12, #20]
	ldr	r5, [r14, #76]
	umlal	r10, r6, r5, r4
	umlal	r6, r7, r1, r4
	umlal	r7, r8, r2, r4
	umlal	r8, r9, r3, r4
	// ([18-21], 6) blocks
	ldr	r3, [r12, #24]
	ldr	r4, [r14, #72]
	umlal	r10, r6, r4, r3
	umlal	r6, r7, r5, r3
	umlal	r7, r8, r1, r3
	umlal	r8, r9, r2, r3
	// ([17-20], 7) blocks
	ldr	r2, [r12, #28]
	ldr	r3, [r14, #68]
	umlal	r10, r6, r3, r2
	umlal	r6, r7, r4, r2
	umlal	r7, r8, r5, r2
	umlal	r8, r9, r1, r2
	// ([16-19], 8) blocks
	ldr	r1, [r12, #32]
	ldr	r2, [r14, #64]
	umlal	r10, r6, r2, r1
	umlal	r6, r7, r3, r1
	umlal	r7, r8, r4, r1
	umlal	r8, r9, r5, r1
	// ([15-18], 9) blocks
	ldr	r5, [r12, #36]
	ldr	r1, [r14, #60]
	umlal	r10, r6, r1, r5
	umlal	r6, r7, r2, r5
	umlal	r7, r8, r3, r5
	umlal	r8, r9, r4, r5
	// ([14-17], 10) blocks
	ldr	r4, [r12, #40]
	ldr	r5, [r14, #56]
	umlal	r10, r6, r5, r4
	umlal	r6, r7, r1, r4
	umlal	r7, r8, r2, r4
	umlal	r8, r9, r3, r4
	// ([13-16], 11) blocks
	ldr	r3, [r12, #44]
	ldr	r4, [r14, #52]
	umlal	r10, r6, r4, r3
	umlal	r6, r7, r5, r3
	umlal	r7, r8, r1, r3
	umlal	r8, r9, r2, r3
	// ([12-15], 12) blocks
	ldr	r2, [r12, #48]
	ldr	r3, [r14, #48]
	umlal	r10, r6, r3, r2
	umlal	r6, r7, r4, r2
	umlal	r7, r8, r5, r2
	umlal	r8, r9, r1, r2
	// ([11-14], 13) blocks
	ldr	r1, [r12, #52]
	ldr	r2, [r14, #44]
	umlal	r10, r6, r2, r1
	umlal	r6, r7, r3, r1
	umlal	r7, r8, r4, r1
	umlal	r8, r9, r5, r1
	// ([10-13], 14) blocks
	ldr	r5, [r12, #56]
	ldr	r1, [r14, #40]
	umlal	r10, r6, r1, r5
	umlal	r6, r7, r2, r5
	umlal	r7, r8, r3, r5
	umlal	r8, r9, r4, r5
	and	r5, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r5, LSR #4	// range < 31
	and	r5, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r5, LSR #4	// range < 31
	and	r5, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r5, LSR #4	// range < 31
	and	r5, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r5, LSR #4	// range < 31
	// ([9-12], 15) blocks
	ldr	r4, [r12, #60]
	ldr	r5, [r14, #36]
	umlal	r10, r6, r5, r4
	umlal	r6, r7, r1, r4
	umlal	r7, r8, r2, r4
	umlal	r8, r9, r3, r4
	str.w r6, [r0, #4]
	str.w r7, [r0, #8]
	str.w r8, [r0, #12]
	str.w r10, [r0], #16
	// ([28-31], 0) blocks
	ldr	r3, [r12]
	ldr	r2, [r14, #124]
	ldr	r1, [r14, #120]
	ldr	r5, [r14, #116]
	ldr	r4, [r14, #112]
	umull	r10, r6, r5, r3
	umull	r7, r8, r2, r3
	umlal	r9, r10, r4, r3
	umlal	r6, r7, r1, r3
	// ([27-30], 1) blocks
	ldr	r2, [r12, #4]
	ldr	r3, [r14, #108]
	umlal	r9, r10, r3, r2
	umlal	r10, r6, r4, r2
	umlal	r6, r7, r5, r2
	umlal	r7, r8, r1, r2
	// ([26-29], 2) blocks
	ldr	r1, [r12, #8]
	ldr	r2, [r14, #104]
	umlal	r9, r10, r2, r1
	umlal	r10, r6, r3, r1
	umlal	r6, r7, r4, r1
	umlal	r7, r8, r5, r1
	// ([25-28], 3) blocks
	ldr	r5, [r12, #12]
	ldr	r1, [r14, #100]
	umlal	r9, r10, r1, r5
	umlal	r10, r6, r2, r5
	umlal	r6, r7, r3, r5
	umlal	r7, r8, r4, r5
	// ([24-27], 4) blocks
	ldr	r4, [r12, #16]
	ldr	r5, [r14, #96]
	umlal	r9, r10, r5, r4
	umlal	r10, r6, r1, r4
	umlal	r6, r7, r2, r4
	umlal	r7, r8, r3, r4
	// ([23-26], 5) blocks
	ldr	r3, [r12, #20]
	ldr	r4, [r14, #92]
	umlal	r9, r10, r4, r3
	umlal	r10, r6, r5, r3
	umlal	r6, r7, r1, r3
	umlal	r7, r8, r2, r3
	// ([22-25], 6) blocks
	ldr	r2, [r12, #24]
	ldr	r3, [r14, #88]
	umlal	r9, r10, r3, r2
	umlal	r10, r6, r4, r2
	umlal	r6, r7, r5, r2
	umlal	r7, r8, r1, r2
	// ([21-24], 7) blocks
	ldr	r1, [r12, #28]
	ldr	r2, [r14, #84]
	umlal	r9, r10, r2, r1
	umlal	r10, r6, r3, r1
	umlal	r6, r7, r4, r1
	umlal	r7, r8, r5, r1
	// ([20-23], 8) blocks
	ldr	r5, [r12, #32]
	ldr	r1, [r14, #80]
	umlal	r9, r10, r1, r5
	umlal	r10, r6, r2, r5
	umlal	r6, r7, r3, r5
	umlal	r7, r8, r4, r5
	// ([19-22], 9) blocks
	ldr	r4, [r12, #36]
	ldr	r5, [r14, #76]
	umlal	r9, r10, r5, r4
	umlal	r10, r6, r1, r4
	umlal	r6, r7, r2, r4
	umlal	r7, r8, r3, r4
	// ([18-21], 10) blocks
	ldr	r3, [r12, #40]
	ldr	r4, [r14, #72]
	umlal	r9, r10, r4, r3
	umlal	r10, r6, r5, r3
	umlal	r6, r7, r1, r3
	umlal	r7, r8, r2, r3
	// ([17-20], 11) blocks
	ldr	r2, [r12, #44]
	ldr	r3, [r14, #68]
	umlal	r9, r10, r3, r2
	umlal	r10, r6, r4, r2
	umlal	r6, r7, r5, r2
	umlal	r7, r8, r1, r2
	// ([16-19], 12) blocks
	ldr	r1, [r12, #48]
	ldr	r2, [r14, #64]
	umlal	r9, r10, r2, r1
	umlal	r10, r6, r3, r1
	umlal	r6, r7, r4, r1
	umlal	r7, r8, r5, r1
	// ([15-18], 13) blocks
	ldr	r5, [r12, #52]
	ldr	r1, [r14, #60]
	umlal	r9, r10, r1, r5
	umlal	r10, r6, r2, r5
	umlal	r6, r7, r3, r5
	umlal	r7, r8, r4, r5
	// ([14-17], 14) blocks
	ldr	r4, [r12, #56]
	ldr	r5, [r14, #56]
	umlal	r9, r10, r5, r4
	umlal	r10, r6, r1, r4
	umlal	r6, r7, r2, r4
	umlal	r7, r8, r3, r4
	and	r4, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r4, LSR #4	// range < 31
	and	r4, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r4, LSR #4	// range < 31
	and	r4, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r4, LSR #4	// range < 31
	and	r4, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r4, LSR #4	// range < 31
	// ([13-16], 15) blocks
	ldr	r3, [r12, #60]
	ldr	r4, [r14, #52]
	umlal	r9, r10, r4, r3
	umlal	r10, r6, r5, r3
	umlal	r6, r7, r1, r3
	umlal	r7, r8, r2, r3
	str.w r10, [r0, #4]
	str.w r6, [r0, #8]
	str.w r7, [r0, #12]
	str.w r9, [r0], #16
	// ([32-35], 0) blocks
	ldr	r2, [r12]
	ldr	r1, [r14, #140]
	ldr	r5, [r14, #136]
	ldr	r4, [r14, #132]
	ldr	r3, [r14, #128]
	umull	r9, r10, r4, r2
	umull	r6, r7, r1, r2
	umlal	r8, r9, r3, r2
	umlal	r10, r6, r5, r2
	// ([31-34], 1) blocks
	ldr	r1, [r12, #4]
	ldr	r2, [r14, #124]
	umlal	r8, r9, r2, r1
	umlal	r9, r10, r3, r1
	umlal	r10, r6, r4, r1
	umlal	r6, r7, r5, r1
	// ([30-33], 2) blocks
	ldr	r5, [r12, #8]
	ldr	r1, [r14, #120]
	umlal	r8, r9, r1, r5
	umlal	r9, r10, r2, r5
	umlal	r10, r6, r3, r5
	umlal	r6, r7, r4, r5
	// ([29-32], 3) blocks
	ldr	r4, [r12, #12]
	ldr	r5, [r14, #116]
	umlal	r8, r9, r5, r4
	umlal	r9, r10, r1, r4
	umlal	r10, r6, r2, r4
	umlal	r6, r7, r3, r4
	// ([28-31], 4) blocks
	ldr	r3, [r12, #16]
	ldr	r4, [r14, #112]
	umlal	r8, r9, r4, r3
	umlal	r9, r10, r5, r3
	umlal	r10, r6, r1, r3
	umlal	r6, r7, r2, r3
	// ([27-30], 5) blocks
	ldr	r2, [r12, #20]
	ldr	r3, [r14, #108]
	umlal	r8, r9, r3, r2
	umlal	r9, r10, r4, r2
	umlal	r10, r6, r5, r2
	umlal	r6, r7, r1, r2
	// ([26-29], 6) blocks
	ldr	r1, [r12, #24]
	ldr	r2, [r14, #104]
	umlal	r8, r9, r2, r1
	umlal	r9, r10, r3, r1
	umlal	r10, r6, r4, r1
	umlal	r6, r7, r5, r1
	// ([25-28], 7) blocks
	ldr	r5, [r12, #28]
	ldr	r1, [r14, #100]
	umlal	r8, r9, r1, r5
	umlal	r9, r10, r2, r5
	umlal	r10, r6, r3, r5
	umlal	r6, r7, r4, r5
	// ([24-27], 8) blocks
	ldr	r4, [r12, #32]
	ldr	r5, [r14, #96]
	umlal	r8, r9, r5, r4
	umlal	r9, r10, r1, r4
	umlal	r10, r6, r2, r4
	umlal	r6, r7, r3, r4
	// ([23-26], 9) blocks
	ldr	r3, [r12, #36]
	ldr	r4, [r14, #92]
	umlal	r8, r9, r4, r3
	umlal	r9, r10, r5, r3
	umlal	r10, r6, r1, r3
	umlal	r6, r7, r2, r3
	// ([22-25], 10) blocks
	ldr	r2, [r12, #40]
	ldr	r3, [r14, #88]
	umlal	r8, r9, r3, r2
	umlal	r9, r10, r4, r2
	umlal	r10, r6, r5, r2
	umlal	r6, r7, r1, r2
	// ([21-24], 11) blocks
	ldr	r1, [r12, #44]
	ldr	r2, [r14, #84]
	umlal	r8, r9, r2, r1
	umlal	r9, r10, r3, r1
	umlal	r10, r6, r4, r1
	umlal	r6, r7, r5, r1
	// ([20-23], 12) blocks
	ldr	r5, [r12, #48]
	ldr	r1, [r14, #80]
	umlal	r8, r9, r1, r5
	umlal	r9, r10, r2, r5
	umlal	r10, r6, r3, r5
	umlal	r6, r7, r4, r5
	// ([19-22], 13) blocks
	ldr	r4, [r12, #52]
	ldr	r5, [r14, #76]
	umlal	r8, r9, r5, r4
	umlal	r9, r10, r1, r4
	umlal	r10, r6, r2, r4
	umlal	r6, r7, r3, r4
	// ([18-21], 14) blocks
	ldr	r3, [r12, #56]
	ldr	r4, [r14, #72]
	umlal	r8, r9, r4, r3
	umlal	r9, r10, r5, r3
	umlal	r10, r6, r1, r3
	umlal	r6, r7, r2, r3
	and	r3, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r3, LSR #4	// range < 31
	and	r3, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r3, LSR #4	// range < 31
	and	r3, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r3, LSR #4	// range < 31
	and	r3, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r3, LSR #4	// range < 31
	// ([17-20], 15) blocks
	ldr	r2, [r12, #60]
	ldr	r3, [r14, #68]
	umlal	r8, r9, r3, r2
	umlal	r9, r10, r4, r2
	umlal	r10, r6, r5, r2
	umlal	r6, r7, r1, r2
	str.w r9, [r0, #4]
	str.w r10, [r0, #8]
	str.w r6, [r0, #12]
	str.w r8, [r0], #16
	// ([36-39], 0) blocks
	ldr	r1, [r12]
	ldr	r5, [r14, #156]
	ldr	r4, [r14, #152]
	ldr	r3, [r14, #148]
	ldr	r2, [r14, #144]
	umull	r8, r9, r3, r1
	umull	r10, r6, r5, r1
	umlal	r7, r8, r2, r1
	umlal	r9, r10, r4, r1
	// ([35-38], 1) blocks
	ldr	r5, [r12, #4]
	ldr	r1, [r14, #140]
	umlal	r7, r8, r1, r5
	umlal	r8, r9, r2, r5
	umlal	r9, r10, r3, r5
	umlal	r10, r6, r4, r5
	// ([34-37], 2) blocks
	ldr	r4, [r12, #8]
	ldr	r5, [r14, #136]
	umlal	r7, r8, r5, r4
	umlal	r8, r9, r1, r4
	umlal	r9, r10, r2, r4
	umlal	r10, r6, r3, r4
	// ([33-36], 3) blocks
	ldr	r3, [r12, #12]
	ldr	r4, [r14, #132]
	umlal	r7, r8, r4, r3
	umlal	r8, r9, r5, r3
	umlal	r9, r10, r1, r3
	umlal	r10, r6, r2, r3
	// ([32-35], 4) blocks
	ldr	r2, [r12, #16]
	ldr	r3, [r14, #128]
	umlal	r7, r8, r3, r2
	umlal	r8, r9, r4, r2
	umlal	r9, r10, r5, r2
	umlal	r10, r6, r1, r2
	// ([31-34], 5) blocks
	ldr	r1, [r12, #20]
	ldr	r2, [r14, #124]
	umlal	r7, r8, r2, r1
	umlal	r8, r9, r3, r1
	umlal	r9, r10, r4, r1
	umlal	r10, r6, r5, r1
	// ([30-33], 6) blocks
	ldr	r5, [r12, #24]
	ldr	r1, [r14, #120]
	umlal	r7, r8, r1, r5
	umlal	r8, r9, r2, r5
	umlal	r9, r10, r3, r5
	umlal	r10, r6, r4, r5
	// ([29-32], 7) blocks
	ldr	r4, [r12, #28]
	ldr	r5, [r14, #116]
	umlal	r7, r8, r5, r4
	umlal	r8, r9, r1, r4
	umlal	r9, r10, r2, r4
	umlal	r10, r6, r3, r4
	// ([28-31], 8) blocks
	ldr	r3, [r12, #32]
	ldr	r4, [r14, #112]
	umlal	r7, r8, r4, r3
	umlal	r8, r9, r5, r3
	umlal	r9, r10, r1, r3
	umlal	r10, r6, r2, r3
	// ([27-30], 9) blocks
	ldr	r2, [r12, #36]
	ldr	r3, [r14, #108]
	umlal	r7, r8, r3, r2
	umlal	r8, r9, r4, r2
	umlal	r9, r10, r5, r2
	umlal	r10, r6, r1, r2
	// ([26-29], 10) blocks
	ldr	r1, [r12, #40]
	ldr	r2, [r14, #104]
	umlal	r7, r8, r2, r1
	umlal	r8, r9, r3, r1
	umlal	r9, r10, r4, r1
	umlal	r10, r6, r5, r1
	// ([25-28], 11) blocks
	ldr	r5, [r12, #44]
	ldr	r1, [r14, #100]
	umlal	r7, r8, r1, r5
	umlal	r8, r9, r2, r5
	umlal	r9, r10, r3, r5
	umlal	r10, r6, r4, r5
	// ([24-27], 12) blocks
	ldr	r4, [r12, #48]
	ldr	r5, [r14, #96]
	umlal	r7, r8, r5, r4
	umlal	r8, r9, r1, r4
	umlal	r9, r10, r2, r4
	umlal	r10, r6, r3, r4
	// ([23-26], 13) blocks
	ldr	r3, [r12, #52]
	ldr	r4, [r14, #92]
	umlal	r7, r8, r4, r3
	umlal	r8, r9, r5, r3
	umlal	r9, r10, r1, r3
	umlal	r10, r6, r2, r3
	// ([22-25], 14) blocks
	ldr	r2, [r12, #56]
	ldr	r3, [r14, #88]
	umlal	r7, r8, r3, r2
	umlal	r8, r9, r4, r2
	umlal	r9, r10, r5, r2
	umlal	r10, r6, r1, r2
	and	r2, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r2, LSR #4	// range < 31
	and	r2, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r2, LSR #4	// range < 31
	and	r2, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r2, LSR #4	// range < 31
	and	r2, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r2, LSR #4	// range < 31
	// ([21-24], 15) blocks
	ldr	r1, [r12, #60]
	ldr	r2, [r14, #84]
	umlal	r7, r8, r2, r1
	umlal	r8, r9, r3, r1
	umlal	r9, r10, r4, r1
	umlal	r10, r6, r5, r1
	str.w r8, [r0, #4]
	str.w r9, [r0, #8]
	str.w r10, [r0, #12]
	str.w r7, [r0], #16
mul_704:
	// ([40-43], 0) blocks
	ldr	r5, [r12]
	ldr	r4, [r14, #172]
	ldr	r3, [r14, #168]
	ldr	r2, [r14, #164]
	ldr	r1, [r14, #160]
	umull	r7, r8, r2, r5
	umull	r9, r10, r4, r5
	umlal	r6, r7, r1, r5
	umlal	r8, r9, r3, r5
	// ([39-42], 1) blocks
	ldr	r4, [r12, #4]
	ldr	r5, [r14, #156]
	umlal	r6, r7, r5, r4
	umlal	r7, r8, r1, r4
	umlal	r8, r9, r2, r4
	umlal	r9, r10, r3, r4
	// ([38-41], 2) blocks
	ldr	r3, [r12, #8]
	ldr	r4, [r14, #152]
	umlal	r6, r7, r4, r3
	umlal	r7, r8, r5, r3
	umlal	r8, r9, r1, r3
	umlal	r9, r10, r2, r3
	// ([37-40], 3) blocks
	ldr	r2, [r12, #12]
	ldr	r3, [r14, #148]
	umlal	r6, r7, r3, r2
	umlal	r7, r8, r4, r2
	umlal	r8, r9, r5, r2
	umlal	r9, r10, r1, r2
	// ([36-39], 4) blocks
	ldr	r1, [r12, #16]
	ldr	r2, [r14, #144]
	umlal	r6, r7, r2, r1
	umlal	r7, r8, r3, r1
	umlal	r8, r9, r4, r1
	umlal	r9, r10, r5, r1
	// ([35-38], 5) blocks
	ldr	r5, [r12, #20]
	ldr	r1, [r14, #140]
	umlal	r6, r7, r1, r5
	umlal	r7, r8, r2, r5
	umlal	r8, r9, r3, r5
	umlal	r9, r10, r4, r5
	// ([34-37], 6) blocks
	ldr	r4, [r12, #24]
	ldr	r5, [r14, #136]
	umlal	r6, r7, r5, r4
	umlal	r7, r8, r1, r4
	umlal	r8, r9, r2, r4
	umlal	r9, r10, r3, r4
	// ([33-36], 7) blocks
	ldr	r3, [r12, #28]
	ldr	r4, [r14, #132]
	umlal	r6, r7, r4, r3
	umlal	r7, r8, r5, r3
	umlal	r8, r9, r1, r3
	umlal	r9, r10, r2, r3
	// ([32-35], 8) blocks
	ldr	r2, [r12, #32]
	ldr	r3, [r14, #128]
	umlal	r6, r7, r3, r2
	umlal	r7, r8, r4, r2
	umlal	r8, r9, r5, r2
	umlal	r9, r10, r1, r2
	// ([31-34], 9) blocks
	ldr	r1, [r12, #36]
	ldr	r2, [r14, #124]
	umlal	r6, r7, r2, r1
	umlal	r7, r8, r3, r1
	umlal	r8, r9, r4, r1
	umlal	r9, r10, r5, r1
	// ([30-33], 10) blocks
	ldr	r5, [r12, #40]
	ldr	r1, [r14, #120]
	umlal	r6, r7, r1, r5
	umlal	r7, r8, r2, r5
	umlal	r8, r9, r3, r5
	umlal	r9, r10, r4, r5
	// ([29-32], 11) blocks
	ldr	r4, [r12, #44]
	ldr	r5, [r14, #116]
	umlal	r6, r7, r5, r4
	umlal	r7, r8, r1, r4
	umlal	r8, r9, r2, r4
	umlal	r9, r10, r3, r4
	// ([28-31], 12) blocks
	ldr	r3, [r12, #48]
	ldr	r4, [r14, #112]
	umlal	r6, r7, r4, r3
	umlal	r7, r8, r5, r3
	umlal	r8, r9, r1, r3
	umlal	r9, r10, r2, r3
	// ([27-30], 13) blocks
	ldr	r2, [r12, #52]
	ldr	r3, [r14, #108]
	umlal	r6, r7, r3, r2
	umlal	r7, r8, r4, r2
	umlal	r8, r9, r5, r2
	umlal	r9, r10, r1, r2
	// ([26-29], 14) blocks
	ldr	r1, [r12, #56]
	ldr	r2, [r14, #104]
	umlal	r6, r7, r2, r1
	umlal	r7, r8, r3, r1
	umlal	r8, r9, r4, r1
	umlal	r9, r10, r5, r1
	and	r1, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r1, LSR #4	// range < 31
	and	r1, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r1, LSR #4	// range < 31
	and	r1, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r1, LSR #4	// range < 31
	and	r1, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r1, LSR #4	// range < 31
	// ([25-28], 15) blocks
	ldr	r5, [r12, #60]
	ldr	r1, [r14, #100]
	umlal	r6, r7, r1, r5
	umlal	r7, r8, r2, r5
	umlal	r8, r9, r3, r5
	umlal	r9, r10, r4, r5
	str.w r7, [r0, #4]
	str.w r8, [r0, #8]
	str.w r9, [r0, #12]
	str.w r6, [r0], #16
	// ([44-47], 0) blocks
	ldr	r4, [r12]
	ldr	r3, [r14, #188]
	ldr	r2, [r14, #184]
	ldr	r1, [r14, #180]
	ldr	r5, [r14, #176]
	umull	r6, r7, r1, r4
	umull	r8, r9, r3, r4
	umlal	r10, r6, r5, r4
	umlal	r7, r8, r2, r4
	// ([43-46], 1) blocks
	ldr	r3, [r12, #4]
	ldr	r4, [r14, #172]
	umlal	r10, r6, r4, r3
	umlal	r6, r7, r5, r3
	umlal	r7, r8, r1, r3
	umlal	r8, r9, r2, r3
	// ([42-45], 2) blocks
	ldr	r2, [r12, #8]
	ldr	r3, [r14, #168]
	umlal	r10, r6, r3, r2
	umlal	r6, r7, r4, r2
	umlal	r7, r8, r5, r2
	umlal	r8, r9, r1, r2
	// ([41-44], 3) blocks
	ldr	r1, [r12, #12]
	ldr	r2, [r14, #164]
	umlal	r10, r6, r2, r1
	umlal	r6, r7, r3, r1
	umlal	r7, r8, r4, r1
	umlal	r8, r9, r5, r1
	// ([40-43], 4) blocks
	ldr	r5, [r12, #16]
	ldr	r1, [r14, #160]
	umlal	r10, r6, r1, r5
	umlal	r6, r7, r2, r5
	umlal	r7, r8, r3, r5
	umlal	r8, r9, r4, r5
	// ([39-42], 5) blocks
	ldr	r4, [r12, #20]
	ldr	r5, [r14, #156]
	umlal	r10, r6, r5, r4
	umlal	r6, r7, r1, r4
	umlal	r7, r8, r2, r4
	umlal	r8, r9, r3, r4
	// ([38-41], 6) blocks
	ldr	r3, [r12, #24]
	ldr	r4, [r14, #152]
	umlal	r10, r6, r4, r3
	umlal	r6, r7, r5, r3
	umlal	r7, r8, r1, r3
	umlal	r8, r9, r2, r3
	// ([37-40], 7) blocks
	ldr	r2, [r12, #28]
	ldr	r3, [r14, #148]
	umlal	r10, r6, r3, r2
	umlal	r6, r7, r4, r2
	umlal	r7, r8, r5, r2
	umlal	r8, r9, r1, r2
	// ([36-39], 8) blocks
	ldr	r1, [r12, #32]
	ldr	r2, [r14, #144]
	umlal	r10, r6, r2, r1
	umlal	r6, r7, r3, r1
	umlal	r7, r8, r4, r1
	umlal	r8, r9, r5, r1
	// ([35-38], 9) blocks
	ldr	r5, [r12, #36]
	ldr	r1, [r14, #140]
	umlal	r10, r6, r1, r5
	umlal	r6, r7, r2, r5
	umlal	r7, r8, r3, r5
	umlal	r8, r9, r4, r5
	// ([34-37], 10) blocks
	ldr	r4, [r12, #40]
	ldr	r5, [r14, #136]
	umlal	r10, r6, r5, r4
	umlal	r6, r7, r1, r4
	umlal	r7, r8, r2, r4
	umlal	r8, r9, r3, r4
	// ([33-36], 11) blocks
	ldr	r3, [r12, #44]
	ldr	r4, [r14, #132]
	umlal	r10, r6, r4, r3
	umlal	r6, r7, r5, r3
	umlal	r7, r8, r1, r3
	umlal	r8, r9, r2, r3
	// ([32-35], 12) blocks
	ldr	r2, [r12, #48]
	ldr	r3, [r14, #128]
	umlal	r10, r6, r3, r2
	umlal	r6, r7, r4, r2
	umlal	r7, r8, r5, r2
	umlal	r8, r9, r1, r2
	// ([31-34], 13) blocks
	ldr	r1, [r12, #52]
	ldr	r2, [r14, #124]
	umlal	r10, r6, r2, r1
	umlal	r6, r7, r3, r1
	umlal	r7, r8, r4, r1
	umlal	r8, r9, r5, r1
	// ([30-33], 14) blocks
	ldr	r5, [r12, #56]
	ldr	r1, [r14, #120]
	umlal	r10, r6, r1, r5
	umlal	r6, r7, r2, r5
	umlal	r7, r8, r3, r5
	umlal	r8, r9, r4, r5
	and	r5, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r5, LSR #4	// range < 31
	and	r5, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r5, LSR #4	// range < 31
	and	r5, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r5, LSR #4	// range < 31
	and	r5, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r5, LSR #4	// range < 31
	// ([29-32], 15) blocks
	ldr	r4, [r12, #60]
	ldr	r5, [r14, #116]
	umlal	r10, r6, r5, r4
	umlal	r6, r7, r1, r4
	umlal	r7, r8, r2, r4
	umlal	r8, r9, r3, r4
	str.w r6, [r0, #4]
	str.w r7, [r0, #8]
	str.w r8, [r0, #12]
	str.w r10, [r0], #16
	// ([48-51], 0) blocks
	ldr	r3, [r12]
	ldr	r2, [r14, #204]
	ldr	r1, [r14, #200]
	ldr	r5, [r14, #196]
	ldr	r4, [r14, #192]
	umull	r10, r6, r5, r3
	umull	r7, r8, r2, r3
	umlal	r9, r10, r4, r3
	umlal	r6, r7, r1, r3
	// ([47-50], 1) blocks
	ldr	r2, [r12, #4]
	ldr	r3, [r14, #188]
	umlal	r9, r10, r3, r2
	umlal	r10, r6, r4, r2
	umlal	r6, r7, r5, r2
	umlal	r7, r8, r1, r2
	// ([46-49], 2) blocks
	ldr	r1, [r12, #8]
	ldr	r2, [r14, #184]
	umlal	r9, r10, r2, r1
	umlal	r10, r6, r3, r1
	umlal	r6, r7, r4, r1
	umlal	r7, r8, r5, r1
	// ([45-48], 3) blocks
	ldr	r5, [r12, #12]
	ldr	r1, [r14, #180]
	umlal	r9, r10, r1, r5
	umlal	r10, r6, r2, r5
	umlal	r6, r7, r3, r5
	umlal	r7, r8, r4, r5
	// ([44-47], 4) blocks
	ldr	r4, [r12, #16]
	ldr	r5, [r14, #176]
	umlal	r9, r10, r5, r4
	umlal	r10, r6, r1, r4
	umlal	r6, r7, r2, r4
	umlal	r7, r8, r3, r4
	// ([43-46], 5) blocks
	ldr	r3, [r12, #20]
	ldr	r4, [r14, #172]
	umlal	r9, r10, r4, r3
	umlal	r10, r6, r5, r3
	umlal	r6, r7, r1, r3
	umlal	r7, r8, r2, r3
	// ([42-45], 6) blocks
	ldr	r2, [r12, #24]
	ldr	r3, [r14, #168]
	umlal	r9, r10, r3, r2
	umlal	r10, r6, r4, r2
	umlal	r6, r7, r5, r2
	umlal	r7, r8, r1, r2
	// ([41-44], 7) blocks
	ldr	r1, [r12, #28]
	ldr	r2, [r14, #164]
	umlal	r9, r10, r2, r1
	umlal	r10, r6, r3, r1
	umlal	r6, r7, r4, r1
	umlal	r7, r8, r5, r1
	// ([40-43], 8) blocks
	ldr	r5, [r12, #32]
	ldr	r1, [r14, #160]
	umlal	r9, r10, r1, r5
	umlal	r10, r6, r2, r5
	umlal	r6, r7, r3, r5
	umlal	r7, r8, r4, r5
	// ([39-42], 9) blocks
	ldr	r4, [r12, #36]
	ldr	r5, [r14, #156]
	umlal	r9, r10, r5, r4
	umlal	r10, r6, r1, r4
	umlal	r6, r7, r2, r4
	umlal	r7, r8, r3, r4
	// ([38-41], 10) blocks
	ldr	r3, [r12, #40]
	ldr	r4, [r14, #152]
	umlal	r9, r10, r4, r3
	umlal	r10, r6, r5, r3
	umlal	r6, r7, r1, r3
	umlal	r7, r8, r2, r3
	// ([37-40], 11) blocks
	ldr	r2, [r12, #44]
	ldr	r3, [r14, #148]
	umlal	r9, r10, r3, r2
	umlal	r10, r6, r4, r2
	umlal	r6, r7, r5, r2
	umlal	r7, r8, r1, r2
	// ([36-39], 12) blocks
	ldr	r1, [r12, #48]
	ldr	r2, [r14, #144]
	umlal	r9, r10, r2, r1
	umlal	r10, r6, r3, r1
	umlal	r6, r7, r4, r1
	umlal	r7, r8, r5, r1
	// ([35-38], 13) blocks
	ldr	r5, [r12, #52]
	ldr	r1, [r14, #140]
	umlal	r9, r10, r1, r5
	umlal	r10, r6, r2, r5
	umlal	r6, r7, r3, r5
	umlal	r7, r8, r4, r5
	// ([34-37], 14) blocks
	ldr	r4, [r12, #56]
	ldr	r5, [r14, #136]
	umlal	r9, r10, r5, r4
	umlal	r10, r6, r1, r4
	umlal	r6, r7, r2, r4
	umlal	r7, r8, r3, r4
	and	r4, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r4, LSR #4	// range < 31
	and	r4, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r4, LSR #4	// range < 31
	and	r4, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r4, LSR #4	// range < 31
	and	r4, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r4, LSR #4	// range < 31
	// ([33-36], 15) blocks
	ldr	r3, [r12, #60]
	ldr	r4, [r14, #132]
	umlal	r9, r10, r4, r3
	umlal	r10, r6, r5, r3
	umlal	r6, r7, r1, r3
	umlal	r7, r8, r2, r3
	str.w r10, [r0, #4]
	str.w r6, [r0, #8]
	str.w r7, [r0, #12]
	str.w r9, [r0], #16
	// ([52-55], 0) blocks
	ldr	r2, [r12]
	ldr	r1, [r14, #220]
	ldr	r5, [r14, #216]
	ldr	r4, [r14, #212]
	ldr	r3, [r14, #208]
	umull	r9, r10, r4, r2
	umull	r6, r7, r1, r2
	umlal	r8, r9, r3, r2
	umlal	r10, r6, r5, r2
	// ([51-54], 1) blocks
	ldr	r1, [r12, #4]
	ldr	r2, [r14, #204]
	umlal	r8, r9, r2, r1
	umlal	r9, r10, r3, r1
	umlal	r10, r6, r4, r1
	umlal	r6, r7, r5, r1
	// ([50-53], 2) blocks
	ldr	r5, [r12, #8]
	ldr	r1, [r14, #200]
	umlal	r8, r9, r1, r5
	umlal	r9, r10, r2, r5
	umlal	r10, r6, r3, r5
	umlal	r6, r7, r4, r5
	// ([49-52], 3) blocks
	ldr	r4, [r12, #12]
	ldr	r5, [r14, #196]
	umlal	r8, r9, r5, r4
	umlal	r9, r10, r1, r4
	umlal	r10, r6, r2, r4
	umlal	r6, r7, r3, r4
	// ([48-51], 4) blocks
	ldr	r3, [r12, #16]
	ldr	r4, [r14, #192]
	umlal	r8, r9, r4, r3
	umlal	r9, r10, r5, r3
	umlal	r10, r6, r1, r3
	umlal	r6, r7, r2, r3
	// ([47-50], 5) blocks
	ldr	r2, [r12, #20]
	ldr	r3, [r14, #188]
	umlal	r8, r9, r3, r2
	umlal	r9, r10, r4, r2
	umlal	r10, r6, r5, r2
	umlal	r6, r7, r1, r2
	// ([46-49], 6) blocks
	ldr	r1, [r12, #24]
	ldr	r2, [r14, #184]
	umlal	r8, r9, r2, r1
	umlal	r9, r10, r3, r1
	umlal	r10, r6, r4, r1
	umlal	r6, r7, r5, r1
	// ([45-48], 7) blocks
	ldr	r5, [r12, #28]
	ldr	r1, [r14, #180]
	umlal	r8, r9, r1, r5
	umlal	r9, r10, r2, r5
	umlal	r10, r6, r3, r5
	umlal	r6, r7, r4, r5
	// ([44-47], 8) blocks
	ldr	r4, [r12, #32]
	ldr	r5, [r14, #176]
	umlal	r8, r9, r5, r4
	umlal	r9, r10, r1, r4
	umlal	r10, r6, r2, r4
	umlal	r6, r7, r3, r4
	// ([43-46], 9) blocks
	ldr	r3, [r12, #36]
	ldr	r4, [r14, #172]
	umlal	r8, r9, r4, r3
	umlal	r9, r10, r5, r3
	umlal	r10, r6, r1, r3
	umlal	r6, r7, r2, r3
	// ([42-45], 10) blocks
	ldr	r2, [r12, #40]
	ldr	r3, [r14, #168]
	umlal	r8, r9, r3, r2
	umlal	r9, r10, r4, r2
	umlal	r10, r6, r5, r2
	umlal	r6, r7, r1, r2
	// ([41-44], 11) blocks
	ldr	r1, [r12, #44]
	ldr	r2, [r14, #164]
	umlal	r8, r9, r2, r1
	umlal	r9, r10, r3, r1
	umlal	r10, r6, r4, r1
	umlal	r6, r7, r5, r1
	// ([40-43], 12) blocks
	ldr	r5, [r12, #48]
	ldr	r1, [r14, #160]
	umlal	r8, r9, r1, r5
	umlal	r9, r10, r2, r5
	umlal	r10, r6, r3, r5
	umlal	r6, r7, r4, r5
	// ([39-42], 13) blocks
	ldr	r4, [r12, #52]
	ldr	r5, [r14, #156]
	umlal	r8, r9, r5, r4
	umlal	r9, r10, r1, r4
	umlal	r10, r6, r2, r4
	umlal	r6, r7, r3, r4
	// ([38-41], 14) blocks
	ldr	r3, [r12, #56]
	ldr	r4, [r14, #152]
	umlal	r8, r9, r4, r3
	umlal	r9, r10, r5, r3
	umlal	r10, r6, r1, r3
	umlal	r6, r7, r2, r3
	and	r3, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r3, LSR #4	// range < 31
	and	r3, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r3, LSR #4	// range < 31
	and	r3, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r3, LSR #4	// range < 31
	and	r3, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r3, LSR #4	// range < 31
	// ([37-40], 15) blocks
	ldr	r2, [r12, #60]
	ldr	r3, [r14, #148]
	umlal	r8, r9, r3, r2
	umlal	r9, r10, r4, r2
	umlal	r10, r6, r5, r2
	umlal	r6, r7, r1, r2
	str.w r9, [r0, #4]
	str.w r10, [r0, #8]
	str.w r6, [r0, #12]
	str.w r8, [r0], #16
mul_640:
	// ([56-59], 0) blocks
	ldr	r1, [r12]
	ldr	r5, [r14, #236]
	ldr	r4, [r14, #232]
	ldr	r3, [r14, #228]
	ldr	r2, [r14, #224]
	umull	r8, r9, r3, r1
	umull	r10, r6, r5, r1
	umlal	r7, r8, r2, r1
	umlal	r9, r10, r4, r1
	// ([55-58], 1) blocks
	ldr	r5, [r12, #4]
	ldr	r1, [r14, #220]
	umlal	r7, r8, r1, r5
	umlal	r8, r9, r2, r5
	umlal	r9, r10, r3, r5
	umlal	r10, r6, r4, r5
	// ([54-57], 2) blocks
	ldr	r4, [r12, #8]
	ldr	r5, [r14, #216]
	umlal	r7, r8, r5, r4
	umlal	r8, r9, r1, r4
	umlal	r9, r10, r2, r4
	umlal	r10, r6, r3, r4
	// ([53-56], 3) blocks
	ldr	r3, [r12, #12]
	ldr	r4, [r14, #212]
	umlal	r7, r8, r4, r3
	umlal	r8, r9, r5, r3
	umlal	r9, r10, r1, r3
	umlal	r10, r6, r2, r3
	// ([52-55], 4) blocks
	ldr	r2, [r12, #16]
	ldr	r3, [r14, #208]
	umlal	r7, r8, r3, r2
	umlal	r8, r9, r4, r2
	umlal	r9, r10, r5, r2
	umlal	r10, r6, r1, r2
	// ([51-54], 5) blocks
	ldr	r1, [r12, #20]
	ldr	r2, [r14, #204]
	umlal	r7, r8, r2, r1
	umlal	r8, r9, r3, r1
	umlal	r9, r10, r4, r1
	umlal	r10, r6, r5, r1
	// ([50-53], 6) blocks
	ldr	r5, [r12, #24]
	ldr	r1, [r14, #200]
	umlal	r7, r8, r1, r5
	umlal	r8, r9, r2, r5
	umlal	r9, r10, r3, r5
	umlal	r10, r6, r4, r5
	// ([49-52], 7) blocks
	ldr	r4, [r12, #28]
	ldr	r5, [r14, #196]
	umlal	r7, r8, r5, r4
	umlal	r8, r9, r1, r4
	umlal	r9, r10, r2, r4
	umlal	r10, r6, r3, r4
	// ([48-51], 8) blocks
	ldr	r3, [r12, #32]
	ldr	r4, [r14, #192]
	umlal	r7, r8, r4, r3
	umlal	r8, r9, r5, r3
	umlal	r9, r10, r1, r3
	umlal	r10, r6, r2, r3
	// ([47-50], 9) blocks
	ldr	r2, [r12, #36]
	ldr	r3, [r14, #188]
	umlal	r7, r8, r3, r2
	umlal	r8, r9, r4, r2
	umlal	r9, r10, r5, r2
	umlal	r10, r6, r1, r2
	// ([46-49], 10) blocks
	ldr	r1, [r12, #40]
	ldr	r2, [r14, #184]
	umlal	r7, r8, r2, r1
	umlal	r8, r9, r3, r1
	umlal	r9, r10, r4, r1
	umlal	r10, r6, r5, r1
	// ([45-48], 11) blocks
	ldr	r5, [r12, #44]
	ldr	r1, [r14, #180]
	umlal	r7, r8, r1, r5
	umlal	r8, r9, r2, r5
	umlal	r9, r10, r3, r5
	umlal	r10, r6, r4, r5
	// ([44-47], 12) blocks
	ldr	r4, [r12, #48]
	ldr	r5, [r14, #176]
	umlal	r7, r8, r5, r4
	umlal	r8, r9, r1, r4
	umlal	r9, r10, r2, r4
	umlal	r10, r6, r3, r4
	// ([43-46], 13) blocks
	ldr	r3, [r12, #52]
	ldr	r4, [r14, #172]
	umlal	r7, r8, r4, r3
	umlal	r8, r9, r5, r3
	umlal	r9, r10, r1, r3
	umlal	r10, r6, r2, r3
	// ([42-45], 14) blocks
	ldr	r2, [r12, #56]
	ldr	r3, [r14, #168]
	umlal	r7, r8, r3, r2
	umlal	r8, r9, r4, r2
	umlal	r9, r10, r5, r2
	umlal	r10, r6, r1, r2
	and	r2, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r2, LSR #4	// range < 31
	and	r2, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r2, LSR #4	// range < 31
	and	r2, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r2, LSR #4	// range < 31
	and	r2, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r2, LSR #4	// range < 31
	// ([41-44], 15) blocks
	ldr	r1, [r12, #60]
	ldr	r2, [r14, #164]
	umlal	r7, r8, r2, r1
	umlal	r8, r9, r3, r1
	umlal	r9, r10, r4, r1
	umlal	r10, r6, r5, r1
	str.w r8, [r0, #4]
	str.w r9, [r0, #8]
	str.w r10, [r0, #12]
	str.w r7, [r0], #16
	// ([60-63], 0) blocks
	ldr	r5, [r12]
	ldr	r4, [r14, #252]
	ldr	r3, [r14, #248]
	ldr	r2, [r14, #244]
	ldr	r1, [r14, #240]
	umull	r7, r8, r2, r5
	umull	r9, r10, r4, r5
	umlal	r6, r7, r1, r5
	umlal	r8, r9, r3, r5
	// ([59-62], 1) blocks
	ldr	r4, [r12, #4]
	ldr	r5, [r14, #236]
	umlal	r6, r7, r5, r4
	umlal	r7, r8, r1, r4
	umlal	r8, r9, r2, r4
	umlal	r9, r10, r3, r4
	// ([58-61], 2) blocks
	ldr	r3, [r12, #8]
	ldr	r4, [r14, #232]
	umlal	r6, r7, r4, r3
	umlal	r7, r8, r5, r3
	umlal	r8, r9, r1, r3
	umlal	r9, r10, r2, r3
	// ([57-60], 3) blocks
	ldr	r2, [r12, #12]
	ldr	r3, [r14, #228]
	umlal	r6, r7, r3, r2
	umlal	r7, r8, r4, r2
	umlal	r8, r9, r5, r2
	umlal	r9, r10, r1, r2
	// ([56-59], 4) blocks
	ldr	r1, [r12, #16]
	ldr	r2, [r14, #224]
	umlal	r6, r7, r2, r1
	umlal	r7, r8, r3, r1
	umlal	r8, r9, r4, r1
	umlal	r9, r10, r5, r1
	// ([55-58], 5) blocks
	ldr	r5, [r12, #20]
	ldr	r1, [r14, #220]
	umlal	r6, r7, r1, r5
	umlal	r7, r8, r2, r5
	umlal	r8, r9, r3, r5
	umlal	r9, r10, r4, r5
	// ([54-57], 6) blocks
	ldr	r4, [r12, #24]
	ldr	r5, [r14, #216]
	umlal	r6, r7, r5, r4
	umlal	r7, r8, r1, r4
	umlal	r8, r9, r2, r4
	umlal	r9, r10, r3, r4
	// ([53-56], 7) blocks
	ldr	r3, [r12, #28]
	ldr	r4, [r14, #212]
	umlal	r6, r7, r4, r3
	umlal	r7, r8, r5, r3
	umlal	r8, r9, r1, r3
	umlal	r9, r10, r2, r3
	// ([52-55], 8) blocks
	ldr	r2, [r12, #32]
	ldr	r3, [r14, #208]
	umlal	r6, r7, r3, r2
	umlal	r7, r8, r4, r2
	umlal	r8, r9, r5, r2
	umlal	r9, r10, r1, r2
	// ([51-54], 9) blocks
	ldr	r1, [r12, #36]
	ldr	r2, [r14, #204]
	umlal	r6, r7, r2, r1
	umlal	r7, r8, r3, r1
	umlal	r8, r9, r4, r1
	umlal	r9, r10, r5, r1
	// ([50-53], 10) blocks
	ldr	r5, [r12, #40]
	ldr	r1, [r14, #200]
	umlal	r6, r7, r1, r5
	umlal	r7, r8, r2, r5
	umlal	r8, r9, r3, r5
	umlal	r9, r10, r4, r5
	// ([49-52], 11) blocks
	ldr	r4, [r12, #44]
	ldr	r5, [r14, #196]
	umlal	r6, r7, r5, r4
	umlal	r7, r8, r1, r4
	umlal	r8, r9, r2, r4
	umlal	r9, r10, r3, r4
	// ([48-51], 12) blocks
	ldr	r3, [r12, #48]
	ldr	r4, [r14, #192]
	umlal	r6, r7, r4, r3
	umlal	r7, r8, r5, r3
	umlal	r8, r9, r1, r3
	umlal	r9, r10, r2, r3
	// ([47-50], 13) blocks
	ldr	r2, [r12, #52]
	ldr	r3, [r14, #188]
	umlal	r6, r7, r3, r2
	umlal	r7, r8, r4, r2
	umlal	r8, r9, r5, r2
	umlal	r9, r10, r1, r2
	// ([46-49], 14) blocks
	ldr	r1, [r12, #56]
	ldr	r2, [r14, #184]
	umlal	r6, r7, r2, r1
	umlal	r7, r8, r3, r1
	umlal	r8, r9, r4, r1
	umlal	r9, r10, r5, r1
	and	r1, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r1, LSR #4	// range < 31
	and	r1, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r1, LSR #4	// range < 31
	and	r1, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r1, LSR #4	// range < 31
	and	r1, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r1, LSR #4	// range < 31
	// ([45-48], 15) blocks
	ldr	r5, [r12, #60]
	ldr	r1, [r14, #180]
	umlal	r6, r7, r1, r5
	umlal	r7, r8, r2, r5
	umlal	r8, r9, r3, r5
	umlal	r9, r10, r4, r5
	str.w r7, [r0, #4]
	str.w r8, [r0, #8]
	str.w r9, [r0, #12]
	str.w r6, [r0], #16
	// ([64-67], 0) blocks
	ldr	r4, [r12]
	ldr	r3, [r14, #268]
	ldr	r2, [r14, #264]
	ldr	r1, [r14, #260]
	ldr	r5, [r14, #256]
	umull	r6, r7, r1, r4
	umull	r8, r9, r3, r4
	umlal	r10, r6, r5, r4
	umlal	r7, r8, r2, r4
	// ([63-66], 1) blocks
	ldr	r3, [r12, #4]
	ldr	r4, [r14, #252]
	umlal	r10, r6, r4, r3
	umlal	r6, r7, r5, r3
	umlal	r7, r8, r1, r3
	umlal	r8, r9, r2, r3
	// ([62-65], 2) blocks
	ldr	r2, [r12, #8]
	ldr	r3, [r14, #248]
	umlal	r10, r6, r3, r2
	umlal	r6, r7, r4, r2
	umlal	r7, r8, r5, r2
	umlal	r8, r9, r1, r2
	// ([61-64], 3) blocks
	ldr	r1, [r12, #12]
	ldr	r2, [r14, #244]
	umlal	r10, r6, r2, r1
	umlal	r6, r7, r3, r1
	umlal	r7, r8, r4, r1
	umlal	r8, r9, r5, r1
	// ([60-63], 4) blocks
	ldr	r5, [r12, #16]
	ldr	r1, [r14, #240]
	umlal	r10, r6, r1, r5
	umlal	r6, r7, r2, r5
	umlal	r7, r8, r3, r5
	umlal	r8, r9, r4, r5
	// ([59-62], 5) blocks
	ldr	r4, [r12, #20]
	ldr	r5, [r14, #236]
	umlal	r10, r6, r5, r4
	umlal	r6, r7, r1, r4
	umlal	r7, r8, r2, r4
	umlal	r8, r9, r3, r4
	// ([58-61], 6) blocks
	ldr	r3, [r12, #24]
	ldr	r4, [r14, #232]
	umlal	r10, r6, r4, r3
	umlal	r6, r7, r5, r3
	umlal	r7, r8, r1, r3
	umlal	r8, r9, r2, r3
	// ([57-60], 7) blocks
	ldr	r2, [r12, #28]
	ldr	r3, [r14, #228]
	umlal	r10, r6, r3, r2
	umlal	r6, r7, r4, r2
	umlal	r7, r8, r5, r2
	umlal	r8, r9, r1, r2
	// ([56-59], 8) blocks
	ldr	r1, [r12, #32]
	ldr	r2, [r14, #224]
	umlal	r10, r6, r2, r1
	umlal	r6, r7, r3, r1
	umlal	r7, r8, r4, r1
	umlal	r8, r9, r5, r1
	// ([55-58], 9) blocks
	ldr	r5, [r12, #36]
	ldr	r1, [r14, #220]
	umlal	r10, r6, r1, r5
	umlal	r6, r7, r2, r5
	umlal	r7, r8, r3, r5
	umlal	r8, r9, r4, r5
	// ([54-57], 10) blocks
	ldr	r4, [r12, #40]
	ldr	r5, [r14, #216]
	umlal	r10, r6, r5, r4
	umlal	r6, r7, r1, r4
	umlal	r7, r8, r2, r4
	umlal	r8, r9, r3, r4
	// ([53-56], 11) blocks
	ldr	r3, [r12, #44]
	ldr	r4, [r14, #212]
	umlal	r10, r6, r4, r3
	umlal	r6, r7, r5, r3
	umlal	r7, r8, r1, r3
	umlal	r8, r9, r2, r3
	// ([52-55], 12) blocks
	ldr	r2, [r12, #48]
	ldr	r3, [r14, #208]
	umlal	r10, r6, r3, r2
	umlal	r6, r7, r4, r2
	umlal	r7, r8, r5, r2
	umlal	r8, r9, r1, r2
	// ([51-54], 13) blocks
	ldr	r1, [r12, #52]
	ldr	r2, [r14, #204]
	umlal	r10, r6, r2, r1
	umlal	r6, r7, r3, r1
	umlal	r7, r8, r4, r1
	umlal	r8, r9, r5, r1
	// ([50-53], 14) blocks
	ldr	r5, [r12, #56]
	ldr	r1, [r14, #200]
	umlal	r10, r6, r1, r5
	umlal	r6, r7, r2, r5
	umlal	r7, r8, r3, r5
	umlal	r8, r9, r4, r5
	and	r5, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r5, LSR #4	// range < 31
	and	r5, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r5, LSR #4	// range < 31
	and	r5, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r5, LSR #4	// range < 31
	and	r5, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r5, LSR #4	// range < 31
	// ([49-52], 15) blocks
	ldr	r4, [r12, #60]
	ldr	r5, [r14, #196]
	umlal	r10, r6, r5, r4
	umlal	r6, r7, r1, r4
	umlal	r7, r8, r2, r4
	umlal	r8, r9, r3, r4
	str.w r6, [r0, #4]
	str.w r7, [r0, #8]
	str.w r8, [r0, #12]
	str.w r10, [r0], #16
	// ([68-71], 0) blocks
	ldr	r3, [r12]
	ldr	r2, [r14, #284]
	ldr	r1, [r14, #280]
	ldr	r5, [r14, #276]
	ldr	r4, [r14, #272]
	umull	r10, r6, r5, r3
	umull	r7, r8, r2, r3
	umlal	r9, r10, r4, r3
	umlal	r6, r7, r1, r3
	// ([67-70], 1) blocks
	ldr	r2, [r12, #4]
	ldr	r3, [r14, #268]
	umlal	r9, r10, r3, r2
	umlal	r10, r6, r4, r2
	umlal	r6, r7, r5, r2
	umlal	r7, r8, r1, r2
	// ([66-69], 2) blocks
	ldr	r1, [r12, #8]
	ldr	r2, [r14, #264]
	umlal	r9, r10, r2, r1
	umlal	r10, r6, r3, r1
	umlal	r6, r7, r4, r1
	umlal	r7, r8, r5, r1
	// ([65-68], 3) blocks
	ldr	r5, [r12, #12]
	ldr	r1, [r14, #260]
	umlal	r9, r10, r1, r5
	umlal	r10, r6, r2, r5
	umlal	r6, r7, r3, r5
	umlal	r7, r8, r4, r5
	// ([64-67], 4) blocks
	ldr	r4, [r12, #16]
	ldr	r5, [r14, #256]
	umlal	r9, r10, r5, r4
	umlal	r10, r6, r1, r4
	umlal	r6, r7, r2, r4
	umlal	r7, r8, r3, r4
	// ([63-66], 5) blocks
	ldr	r3, [r12, #20]
	ldr	r4, [r14, #252]
	umlal	r9, r10, r4, r3
	umlal	r10, r6, r5, r3
	umlal	r6, r7, r1, r3
	umlal	r7, r8, r2, r3
	// ([62-65], 6) blocks
	ldr	r2, [r12, #24]
	ldr	r3, [r14, #248]
	umlal	r9, r10, r3, r2
	umlal	r10, r6, r4, r2
	umlal	r6, r7, r5, r2
	umlal	r7, r8, r1, r2
	// ([61-64], 7) blocks
	ldr	r1, [r12, #28]
	ldr	r2, [r14, #244]
	umlal	r9, r10, r2, r1
	umlal	r10, r6, r3, r1
	umlal	r6, r7, r4, r1
	umlal	r7, r8, r5, r1
	// ([60-63], 8) blocks
	ldr	r5, [r12, #32]
	ldr	r1, [r14, #240]
	umlal	r9, r10, r1, r5
	umlal	r10, r6, r2, r5
	umlal	r6, r7, r3, r5
	umlal	r7, r8, r4, r5
	// ([59-62], 9) blocks
	ldr	r4, [r12, #36]
	ldr	r5, [r14, #236]
	umlal	r9, r10, r5, r4
	umlal	r10, r6, r1, r4
	umlal	r6, r7, r2, r4
	umlal	r7, r8, r3, r4
	// ([58-61], 10) blocks
	ldr	r3, [r12, #40]
	ldr	r4, [r14, #232]
	umlal	r9, r10, r4, r3
	umlal	r10, r6, r5, r3
	umlal	r6, r7, r1, r3
	umlal	r7, r8, r2, r3
	// ([57-60], 11) blocks
	ldr	r2, [r12, #44]
	ldr	r3, [r14, #228]
	umlal	r9, r10, r3, r2
	umlal	r10, r6, r4, r2
	umlal	r6, r7, r5, r2
	umlal	r7, r8, r1, r2
	// ([56-59], 12) blocks
	ldr	r1, [r12, #48]
	ldr	r2, [r14, #224]
	umlal	r9, r10, r2, r1
	umlal	r10, r6, r3, r1
	umlal	r6, r7, r4, r1
	umlal	r7, r8, r5, r1
	// ([55-58], 13) blocks
	ldr	r5, [r12, #52]
	ldr	r1, [r14, #220]
	umlal	r9, r10, r1, r5
	umlal	r10, r6, r2, r5
	umlal	r6, r7, r3, r5
	umlal	r7, r8, r4, r5
	// ([54-57], 14) blocks
	ldr	r4, [r12, #56]
	ldr	r5, [r14, #216]
	umlal	r9, r10, r5, r4
	umlal	r10, r6, r1, r4
	umlal	r6, r7, r2, r4
	umlal	r7, r8, r3, r4
	and	r4, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r4, LSR #4	// range < 31
	and	r4, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r4, LSR #4	// range < 31
	and	r4, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r4, LSR #4	// range < 31
	and	r4, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r4, LSR #4	// range < 31
	// ([53-56], 15) blocks
	ldr	r3, [r12, #60]
	ldr	r4, [r14, #212]
	umlal	r9, r10, r4, r3
	umlal	r10, r6, r5, r3
	umlal	r6, r7, r1, r3
	umlal	r7, r8, r2, r3
	str.w r10, [r0, #4]
	str.w r6, [r0, #8]
	str.w r7, [r0, #12]
	str.w r9, [r0], #16
mul_576:
	// ([72-75], 0) blocks
	ldr	r2, [r12]
	ldr	r1, [r14, #300]
	ldr	r5, [r14, #296]
	ldr	r4, [r14, #292]
	ldr	r3, [r14, #288]
	umull	r9, r10, r4, r2
	umull	r6, r7, r1, r2
	umlal	r8, r9, r3, r2
	umlal	r10, r6, r5, r2
	// ([71-74], 1) blocks
	ldr	r1, [r12, #4]
	ldr	r2, [r14, #284]
	umlal	r8, r9, r2, r1
	umlal	r9, r10, r3, r1
	umlal	r10, r6, r4, r1
	umlal	r6, r7, r5, r1
	// ([70-73], 2) blocks
	ldr	r5, [r12, #8]
	ldr	r1, [r14, #280]
	umlal	r8, r9, r1, r5
	umlal	r9, r10, r2, r5
	umlal	r10, r6, r3, r5
	umlal	r6, r7, r4, r5
	// ([69-72], 3) blocks
	ldr	r4, [r12, #12]
	ldr	r5, [r14, #276]
	umlal	r8, r9, r5, r4
	umlal	r9, r10, r1, r4
	umlal	r10, r6, r2, r4
	umlal	r6, r7, r3, r4
	// ([68-71], 4) blocks
	ldr	r3, [r12, #16]
	ldr	r4, [r14, #272]
	umlal	r8, r9, r4, r3
	umlal	r9, r10, r5, r3
	umlal	r10, r6, r1, r3
	umlal	r6, r7, r2, r3
	// ([67-70], 5) blocks
	ldr	r2, [r12, #20]
	ldr	r3, [r14, #268]
	umlal	r8, r9, r3, r2
	umlal	r9, r10, r4, r2
	umlal	r10, r6, r5, r2
	umlal	r6, r7, r1, r2
	// ([66-69], 6) blocks
	ldr	r1, [r12, #24]
	ldr	r2, [r14, #264]
	umlal	r8, r9, r2, r1
	umlal	r9, r10, r3, r1
	umlal	r10, r6, r4, r1
	umlal	r6, r7, r5, r1
	// ([65-68], 7) blocks
	ldr	r5, [r12, #28]
	ldr	r1, [r14, #260]
	umlal	r8, r9, r1, r5
	umlal	r9, r10, r2, r5
	umlal	r10, r6, r3, r5
	umlal	r6, r7, r4, r5
	// ([64-67], 8) blocks
	ldr	r4, [r12, #32]
	ldr	r5, [r14, #256]
	umlal	r8, r9, r5, r4
	umlal	r9, r10, r1, r4
	umlal	r10, r6, r2, r4
	umlal	r6, r7, r3, r4
	// ([63-66], 9) blocks
	ldr	r3, [r12, #36]
	ldr	r4, [r14, #252]
	umlal	r8, r9, r4, r3
	umlal	r9, r10, r5, r3
	umlal	r10, r6, r1, r3
	umlal	r6, r7, r2, r3
	// ([62-65], 10) blocks
	ldr	r2, [r12, #40]
	ldr	r3, [r14, #248]
	umlal	r8, r9, r3, r2
	umlal	r9, r10, r4, r2
	umlal	r10, r6, r5, r2
	umlal	r6, r7, r1, r2
	// ([61-64], 11) blocks
	ldr	r1, [r12, #44]
	ldr	r2, [r14, #244]
	umlal	r8, r9, r2, r1
	umlal	r9, r10, r3, r1
	umlal	r10, r6, r4, r1
	umlal	r6, r7, r5, r1
	// ([60-63], 12) blocks
	ldr	r5, [r12, #48]
	ldr	r1, [r14, #240]
	umlal	r8, r9, r1, r5
	umlal	r9, r10, r2, r5
	umlal	r10, r6, r3, r5
	umlal	r6, r7, r4, r5
	// ([59-62], 13) blocks
	ldr	r4, [r12, #52]
	ldr	r5, [r14, #236]
	umlal	r8, r9, r5, r4
	umlal	r9, r10, r1, r4
	umlal	r10, r6, r2, r4
	umlal	r6, r7, r3, r4
	// ([58-61], 14) blocks
	ldr	r3, [r12, #56]
	ldr	r4, [r14, #232]
	umlal	r8, r9, r4, r3
	umlal	r9, r10, r5, r3
	umlal	r10, r6, r1, r3
	umlal	r6, r7, r2, r3
	and	r3, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r3, LSR #4	// range < 31
	and	r3, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r3, LSR #4	// range < 31
	and	r3, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r3, LSR #4	// range < 31
	and	r3, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r3, LSR #4	// range < 31
	// ([57-60], 15) blocks
	ldr	r2, [r12, #60]
	ldr	r3, [r14, #228]
	umlal	r8, r9, r3, r2
	umlal	r9, r10, r4, r2
	umlal	r10, r6, r5, r2
	umlal	r6, r7, r1, r2
	str.w r9, [r0, #4]
	str.w r10, [r0, #8]
	str.w r6, [r0, #12]
	str.w r8, [r0], #16
	// ([76-79], 0) blocks
	ldr	r1, [r12]
	ldr	r5, [r14, #316]
	ldr	r4, [r14, #312]
	ldr	r3, [r14, #308]
	ldr	r2, [r14, #304]
	umull	r8, r9, r3, r1
	umull	r10, r6, r5, r1
	umlal	r7, r8, r2, r1
	umlal	r9, r10, r4, r1
	// ([75-78], 1) blocks
	ldr	r5, [r12, #4]
	ldr	r1, [r14, #300]
	umlal	r7, r8, r1, r5
	umlal	r8, r9, r2, r5
	umlal	r9, r10, r3, r5
	umlal	r10, r6, r4, r5
	// ([74-77], 2) blocks
	ldr	r4, [r12, #8]
	ldr	r5, [r14, #296]
	umlal	r7, r8, r5, r4
	umlal	r8, r9, r1, r4
	umlal	r9, r10, r2, r4
	umlal	r10, r6, r3, r4
	// ([73-76], 3) blocks
	ldr	r3, [r12, #12]
	ldr	r4, [r14, #292]
	umlal	r7, r8, r4, r3
	umlal	r8, r9, r5, r3
	umlal	r9, r10, r1, r3
	umlal	r10, r6, r2, r3
	// ([72-75], 4) blocks
	ldr	r2, [r12, #16]
	ldr	r3, [r14, #288]
	umlal	r7, r8, r3, r2
	umlal	r8, r9, r4, r2
	umlal	r9, r10, r5, r2
	umlal	r10, r6, r1, r2
	// ([71-74], 5) blocks
	ldr	r1, [r12, #20]
	ldr	r2, [r14, #284]
	umlal	r7, r8, r2, r1
	umlal	r8, r9, r3, r1
	umlal	r9, r10, r4, r1
	umlal	r10, r6, r5, r1
	// ([70-73], 6) blocks
	ldr	r5, [r12, #24]
	ldr	r1, [r14, #280]
	umlal	r7, r8, r1, r5
	umlal	r8, r9, r2, r5
	umlal	r9, r10, r3, r5
	umlal	r10, r6, r4, r5
	// ([69-72], 7) blocks
	ldr	r4, [r12, #28]
	ldr	r5, [r14, #276]
	umlal	r7, r8, r5, r4
	umlal	r8, r9, r1, r4
	umlal	r9, r10, r2, r4
	umlal	r10, r6, r3, r4
	// ([68-71], 8) blocks
	ldr	r3, [r12, #32]
	ldr	r4, [r14, #272]
	umlal	r7, r8, r4, r3
	umlal	r8, r9, r5, r3
	umlal	r9, r10, r1, r3
	umlal	r10, r6, r2, r3
	// ([67-70], 9) blocks
	ldr	r2, [r12, #36]
	ldr	r3, [r14, #268]
	umlal	r7, r8, r3, r2
	umlal	r8, r9, r4, r2
	umlal	r9, r10, r5, r2
	umlal	r10, r6, r1, r2
	// ([66-69], 10) blocks
	ldr	r1, [r12, #40]
	ldr	r2, [r14, #264]
	umlal	r7, r8, r2, r1
	umlal	r8, r9, r3, r1
	umlal	r9, r10, r4, r1
	umlal	r10, r6, r5, r1
	// ([65-68], 11) blocks
	ldr	r5, [r12, #44]
	ldr	r1, [r14, #260]
	umlal	r7, r8, r1, r5
	umlal	r8, r9, r2, r5
	umlal	r9, r10, r3, r5
	umlal	r10, r6, r4, r5
	// ([64-67], 12) blocks
	ldr	r4, [r12, #48]
	ldr	r5, [r14, #256]
	umlal	r7, r8, r5, r4
	umlal	r8, r9, r1, r4
	umlal	r9, r10, r2, r4
	umlal	r10, r6, r3, r4
	// ([63-66], 13) blocks
	ldr	r3, [r12, #52]
	ldr	r4, [r14, #252]
	umlal	r7, r8, r4, r3
	umlal	r8, r9, r5, r3
	umlal	r9, r10, r1, r3
	umlal	r10, r6, r2, r3
	// ([62-65], 14) blocks
	ldr	r2, [r12, #56]
	ldr	r3, [r14, #248]
	umlal	r7, r8, r3, r2
	umlal	r8, r9, r4, r2
	umlal	r9, r10, r5, r2
	umlal	r10, r6, r1, r2
	and	r2, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r2, LSR #4	// range < 31
	and	r2, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r2, LSR #4	// range < 31
	and	r2, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r2, LSR #4	// range < 31
	and	r2, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r2, LSR #4	// range < 31
	// ([61-64], 15) blocks
	ldr	r1, [r12, #60]
	ldr	r2, [r14, #244]
	umlal	r7, r8, r2, r1
	umlal	r8, r9, r3, r1
	umlal	r9, r10, r4, r1
	umlal	r10, r6, r5, r1
	str.w r8, [r0, #4]
	str.w r9, [r0, #8]
	str.w r10, [r0, #12]
	str.w r7, [r0], #16
	// ([80-83], 0) blocks
	ldr	r5, [r12]
	ldr	r4, [r14, #332]
	ldr	r3, [r14, #328]
	ldr	r2, [r14, #324]
	ldr	r1, [r14, #320]
	umull	r7, r8, r2, r5
	umull	r9, r10, r4, r5
	umlal	r6, r7, r1, r5
	umlal	r8, r9, r3, r5
	// ([79-82], 1) blocks
	ldr	r4, [r12, #4]
	ldr	r5, [r14, #316]
	umlal	r6, r7, r5, r4
	umlal	r7, r8, r1, r4
	umlal	r8, r9, r2, r4
	umlal	r9, r10, r3, r4
	// ([78-81], 2) blocks
	ldr	r3, [r12, #8]
	ldr	r4, [r14, #312]
	umlal	r6, r7, r4, r3
	umlal	r7, r8, r5, r3
	umlal	r8, r9, r1, r3
	umlal	r9, r10, r2, r3
	// ([77-80], 3) blocks
	ldr	r2, [r12, #12]
	ldr	r3, [r14, #308]
	umlal	r6, r7, r3, r2
	umlal	r7, r8, r4, r2
	umlal	r8, r9, r5, r2
	umlal	r9, r10, r1, r2
	// ([76-79], 4) blocks
	ldr	r1, [r12, #16]
	ldr	r2, [r14, #304]
	umlal	r6, r7, r2, r1
	umlal	r7, r8, r3, r1
	umlal	r8, r9, r4, r1
	umlal	r9, r10, r5, r1
	// ([75-78], 5) blocks
	ldr	r5, [r12, #20]
	ldr	r1, [r14, #300]
	umlal	r6, r7, r1, r5
	umlal	r7, r8, r2, r5
	umlal	r8, r9, r3, r5
	umlal	r9, r10, r4, r5
	// ([74-77], 6) blocks
	ldr	r4, [r12, #24]
	ldr	r5, [r14, #296]
	umlal	r6, r7, r5, r4
	umlal	r7, r8, r1, r4
	umlal	r8, r9, r2, r4
	umlal	r9, r10, r3, r4
	// ([73-76], 7) blocks
	ldr	r3, [r12, #28]
	ldr	r4, [r14, #292]
	umlal	r6, r7, r4, r3
	umlal	r7, r8, r5, r3
	umlal	r8, r9, r1, r3
	umlal	r9, r10, r2, r3
	// ([72-75], 8) blocks
	ldr	r2, [r12, #32]
	ldr	r3, [r14, #288]
	umlal	r6, r7, r3, r2
	umlal	r7, r8, r4, r2
	umlal	r8, r9, r5, r2
	umlal	r9, r10, r1, r2
	// ([71-74], 9) blocks
	ldr	r1, [r12, #36]
	ldr	r2, [r14, #284]
	umlal	r6, r7, r2, r1
	umlal	r7, r8, r3, r1
	umlal	r8, r9, r4, r1
	umlal	r9, r10, r5, r1
	// ([70-73], 10) blocks
	ldr	r5, [r12, #40]
	ldr	r1, [r14, #280]
	umlal	r6, r7, r1, r5
	umlal	r7, r8, r2, r5
	umlal	r8, r9, r3, r5
	umlal	r9, r10, r4, r5
	// ([69-72], 11) blocks
	ldr	r4, [r12, #44]
	ldr	r5, [r14, #276]
	umlal	r6, r7, r5, r4
	umlal	r7, r8, r1, r4
	umlal	r8, r9, r2, r4
	umlal	r9, r10, r3, r4
	// ([68-71], 12) blocks
	ldr	r3, [r12, #48]
	ldr	r4, [r14, #272]
	umlal	r6, r7, r4, r3
	umlal	r7, r8, r5, r3
	umlal	r8, r9, r1, r3
	umlal	r9, r10, r2, r3
	// ([67-70], 13) blocks
	ldr	r2, [r12, #52]
	ldr	r3, [r14, #268]
	umlal	r6, r7, r3, r2
	umlal	r7, r8, r4, r2
	umlal	r8, r9, r5, r2
	umlal	r9, r10, r1, r2
	// ([66-69], 14) blocks
	ldr	r1, [r12, #56]
	ldr	r2, [r14, #264]
	umlal	r6, r7, r2, r1
	umlal	r7, r8, r3, r1
	umlal	r8, r9, r4, r1
	umlal	r9, r10, r5, r1
	and	r1, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r1, LSR #4	// range < 31
	and	r1, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r1, LSR #4	// range < 31
	and	r1, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r1, LSR #4	// range < 31
	and	r1, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r1, LSR #4	// range < 31
	// ([65-68], 15) blocks
	ldr	r5, [r12, #60]
	ldr	r1, [r14, #260]
	umlal	r6, r7, r1, r5
	umlal	r7, r8, r2, r5
	umlal	r8, r9, r3, r5
	umlal	r9, r10, r4, r5
	str.w r7, [r0, #4]
	str.w r8, [r0, #8]
	str.w r9, [r0, #12]
	str.w r6, [r0], #16
	// ([84-87], 0) blocks
	ldr	r4, [r12]
	ldr	r3, [r14, #348]
	ldr	r2, [r14, #344]
	ldr	r1, [r14, #340]
	ldr	r5, [r14, #336]
	umull	r6, r7, r1, r4
	umull	r8, r9, r3, r4
	umlal	r10, r6, r5, r4
	umlal	r7, r8, r2, r4
	// ([83-86], 1) blocks
	ldr	r3, [r12, #4]
	ldr	r4, [r14, #332]
	umlal	r10, r6, r4, r3
	umlal	r6, r7, r5, r3
	umlal	r7, r8, r1, r3
	umlal	r8, r9, r2, r3
	// ([82-85], 2) blocks
	ldr	r2, [r12, #8]
	ldr	r3, [r14, #328]
	umlal	r10, r6, r3, r2
	umlal	r6, r7, r4, r2
	umlal	r7, r8, r5, r2
	umlal	r8, r9, r1, r2
	// ([81-84], 3) blocks
	ldr	r1, [r12, #12]
	ldr	r2, [r14, #324]
	umlal	r10, r6, r2, r1
	umlal	r6, r7, r3, r1
	umlal	r7, r8, r4, r1
	umlal	r8, r9, r5, r1
	// ([80-83], 4) blocks
	ldr	r5, [r12, #16]
	ldr	r1, [r14, #320]
	umlal	r10, r6, r1, r5
	umlal	r6, r7, r2, r5
	umlal	r7, r8, r3, r5
	umlal	r8, r9, r4, r5
	// ([79-82], 5) blocks
	ldr	r4, [r12, #20]
	ldr	r5, [r14, #316]
	umlal	r10, r6, r5, r4
	umlal	r6, r7, r1, r4
	umlal	r7, r8, r2, r4
	umlal	r8, r9, r3, r4
	// ([78-81], 6) blocks
	ldr	r3, [r12, #24]
	ldr	r4, [r14, #312]
	umlal	r10, r6, r4, r3
	umlal	r6, r7, r5, r3
	umlal	r7, r8, r1, r3
	umlal	r8, r9, r2, r3
	// ([77-80], 7) blocks
	ldr	r2, [r12, #28]
	ldr	r3, [r14, #308]
	umlal	r10, r6, r3, r2
	umlal	r6, r7, r4, r2
	umlal	r7, r8, r5, r2
	umlal	r8, r9, r1, r2
	// ([76-79], 8) blocks
	ldr	r1, [r12, #32]
	ldr	r2, [r14, #304]
	umlal	r10, r6, r2, r1
	umlal	r6, r7, r3, r1
	umlal	r7, r8, r4, r1
	umlal	r8, r9, r5, r1
	// ([75-78], 9) blocks
	ldr	r5, [r12, #36]
	ldr	r1, [r14, #300]
	umlal	r10, r6, r1, r5
	umlal	r6, r7, r2, r5
	umlal	r7, r8, r3, r5
	umlal	r8, r9, r4, r5
	// ([74-77], 10) blocks
	ldr	r4, [r12, #40]
	ldr	r5, [r14, #296]
	umlal	r10, r6, r5, r4
	umlal	r6, r7, r1, r4
	umlal	r7, r8, r2, r4
	umlal	r8, r9, r3, r4
	// ([73-76], 11) blocks
	ldr	r3, [r12, #44]
	ldr	r4, [r14, #292]
	umlal	r10, r6, r4, r3
	umlal	r6, r7, r5, r3
	umlal	r7, r8, r1, r3
	umlal	r8, r9, r2, r3
	// ([72-75], 12) blocks
	ldr	r2, [r12, #48]
	ldr	r3, [r14, #288]
	umlal	r10, r6, r3, r2
	umlal	r6, r7, r4, r2
	umlal	r7, r8, r5, r2
	umlal	r8, r9, r1, r2
	// ([71-74], 13) blocks
	ldr	r1, [r12, #52]
	ldr	r2, [r14, #284]
	umlal	r10, r6, r2, r1
	umlal	r6, r7, r3, r1
	umlal	r7, r8, r4, r1
	umlal	r8, r9, r5, r1
	// ([70-73], 14) blocks
	ldr	r5, [r12, #56]
	ldr	r1, [r14, #280]
	umlal	r10, r6, r1, r5
	umlal	r6, r7, r2, r5
	umlal	r7, r8, r3, r5
	umlal	r8, r9, r4, r5
	and	r5, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r5, LSR #4	// range < 31
	and	r5, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r5, LSR #4	// range < 31
	and	r5, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r5, LSR #4	// range < 31
	and	r5, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r5, LSR #4	// range < 31
	// ([69-72], 15) blocks
	ldr	r4, [r12, #60]
	ldr	r5, [r14, #276]
	umlal	r10, r6, r5, r4
	umlal	r6, r7, r1, r4
	umlal	r7, r8, r2, r4
	umlal	r8, r9, r3, r4
	str.w r6, [r0, #4]
	str.w r7, [r0, #8]
	str.w r8, [r0, #12]
	str.w r10, [r0], #16
mul_512:
	// ([88-91], 0) blocks
	ldr	r3, [r12]
	ldr	r2, [r14, #364]
	ldr	r1, [r14, #360]
	ldr	r5, [r14, #356]
	ldr	r4, [r14, #352]
	umull	r10, r6, r5, r3
	umull	r7, r8, r2, r3
	umlal	r9, r10, r4, r3
	umlal	r6, r7, r1, r3
	// ([87-90], 1) blocks
	ldr	r2, [r12, #4]
	ldr	r3, [r14, #348]
	umlal	r9, r10, r3, r2
	umlal	r10, r6, r4, r2
	umlal	r6, r7, r5, r2
	umlal	r7, r8, r1, r2
	// ([86-89], 2) blocks
	ldr	r1, [r12, #8]
	ldr	r2, [r14, #344]
	umlal	r9, r10, r2, r1
	umlal	r10, r6, r3, r1
	umlal	r6, r7, r4, r1
	umlal	r7, r8, r5, r1
	// ([85-88], 3) blocks
	ldr	r5, [r12, #12]
	ldr	r1, [r14, #340]
	umlal	r9, r10, r1, r5
	umlal	r10, r6, r2, r5
	umlal	r6, r7, r3, r5
	umlal	r7, r8, r4, r5
	// ([84-87], 4) blocks
	ldr	r4, [r12, #16]
	ldr	r5, [r14, #336]
	umlal	r9, r10, r5, r4
	umlal	r10, r6, r1, r4
	umlal	r6, r7, r2, r4
	umlal	r7, r8, r3, r4
	// ([83-86], 5) blocks
	ldr	r3, [r12, #20]
	ldr	r4, [r14, #332]
	umlal	r9, r10, r4, r3
	umlal	r10, r6, r5, r3
	umlal	r6, r7, r1, r3
	umlal	r7, r8, r2, r3
	// ([82-85], 6) blocks
	ldr	r2, [r12, #24]
	ldr	r3, [r14, #328]
	umlal	r9, r10, r3, r2
	umlal	r10, r6, r4, r2
	umlal	r6, r7, r5, r2
	umlal	r7, r8, r1, r2
	// ([81-84], 7) blocks
	ldr	r1, [r12, #28]
	ldr	r2, [r14, #324]
	umlal	r9, r10, r2, r1
	umlal	r10, r6, r3, r1
	umlal	r6, r7, r4, r1
	umlal	r7, r8, r5, r1
	// ([80-83], 8) blocks
	ldr	r5, [r12, #32]
	ldr	r1, [r14, #320]
	umlal	r9, r10, r1, r5
	umlal	r10, r6, r2, r5
	umlal	r6, r7, r3, r5
	umlal	r7, r8, r4, r5
	// ([79-82], 9) blocks
	ldr	r4, [r12, #36]
	ldr	r5, [r14, #316]
	umlal	r9, r10, r5, r4
	umlal	r10, r6, r1, r4
	umlal	r6, r7, r2, r4
	umlal	r7, r8, r3, r4
	// ([78-81], 10) blocks
	ldr	r3, [r12, #40]
	ldr	r4, [r14, #312]
	umlal	r9, r10, r4, r3
	umlal	r10, r6, r5, r3
	umlal	r6, r7, r1, r3
	umlal	r7, r8, r2, r3
	// ([77-80], 11) blocks
	ldr	r2, [r12, #44]
	ldr	r3, [r14, #308]
	umlal	r9, r10, r3, r2
	umlal	r10, r6, r4, r2
	umlal	r6, r7, r5, r2
	umlal	r7, r8, r1, r2
	// ([76-79], 12) blocks
	ldr	r1, [r12, #48]
	ldr	r2, [r14, #304]
	umlal	r9, r10, r2, r1
	umlal	r10, r6, r3, r1
	umlal	r6, r7, r4, r1
	umlal	r7, r8, r5, r1
	// ([75-78], 13) blocks
	ldr	r5, [r12, #52]
	ldr	r1, [r14, #300]
	umlal	r9, r10, r1, r5
	umlal	r10, r6, r2, r5
	umlal	r6, r7, r3, r5
	umlal	r7, r8, r4, r5
	// ([74-77], 14) blocks
	ldr	r4, [r12, #56]
	ldr	r5, [r14, #296]
	umlal	r9, r10, r5, r4
	umlal	r10, r6, r1, r4
	umlal	r6, r7, r2, r4
	umlal	r7, r8, r3, r4
	and	r4, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r4, LSR #4	// range < 31
	and	r4, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r4, LSR #4	// range < 31
	and	r4, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r4, LSR #4	// range < 31
	and	r4, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r4, LSR #4	// range < 31
	// ([73-76], 15) blocks
	ldr	r3, [r12, #60]
	ldr	r4, [r14, #292]
	umlal	r9, r10, r4, r3
	umlal	r10, r6, r5, r3
	umlal	r6, r7, r1, r3
	umlal	r7, r8, r2, r3
	str.w r10, [r0, #4]
	str.w r6, [r0, #8]
	str.w r7, [r0, #12]
	str.w r9, [r0], #16
	// ([92-95], 0) blocks
	ldr	r2, [r12]
	ldr	r1, [r14, #380]
	ldr	r5, [r14, #376]
	ldr	r4, [r14, #372]
	ldr	r3, [r14, #368]
	umull	r9, r10, r4, r2
	umull	r6, r7, r1, r2
	umlal	r8, r9, r3, r2
	umlal	r10, r6, r5, r2
	// ([91-94], 1) blocks
	ldr	r1, [r12, #4]
	ldr	r2, [r14, #364]
	umlal	r8, r9, r2, r1
	umlal	r9, r10, r3, r1
	umlal	r10, r6, r4, r1
	umlal	r6, r7, r5, r1
	// ([90-93], 2) blocks
	ldr	r5, [r12, #8]
	ldr	r1, [r14, #360]
	umlal	r8, r9, r1, r5
	umlal	r9, r10, r2, r5
	umlal	r10, r6, r3, r5
	umlal	r6, r7, r4, r5
	// ([89-92], 3) blocks
	ldr	r4, [r12, #12]
	ldr	r5, [r14, #356]
	umlal	r8, r9, r5, r4
	umlal	r9, r10, r1, r4
	umlal	r10, r6, r2, r4
	umlal	r6, r7, r3, r4
	// ([88-91], 4) blocks
	ldr	r3, [r12, #16]
	ldr	r4, [r14, #352]
	umlal	r8, r9, r4, r3
	umlal	r9, r10, r5, r3
	umlal	r10, r6, r1, r3
	umlal	r6, r7, r2, r3
	// ([87-90], 5) blocks
	ldr	r2, [r12, #20]
	ldr	r3, [r14, #348]
	umlal	r8, r9, r3, r2
	umlal	r9, r10, r4, r2
	umlal	r10, r6, r5, r2
	umlal	r6, r7, r1, r2
	// ([86-89], 6) blocks
	ldr	r1, [r12, #24]
	ldr	r2, [r14, #344]
	umlal	r8, r9, r2, r1
	umlal	r9, r10, r3, r1
	umlal	r10, r6, r4, r1
	umlal	r6, r7, r5, r1
	// ([85-88], 7) blocks
	ldr	r5, [r12, #28]
	ldr	r1, [r14, #340]
	umlal	r8, r9, r1, r5
	umlal	r9, r10, r2, r5
	umlal	r10, r6, r3, r5
	umlal	r6, r7, r4, r5
	// ([84-87], 8) blocks
	ldr	r4, [r12, #32]
	ldr	r5, [r14, #336]
	umlal	r8, r9, r5, r4
	umlal	r9, r10, r1, r4
	umlal	r10, r6, r2, r4
	umlal	r6, r7, r3, r4
	// ([83-86], 9) blocks
	ldr	r3, [r12, #36]
	ldr	r4, [r14, #332]
	umlal	r8, r9, r4, r3
	umlal	r9, r10, r5, r3
	umlal	r10, r6, r1, r3
	umlal	r6, r7, r2, r3
	// ([82-85], 10) blocks
	ldr	r2, [r12, #40]
	ldr	r3, [r14, #328]
	umlal	r8, r9, r3, r2
	umlal	r9, r10, r4, r2
	umlal	r10, r6, r5, r2
	umlal	r6, r7, r1, r2
	// ([81-84], 11) blocks
	ldr	r1, [r12, #44]
	ldr	r2, [r14, #324]
	umlal	r8, r9, r2, r1
	umlal	r9, r10, r3, r1
	umlal	r10, r6, r4, r1
	umlal	r6, r7, r5, r1
	// ([80-83], 12) blocks
	ldr	r5, [r12, #48]
	ldr	r1, [r14, #320]
	umlal	r8, r9, r1, r5
	umlal	r9, r10, r2, r5
	umlal	r10, r6, r3, r5
	umlal	r6, r7, r4, r5
	// ([79-82], 13) blocks
	ldr	r4, [r12, #52]
	ldr	r5, [r14, #316]
	umlal	r8, r9, r5, r4
	umlal	r9, r10, r1, r4
	umlal	r10, r6, r2, r4
	umlal	r6, r7, r3, r4
	// ([78-81], 14) blocks
	ldr	r3, [r12, #56]
	ldr	r4, [r14, #312]
	umlal	r8, r9, r4, r3
	umlal	r9, r10, r5, r3
	umlal	r10, r6, r1, r3
	umlal	r6, r7, r2, r3
	and	r3, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r3, LSR #4	// range < 31
	and	r3, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r3, LSR #4	// range < 31
	and	r3, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r3, LSR #4	// range < 31
	and	r3, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r3, LSR #4	// range < 31
	// ([77-80], 15) blocks
	ldr	r2, [r12, #60]
	ldr	r3, [r14, #308]
	umlal	r8, r9, r3, r2
	umlal	r9, r10, r4, r2
	umlal	r10, r6, r5, r2
	umlal	r6, r7, r1, r2
	str.w r9, [r0, #4]
	str.w r10, [r0, #8]
	str.w r6, [r0, #12]
	str.w r8, [r0], #16
	// ([96-99], 0) blocks
	ldr	r1, [r12]
	ldr	r5, [r14, #396]
	ldr	r4, [r14, #392]
	ldr	r3, [r14, #388]
	ldr	r2, [r14, #384]
	umull	r8, r9, r3, r1
	umull	r10, r6, r5, r1
	umlal	r7, r8, r2, r1
	umlal	r9, r10, r4, r1
	// ([95-98], 1) blocks
	ldr	r5, [r12, #4]
	ldr	r1, [r14, #380]
	umlal	r7, r8, r1, r5
	umlal	r8, r9, r2, r5
	umlal	r9, r10, r3, r5
	umlal	r10, r6, r4, r5
	// ([94-97], 2) blocks
	ldr	r4, [r12, #8]
	ldr	r5, [r14, #376]
	umlal	r7, r8, r5, r4
	umlal	r8, r9, r1, r4
	umlal	r9, r10, r2, r4
	umlal	r10, r6, r3, r4
	// ([93-96], 3) blocks
	ldr	r3, [r12, #12]
	ldr	r4, [r14, #372]
	umlal	r7, r8, r4, r3
	umlal	r8, r9, r5, r3
	umlal	r9, r10, r1, r3
	umlal	r10, r6, r2, r3
	// ([92-95], 4) blocks
	ldr	r2, [r12, #16]
	ldr	r3, [r14, #368]
	umlal	r7, r8, r3, r2
	umlal	r8, r9, r4, r2
	umlal	r9, r10, r5, r2
	umlal	r10, r6, r1, r2
	// ([91-94], 5) blocks
	ldr	r1, [r12, #20]
	ldr	r2, [r14, #364]
	umlal	r7, r8, r2, r1
	umlal	r8, r9, r3, r1
	umlal	r9, r10, r4, r1
	umlal	r10, r6, r5, r1
	// ([90-93], 6) blocks
	ldr	r5, [r12, #24]
	ldr	r1, [r14, #360]
	umlal	r7, r8, r1, r5
	umlal	r8, r9, r2, r5
	umlal	r9, r10, r3, r5
	umlal	r10, r6, r4, r5
	// ([89-92], 7) blocks
	ldr	r4, [r12, #28]
	ldr	r5, [r14, #356]
	umlal	r7, r8, r5, r4
	umlal	r8, r9, r1, r4
	umlal	r9, r10, r2, r4
	umlal	r10, r6, r3, r4
	// ([88-91], 8) blocks
	ldr	r3, [r12, #32]
	ldr	r4, [r14, #352]
	umlal	r7, r8, r4, r3
	umlal	r8, r9, r5, r3
	umlal	r9, r10, r1, r3
	umlal	r10, r6, r2, r3
	// ([87-90], 9) blocks
	ldr	r2, [r12, #36]
	ldr	r3, [r14, #348]
	umlal	r7, r8, r3, r2
	umlal	r8, r9, r4, r2
	umlal	r9, r10, r5, r2
	umlal	r10, r6, r1, r2
	// ([86-89], 10) blocks
	ldr	r1, [r12, #40]
	ldr	r2, [r14, #344]
	umlal	r7, r8, r2, r1
	umlal	r8, r9, r3, r1
	umlal	r9, r10, r4, r1
	umlal	r10, r6, r5, r1
	// ([85-88], 11) blocks
	ldr	r5, [r12, #44]
	ldr	r1, [r14, #340]
	umlal	r7, r8, r1, r5
	umlal	r8, r9, r2, r5
	umlal	r9, r10, r3, r5
	umlal	r10, r6, r4, r5
	// ([84-87], 12) blocks
	ldr	r4, [r12, #48]
	ldr	r5, [r14, #336]
	umlal	r7, r8, r5, r4
	umlal	r8, r9, r1, r4
	umlal	r9, r10, r2, r4
	umlal	r10, r6, r3, r4
	// ([83-86], 13) blocks
	ldr	r3, [r12, #52]
	ldr	r4, [r14, #332]
	umlal	r7, r8, r4, r3
	umlal	r8, r9, r5, r3
	umlal	r9, r10, r1, r3
	umlal	r10, r6, r2, r3
	// ([82-85], 14) blocks
	ldr	r2, [r12, #56]
	ldr	r3, [r14, #328]
	umlal	r7, r8, r3, r2
	umlal	r8, r9, r4, r2
	umlal	r9, r10, r5, r2
	umlal	r10, r6, r1, r2
	and	r2, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r2, LSR #4	// range < 31
	and	r2, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r2, LSR #4	// range < 31
	and	r2, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r2, LSR #4	// range < 31
	and	r2, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r2, LSR #4	// range < 31
	// ([81-84], 15) blocks
	ldr	r1, [r12, #60]
	ldr	r2, [r14, #324]
	umlal	r7, r8, r2, r1
	umlal	r8, r9, r3, r1
	umlal	r9, r10, r4, r1
	umlal	r10, r6, r5, r1
	str.w r8, [r0, #4]
	str.w r9, [r0, #8]
	str.w r10, [r0, #12]
	str.w r7, [r0], #16
	// ([100-103], 0) blocks
	ldr	r5, [r12]
	ldr	r4, [r14, #412]
	ldr	r3, [r14, #408]
	ldr	r2, [r14, #404]
	ldr	r1, [r14, #400]
	umull	r7, r8, r2, r5
	umull	r9, r10, r4, r5
	umlal	r6, r7, r1, r5
	umlal	r8, r9, r3, r5
	// ([99-102], 1) blocks
	ldr	r4, [r12, #4]
	ldr	r5, [r14, #396]
	umlal	r6, r7, r5, r4
	umlal	r7, r8, r1, r4
	umlal	r8, r9, r2, r4
	umlal	r9, r10, r3, r4
	// ([98-101], 2) blocks
	ldr	r3, [r12, #8]
	ldr	r4, [r14, #392]
	umlal	r6, r7, r4, r3
	umlal	r7, r8, r5, r3
	umlal	r8, r9, r1, r3
	umlal	r9, r10, r2, r3
	// ([97-100], 3) blocks
	ldr	r2, [r12, #12]
	ldr	r3, [r14, #388]
	umlal	r6, r7, r3, r2
	umlal	r7, r8, r4, r2
	umlal	r8, r9, r5, r2
	umlal	r9, r10, r1, r2
	// ([96-99], 4) blocks
	ldr	r1, [r12, #16]
	ldr	r2, [r14, #384]
	umlal	r6, r7, r2, r1
	umlal	r7, r8, r3, r1
	umlal	r8, r9, r4, r1
	umlal	r9, r10, r5, r1
	// ([95-98], 5) blocks
	ldr	r5, [r12, #20]
	ldr	r1, [r14, #380]
	umlal	r6, r7, r1, r5
	umlal	r7, r8, r2, r5
	umlal	r8, r9, r3, r5
	umlal	r9, r10, r4, r5
	// ([94-97], 6) blocks
	ldr	r4, [r12, #24]
	ldr	r5, [r14, #376]
	umlal	r6, r7, r5, r4
	umlal	r7, r8, r1, r4
	umlal	r8, r9, r2, r4
	umlal	r9, r10, r3, r4
	// ([93-96], 7) blocks
	ldr	r3, [r12, #28]
	ldr	r4, [r14, #372]
	umlal	r6, r7, r4, r3
	umlal	r7, r8, r5, r3
	umlal	r8, r9, r1, r3
	umlal	r9, r10, r2, r3
	// ([92-95], 8) blocks
	ldr	r2, [r12, #32]
	ldr	r3, [r14, #368]
	umlal	r6, r7, r3, r2
	umlal	r7, r8, r4, r2
	umlal	r8, r9, r5, r2
	umlal	r9, r10, r1, r2
	// ([91-94], 9) blocks
	ldr	r1, [r12, #36]
	ldr	r2, [r14, #364]
	umlal	r6, r7, r2, r1
	umlal	r7, r8, r3, r1
	umlal	r8, r9, r4, r1
	umlal	r9, r10, r5, r1
	// ([90-93], 10) blocks
	ldr	r5, [r12, #40]
	ldr	r1, [r14, #360]
	umlal	r6, r7, r1, r5
	umlal	r7, r8, r2, r5
	umlal	r8, r9, r3, r5
	umlal	r9, r10, r4, r5
	// ([89-92], 11) blocks
	ldr	r4, [r12, #44]
	ldr	r5, [r14, #356]
	umlal	r6, r7, r5, r4
	umlal	r7, r8, r1, r4
	umlal	r8, r9, r2, r4
	umlal	r9, r10, r3, r4
	// ([88-91], 12) blocks
	ldr	r3, [r12, #48]
	ldr	r4, [r14, #352]
	umlal	r6, r7, r4, r3
	umlal	r7, r8, r5, r3
	umlal	r8, r9, r1, r3
	umlal	r9, r10, r2, r3
	// ([87-90], 13) blocks
	ldr	r2, [r12, #52]
	ldr	r3, [r14, #348]
	umlal	r6, r7, r3, r2
	umlal	r7, r8, r4, r2
	umlal	r8, r9, r5, r2
	umlal	r9, r10, r1, r2
	// ([86-89], 14) blocks
	ldr	r1, [r12, #56]
	ldr	r2, [r14, #344]
	umlal	r6, r7, r2, r1
	umlal	r7, r8, r3, r1
	umlal	r8, r9, r4, r1
	umlal	r9, r10, r5, r1
	and	r1, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r1, LSR #4	// range < 31
	and	r1, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r1, LSR #4	// range < 31
	and	r1, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r1, LSR #4	// range < 31
	and	r1, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r1, LSR #4	// range < 31
	// ([85-88], 15) blocks
	ldr	r5, [r12, #60]
	ldr	r1, [r14, #340]
	umlal	r6, r7, r1, r5
	umlal	r7, r8, r2, r5
	umlal	r8, r9, r3, r5
	umlal	r9, r10, r4, r5
	str.w r7, [r0, #4]
	str.w r8, [r0, #8]
	str.w r9, [r0, #12]
	str.w r6, [r0], #16
mul_448:
	// ([104-107], 0) blocks
	ldr	r4, [r12]
	ldr	r3, [r14, #428]
	ldr	r2, [r14, #424]
	ldr	r1, [r14, #420]
	ldr	r5, [r14, #416]
	umull	r6, r7, r1, r4
	umull	r8, r9, r3, r4
	umlal	r10, r6, r5, r4
	umlal	r7, r8, r2, r4
	// ([103-106], 1) blocks
	ldr	r3, [r12, #4]
	ldr	r4, [r14, #412]
	umlal	r10, r6, r4, r3
	umlal	r6, r7, r5, r3
	umlal	r7, r8, r1, r3
	umlal	r8, r9, r2, r3
	// ([102-105], 2) blocks
	ldr	r2, [r12, #8]
	ldr	r3, [r14, #408]
	umlal	r10, r6, r3, r2
	umlal	r6, r7, r4, r2
	umlal	r7, r8, r5, r2
	umlal	r8, r9, r1, r2
	// ([101-104], 3) blocks
	ldr	r1, [r12, #12]
	ldr	r2, [r14, #404]
	umlal	r10, r6, r2, r1
	umlal	r6, r7, r3, r1
	umlal	r7, r8, r4, r1
	umlal	r8, r9, r5, r1
	// ([100-103], 4) blocks
	ldr	r5, [r12, #16]
	ldr	r1, [r14, #400]
	umlal	r10, r6, r1, r5
	umlal	r6, r7, r2, r5
	umlal	r7, r8, r3, r5
	umlal	r8, r9, r4, r5
	// ([99-102], 5) blocks
	ldr	r4, [r12, #20]
	ldr	r5, [r14, #396]
	umlal	r10, r6, r5, r4
	umlal	r6, r7, r1, r4
	umlal	r7, r8, r2, r4
	umlal	r8, r9, r3, r4
	// ([98-101], 6) blocks
	ldr	r3, [r12, #24]
	ldr	r4, [r14, #392]
	umlal	r10, r6, r4, r3
	umlal	r6, r7, r5, r3
	umlal	r7, r8, r1, r3
	umlal	r8, r9, r2, r3
	// ([97-100], 7) blocks
	ldr	r2, [r12, #28]
	ldr	r3, [r14, #388]
	umlal	r10, r6, r3, r2
	umlal	r6, r7, r4, r2
	umlal	r7, r8, r5, r2
	umlal	r8, r9, r1, r2
	// ([96-99], 8) blocks
	ldr	r1, [r12, #32]
	ldr	r2, [r14, #384]
	umlal	r10, r6, r2, r1
	umlal	r6, r7, r3, r1
	umlal	r7, r8, r4, r1
	umlal	r8, r9, r5, r1
	// ([95-98], 9) blocks
	ldr	r5, [r12, #36]
	ldr	r1, [r14, #380]
	umlal	r10, r6, r1, r5
	umlal	r6, r7, r2, r5
	umlal	r7, r8, r3, r5
	umlal	r8, r9, r4, r5
	// ([94-97], 10) blocks
	ldr	r4, [r12, #40]
	ldr	r5, [r14, #376]
	umlal	r10, r6, r5, r4
	umlal	r6, r7, r1, r4
	umlal	r7, r8, r2, r4
	umlal	r8, r9, r3, r4
	// ([93-96], 11) blocks
	ldr	r3, [r12, #44]
	ldr	r4, [r14, #372]
	umlal	r10, r6, r4, r3
	umlal	r6, r7, r5, r3
	umlal	r7, r8, r1, r3
	umlal	r8, r9, r2, r3
	// ([92-95], 12) blocks
	ldr	r2, [r12, #48]
	ldr	r3, [r14, #368]
	umlal	r10, r6, r3, r2
	umlal	r6, r7, r4, r2
	umlal	r7, r8, r5, r2
	umlal	r8, r9, r1, r2
	// ([91-94], 13) blocks
	ldr	r1, [r12, #52]
	ldr	r2, [r14, #364]
	umlal	r10, r6, r2, r1
	umlal	r6, r7, r3, r1
	umlal	r7, r8, r4, r1
	umlal	r8, r9, r5, r1
	// ([90-93], 14) blocks
	ldr	r5, [r12, #56]
	ldr	r1, [r14, #360]
	umlal	r10, r6, r1, r5
	umlal	r6, r7, r2, r5
	umlal	r7, r8, r3, r5
	umlal	r8, r9, r4, r5
	and	r5, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r5, LSR #4	// range < 31
	and	r5, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r5, LSR #4	// range < 31
	and	r5, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r5, LSR #4	// range < 31
	and	r5, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r5, LSR #4	// range < 31
	// ([89-92], 15) blocks
	ldr	r4, [r12, #60]
	ldr	r5, [r14, #356]
	umlal	r10, r6, r5, r4
	umlal	r6, r7, r1, r4
	umlal	r7, r8, r2, r4
	umlal	r8, r9, r3, r4
	str.w r6, [r0, #4]
	str.w r7, [r0, #8]
	str.w r8, [r0, #12]
	str.w r10, [r0], #16
	// ([108-111], 0) blocks
	ldr	r3, [r12]
	ldr	r2, [r14, #444]
	ldr	r1, [r14, #440]
	ldr	r5, [r14, #436]
	ldr	r4, [r14, #432]
	umull	r10, r6, r5, r3
	umull	r7, r8, r2, r3
	umlal	r9, r10, r4, r3
	umlal	r6, r7, r1, r3
	// ([107-110], 1) blocks
	ldr	r2, [r12, #4]
	ldr	r3, [r14, #428]
	umlal	r9, r10, r3, r2
	umlal	r10, r6, r4, r2
	umlal	r6, r7, r5, r2
	umlal	r7, r8, r1, r2
	// ([106-109], 2) blocks
	ldr	r1, [r12, #8]
	ldr	r2, [r14, #424]
	umlal	r9, r10, r2, r1
	umlal	r10, r6, r3, r1
	umlal	r6, r7, r4, r1
	umlal	r7, r8, r5, r1
	// ([105-108], 3) blocks
	ldr	r5, [r12, #12]
	ldr	r1, [r14, #420]
	umlal	r9, r10, r1, r5
	umlal	r10, r6, r2, r5
	umlal	r6, r7, r3, r5
	umlal	r7, r8, r4, r5
	// ([104-107], 4) blocks
	ldr	r4, [r12, #16]
	ldr	r5, [r14, #416]
	umlal	r9, r10, r5, r4
	umlal	r10, r6, r1, r4
	umlal	r6, r7, r2, r4
	umlal	r7, r8, r3, r4
	// ([103-106], 5) blocks
	ldr	r3, [r12, #20]
	ldr	r4, [r14, #412]
	umlal	r9, r10, r4, r3
	umlal	r10, r6, r5, r3
	umlal	r6, r7, r1, r3
	umlal	r7, r8, r2, r3
	// ([102-105], 6) blocks
	ldr	r2, [r12, #24]
	ldr	r3, [r14, #408]
	umlal	r9, r10, r3, r2
	umlal	r10, r6, r4, r2
	umlal	r6, r7, r5, r2
	umlal	r7, r8, r1, r2
	// ([101-104], 7) blocks
	ldr	r1, [r12, #28]
	ldr	r2, [r14, #404]
	umlal	r9, r10, r2, r1
	umlal	r10, r6, r3, r1
	umlal	r6, r7, r4, r1
	umlal	r7, r8, r5, r1
	// ([100-103], 8) blocks
	ldr	r5, [r12, #32]
	ldr	r1, [r14, #400]
	umlal	r9, r10, r1, r5
	umlal	r10, r6, r2, r5
	umlal	r6, r7, r3, r5
	umlal	r7, r8, r4, r5
	// ([99-102], 9) blocks
	ldr	r4, [r12, #36]
	ldr	r5, [r14, #396]
	umlal	r9, r10, r5, r4
	umlal	r10, r6, r1, r4
	umlal	r6, r7, r2, r4
	umlal	r7, r8, r3, r4
	// ([98-101], 10) blocks
	ldr	r3, [r12, #40]
	ldr	r4, [r14, #392]
	umlal	r9, r10, r4, r3
	umlal	r10, r6, r5, r3
	umlal	r6, r7, r1, r3
	umlal	r7, r8, r2, r3
	// ([97-100], 11) blocks
	ldr	r2, [r12, #44]
	ldr	r3, [r14, #388]
	umlal	r9, r10, r3, r2
	umlal	r10, r6, r4, r2
	umlal	r6, r7, r5, r2
	umlal	r7, r8, r1, r2
	// ([96-99], 12) blocks
	ldr	r1, [r12, #48]
	ldr	r2, [r14, #384]
	umlal	r9, r10, r2, r1
	umlal	r10, r6, r3, r1
	umlal	r6, r7, r4, r1
	umlal	r7, r8, r5, r1
	// ([95-98], 13) blocks
	ldr	r5, [r12, #52]
	ldr	r1, [r14, #380]
	umlal	r9, r10, r1, r5
	umlal	r10, r6, r2, r5
	umlal	r6, r7, r3, r5
	umlal	r7, r8, r4, r5
	// ([94-97], 14) blocks
	ldr	r4, [r12, #56]
	ldr	r5, [r14, #376]
	umlal	r9, r10, r5, r4
	umlal	r10, r6, r1, r4
	umlal	r6, r7, r2, r4
	umlal	r7, r8, r3, r4
	and	r4, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r4, LSR #4	// range < 31
	and	r4, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r4, LSR #4	// range < 31
	and	r4, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r4, LSR #4	// range < 31
	and	r4, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r4, LSR #4	// range < 31
	// ([93-96], 15) blocks
	ldr	r3, [r12, #60]
	ldr	r4, [r14, #372]
	umlal	r9, r10, r4, r3
	umlal	r10, r6, r5, r3
	umlal	r6, r7, r1, r3
	umlal	r7, r8, r2, r3
	str.w r10, [r0, #4]
	str.w r6, [r0, #8]
	str.w r7, [r0, #12]
	str.w r9, [r0], #16
	// ([112-115], 0) blocks
	ldr	r2, [r12]
	ldr	r1, [r14, #460]
	ldr	r5, [r14, #456]
	ldr	r4, [r14, #452]
	ldr	r3, [r14, #448]
	umull	r9, r10, r4, r2
	umull	r6, r7, r1, r2
	umlal	r8, r9, r3, r2
	umlal	r10, r6, r5, r2
	// ([111-114], 1) blocks
	ldr	r1, [r12, #4]
	ldr	r2, [r14, #444]
	umlal	r8, r9, r2, r1
	umlal	r9, r10, r3, r1
	umlal	r10, r6, r4, r1
	umlal	r6, r7, r5, r1
	// ([110-113], 2) blocks
	ldr	r5, [r12, #8]
	ldr	r1, [r14, #440]
	umlal	r8, r9, r1, r5
	umlal	r9, r10, r2, r5
	umlal	r10, r6, r3, r5
	umlal	r6, r7, r4, r5
	// ([109-112], 3) blocks
	ldr	r4, [r12, #12]
	ldr	r5, [r14, #436]
	umlal	r8, r9, r5, r4
	umlal	r9, r10, r1, r4
	umlal	r10, r6, r2, r4
	umlal	r6, r7, r3, r4
	// ([108-111], 4) blocks
	ldr	r3, [r12, #16]
	ldr	r4, [r14, #432]
	umlal	r8, r9, r4, r3
	umlal	r9, r10, r5, r3
	umlal	r10, r6, r1, r3
	umlal	r6, r7, r2, r3
	// ([107-110], 5) blocks
	ldr	r2, [r12, #20]
	ldr	r3, [r14, #428]
	umlal	r8, r9, r3, r2
	umlal	r9, r10, r4, r2
	umlal	r10, r6, r5, r2
	umlal	r6, r7, r1, r2
	// ([106-109], 6) blocks
	ldr	r1, [r12, #24]
	ldr	r2, [r14, #424]
	umlal	r8, r9, r2, r1
	umlal	r9, r10, r3, r1
	umlal	r10, r6, r4, r1
	umlal	r6, r7, r5, r1
	// ([105-108], 7) blocks
	ldr	r5, [r12, #28]
	ldr	r1, [r14, #420]
	umlal	r8, r9, r1, r5
	umlal	r9, r10, r2, r5
	umlal	r10, r6, r3, r5
	umlal	r6, r7, r4, r5
	// ([104-107], 8) blocks
	ldr	r4, [r12, #32]
	ldr	r5, [r14, #416]
	umlal	r8, r9, r5, r4
	umlal	r9, r10, r1, r4
	umlal	r10, r6, r2, r4
	umlal	r6, r7, r3, r4
	// ([103-106], 9) blocks
	ldr	r3, [r12, #36]
	ldr	r4, [r14, #412]
	umlal	r8, r9, r4, r3
	umlal	r9, r10, r5, r3
	umlal	r10, r6, r1, r3
	umlal	r6, r7, r2, r3
	// ([102-105], 10) blocks
	ldr	r2, [r12, #40]
	ldr	r3, [r14, #408]
	umlal	r8, r9, r3, r2
	umlal	r9, r10, r4, r2
	umlal	r10, r6, r5, r2
	umlal	r6, r7, r1, r2
	// ([101-104], 11) blocks
	ldr	r1, [r12, #44]
	ldr	r2, [r14, #404]
	umlal	r8, r9, r2, r1
	umlal	r9, r10, r3, r1
	umlal	r10, r6, r4, r1
	umlal	r6, r7, r5, r1
	// ([100-103], 12) blocks
	ldr	r5, [r12, #48]
	ldr	r1, [r14, #400]
	umlal	r8, r9, r1, r5
	umlal	r9, r10, r2, r5
	umlal	r10, r6, r3, r5
	umlal	r6, r7, r4, r5
	// ([99-102], 13) blocks
	ldr	r4, [r12, #52]
	ldr	r5, [r14, #396]
	umlal	r8, r9, r5, r4
	umlal	r9, r10, r1, r4
	umlal	r10, r6, r2, r4
	umlal	r6, r7, r3, r4
	// ([98-101], 14) blocks
	ldr	r3, [r12, #56]
	ldr	r4, [r14, #392]
	umlal	r8, r9, r4, r3
	umlal	r9, r10, r5, r3
	umlal	r10, r6, r1, r3
	umlal	r6, r7, r2, r3
	and	r3, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r3, LSR #4	// range < 31
	and	r3, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r3, LSR #4	// range < 31
	and	r3, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r3, LSR #4	// range < 31
	and	r3, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r3, LSR #4	// range < 31
	// ([97-100], 15) blocks
	ldr	r2, [r12, #60]
	ldr	r3, [r14, #388]
	umlal	r8, r9, r3, r2
	umlal	r9, r10, r4, r2
	umlal	r10, r6, r5, r2
	umlal	r6, r7, r1, r2
	str.w r9, [r0, #4]
	str.w r10, [r0, #8]
	str.w r6, [r0, #12]
	str.w r8, [r0], #16
	// ([116-119], 0) blocks
	ldr	r1, [r12]
	ldr	r5, [r14, #476]
	ldr	r4, [r14, #472]
	ldr	r3, [r14, #468]
	ldr	r2, [r14, #464]
	umull	r8, r9, r3, r1
	umull	r10, r6, r5, r1
	umlal	r7, r8, r2, r1
	umlal	r9, r10, r4, r1
	// ([115-118], 1) blocks
	ldr	r5, [r12, #4]
	ldr	r1, [r14, #460]
	umlal	r7, r8, r1, r5
	umlal	r8, r9, r2, r5
	umlal	r9, r10, r3, r5
	umlal	r10, r6, r4, r5
	// ([114-117], 2) blocks
	ldr	r4, [r12, #8]
	ldr	r5, [r14, #456]
	umlal	r7, r8, r5, r4
	umlal	r8, r9, r1, r4
	umlal	r9, r10, r2, r4
	umlal	r10, r6, r3, r4
	// ([113-116], 3) blocks
	ldr	r3, [r12, #12]
	ldr	r4, [r14, #452]
	umlal	r7, r8, r4, r3
	umlal	r8, r9, r5, r3
	umlal	r9, r10, r1, r3
	umlal	r10, r6, r2, r3
	// ([112-115], 4) blocks
	ldr	r2, [r12, #16]
	ldr	r3, [r14, #448]
	umlal	r7, r8, r3, r2
	umlal	r8, r9, r4, r2
	umlal	r9, r10, r5, r2
	umlal	r10, r6, r1, r2
	// ([111-114], 5) blocks
	ldr	r1, [r12, #20]
	ldr	r2, [r14, #444]
	umlal	r7, r8, r2, r1
	umlal	r8, r9, r3, r1
	umlal	r9, r10, r4, r1
	umlal	r10, r6, r5, r1
	// ([110-113], 6) blocks
	ldr	r5, [r12, #24]
	ldr	r1, [r14, #440]
	umlal	r7, r8, r1, r5
	umlal	r8, r9, r2, r5
	umlal	r9, r10, r3, r5
	umlal	r10, r6, r4, r5
	// ([109-112], 7) blocks
	ldr	r4, [r12, #28]
	ldr	r5, [r14, #436]
	umlal	r7, r8, r5, r4
	umlal	r8, r9, r1, r4
	umlal	r9, r10, r2, r4
	umlal	r10, r6, r3, r4
	// ([108-111], 8) blocks
	ldr	r3, [r12, #32]
	ldr	r4, [r14, #432]
	umlal	r7, r8, r4, r3
	umlal	r8, r9, r5, r3
	umlal	r9, r10, r1, r3
	umlal	r10, r6, r2, r3
	// ([107-110], 9) blocks
	ldr	r2, [r12, #36]
	ldr	r3, [r14, #428]
	umlal	r7, r8, r3, r2
	umlal	r8, r9, r4, r2
	umlal	r9, r10, r5, r2
	umlal	r10, r6, r1, r2
	// ([106-109], 10) blocks
	ldr	r1, [r12, #40]
	ldr	r2, [r14, #424]
	umlal	r7, r8, r2, r1
	umlal	r8, r9, r3, r1
	umlal	r9, r10, r4, r1
	umlal	r10, r6, r5, r1
	// ([105-108], 11) blocks
	ldr	r5, [r12, #44]
	ldr	r1, [r14, #420]
	umlal	r7, r8, r1, r5
	umlal	r8, r9, r2, r5
	umlal	r9, r10, r3, r5
	umlal	r10, r6, r4, r5
	// ([104-107], 12) blocks
	ldr	r4, [r12, #48]
	ldr	r5, [r14, #416]
	umlal	r7, r8, r5, r4
	umlal	r8, r9, r1, r4
	umlal	r9, r10, r2, r4
	umlal	r10, r6, r3, r4
	// ([103-106], 13) blocks
	ldr	r3, [r12, #52]
	ldr	r4, [r14, #412]
	umlal	r7, r8, r4, r3
	umlal	r8, r9, r5, r3
	umlal	r9, r10, r1, r3
	umlal	r10, r6, r2, r3
	// ([102-105], 14) blocks
	ldr	r2, [r12, #56]
	ldr	r3, [r14, #408]
	umlal	r7, r8, r3, r2
	umlal	r8, r9, r4, r2
	umlal	r9, r10, r5, r2
	umlal	r10, r6, r1, r2
	and	r2, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r2, LSR #4	// range < 31
	and	r2, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r2, LSR #4	// range < 31
	and	r2, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r2, LSR #4	// range < 31
	and	r2, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r2, LSR #4	// range < 31
	// ([101-104], 15) blocks
	ldr	r1, [r12, #60]
	ldr	r2, [r14, #404]
	umlal	r7, r8, r2, r1
	umlal	r8, r9, r3, r1
	umlal	r9, r10, r4, r1
	umlal	r10, r6, r5, r1
	str.w r8, [r0, #4]
	str.w r9, [r0, #8]
	str.w r10, [r0, #12]
	str.w r7, [r0], #16
mul_384:
	// ([120-123], 0) blocks
	ldr	r5, [r12]
	ldr	r4, [r14, #492]
	ldr	r3, [r14, #488]
	ldr	r2, [r14, #484]
	ldr	r1, [r14, #480]
	umull	r7, r8, r2, r5
	umull	r9, r10, r4, r5
	umlal	r6, r7, r1, r5
	umlal	r8, r9, r3, r5
	// ([119-122], 1) blocks
	ldr	r4, [r12, #4]
	ldr	r5, [r14, #476]
	umlal	r6, r7, r5, r4
	umlal	r7, r8, r1, r4
	umlal	r8, r9, r2, r4
	umlal	r9, r10, r3, r4
	// ([118-121], 2) blocks
	ldr	r3, [r12, #8]
	ldr	r4, [r14, #472]
	umlal	r6, r7, r4, r3
	umlal	r7, r8, r5, r3
	umlal	r8, r9, r1, r3
	umlal	r9, r10, r2, r3
	// ([117-120], 3) blocks
	ldr	r2, [r12, #12]
	ldr	r3, [r14, #468]
	umlal	r6, r7, r3, r2
	umlal	r7, r8, r4, r2
	umlal	r8, r9, r5, r2
	umlal	r9, r10, r1, r2
	// ([116-119], 4) blocks
	ldr	r1, [r12, #16]
	ldr	r2, [r14, #464]
	umlal	r6, r7, r2, r1
	umlal	r7, r8, r3, r1
	umlal	r8, r9, r4, r1
	umlal	r9, r10, r5, r1
	// ([115-118], 5) blocks
	ldr	r5, [r12, #20]
	ldr	r1, [r14, #460]
	umlal	r6, r7, r1, r5
	umlal	r7, r8, r2, r5
	umlal	r8, r9, r3, r5
	umlal	r9, r10, r4, r5
	// ([114-117], 6) blocks
	ldr	r4, [r12, #24]
	ldr	r5, [r14, #456]
	umlal	r6, r7, r5, r4
	umlal	r7, r8, r1, r4
	umlal	r8, r9, r2, r4
	umlal	r9, r10, r3, r4
	// ([113-116], 7) blocks
	ldr	r3, [r12, #28]
	ldr	r4, [r14, #452]
	umlal	r6, r7, r4, r3
	umlal	r7, r8, r5, r3
	umlal	r8, r9, r1, r3
	umlal	r9, r10, r2, r3
	// ([112-115], 8) blocks
	ldr	r2, [r12, #32]
	ldr	r3, [r14, #448]
	umlal	r6, r7, r3, r2
	umlal	r7, r8, r4, r2
	umlal	r8, r9, r5, r2
	umlal	r9, r10, r1, r2
	// ([111-114], 9) blocks
	ldr	r1, [r12, #36]
	ldr	r2, [r14, #444]
	umlal	r6, r7, r2, r1
	umlal	r7, r8, r3, r1
	umlal	r8, r9, r4, r1
	umlal	r9, r10, r5, r1
	// ([110-113], 10) blocks
	ldr	r5, [r12, #40]
	ldr	r1, [r14, #440]
	umlal	r6, r7, r1, r5
	umlal	r7, r8, r2, r5
	umlal	r8, r9, r3, r5
	umlal	r9, r10, r4, r5
	// ([109-112], 11) blocks
	ldr	r4, [r12, #44]
	ldr	r5, [r14, #436]
	umlal	r6, r7, r5, r4
	umlal	r7, r8, r1, r4
	umlal	r8, r9, r2, r4
	umlal	r9, r10, r3, r4
	// ([108-111], 12) blocks
	ldr	r3, [r12, #48]
	ldr	r4, [r14, #432]
	umlal	r6, r7, r4, r3
	umlal	r7, r8, r5, r3
	umlal	r8, r9, r1, r3
	umlal	r9, r10, r2, r3
	// ([107-110], 13) blocks
	ldr	r2, [r12, #52]
	ldr	r3, [r14, #428]
	umlal	r6, r7, r3, r2
	umlal	r7, r8, r4, r2
	umlal	r8, r9, r5, r2
	umlal	r9, r10, r1, r2
	// ([106-109], 14) blocks
	ldr	r1, [r12, #56]
	ldr	r2, [r14, #424]
	umlal	r6, r7, r2, r1
	umlal	r7, r8, r3, r1
	umlal	r8, r9, r4, r1
	umlal	r9, r10, r5, r1
	and	r1, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r1, LSR #4	// range < 31
	and	r1, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r1, LSR #4	// range < 31
	and	r1, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r1, LSR #4	// range < 31
	and	r1, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r1, LSR #4	// range < 31
	// ([105-108], 15) blocks
	ldr	r5, [r12, #60]
	ldr	r1, [r14, #420]
	umlal	r6, r7, r1, r5
	umlal	r7, r8, r2, r5
	umlal	r8, r9, r3, r5
	umlal	r9, r10, r4, r5
	str.w r7, [r0, #4]
	str.w r8, [r0, #8]
	str.w r9, [r0, #12]
	str.w r6, [r0], #16
	// ([124-127], 0) blocks
	ldr	r4, [r12]
	ldr	r3, [r14, #508]
	ldr	r2, [r14, #504]
	ldr	r1, [r14, #500]
	ldr	r5, [r14, #496]
	umull	r6, r7, r1, r4
	umull	r8, r9, r3, r4
	umlal	r10, r6, r5, r4
	umlal	r7, r8, r2, r4
	// ([123-126], 1) blocks
	ldr	r3, [r12, #4]
	ldr	r4, [r14, #492]
	umlal	r10, r6, r4, r3
	umlal	r6, r7, r5, r3
	umlal	r7, r8, r1, r3
	umlal	r8, r9, r2, r3
	// ([122-125], 2) blocks
	ldr	r2, [r12, #8]
	ldr	r3, [r14, #488]
	umlal	r10, r6, r3, r2
	umlal	r6, r7, r4, r2
	umlal	r7, r8, r5, r2
	umlal	r8, r9, r1, r2
	// ([121-124], 3) blocks
	ldr	r1, [r12, #12]
	ldr	r2, [r14, #484]
	umlal	r10, r6, r2, r1
	umlal	r6, r7, r3, r1
	umlal	r7, r8, r4, r1
	umlal	r8, r9, r5, r1
	// ([120-123], 4) blocks
	ldr	r5, [r12, #16]
	ldr	r1, [r14, #480]
	umlal	r10, r6, r1, r5
	umlal	r6, r7, r2, r5
	umlal	r7, r8, r3, r5
	umlal	r8, r9, r4, r5
	// ([119-122], 5) blocks
	ldr	r4, [r12, #20]
	ldr	r5, [r14, #476]
	umlal	r10, r6, r5, r4
	umlal	r6, r7, r1, r4
	umlal	r7, r8, r2, r4
	umlal	r8, r9, r3, r4
	// ([118-121], 6) blocks
	ldr	r3, [r12, #24]
	ldr	r4, [r14, #472]
	umlal	r10, r6, r4, r3
	umlal	r6, r7, r5, r3
	umlal	r7, r8, r1, r3
	umlal	r8, r9, r2, r3
	// ([117-120], 7) blocks
	ldr	r2, [r12, #28]
	ldr	r3, [r14, #468]
	umlal	r10, r6, r3, r2
	umlal	r6, r7, r4, r2
	umlal	r7, r8, r5, r2
	umlal	r8, r9, r1, r2
	// ([116-119], 8) blocks
	ldr	r1, [r12, #32]
	ldr	r2, [r14, #464]
	umlal	r10, r6, r2, r1
	umlal	r6, r7, r3, r1
	umlal	r7, r8, r4, r1
	umlal	r8, r9, r5, r1
	// ([115-118], 9) blocks
	ldr	r5, [r12, #36]
	ldr	r1, [r14, #460]
	umlal	r10, r6, r1, r5
	umlal	r6, r7, r2, r5
	umlal	r7, r8, r3, r5
	umlal	r8, r9, r4, r5
	// ([114-117], 10) blocks
	ldr	r4, [r12, #40]
	ldr	r5, [r14, #456]
	umlal	r10, r6, r5, r4
	umlal	r6, r7, r1, r4
	umlal	r7, r8, r2, r4
	umlal	r8, r9, r3, r4
	// ([113-116], 11) blocks
	ldr	r3, [r12, #44]
	ldr	r4, [r14, #452]
	umlal	r10, r6, r4, r3
	umlal	r6, r7, r5, r3
	umlal	r7, r8, r1, r3
	umlal	r8, r9, r2, r3
	// ([112-115], 12) blocks
	ldr	r2, [r12, #48]
	ldr	r3, [r14, #448]
	umlal	r10, r6, r3, r2
	umlal	r6, r7, r4, r2
	umlal	r7, r8, r5, r2
	umlal	r8, r9, r1, r2
	// ([111-114], 13) blocks
	ldr	r1, [r12, #52]
	ldr	r2, [r14, #444]
	umlal	r10, r6, r2, r1
	umlal	r6, r7, r3, r1
	umlal	r7, r8, r4, r1
	umlal	r8, r9, r5, r1
	// ([110-113], 14) blocks
	ldr	r5, [r12, #56]
	ldr	r1, [r14, #440]
	umlal	r10, r6, r1, r5
	umlal	r6, r7, r2, r5
	umlal	r7, r8, r3, r5
	umlal	r8, r9, r4, r5
	and	r5, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r5, LSR #4	// range < 31
	and	r5, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r5, LSR #4	// range < 31
	and	r5, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r5, LSR #4	// range < 31
	and	r5, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r5, LSR #4	// range < 31
	// ([109-112], 15) blocks
	ldr	r4, [r12, #60]
	ldr	r5, [r14, #436]
	umlal	r10, r6, r5, r4
	umlal	r6, r7, r1, r4
	umlal	r7, r8, r2, r4
	umlal	r8, r9, r3, r4
	str.w r6, [r0, #4]
	str.w r7, [r0, #8]
	str.w r8, [r0, #12]
	str.w r10, [r0], #16
	// ([128-131], 0) blocks
	ldr	r3, [r12]
	ldr	r2, [r14, #524]
	ldr	r1, [r14, #520]
	ldr	r5, [r14, #516]
	ldr	r4, [r14, #512]
	umull	r10, r6, r5, r3
	umull	r7, r8, r2, r3
	umlal	r9, r10, r4, r3
	umlal	r6, r7, r1, r3
	// ([127-130], 1) blocks
	ldr	r2, [r12, #4]
	ldr	r3, [r14, #508]
	umlal	r9, r10, r3, r2
	umlal	r10, r6, r4, r2
	umlal	r6, r7, r5, r2
	umlal	r7, r8, r1, r2
	// ([126-129], 2) blocks
	ldr	r1, [r12, #8]
	ldr	r2, [r14, #504]
	umlal	r9, r10, r2, r1
	umlal	r10, r6, r3, r1
	umlal	r6, r7, r4, r1
	umlal	r7, r8, r5, r1
	// ([125-128], 3) blocks
	ldr	r5, [r12, #12]
	ldr	r1, [r14, #500]
	umlal	r9, r10, r1, r5
	umlal	r10, r6, r2, r5
	umlal	r6, r7, r3, r5
	umlal	r7, r8, r4, r5
	// ([124-127], 4) blocks
	ldr	r4, [r12, #16]
	ldr	r5, [r14, #496]
	umlal	r9, r10, r5, r4
	umlal	r10, r6, r1, r4
	umlal	r6, r7, r2, r4
	umlal	r7, r8, r3, r4
	// ([123-126], 5) blocks
	ldr	r3, [r12, #20]
	ldr	r4, [r14, #492]
	umlal	r9, r10, r4, r3
	umlal	r10, r6, r5, r3
	umlal	r6, r7, r1, r3
	umlal	r7, r8, r2, r3
	// ([122-125], 6) blocks
	ldr	r2, [r12, #24]
	ldr	r3, [r14, #488]
	umlal	r9, r10, r3, r2
	umlal	r10, r6, r4, r2
	umlal	r6, r7, r5, r2
	umlal	r7, r8, r1, r2
	// ([121-124], 7) blocks
	ldr	r1, [r12, #28]
	ldr	r2, [r14, #484]
	umlal	r9, r10, r2, r1
	umlal	r10, r6, r3, r1
	umlal	r6, r7, r4, r1
	umlal	r7, r8, r5, r1
	// ([120-123], 8) blocks
	ldr	r5, [r12, #32]
	ldr	r1, [r14, #480]
	umlal	r9, r10, r1, r5
	umlal	r10, r6, r2, r5
	umlal	r6, r7, r3, r5
	umlal	r7, r8, r4, r5
	// ([119-122], 9) blocks
	ldr	r4, [r12, #36]
	ldr	r5, [r14, #476]
	umlal	r9, r10, r5, r4
	umlal	r10, r6, r1, r4
	umlal	r6, r7, r2, r4
	umlal	r7, r8, r3, r4
	// ([118-121], 10) blocks
	ldr	r3, [r12, #40]
	ldr	r4, [r14, #472]
	umlal	r9, r10, r4, r3
	umlal	r10, r6, r5, r3
	umlal	r6, r7, r1, r3
	umlal	r7, r8, r2, r3
	// ([117-120], 11) blocks
	ldr	r2, [r12, #44]
	ldr	r3, [r14, #468]
	umlal	r9, r10, r3, r2
	umlal	r10, r6, r4, r2
	umlal	r6, r7, r5, r2
	umlal	r7, r8, r1, r2
	// ([116-119], 12) blocks
	ldr	r1, [r12, #48]
	ldr	r2, [r14, #464]
	umlal	r9, r10, r2, r1
	umlal	r10, r6, r3, r1
	umlal	r6, r7, r4, r1
	umlal	r7, r8, r5, r1
	// ([115-118], 13) blocks
	ldr	r5, [r12, #52]
	ldr	r1, [r14, #460]
	umlal	r9, r10, r1, r5
	umlal	r10, r6, r2, r5
	umlal	r6, r7, r3, r5
	umlal	r7, r8, r4, r5
	// ([114-117], 14) blocks
	ldr	r4, [r12, #56]
	ldr	r5, [r14, #456]
	umlal	r9, r10, r5, r4
	umlal	r10, r6, r1, r4
	umlal	r6, r7, r2, r4
	umlal	r7, r8, r3, r4
	and	r4, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r4, LSR #4	// range < 31
	and	r4, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r4, LSR #4	// range < 31
	and	r4, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r4, LSR #4	// range < 31
	and	r4, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r4, LSR #4	// range < 31
	// ([113-116], 15) blocks
	ldr	r3, [r12, #60]
	ldr	r4, [r14, #452]
	umlal	r9, r10, r4, r3
	umlal	r10, r6, r5, r3
	umlal	r6, r7, r1, r3
	umlal	r7, r8, r2, r3
	str.w r10, [r0, #4]
	str.w r6, [r0, #8]
	str.w r7, [r0, #12]
	str.w r9, [r0], #16
	// ([132-135], 0) blocks
	ldr	r2, [r12]
	ldr	r1, [r14, #540]
	ldr	r5, [r14, #536]
	ldr	r4, [r14, #532]
	ldr	r3, [r14, #528]
	umull	r9, r10, r4, r2
	umull	r6, r7, r1, r2
	umlal	r8, r9, r3, r2
	umlal	r10, r6, r5, r2
	// ([131-134], 1) blocks
	ldr	r1, [r12, #4]
	ldr	r2, [r14, #524]
	umlal	r8, r9, r2, r1
	umlal	r9, r10, r3, r1
	umlal	r10, r6, r4, r1
	umlal	r6, r7, r5, r1
	// ([130-133], 2) blocks
	ldr	r5, [r12, #8]
	ldr	r1, [r14, #520]
	umlal	r8, r9, r1, r5
	umlal	r9, r10, r2, r5
	umlal	r10, r6, r3, r5
	umlal	r6, r7, r4, r5
	// ([129-132], 3) blocks
	ldr	r4, [r12, #12]
	ldr	r5, [r14, #516]
	umlal	r8, r9, r5, r4
	umlal	r9, r10, r1, r4
	umlal	r10, r6, r2, r4
	umlal	r6, r7, r3, r4
	// ([128-131], 4) blocks
	ldr	r3, [r12, #16]
	ldr	r4, [r14, #512]
	umlal	r8, r9, r4, r3
	umlal	r9, r10, r5, r3
	umlal	r10, r6, r1, r3
	umlal	r6, r7, r2, r3
	// ([127-130], 5) blocks
	ldr	r2, [r12, #20]
	ldr	r3, [r14, #508]
	umlal	r8, r9, r3, r2
	umlal	r9, r10, r4, r2
	umlal	r10, r6, r5, r2
	umlal	r6, r7, r1, r2
	// ([126-129], 6) blocks
	ldr	r1, [r12, #24]
	ldr	r2, [r14, #504]
	umlal	r8, r9, r2, r1
	umlal	r9, r10, r3, r1
	umlal	r10, r6, r4, r1
	umlal	r6, r7, r5, r1
	// ([125-128], 7) blocks
	ldr	r5, [r12, #28]
	ldr	r1, [r14, #500]
	umlal	r8, r9, r1, r5
	umlal	r9, r10, r2, r5
	umlal	r10, r6, r3, r5
	umlal	r6, r7, r4, r5
	// ([124-127], 8) blocks
	ldr	r4, [r12, #32]
	ldr	r5, [r14, #496]
	umlal	r8, r9, r5, r4
	umlal	r9, r10, r1, r4
	umlal	r10, r6, r2, r4
	umlal	r6, r7, r3, r4
	// ([123-126], 9) blocks
	ldr	r3, [r12, #36]
	ldr	r4, [r14, #492]
	umlal	r8, r9, r4, r3
	umlal	r9, r10, r5, r3
	umlal	r10, r6, r1, r3
	umlal	r6, r7, r2, r3
	// ([122-125], 10) blocks
	ldr	r2, [r12, #40]
	ldr	r3, [r14, #488]
	umlal	r8, r9, r3, r2
	umlal	r9, r10, r4, r2
	umlal	r10, r6, r5, r2
	umlal	r6, r7, r1, r2
	// ([121-124], 11) blocks
	ldr	r1, [r12, #44]
	ldr	r2, [r14, #484]
	umlal	r8, r9, r2, r1
	umlal	r9, r10, r3, r1
	umlal	r10, r6, r4, r1
	umlal	r6, r7, r5, r1
	// ([120-123], 12) blocks
	ldr	r5, [r12, #48]
	ldr	r1, [r14, #480]
	umlal	r8, r9, r1, r5
	umlal	r9, r10, r2, r5
	umlal	r10, r6, r3, r5
	umlal	r6, r7, r4, r5
	// ([119-122], 13) blocks
	ldr	r4, [r12, #52]
	ldr	r5, [r14, #476]
	umlal	r8, r9, r5, r4
	umlal	r9, r10, r1, r4
	umlal	r10, r6, r2, r4
	umlal	r6, r7, r3, r4
	// ([118-121], 14) blocks
	ldr	r3, [r12, #56]
	ldr	r4, [r14, #472]
	umlal	r8, r9, r4, r3
	umlal	r9, r10, r5, r3
	umlal	r10, r6, r1, r3
	umlal	r6, r7, r2, r3
	and	r3, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r3, LSR #4	// range < 31
	and	r3, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r3, LSR #4	// range < 31
	and	r3, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r3, LSR #4	// range < 31
	and	r3, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r3, LSR #4	// range < 31
	// ([117-120], 15) blocks
	ldr	r2, [r12, #60]
	ldr	r3, [r14, #468]
	umlal	r8, r9, r3, r2
	umlal	r9, r10, r4, r2
	umlal	r10, r6, r5, r2
	umlal	r6, r7, r1, r2
	str.w r9, [r0, #4]
	str.w r10, [r0, #8]
	str.w r6, [r0, #12]
	str.w r8, [r0], #16
mul_320:
	// ([136-139], 0) blocks
	ldr	r1, [r12]
	ldr	r5, [r14, #556]
	ldr	r4, [r14, #552]
	ldr	r3, [r14, #548]
	ldr	r2, [r14, #544]
	umull	r8, r9, r3, r1
	umull	r10, r6, r5, r1
	umlal	r7, r8, r2, r1
	umlal	r9, r10, r4, r1
	// ([135-138], 1) blocks
	ldr	r5, [r12, #4]
	ldr	r1, [r14, #540]
	umlal	r7, r8, r1, r5
	umlal	r8, r9, r2, r5
	umlal	r9, r10, r3, r5
	umlal	r10, r6, r4, r5
	// ([134-137], 2) blocks
	ldr	r4, [r12, #8]
	ldr	r5, [r14, #536]
	umlal	r7, r8, r5, r4
	umlal	r8, r9, r1, r4
	umlal	r9, r10, r2, r4
	umlal	r10, r6, r3, r4
	// ([133-136], 3) blocks
	ldr	r3, [r12, #12]
	ldr	r4, [r14, #532]
	umlal	r7, r8, r4, r3
	umlal	r8, r9, r5, r3
	umlal	r9, r10, r1, r3
	umlal	r10, r6, r2, r3
	// ([132-135], 4) blocks
	ldr	r2, [r12, #16]
	ldr	r3, [r14, #528]
	umlal	r7, r8, r3, r2
	umlal	r8, r9, r4, r2
	umlal	r9, r10, r5, r2
	umlal	r10, r6, r1, r2
	// ([131-134], 5) blocks
	ldr	r1, [r12, #20]
	ldr	r2, [r14, #524]
	umlal	r7, r8, r2, r1
	umlal	r8, r9, r3, r1
	umlal	r9, r10, r4, r1
	umlal	r10, r6, r5, r1
	// ([130-133], 6) blocks
	ldr	r5, [r12, #24]
	ldr	r1, [r14, #520]
	umlal	r7, r8, r1, r5
	umlal	r8, r9, r2, r5
	umlal	r9, r10, r3, r5
	umlal	r10, r6, r4, r5
	// ([129-132], 7) blocks
	ldr	r4, [r12, #28]
	ldr	r5, [r14, #516]
	umlal	r7, r8, r5, r4
	umlal	r8, r9, r1, r4
	umlal	r9, r10, r2, r4
	umlal	r10, r6, r3, r4
	// ([128-131], 8) blocks
	ldr	r3, [r12, #32]
	ldr	r4, [r14, #512]
	umlal	r7, r8, r4, r3
	umlal	r8, r9, r5, r3
	umlal	r9, r10, r1, r3
	umlal	r10, r6, r2, r3
	// ([127-130], 9) blocks
	ldr	r2, [r12, #36]
	ldr	r3, [r14, #508]
	umlal	r7, r8, r3, r2
	umlal	r8, r9, r4, r2
	umlal	r9, r10, r5, r2
	umlal	r10, r6, r1, r2
	// ([126-129], 10) blocks
	ldr	r1, [r12, #40]
	ldr	r2, [r14, #504]
	umlal	r7, r8, r2, r1
	umlal	r8, r9, r3, r1
	umlal	r9, r10, r4, r1
	umlal	r10, r6, r5, r1
	// ([125-128], 11) blocks
	ldr	r5, [r12, #44]
	ldr	r1, [r14, #500]
	umlal	r7, r8, r1, r5
	umlal	r8, r9, r2, r5
	umlal	r9, r10, r3, r5
	umlal	r10, r6, r4, r5
	// ([124-127], 12) blocks
	ldr	r4, [r12, #48]
	ldr	r5, [r14, #496]
	umlal	r7, r8, r5, r4
	umlal	r8, r9, r1, r4
	umlal	r9, r10, r2, r4
	umlal	r10, r6, r3, r4
	// ([123-126], 13) blocks
	ldr	r3, [r12, #52]
	ldr	r4, [r14, #492]
	umlal	r7, r8, r4, r3
	umlal	r8, r9, r5, r3
	umlal	r9, r10, r1, r3
	umlal	r10, r6, r2, r3
	// ([122-125], 14) blocks
	ldr	r2, [r12, #56]
	ldr	r3, [r14, #488]
	umlal	r7, r8, r3, r2
	umlal	r8, r9, r4, r2
	umlal	r9, r10, r5, r2
	umlal	r10, r6, r1, r2
	and	r2, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r2, LSR #4	// range < 31
	and	r2, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r2, LSR #4	// range < 31
	and	r2, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r2, LSR #4	// range < 31
	and	r2, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r2, LSR #4	// range < 31
	// ([121-124], 15) blocks
	ldr	r1, [r12, #60]
	ldr	r2, [r14, #484]
	umlal	r7, r8, r2, r1
	umlal	r8, r9, r3, r1
	umlal	r9, r10, r4, r1
	umlal	r10, r6, r5, r1
	str.w r8, [r0, #4]
	str.w r9, [r0, #8]
	str.w r10, [r0, #12]
	str.w r7, [r0], #16
	// ([140-143], 0) blocks
	ldr	r5, [r12]
	ldr	r4, [r14, #572]
	ldr	r3, [r14, #568]
	ldr	r2, [r14, #564]
	ldr	r1, [r14, #560]
	umull	r7, r8, r2, r5
	umull	r9, r10, r4, r5
	umlal	r6, r7, r1, r5
	umlal	r8, r9, r3, r5
	// ([139-142], 1) blocks
	ldr	r4, [r12, #4]
	ldr	r5, [r14, #556]
	umlal	r6, r7, r5, r4
	umlal	r7, r8, r1, r4
	umlal	r8, r9, r2, r4
	umlal	r9, r10, r3, r4
	// ([138-141], 2) blocks
	ldr	r3, [r12, #8]
	ldr	r4, [r14, #552]
	umlal	r6, r7, r4, r3
	umlal	r7, r8, r5, r3
	umlal	r8, r9, r1, r3
	umlal	r9, r10, r2, r3
	// ([137-140], 3) blocks
	ldr	r2, [r12, #12]
	ldr	r3, [r14, #548]
	umlal	r6, r7, r3, r2
	umlal	r7, r8, r4, r2
	umlal	r8, r9, r5, r2
	umlal	r9, r10, r1, r2
	// ([136-139], 4) blocks
	ldr	r1, [r12, #16]
	ldr	r2, [r14, #544]
	umlal	r6, r7, r2, r1
	umlal	r7, r8, r3, r1
	umlal	r8, r9, r4, r1
	umlal	r9, r10, r5, r1
	// ([135-138], 5) blocks
	ldr	r5, [r12, #20]
	ldr	r1, [r14, #540]
	umlal	r6, r7, r1, r5
	umlal	r7, r8, r2, r5
	umlal	r8, r9, r3, r5
	umlal	r9, r10, r4, r5
	// ([134-137], 6) blocks
	ldr	r4, [r12, #24]
	ldr	r5, [r14, #536]
	umlal	r6, r7, r5, r4
	umlal	r7, r8, r1, r4
	umlal	r8, r9, r2, r4
	umlal	r9, r10, r3, r4
	// ([133-136], 7) blocks
	ldr	r3, [r12, #28]
	ldr	r4, [r14, #532]
	umlal	r6, r7, r4, r3
	umlal	r7, r8, r5, r3
	umlal	r8, r9, r1, r3
	umlal	r9, r10, r2, r3
	// ([132-135], 8) blocks
	ldr	r2, [r12, #32]
	ldr	r3, [r14, #528]
	umlal	r6, r7, r3, r2
	umlal	r7, r8, r4, r2
	umlal	r8, r9, r5, r2
	umlal	r9, r10, r1, r2
	// ([131-134], 9) blocks
	ldr	r1, [r12, #36]
	ldr	r2, [r14, #524]
	umlal	r6, r7, r2, r1
	umlal	r7, r8, r3, r1
	umlal	r8, r9, r4, r1
	umlal	r9, r10, r5, r1
	// ([130-133], 10) blocks
	ldr	r5, [r12, #40]
	ldr	r1, [r14, #520]
	umlal	r6, r7, r1, r5
	umlal	r7, r8, r2, r5
	umlal	r8, r9, r3, r5
	umlal	r9, r10, r4, r5
	// ([129-132], 11) blocks
	ldr	r4, [r12, #44]
	ldr	r5, [r14, #516]
	umlal	r6, r7, r5, r4
	umlal	r7, r8, r1, r4
	umlal	r8, r9, r2, r4
	umlal	r9, r10, r3, r4
	// ([128-131], 12) blocks
	ldr	r3, [r12, #48]
	ldr	r4, [r14, #512]
	umlal	r6, r7, r4, r3
	umlal	r7, r8, r5, r3
	umlal	r8, r9, r1, r3
	umlal	r9, r10, r2, r3
	// ([127-130], 13) blocks
	ldr	r2, [r12, #52]
	ldr	r3, [r14, #508]
	umlal	r6, r7, r3, r2
	umlal	r7, r8, r4, r2
	umlal	r8, r9, r5, r2
	umlal	r9, r10, r1, r2
	// ([126-129], 14) blocks
	ldr	r1, [r12, #56]
	ldr	r2, [r14, #504]
	umlal	r6, r7, r2, r1
	umlal	r7, r8, r3, r1
	umlal	r8, r9, r4, r1
	umlal	r9, r10, r5, r1
	and	r1, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r1, LSR #4	// range < 31
	and	r1, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r1, LSR #4	// range < 31
	and	r1, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r1, LSR #4	// range < 31
	and	r1, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r1, LSR #4	// range < 31
	// ([125-128], 15) blocks
	ldr	r5, [r12, #60]
	ldr	r1, [r14, #500]
	umlal	r6, r7, r1, r5
	umlal	r7, r8, r2, r5
	umlal	r8, r9, r3, r5
	umlal	r9, r10, r4, r5
	str.w r7, [r0, #4]
	str.w r8, [r0, #8]
	str.w r9, [r0, #12]
	str.w r6, [r0], #16
	// ([144-147], 0) blocks
	ldr	r4, [r12]
	ldr	r3, [r14, #588]
	ldr	r2, [r14, #584]
	ldr	r1, [r14, #580]
	ldr	r5, [r14, #576]
	umull	r6, r7, r1, r4
	umull	r8, r9, r3, r4
	umlal	r10, r6, r5, r4
	umlal	r7, r8, r2, r4
	// ([143-146], 1) blocks
	ldr	r3, [r12, #4]
	ldr	r4, [r14, #572]
	umlal	r10, r6, r4, r3
	umlal	r6, r7, r5, r3
	umlal	r7, r8, r1, r3
	umlal	r8, r9, r2, r3
	// ([142-145], 2) blocks
	ldr	r2, [r12, #8]
	ldr	r3, [r14, #568]
	umlal	r10, r6, r3, r2
	umlal	r6, r7, r4, r2
	umlal	r7, r8, r5, r2
	umlal	r8, r9, r1, r2
	// ([141-144], 3) blocks
	ldr	r1, [r12, #12]
	ldr	r2, [r14, #564]
	umlal	r10, r6, r2, r1
	umlal	r6, r7, r3, r1
	umlal	r7, r8, r4, r1
	umlal	r8, r9, r5, r1
	// ([140-143], 4) blocks
	ldr	r5, [r12, #16]
	ldr	r1, [r14, #560]
	umlal	r10, r6, r1, r5
	umlal	r6, r7, r2, r5
	umlal	r7, r8, r3, r5
	umlal	r8, r9, r4, r5
	// ([139-142], 5) blocks
	ldr	r4, [r12, #20]
	ldr	r5, [r14, #556]
	umlal	r10, r6, r5, r4
	umlal	r6, r7, r1, r4
	umlal	r7, r8, r2, r4
	umlal	r8, r9, r3, r4
	// ([138-141], 6) blocks
	ldr	r3, [r12, #24]
	ldr	r4, [r14, #552]
	umlal	r10, r6, r4, r3
	umlal	r6, r7, r5, r3
	umlal	r7, r8, r1, r3
	umlal	r8, r9, r2, r3
	// ([137-140], 7) blocks
	ldr	r2, [r12, #28]
	ldr	r3, [r14, #548]
	umlal	r10, r6, r3, r2
	umlal	r6, r7, r4, r2
	umlal	r7, r8, r5, r2
	umlal	r8, r9, r1, r2
	// ([136-139], 8) blocks
	ldr	r1, [r12, #32]
	ldr	r2, [r14, #544]
	umlal	r10, r6, r2, r1
	umlal	r6, r7, r3, r1
	umlal	r7, r8, r4, r1
	umlal	r8, r9, r5, r1
	// ([135-138], 9) blocks
	ldr	r5, [r12, #36]
	ldr	r1, [r14, #540]
	umlal	r10, r6, r1, r5
	umlal	r6, r7, r2, r5
	umlal	r7, r8, r3, r5
	umlal	r8, r9, r4, r5
	// ([134-137], 10) blocks
	ldr	r4, [r12, #40]
	ldr	r5, [r14, #536]
	umlal	r10, r6, r5, r4
	umlal	r6, r7, r1, r4
	umlal	r7, r8, r2, r4
	umlal	r8, r9, r3, r4
	// ([133-136], 11) blocks
	ldr	r3, [r12, #44]
	ldr	r4, [r14, #532]
	umlal	r10, r6, r4, r3
	umlal	r6, r7, r5, r3
	umlal	r7, r8, r1, r3
	umlal	r8, r9, r2, r3
	// ([132-135], 12) blocks
	ldr	r2, [r12, #48]
	ldr	r3, [r14, #528]
	umlal	r10, r6, r3, r2
	umlal	r6, r7, r4, r2
	umlal	r7, r8, r5, r2
	umlal	r8, r9, r1, r2
	// ([131-134], 13) blocks
	ldr	r1, [r12, #52]
	ldr	r2, [r14, #524]
	umlal	r10, r6, r2, r1
	umlal	r6, r7, r3, r1
	umlal	r7, r8, r4, r1
	umlal	r8, r9, r5, r1
	// ([130-133], 14) blocks
	ldr	r5, [r12, #56]
	ldr	r1, [r14, #520]
	umlal	r10, r6, r1, r5
	umlal	r6, r7, r2, r5
	umlal	r7, r8, r3, r5
	umlal	r8, r9, r4, r5
	and	r5, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r5, LSR #4	// range < 31
	and	r5, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r5, LSR #4	// range < 31
	and	r5, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r5, LSR #4	// range < 31
	and	r5, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r5, LSR #4	// range < 31
	// ([129-132], 15) blocks
	ldr	r4, [r12, #60]
	ldr	r5, [r14, #516]
	umlal	r10, r6, r5, r4
	umlal	r6, r7, r1, r4
	umlal	r7, r8, r2, r4
	umlal	r8, r9, r3, r4
	str.w r6, [r0, #4]
	str.w r7, [r0, #8]
	str.w r8, [r0, #12]
	str.w r10, [r0], #16
	// ([148-151], 0) blocks
	ldr	r3, [r12]
	ldr	r2, [r14, #604]
	ldr	r1, [r14, #600]
	ldr	r5, [r14, #596]
	ldr	r4, [r14, #592]
	umull	r10, r6, r5, r3
	umull	r7, r8, r2, r3
	umlal	r9, r10, r4, r3
	umlal	r6, r7, r1, r3
	// ([147-150], 1) blocks
	ldr	r2, [r12, #4]
	ldr	r3, [r14, #588]
	umlal	r9, r10, r3, r2
	umlal	r10, r6, r4, r2
	umlal	r6, r7, r5, r2
	umlal	r7, r8, r1, r2
	// ([146-149], 2) blocks
	ldr	r1, [r12, #8]
	ldr	r2, [r14, #584]
	umlal	r9, r10, r2, r1
	umlal	r10, r6, r3, r1
	umlal	r6, r7, r4, r1
	umlal	r7, r8, r5, r1
	// ([145-148], 3) blocks
	ldr	r5, [r12, #12]
	ldr	r1, [r14, #580]
	umlal	r9, r10, r1, r5
	umlal	r10, r6, r2, r5
	umlal	r6, r7, r3, r5
	umlal	r7, r8, r4, r5
	// ([144-147], 4) blocks
	ldr	r4, [r12, #16]
	ldr	r5, [r14, #576]
	umlal	r9, r10, r5, r4
	umlal	r10, r6, r1, r4
	umlal	r6, r7, r2, r4
	umlal	r7, r8, r3, r4
	// ([143-146], 5) blocks
	ldr	r3, [r12, #20]
	ldr	r4, [r14, #572]
	umlal	r9, r10, r4, r3
	umlal	r10, r6, r5, r3
	umlal	r6, r7, r1, r3
	umlal	r7, r8, r2, r3
	// ([142-145], 6) blocks
	ldr	r2, [r12, #24]
	ldr	r3, [r14, #568]
	umlal	r9, r10, r3, r2
	umlal	r10, r6, r4, r2
	umlal	r6, r7, r5, r2
	umlal	r7, r8, r1, r2
	// ([141-144], 7) blocks
	ldr	r1, [r12, #28]
	ldr	r2, [r14, #564]
	umlal	r9, r10, r2, r1
	umlal	r10, r6, r3, r1
	umlal	r6, r7, r4, r1
	umlal	r7, r8, r5, r1
	// ([140-143], 8) blocks
	ldr	r5, [r12, #32]
	ldr	r1, [r14, #560]
	umlal	r9, r10, r1, r5
	umlal	r10, r6, r2, r5
	umlal	r6, r7, r3, r5
	umlal	r7, r8, r4, r5
	// ([139-142], 9) blocks
	ldr	r4, [r12, #36]
	ldr	r5, [r14, #556]
	umlal	r9, r10, r5, r4
	umlal	r10, r6, r1, r4
	umlal	r6, r7, r2, r4
	umlal	r7, r8, r3, r4
	// ([138-141], 10) blocks
	ldr	r3, [r12, #40]
	ldr	r4, [r14, #552]
	umlal	r9, r10, r4, r3
	umlal	r10, r6, r5, r3
	umlal	r6, r7, r1, r3
	umlal	r7, r8, r2, r3
	// ([137-140], 11) blocks
	ldr	r2, [r12, #44]
	ldr	r3, [r14, #548]
	umlal	r9, r10, r3, r2
	umlal	r10, r6, r4, r2
	umlal	r6, r7, r5, r2
	umlal	r7, r8, r1, r2
	// ([136-139], 12) blocks
	ldr	r1, [r12, #48]
	ldr	r2, [r14, #544]
	umlal	r9, r10, r2, r1
	umlal	r10, r6, r3, r1
	umlal	r6, r7, r4, r1
	umlal	r7, r8, r5, r1
	// ([135-138], 13) blocks
	ldr	r5, [r12, #52]
	ldr	r1, [r14, #540]
	umlal	r9, r10, r1, r5
	umlal	r10, r6, r2, r5
	umlal	r6, r7, r3, r5
	umlal	r7, r8, r4, r5
	// ([134-137], 14) blocks
	ldr	r4, [r12, #56]
	ldr	r5, [r14, #536]
	umlal	r9, r10, r5, r4
	umlal	r10, r6, r1, r4
	umlal	r6, r7, r2, r4
	umlal	r7, r8, r3, r4
	and	r4, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r4, LSR #4	// range < 31
	and	r4, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r4, LSR #4	// range < 31
	and	r4, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r4, LSR #4	// range < 31
	and	r4, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r4, LSR #4	// range < 31
	// ([133-136], 15) blocks
	ldr	r3, [r12, #60]
	ldr	r4, [r14, #532]
	umlal	r9, r10, r4, r3
	umlal	r10, r6, r5, r3
	umlal	r6, r7, r1, r3
	umlal	r7, r8, r2, r3
	str.w r10, [r0, #4]
	str.w r6, [r0, #8]
	str.w r7, [r0, #12]
	str.w r9, [r0], #16
mul_256:
	// ([152-155], 0) blocks
	ldr	r2, [r12]
	ldr	r1, [r14, #620]
	ldr	r5, [r14, #616]
	ldr	r4, [r14, #612]
	ldr	r3, [r14, #608]
	umull	r9, r10, r4, r2
	umull	r6, r7, r1, r2
	umlal	r8, r9, r3, r2
	umlal	r10, r6, r5, r2
	// ([151-154], 1) blocks
	ldr	r1, [r12, #4]
	ldr	r2, [r14, #604]
	umlal	r8, r9, r2, r1
	umlal	r9, r10, r3, r1
	umlal	r10, r6, r4, r1
	umlal	r6, r7, r5, r1
	// ([150-153], 2) blocks
	ldr	r5, [r12, #8]
	ldr	r1, [r14, #600]
	umlal	r8, r9, r1, r5
	umlal	r9, r10, r2, r5
	umlal	r10, r6, r3, r5
	umlal	r6, r7, r4, r5
	// ([149-152], 3) blocks
	ldr	r4, [r12, #12]
	ldr	r5, [r14, #596]
	umlal	r8, r9, r5, r4
	umlal	r9, r10, r1, r4
	umlal	r10, r6, r2, r4
	umlal	r6, r7, r3, r4
	// ([148-151], 4) blocks
	ldr	r3, [r12, #16]
	ldr	r4, [r14, #592]
	umlal	r8, r9, r4, r3
	umlal	r9, r10, r5, r3
	umlal	r10, r6, r1, r3
	umlal	r6, r7, r2, r3
	// ([147-150], 5) blocks
	ldr	r2, [r12, #20]
	ldr	r3, [r14, #588]
	umlal	r8, r9, r3, r2
	umlal	r9, r10, r4, r2
	umlal	r10, r6, r5, r2
	umlal	r6, r7, r1, r2
	// ([146-149], 6) blocks
	ldr	r1, [r12, #24]
	ldr	r2, [r14, #584]
	umlal	r8, r9, r2, r1
	umlal	r9, r10, r3, r1
	umlal	r10, r6, r4, r1
	umlal	r6, r7, r5, r1
	// ([145-148], 7) blocks
	ldr	r5, [r12, #28]
	ldr	r1, [r14, #580]
	umlal	r8, r9, r1, r5
	umlal	r9, r10, r2, r5
	umlal	r10, r6, r3, r5
	umlal	r6, r7, r4, r5
	// ([144-147], 8) blocks
	ldr	r4, [r12, #32]
	ldr	r5, [r14, #576]
	umlal	r8, r9, r5, r4
	umlal	r9, r10, r1, r4
	umlal	r10, r6, r2, r4
	umlal	r6, r7, r3, r4
	// ([143-146], 9) blocks
	ldr	r3, [r12, #36]
	ldr	r4, [r14, #572]
	umlal	r8, r9, r4, r3
	umlal	r9, r10, r5, r3
	umlal	r10, r6, r1, r3
	umlal	r6, r7, r2, r3
	// ([142-145], 10) blocks
	ldr	r2, [r12, #40]
	ldr	r3, [r14, #568]
	umlal	r8, r9, r3, r2
	umlal	r9, r10, r4, r2
	umlal	r10, r6, r5, r2
	umlal	r6, r7, r1, r2
	// ([141-144], 11) blocks
	ldr	r1, [r12, #44]
	ldr	r2, [r14, #564]
	umlal	r8, r9, r2, r1
	umlal	r9, r10, r3, r1
	umlal	r10, r6, r4, r1
	umlal	r6, r7, r5, r1
	// ([140-143], 12) blocks
	ldr	r5, [r12, #48]
	ldr	r1, [r14, #560]
	umlal	r8, r9, r1, r5
	umlal	r9, r10, r2, r5
	umlal	r10, r6, r3, r5
	umlal	r6, r7, r4, r5
	// ([139-142], 13) blocks
	ldr	r4, [r12, #52]
	ldr	r5, [r14, #556]
	umlal	r8, r9, r5, r4
	umlal	r9, r10, r1, r4
	umlal	r10, r6, r2, r4
	umlal	r6, r7, r3, r4
	// ([138-141], 14) blocks
	ldr	r3, [r12, #56]
	ldr	r4, [r14, #552]
	umlal	r8, r9, r4, r3
	umlal	r9, r10, r5, r3
	umlal	r10, r6, r1, r3
	umlal	r6, r7, r2, r3
	and	r3, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r3, LSR #4	// range < 31
	and	r3, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r3, LSR #4	// range < 31
	and	r3, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r3, LSR #4	// range < 31
	and	r3, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r3, LSR #4	// range < 31
	// ([137-140], 15) blocks
	ldr	r2, [r12, #60]
	ldr	r3, [r14, #548]
	umlal	r8, r9, r3, r2
	umlal	r9, r10, r4, r2
	umlal	r10, r6, r5, r2
	umlal	r6, r7, r1, r2
	str.w r9, [r0, #4]
	str.w r10, [r0, #8]
	str.w r6, [r0, #12]
	str.w r8, [r0], #16
	// ([156-159], 0) blocks
	ldr	r1, [r12]
	ldr	r5, [r14, #636]
	ldr	r4, [r14, #632]
	ldr	r3, [r14, #628]
	ldr	r2, [r14, #624]
	umull	r8, r9, r3, r1
	umull	r10, r6, r5, r1
	umlal	r7, r8, r2, r1
	umlal	r9, r10, r4, r1
	// ([155-158], 1) blocks
	ldr	r5, [r12, #4]
	ldr	r1, [r14, #620]
	umlal	r7, r8, r1, r5
	umlal	r8, r9, r2, r5
	umlal	r9, r10, r3, r5
	umlal	r10, r6, r4, r5
	// ([154-157], 2) blocks
	ldr	r4, [r12, #8]
	ldr	r5, [r14, #616]
	umlal	r7, r8, r5, r4
	umlal	r8, r9, r1, r4
	umlal	r9, r10, r2, r4
	umlal	r10, r6, r3, r4
	// ([153-156], 3) blocks
	ldr	r3, [r12, #12]
	ldr	r4, [r14, #612]
	umlal	r7, r8, r4, r3
	umlal	r8, r9, r5, r3
	umlal	r9, r10, r1, r3
	umlal	r10, r6, r2, r3
	// ([152-155], 4) blocks
	ldr	r2, [r12, #16]
	ldr	r3, [r14, #608]
	umlal	r7, r8, r3, r2
	umlal	r8, r9, r4, r2
	umlal	r9, r10, r5, r2
	umlal	r10, r6, r1, r2
	// ([151-154], 5) blocks
	ldr	r1, [r12, #20]
	ldr	r2, [r14, #604]
	umlal	r7, r8, r2, r1
	umlal	r8, r9, r3, r1
	umlal	r9, r10, r4, r1
	umlal	r10, r6, r5, r1
	// ([150-153], 6) blocks
	ldr	r5, [r12, #24]
	ldr	r1, [r14, #600]
	umlal	r7, r8, r1, r5
	umlal	r8, r9, r2, r5
	umlal	r9, r10, r3, r5
	umlal	r10, r6, r4, r5
	// ([149-152], 7) blocks
	ldr	r4, [r12, #28]
	ldr	r5, [r14, #596]
	umlal	r7, r8, r5, r4
	umlal	r8, r9, r1, r4
	umlal	r9, r10, r2, r4
	umlal	r10, r6, r3, r4
	// ([148-151], 8) blocks
	ldr	r3, [r12, #32]
	ldr	r4, [r14, #592]
	umlal	r7, r8, r4, r3
	umlal	r8, r9, r5, r3
	umlal	r9, r10, r1, r3
	umlal	r10, r6, r2, r3
	// ([147-150], 9) blocks
	ldr	r2, [r12, #36]
	ldr	r3, [r14, #588]
	umlal	r7, r8, r3, r2
	umlal	r8, r9, r4, r2
	umlal	r9, r10, r5, r2
	umlal	r10, r6, r1, r2
	// ([146-149], 10) blocks
	ldr	r1, [r12, #40]
	ldr	r2, [r14, #584]
	umlal	r7, r8, r2, r1
	umlal	r8, r9, r3, r1
	umlal	r9, r10, r4, r1
	umlal	r10, r6, r5, r1
	// ([145-148], 11) blocks
	ldr	r5, [r12, #44]
	ldr	r1, [r14, #580]
	umlal	r7, r8, r1, r5
	umlal	r8, r9, r2, r5
	umlal	r9, r10, r3, r5
	umlal	r10, r6, r4, r5
	// ([144-147], 12) blocks
	ldr	r4, [r12, #48]
	ldr	r5, [r14, #576]
	umlal	r7, r8, r5, r4
	umlal	r8, r9, r1, r4
	umlal	r9, r10, r2, r4
	umlal	r10, r6, r3, r4
	// ([143-146], 13) blocks
	ldr	r3, [r12, #52]
	ldr	r4, [r14, #572]
	umlal	r7, r8, r4, r3
	umlal	r8, r9, r5, r3
	umlal	r9, r10, r1, r3
	umlal	r10, r6, r2, r3
	// ([142-145], 14) blocks
	ldr	r2, [r12, #56]
	ldr	r3, [r14, #568]
	umlal	r7, r8, r3, r2
	umlal	r8, r9, r4, r2
	umlal	r9, r10, r5, r2
	umlal	r10, r6, r1, r2
	and	r2, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r2, LSR #4	// range < 31
	and	r2, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r2, LSR #4	// range < 31
	and	r2, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r2, LSR #4	// range < 31
	and	r2, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r2, LSR #4	// range < 31
	// ([141-144], 15) blocks
	ldr	r1, [r12, #60]
	ldr	r2, [r14, #564]
	umlal	r7, r8, r2, r1
	umlal	r8, r9, r3, r1
	umlal	r9, r10, r4, r1
	umlal	r10, r6, r5, r1
	str.w r8, [r0, #4]
	str.w r9, [r0, #8]
	str.w r10, [r0, #12]
	str.w r7, [r0], #16
	// ([160-163], 0) blocks
	ldr	r5, [r12]
	ldr	r4, [r14, #652]
	ldr	r3, [r14, #648]
	ldr	r2, [r14, #644]
	ldr	r1, [r14, #640]
	umull	r7, r8, r2, r5
	umull	r9, r10, r4, r5
	umlal	r6, r7, r1, r5
	umlal	r8, r9, r3, r5
	// ([159-162], 1) blocks
	ldr	r4, [r12, #4]
	ldr	r5, [r14, #636]
	umlal	r6, r7, r5, r4
	umlal	r7, r8, r1, r4
	umlal	r8, r9, r2, r4
	umlal	r9, r10, r3, r4
	// ([158-161], 2) blocks
	ldr	r3, [r12, #8]
	ldr	r4, [r14, #632]
	umlal	r6, r7, r4, r3
	umlal	r7, r8, r5, r3
	umlal	r8, r9, r1, r3
	umlal	r9, r10, r2, r3
	// ([157-160], 3) blocks
	ldr	r2, [r12, #12]
	ldr	r3, [r14, #628]
	umlal	r6, r7, r3, r2
	umlal	r7, r8, r4, r2
	umlal	r8, r9, r5, r2
	umlal	r9, r10, r1, r2
	// ([156-159], 4) blocks
	ldr	r1, [r12, #16]
	ldr	r2, [r14, #624]
	umlal	r6, r7, r2, r1
	umlal	r7, r8, r3, r1
	umlal	r8, r9, r4, r1
	umlal	r9, r10, r5, r1
	// ([155-158], 5) blocks
	ldr	r5, [r12, #20]
	ldr	r1, [r14, #620]
	umlal	r6, r7, r1, r5
	umlal	r7, r8, r2, r5
	umlal	r8, r9, r3, r5
	umlal	r9, r10, r4, r5
	// ([154-157], 6) blocks
	ldr	r4, [r12, #24]
	ldr	r5, [r14, #616]
	umlal	r6, r7, r5, r4
	umlal	r7, r8, r1, r4
	umlal	r8, r9, r2, r4
	umlal	r9, r10, r3, r4
	// ([153-156], 7) blocks
	ldr	r3, [r12, #28]
	ldr	r4, [r14, #612]
	umlal	r6, r7, r4, r3
	umlal	r7, r8, r5, r3
	umlal	r8, r9, r1, r3
	umlal	r9, r10, r2, r3
	// ([152-155], 8) blocks
	ldr	r2, [r12, #32]
	ldr	r3, [r14, #608]
	umlal	r6, r7, r3, r2
	umlal	r7, r8, r4, r2
	umlal	r8, r9, r5, r2
	umlal	r9, r10, r1, r2
	// ([151-154], 9) blocks
	ldr	r1, [r12, #36]
	ldr	r2, [r14, #604]
	umlal	r6, r7, r2, r1
	umlal	r7, r8, r3, r1
	umlal	r8, r9, r4, r1
	umlal	r9, r10, r5, r1
	// ([150-153], 10) blocks
	ldr	r5, [r12, #40]
	ldr	r1, [r14, #600]
	umlal	r6, r7, r1, r5
	umlal	r7, r8, r2, r5
	umlal	r8, r9, r3, r5
	umlal	r9, r10, r4, r5
	// ([149-152], 11) blocks
	ldr	r4, [r12, #44]
	ldr	r5, [r14, #596]
	umlal	r6, r7, r5, r4
	umlal	r7, r8, r1, r4
	umlal	r8, r9, r2, r4
	umlal	r9, r10, r3, r4
	// ([148-151], 12) blocks
	ldr	r3, [r12, #48]
	ldr	r4, [r14, #592]
	umlal	r6, r7, r4, r3
	umlal	r7, r8, r5, r3
	umlal	r8, r9, r1, r3
	umlal	r9, r10, r2, r3
	// ([147-150], 13) blocks
	ldr	r2, [r12, #52]
	ldr	r3, [r14, #588]
	umlal	r6, r7, r3, r2
	umlal	r7, r8, r4, r2
	umlal	r8, r9, r5, r2
	umlal	r9, r10, r1, r2
	// ([146-149], 14) blocks
	ldr	r1, [r12, #56]
	ldr	r2, [r14, #584]
	umlal	r6, r7, r2, r1
	umlal	r7, r8, r3, r1
	umlal	r8, r9, r4, r1
	umlal	r9, r10, r5, r1
	and	r1, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r1, LSR #4	// range < 31
	and	r1, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r1, LSR #4	// range < 31
	and	r1, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r1, LSR #4	// range < 31
	and	r1, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r1, LSR #4	// range < 31
	// ([145-148], 15) blocks
	ldr	r5, [r12, #60]
	ldr	r1, [r14, #580]
	umlal	r6, r7, r1, r5
	umlal	r7, r8, r2, r5
	umlal	r8, r9, r3, r5
	umlal	r9, r10, r4, r5
	str.w r7, [r0, #4]
	str.w r8, [r0, #8]
	str.w r9, [r0, #12]
	str.w r6, [r0], #16
	// ([164-167], 0) blocks
	ldr	r4, [r12]
	ldr	r3, [r14, #668]
	ldr	r2, [r14, #664]
	ldr	r1, [r14, #660]
	ldr	r5, [r14, #656]
	umull	r6, r7, r1, r4
	umull	r8, r9, r3, r4
	umlal	r10, r6, r5, r4
	umlal	r7, r8, r2, r4
	// ([163-166], 1) blocks
	ldr	r3, [r12, #4]
	ldr	r4, [r14, #652]
	umlal	r10, r6, r4, r3
	umlal	r6, r7, r5, r3
	umlal	r7, r8, r1, r3
	umlal	r8, r9, r2, r3
	// ([162-165], 2) blocks
	ldr	r2, [r12, #8]
	ldr	r3, [r14, #648]
	umlal	r10, r6, r3, r2
	umlal	r6, r7, r4, r2
	umlal	r7, r8, r5, r2
	umlal	r8, r9, r1, r2
	// ([161-164], 3) blocks
	ldr	r1, [r12, #12]
	ldr	r2, [r14, #644]
	umlal	r10, r6, r2, r1
	umlal	r6, r7, r3, r1
	umlal	r7, r8, r4, r1
	umlal	r8, r9, r5, r1
	// ([160-163], 4) blocks
	ldr	r5, [r12, #16]
	ldr	r1, [r14, #640]
	umlal	r10, r6, r1, r5
	umlal	r6, r7, r2, r5
	umlal	r7, r8, r3, r5
	umlal	r8, r9, r4, r5
	// ([159-162], 5) blocks
	ldr	r4, [r12, #20]
	ldr	r5, [r14, #636]
	umlal	r10, r6, r5, r4
	umlal	r6, r7, r1, r4
	umlal	r7, r8, r2, r4
	umlal	r8, r9, r3, r4
	// ([158-161], 6) blocks
	ldr	r3, [r12, #24]
	ldr	r4, [r14, #632]
	umlal	r10, r6, r4, r3
	umlal	r6, r7, r5, r3
	umlal	r7, r8, r1, r3
	umlal	r8, r9, r2, r3
	// ([157-160], 7) blocks
	ldr	r2, [r12, #28]
	ldr	r3, [r14, #628]
	umlal	r10, r6, r3, r2
	umlal	r6, r7, r4, r2
	umlal	r7, r8, r5, r2
	umlal	r8, r9, r1, r2
	// ([156-159], 8) blocks
	ldr	r1, [r12, #32]
	ldr	r2, [r14, #624]
	umlal	r10, r6, r2, r1
	umlal	r6, r7, r3, r1
	umlal	r7, r8, r4, r1
	umlal	r8, r9, r5, r1
	// ([155-158], 9) blocks
	ldr	r5, [r12, #36]
	ldr	r1, [r14, #620]
	umlal	r10, r6, r1, r5
	umlal	r6, r7, r2, r5
	umlal	r7, r8, r3, r5
	umlal	r8, r9, r4, r5
	// ([154-157], 10) blocks
	ldr	r4, [r12, #40]
	ldr	r5, [r14, #616]
	umlal	r10, r6, r5, r4
	umlal	r6, r7, r1, r4
	umlal	r7, r8, r2, r4
	umlal	r8, r9, r3, r4
	// ([153-156], 11) blocks
	ldr	r3, [r12, #44]
	ldr	r4, [r14, #612]
	umlal	r10, r6, r4, r3
	umlal	r6, r7, r5, r3
	umlal	r7, r8, r1, r3
	umlal	r8, r9, r2, r3
	// ([152-155], 12) blocks
	ldr	r2, [r12, #48]
	ldr	r3, [r14, #608]
	umlal	r10, r6, r3, r2
	umlal	r6, r7, r4, r2
	umlal	r7, r8, r5, r2
	umlal	r8, r9, r1, r2
	// ([151-154], 13) blocks
	ldr	r1, [r12, #52]
	ldr	r2, [r14, #604]
	umlal	r10, r6, r2, r1
	umlal	r6, r7, r3, r1
	umlal	r7, r8, r4, r1
	umlal	r8, r9, r5, r1
	// ([150-153], 14) blocks
	ldr	r5, [r12, #56]
	ldr	r1, [r14, #600]
	umlal	r10, r6, r1, r5
	umlal	r6, r7, r2, r5
	umlal	r7, r8, r3, r5
	umlal	r8, r9, r4, r5
	and	r5, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r5, LSR #4	// range < 31
	and	r5, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r5, LSR #4	// range < 31
	and	r5, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r5, LSR #4	// range < 31
	and	r5, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r5, LSR #4	// range < 31
	// ([149-152], 15) blocks
	ldr	r4, [r12, #60]
	ldr	r5, [r14, #596]
	umlal	r10, r6, r5, r4
	umlal	r6, r7, r1, r4
	umlal	r7, r8, r2, r4
	umlal	r8, r9, r3, r4
	str.w r6, [r0, #4]
	str.w r7, [r0, #8]
	str.w r8, [r0, #12]
	str.w r10, [r0], #16
mul_192:
	// ([168-171], 0) blocks
	ldr	r3, [r12]
	ldr	r2, [r14, #684]
	ldr	r1, [r14, #680]
	ldr	r5, [r14, #676]
	ldr	r4, [r14, #672]
	umull	r10, r6, r5, r3
	umull	r7, r8, r2, r3
	umlal	r9, r10, r4, r3
	umlal	r6, r7, r1, r3
	// ([167-170], 1) blocks
	ldr	r2, [r12, #4]
	ldr	r3, [r14, #668]
	umlal	r9, r10, r3, r2
	umlal	r10, r6, r4, r2
	umlal	r6, r7, r5, r2
	umlal	r7, r8, r1, r2
	// ([166-169], 2) blocks
	ldr	r1, [r12, #8]
	ldr	r2, [r14, #664]
	umlal	r9, r10, r2, r1
	umlal	r10, r6, r3, r1
	umlal	r6, r7, r4, r1
	umlal	r7, r8, r5, r1
	// ([165-168], 3) blocks
	ldr	r5, [r12, #12]
	ldr	r1, [r14, #660]
	umlal	r9, r10, r1, r5
	umlal	r10, r6, r2, r5
	umlal	r6, r7, r3, r5
	umlal	r7, r8, r4, r5
	// ([164-167], 4) blocks
	ldr	r4, [r12, #16]
	ldr	r5, [r14, #656]
	umlal	r9, r10, r5, r4
	umlal	r10, r6, r1, r4
	umlal	r6, r7, r2, r4
	umlal	r7, r8, r3, r4
	// ([163-166], 5) blocks
	ldr	r3, [r12, #20]
	ldr	r4, [r14, #652]
	umlal	r9, r10, r4, r3
	umlal	r10, r6, r5, r3
	umlal	r6, r7, r1, r3
	umlal	r7, r8, r2, r3
	// ([162-165], 6) blocks
	ldr	r2, [r12, #24]
	ldr	r3, [r14, #648]
	umlal	r9, r10, r3, r2
	umlal	r10, r6, r4, r2
	umlal	r6, r7, r5, r2
	umlal	r7, r8, r1, r2
	// ([161-164], 7) blocks
	ldr	r1, [r12, #28]
	ldr	r2, [r14, #644]
	umlal	r9, r10, r2, r1
	umlal	r10, r6, r3, r1
	umlal	r6, r7, r4, r1
	umlal	r7, r8, r5, r1
	// ([160-163], 8) blocks
	ldr	r5, [r12, #32]
	ldr	r1, [r14, #640]
	umlal	r9, r10, r1, r5
	umlal	r10, r6, r2, r5
	umlal	r6, r7, r3, r5
	umlal	r7, r8, r4, r5
	// ([159-162], 9) blocks
	ldr	r4, [r12, #36]
	ldr	r5, [r14, #636]
	umlal	r9, r10, r5, r4
	umlal	r10, r6, r1, r4
	umlal	r6, r7, r2, r4
	umlal	r7, r8, r3, r4
	// ([158-161], 10) blocks
	ldr	r3, [r12, #40]
	ldr	r4, [r14, #632]
	umlal	r9, r10, r4, r3
	umlal	r10, r6, r5, r3
	umlal	r6, r7, r1, r3
	umlal	r7, r8, r2, r3
	// ([157-160], 11) blocks
	ldr	r2, [r12, #44]
	ldr	r3, [r14, #628]
	umlal	r9, r10, r3, r2
	umlal	r10, r6, r4, r2
	umlal	r6, r7, r5, r2
	umlal	r7, r8, r1, r2
	// ([156-159], 12) blocks
	ldr	r1, [r12, #48]
	ldr	r2, [r14, #624]
	umlal	r9, r10, r2, r1
	umlal	r10, r6, r3, r1
	umlal	r6, r7, r4, r1
	umlal	r7, r8, r5, r1
	// ([155-158], 13) blocks
	ldr	r5, [r12, #52]
	ldr	r1, [r14, #620]
	umlal	r9, r10, r1, r5
	umlal	r10, r6, r2, r5
	umlal	r6, r7, r3, r5
	umlal	r7, r8, r4, r5
	// ([154-157], 14) blocks
	ldr	r4, [r12, #56]
	ldr	r5, [r14, #616]
	umlal	r9, r10, r5, r4
	umlal	r10, r6, r1, r4
	umlal	r6, r7, r2, r4
	umlal	r7, r8, r3, r4
	and	r4, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r4, LSR #4	// range < 31
	and	r4, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r4, LSR #4	// range < 31
	and	r4, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r4, LSR #4	// range < 31
	and	r4, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r4, LSR #4	// range < 31
	// ([153-156], 15) blocks
	ldr	r3, [r12, #60]
	ldr	r4, [r14, #612]
	umlal	r9, r10, r4, r3
	umlal	r10, r6, r5, r3
	umlal	r6, r7, r1, r3
	umlal	r7, r8, r2, r3
	str.w r10, [r0, #4]
	str.w r6, [r0, #8]
	str.w r7, [r0, #12]
	str.w r9, [r0], #16
	// ([172-175], 0) blocks
	ldr	r2, [r12]
	ldr	r1, [r14, #700]
	ldr	r5, [r14, #696]
	ldr	r4, [r14, #692]
	ldr	r3, [r14, #688]
	umull	r9, r10, r4, r2
	umull	r6, r7, r1, r2
	umlal	r8, r9, r3, r2
	umlal	r10, r6, r5, r2
	// ([171-174], 1) blocks
	ldr	r1, [r12, #4]
	ldr	r2, [r14, #684]
	umlal	r8, r9, r2, r1
	umlal	r9, r10, r3, r1
	umlal	r10, r6, r4, r1
	umlal	r6, r7, r5, r1
	// ([170-173], 2) blocks
	ldr	r5, [r12, #8]
	ldr	r1, [r14, #680]
	umlal	r8, r9, r1, r5
	umlal	r9, r10, r2, r5
	umlal	r10, r6, r3, r5
	umlal	r6, r7, r4, r5
	// ([169-172], 3) blocks
	ldr	r4, [r12, #12]
	ldr	r5, [r14, #676]
	umlal	r8, r9, r5, r4
	umlal	r9, r10, r1, r4
	umlal	r10, r6, r2, r4
	umlal	r6, r7, r3, r4
	// ([168-171], 4) blocks
	ldr	r3, [r12, #16]
	ldr	r4, [r14, #672]
	umlal	r8, r9, r4, r3
	umlal	r9, r10, r5, r3
	umlal	r10, r6, r1, r3
	umlal	r6, r7, r2, r3
	// ([167-170], 5) blocks
	ldr	r2, [r12, #20]
	ldr	r3, [r14, #668]
	umlal	r8, r9, r3, r2
	umlal	r9, r10, r4, r2
	umlal	r10, r6, r5, r2
	umlal	r6, r7, r1, r2
	// ([166-169], 6) blocks
	ldr	r1, [r12, #24]
	ldr	r2, [r14, #664]
	umlal	r8, r9, r2, r1
	umlal	r9, r10, r3, r1
	umlal	r10, r6, r4, r1
	umlal	r6, r7, r5, r1
	// ([165-168], 7) blocks
	ldr	r5, [r12, #28]
	ldr	r1, [r14, #660]
	umlal	r8, r9, r1, r5
	umlal	r9, r10, r2, r5
	umlal	r10, r6, r3, r5
	umlal	r6, r7, r4, r5
	// ([164-167], 8) blocks
	ldr	r4, [r12, #32]
	ldr	r5, [r14, #656]
	umlal	r8, r9, r5, r4
	umlal	r9, r10, r1, r4
	umlal	r10, r6, r2, r4
	umlal	r6, r7, r3, r4
	// ([163-166], 9) blocks
	ldr	r3, [r12, #36]
	ldr	r4, [r14, #652]
	umlal	r8, r9, r4, r3
	umlal	r9, r10, r5, r3
	umlal	r10, r6, r1, r3
	umlal	r6, r7, r2, r3
	// ([162-165], 10) blocks
	ldr	r2, [r12, #40]
	ldr	r3, [r14, #648]
	umlal	r8, r9, r3, r2
	umlal	r9, r10, r4, r2
	umlal	r10, r6, r5, r2
	umlal	r6, r7, r1, r2
	// ([161-164], 11) blocks
	ldr	r1, [r12, #44]
	ldr	r2, [r14, #644]
	umlal	r8, r9, r2, r1
	umlal	r9, r10, r3, r1
	umlal	r10, r6, r4, r1
	umlal	r6, r7, r5, r1
	// ([160-163], 12) blocks
	ldr	r5, [r12, #48]
	ldr	r1, [r14, #640]
	umlal	r8, r9, r1, r5
	umlal	r9, r10, r2, r5
	umlal	r10, r6, r3, r5
	umlal	r6, r7, r4, r5
	// ([159-162], 13) blocks
	ldr	r4, [r12, #52]
	ldr	r5, [r14, #636]
	umlal	r8, r9, r5, r4
	umlal	r9, r10, r1, r4
	umlal	r10, r6, r2, r4
	umlal	r6, r7, r3, r4
	// ([158-161], 14) blocks
	ldr	r3, [r12, #56]
	ldr	r4, [r14, #632]
	umlal	r8, r9, r4, r3
	umlal	r9, r10, r5, r3
	umlal	r10, r6, r1, r3
	umlal	r6, r7, r2, r3
	and	r3, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r3, LSR #4	// range < 31
	and	r3, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r3, LSR #4	// range < 31
	and	r3, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r3, LSR #4	// range < 31
	and	r3, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r3, LSR #4	// range < 31
	// ([157-160], 15) blocks
	ldr	r2, [r12, #60]
	ldr	r3, [r14, #628]
	umlal	r8, r9, r3, r2
	umlal	r9, r10, r4, r2
	umlal	r10, r6, r5, r2
	umlal	r6, r7, r1, r2
	str.w r9, [r0, #4]
	str.w r10, [r0, #8]
	str.w r6, [r0, #12]
	str.w r8, [r0], #16
	// ([176-179], 0) blocks
	ldr	r1, [r12]
	ldr	r5, [r14, #716]
	ldr	r4, [r14, #712]
	ldr	r3, [r14, #708]
	ldr	r2, [r14, #704]
	umull	r8, r9, r3, r1
	umull	r10, r6, r5, r1
	umlal	r7, r8, r2, r1
	umlal	r9, r10, r4, r1
	// ([175-178], 1) blocks
	ldr	r5, [r12, #4]
	ldr	r1, [r14, #700]
	umlal	r7, r8, r1, r5
	umlal	r8, r9, r2, r5
	umlal	r9, r10, r3, r5
	umlal	r10, r6, r4, r5
	// ([174-177], 2) blocks
	ldr	r4, [r12, #8]
	ldr	r5, [r14, #696]
	umlal	r7, r8, r5, r4
	umlal	r8, r9, r1, r4
	umlal	r9, r10, r2, r4
	umlal	r10, r6, r3, r4
	// ([173-176], 3) blocks
	ldr	r3, [r12, #12]
	ldr	r4, [r14, #692]
	umlal	r7, r8, r4, r3
	umlal	r8, r9, r5, r3
	umlal	r9, r10, r1, r3
	umlal	r10, r6, r2, r3
	// ([172-175], 4) blocks
	ldr	r2, [r12, #16]
	ldr	r3, [r14, #688]
	umlal	r7, r8, r3, r2
	umlal	r8, r9, r4, r2
	umlal	r9, r10, r5, r2
	umlal	r10, r6, r1, r2
	// ([171-174], 5) blocks
	ldr	r1, [r12, #20]
	ldr	r2, [r14, #684]
	umlal	r7, r8, r2, r1
	umlal	r8, r9, r3, r1
	umlal	r9, r10, r4, r1
	umlal	r10, r6, r5, r1
	// ([170-173], 6) blocks
	ldr	r5, [r12, #24]
	ldr	r1, [r14, #680]
	umlal	r7, r8, r1, r5
	umlal	r8, r9, r2, r5
	umlal	r9, r10, r3, r5
	umlal	r10, r6, r4, r5
	// ([169-172], 7) blocks
	ldr	r4, [r12, #28]
	ldr	r5, [r14, #676]
	umlal	r7, r8, r5, r4
	umlal	r8, r9, r1, r4
	umlal	r9, r10, r2, r4
	umlal	r10, r6, r3, r4
	// ([168-171], 8) blocks
	ldr	r3, [r12, #32]
	ldr	r4, [r14, #672]
	umlal	r7, r8, r4, r3
	umlal	r8, r9, r5, r3
	umlal	r9, r10, r1, r3
	umlal	r10, r6, r2, r3
	// ([167-170], 9) blocks
	ldr	r2, [r12, #36]
	ldr	r3, [r14, #668]
	umlal	r7, r8, r3, r2
	umlal	r8, r9, r4, r2
	umlal	r9, r10, r5, r2
	umlal	r10, r6, r1, r2
	// ([166-169], 10) blocks
	ldr	r1, [r12, #40]
	ldr	r2, [r14, #664]
	umlal	r7, r8, r2, r1
	umlal	r8, r9, r3, r1
	umlal	r9, r10, r4, r1
	umlal	r10, r6, r5, r1
	// ([165-168], 11) blocks
	ldr	r5, [r12, #44]
	ldr	r1, [r14, #660]
	umlal	r7, r8, r1, r5
	umlal	r8, r9, r2, r5
	umlal	r9, r10, r3, r5
	umlal	r10, r6, r4, r5
	// ([164-167], 12) blocks
	ldr	r4, [r12, #48]
	ldr	r5, [r14, #656]
	umlal	r7, r8, r5, r4
	umlal	r8, r9, r1, r4
	umlal	r9, r10, r2, r4
	umlal	r10, r6, r3, r4
	// ([163-166], 13) blocks
	ldr	r3, [r12, #52]
	ldr	r4, [r14, #652]
	umlal	r7, r8, r4, r3
	umlal	r8, r9, r5, r3
	umlal	r9, r10, r1, r3
	umlal	r10, r6, r2, r3
	// ([162-165], 14) blocks
	ldr	r2, [r12, #56]
	ldr	r3, [r14, #648]
	umlal	r7, r8, r3, r2
	umlal	r8, r9, r4, r2
	umlal	r9, r10, r5, r2
	umlal	r10, r6, r1, r2
	and	r2, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r2, LSR #4	// range < 31
	and	r2, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r2, LSR #4	// range < 31
	and	r2, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r2, LSR #4	// range < 31
	and	r2, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r2, LSR #4	// range < 31
	// ([161-164], 15) blocks
	ldr	r1, [r12, #60]
	ldr	r2, [r14, #644]
	umlal	r7, r8, r2, r1
	umlal	r8, r9, r3, r1
	umlal	r9, r10, r4, r1
	umlal	r10, r6, r5, r1
	str.w r8, [r0, #4]
	str.w r9, [r0, #8]
	str.w r10, [r0, #12]
	str.w r7, [r0], #16
	// ([180-183], 0) blocks
	ldr	r5, [r12]
	ldr	r4, [r14, #732]
	ldr	r3, [r14, #728]
	ldr	r2, [r14, #724]
	ldr	r1, [r14, #720]
	umull	r7, r8, r2, r5
	umull	r9, r10, r4, r5
	umlal	r6, r7, r1, r5
	umlal	r8, r9, r3, r5
	// ([179-182], 1) blocks
	ldr	r4, [r12, #4]
	ldr	r5, [r14, #716]
	umlal	r6, r7, r5, r4
	umlal	r7, r8, r1, r4
	umlal	r8, r9, r2, r4
	umlal	r9, r10, r3, r4
	// ([178-181], 2) blocks
	ldr	r3, [r12, #8]
	ldr	r4, [r14, #712]
	umlal	r6, r7, r4, r3
	umlal	r7, r8, r5, r3
	umlal	r8, r9, r1, r3
	umlal	r9, r10, r2, r3
	// ([177-180], 3) blocks
	ldr	r2, [r12, #12]
	ldr	r3, [r14, #708]
	umlal	r6, r7, r3, r2
	umlal	r7, r8, r4, r2
	umlal	r8, r9, r5, r2
	umlal	r9, r10, r1, r2
	// ([176-179], 4) blocks
	ldr	r1, [r12, #16]
	ldr	r2, [r14, #704]
	umlal	r6, r7, r2, r1
	umlal	r7, r8, r3, r1
	umlal	r8, r9, r4, r1
	umlal	r9, r10, r5, r1
	// ([175-178], 5) blocks
	ldr	r5, [r12, #20]
	ldr	r1, [r14, #700]
	umlal	r6, r7, r1, r5
	umlal	r7, r8, r2, r5
	umlal	r8, r9, r3, r5
	umlal	r9, r10, r4, r5
	// ([174-177], 6) blocks
	ldr	r4, [r12, #24]
	ldr	r5, [r14, #696]
	umlal	r6, r7, r5, r4
	umlal	r7, r8, r1, r4
	umlal	r8, r9, r2, r4
	umlal	r9, r10, r3, r4
	// ([173-176], 7) blocks
	ldr	r3, [r12, #28]
	ldr	r4, [r14, #692]
	umlal	r6, r7, r4, r3
	umlal	r7, r8, r5, r3
	umlal	r8, r9, r1, r3
	umlal	r9, r10, r2, r3
	// ([172-175], 8) blocks
	ldr	r2, [r12, #32]
	ldr	r3, [r14, #688]
	umlal	r6, r7, r3, r2
	umlal	r7, r8, r4, r2
	umlal	r8, r9, r5, r2
	umlal	r9, r10, r1, r2
	// ([171-174], 9) blocks
	ldr	r1, [r12, #36]
	ldr	r2, [r14, #684]
	umlal	r6, r7, r2, r1
	umlal	r7, r8, r3, r1
	umlal	r8, r9, r4, r1
	umlal	r9, r10, r5, r1
	// ([170-173], 10) blocks
	ldr	r5, [r12, #40]
	ldr	r1, [r14, #680]
	umlal	r6, r7, r1, r5
	umlal	r7, r8, r2, r5
	umlal	r8, r9, r3, r5
	umlal	r9, r10, r4, r5
	// ([169-172], 11) blocks
	ldr	r4, [r12, #44]
	ldr	r5, [r14, #676]
	umlal	r6, r7, r5, r4
	umlal	r7, r8, r1, r4
	umlal	r8, r9, r2, r4
	umlal	r9, r10, r3, r4
	// ([168-171], 12) blocks
	ldr	r3, [r12, #48]
	ldr	r4, [r14, #672]
	umlal	r6, r7, r4, r3
	umlal	r7, r8, r5, r3
	umlal	r8, r9, r1, r3
	umlal	r9, r10, r2, r3
	// ([167-170], 13) blocks
	ldr	r2, [r12, #52]
	ldr	r3, [r14, #668]
	umlal	r6, r7, r3, r2
	umlal	r7, r8, r4, r2
	umlal	r8, r9, r5, r2
	umlal	r9, r10, r1, r2
	// ([166-169], 14) blocks
	ldr	r1, [r12, #56]
	ldr	r2, [r14, #664]
	umlal	r6, r7, r2, r1
	umlal	r7, r8, r3, r1
	umlal	r8, r9, r4, r1
	umlal	r9, r10, r5, r1
	and	r1, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r1, LSR #4	// range < 31
	and	r1, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r1, LSR #4	// range < 31
	and	r1, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r1, LSR #4	// range < 31
	and	r1, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r1, LSR #4	// range < 31
	// ([165-168], 15) blocks
	ldr	r5, [r12, #60]
	ldr	r1, [r14, #660]
	umlal	r6, r7, r1, r5
	umlal	r7, r8, r2, r5
	umlal	r8, r9, r3, r5
	umlal	r9, r10, r4, r5
	str.w r7, [r0, #4]
	str.w r8, [r0, #8]
	str.w r9, [r0, #12]
	str.w r6, [r0], #16
mul_128:
	// ([184-187], 0) blocks
	ldr	r4, [r12]
	ldr	r3, [r14, #748]
	ldr	r2, [r14, #744]
	ldr	r1, [r14, #740]
	ldr	r5, [r14, #736]
	umull	r6, r7, r1, r4
	umull	r8, r9, r3, r4
	umlal	r10, r6, r5, r4
	umlal	r7, r8, r2, r4
	// ([183-186], 1) blocks
	ldr	r3, [r12, #4]
	ldr	r4, [r14, #732]
	umlal	r10, r6, r4, r3
	umlal	r6, r7, r5, r3
	umlal	r7, r8, r1, r3
	umlal	r8, r9, r2, r3
	// ([182-185], 2) blocks
	ldr	r2, [r12, #8]
	ldr	r3, [r14, #728]
	umlal	r10, r6, r3, r2
	umlal	r6, r7, r4, r2
	umlal	r7, r8, r5, r2
	umlal	r8, r9, r1, r2
	// ([181-184], 3) blocks
	ldr	r1, [r12, #12]
	ldr	r2, [r14, #724]
	umlal	r10, r6, r2, r1
	umlal	r6, r7, r3, r1
	umlal	r7, r8, r4, r1
	umlal	r8, r9, r5, r1
	// ([180-183], 4) blocks
	ldr	r5, [r12, #16]
	ldr	r1, [r14, #720]
	umlal	r10, r6, r1, r5
	umlal	r6, r7, r2, r5
	umlal	r7, r8, r3, r5
	umlal	r8, r9, r4, r5
	// ([179-182], 5) blocks
	ldr	r4, [r12, #20]
	ldr	r5, [r14, #716]
	umlal	r10, r6, r5, r4
	umlal	r6, r7, r1, r4
	umlal	r7, r8, r2, r4
	umlal	r8, r9, r3, r4
	// ([178-181], 6) blocks
	ldr	r3, [r12, #24]
	ldr	r4, [r14, #712]
	umlal	r10, r6, r4, r3
	umlal	r6, r7, r5, r3
	umlal	r7, r8, r1, r3
	umlal	r8, r9, r2, r3
	// ([177-180], 7) blocks
	ldr	r2, [r12, #28]
	ldr	r3, [r14, #708]
	umlal	r10, r6, r3, r2
	umlal	r6, r7, r4, r2
	umlal	r7, r8, r5, r2
	umlal	r8, r9, r1, r2
	// ([176-179], 8) blocks
	ldr	r1, [r12, #32]
	ldr	r2, [r14, #704]
	umlal	r10, r6, r2, r1
	umlal	r6, r7, r3, r1
	umlal	r7, r8, r4, r1
	umlal	r8, r9, r5, r1
	// ([175-178], 9) blocks
	ldr	r5, [r12, #36]
	ldr	r1, [r14, #700]
	umlal	r10, r6, r1, r5
	umlal	r6, r7, r2, r5
	umlal	r7, r8, r3, r5
	umlal	r8, r9, r4, r5
	// ([174-177], 10) blocks
	ldr	r4, [r12, #40]
	ldr	r5, [r14, #696]
	umlal	r10, r6, r5, r4
	umlal	r6, r7, r1, r4
	umlal	r7, r8, r2, r4
	umlal	r8, r9, r3, r4
	// ([173-176], 11) blocks
	ldr	r3, [r12, #44]
	ldr	r4, [r14, #692]
	umlal	r10, r6, r4, r3
	umlal	r6, r7, r5, r3
	umlal	r7, r8, r1, r3
	umlal	r8, r9, r2, r3
	// ([172-175], 12) blocks
	ldr	r2, [r12, #48]
	ldr	r3, [r14, #688]
	umlal	r10, r6, r3, r2
	umlal	r6, r7, r4, r2
	umlal	r7, r8, r5, r2
	umlal	r8, r9, r1, r2
	// ([171-174], 13) blocks
	ldr	r1, [r12, #52]
	ldr	r2, [r14, #684]
	umlal	r10, r6, r2, r1
	umlal	r6, r7, r3, r1
	umlal	r7, r8, r4, r1
	umlal	r8, r9, r5, r1
	// ([170-173], 14) blocks
	ldr	r5, [r12, #56]
	ldr	r1, [r14, #680]
	umlal	r10, r6, r1, r5
	umlal	r6, r7, r2, r5
	umlal	r7, r8, r3, r5
	umlal	r8, r9, r4, r5
	and	r5, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r5, LSR #4	// range < 31
	and	r5, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r5, LSR #4	// range < 31
	and	r5, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r5, LSR #4	// range < 31
	and	r5, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r5, LSR #4	// range < 31
	// ([169-172], 15) blocks
	ldr	r4, [r12, #60]
	ldr	r5, [r14, #676]
	umlal	r10, r6, r5, r4
	umlal	r6, r7, r1, r4
	umlal	r7, r8, r2, r4
	umlal	r8, r9, r3, r4
	str.w r6, [r0, #4]
	str.w r7, [r0, #8]
	str.w r8, [r0, #12]
	str.w r10, [r0], #16
	// ([188-191], 0) blocks
	ldr	r3, [r12]
	ldr	r2, [r14, #764]
	ldr	r1, [r14, #760]
	ldr	r5, [r14, #756]
	ldr	r4, [r14, #752]
	umull	r10, r6, r5, r3
	umull	r7, r8, r2, r3
	umlal	r9, r10, r4, r3
	umlal	r6, r7, r1, r3
	// ([187-190], 1) blocks
	ldr	r2, [r12, #4]
	ldr	r3, [r14, #748]
	umlal	r9, r10, r3, r2
	umlal	r10, r6, r4, r2
	umlal	r6, r7, r5, r2
	umlal	r7, r8, r1, r2
	// ([186-189], 2) blocks
	ldr	r1, [r12, #8]
	ldr	r2, [r14, #744]
	umlal	r9, r10, r2, r1
	umlal	r10, r6, r3, r1
	umlal	r6, r7, r4, r1
	umlal	r7, r8, r5, r1
	// ([185-188], 3) blocks
	ldr	r5, [r12, #12]
	ldr	r1, [r14, #740]
	umlal	r9, r10, r1, r5
	umlal	r10, r6, r2, r5
	umlal	r6, r7, r3, r5
	umlal	r7, r8, r4, r5
	// ([184-187], 4) blocks
	ldr	r4, [r12, #16]
	ldr	r5, [r14, #736]
	umlal	r9, r10, r5, r4
	umlal	r10, r6, r1, r4
	umlal	r6, r7, r2, r4
	umlal	r7, r8, r3, r4
	// ([183-186], 5) blocks
	ldr	r3, [r12, #20]
	ldr	r4, [r14, #732]
	umlal	r9, r10, r4, r3
	umlal	r10, r6, r5, r3
	umlal	r6, r7, r1, r3
	umlal	r7, r8, r2, r3
	// ([182-185], 6) blocks
	ldr	r2, [r12, #24]
	ldr	r3, [r14, #728]
	umlal	r9, r10, r3, r2
	umlal	r10, r6, r4, r2
	umlal	r6, r7, r5, r2
	umlal	r7, r8, r1, r2
	// ([181-184], 7) blocks
	ldr	r1, [r12, #28]
	ldr	r2, [r14, #724]
	umlal	r9, r10, r2, r1
	umlal	r10, r6, r3, r1
	umlal	r6, r7, r4, r1
	umlal	r7, r8, r5, r1
	// ([180-183], 8) blocks
	ldr	r5, [r12, #32]
	ldr	r1, [r14, #720]
	umlal	r9, r10, r1, r5
	umlal	r10, r6, r2, r5
	umlal	r6, r7, r3, r5
	umlal	r7, r8, r4, r5
	// ([179-182], 9) blocks
	ldr	r4, [r12, #36]
	ldr	r5, [r14, #716]
	umlal	r9, r10, r5, r4
	umlal	r10, r6, r1, r4
	umlal	r6, r7, r2, r4
	umlal	r7, r8, r3, r4
	// ([178-181], 10) blocks
	ldr	r3, [r12, #40]
	ldr	r4, [r14, #712]
	umlal	r9, r10, r4, r3
	umlal	r10, r6, r5, r3
	umlal	r6, r7, r1, r3
	umlal	r7, r8, r2, r3
	// ([177-180], 11) blocks
	ldr	r2, [r12, #44]
	ldr	r3, [r14, #708]
	umlal	r9, r10, r3, r2
	umlal	r10, r6, r4, r2
	umlal	r6, r7, r5, r2
	umlal	r7, r8, r1, r2
	// ([176-179], 12) blocks
	ldr	r1, [r12, #48]
	ldr	r2, [r14, #704]
	umlal	r9, r10, r2, r1
	umlal	r10, r6, r3, r1
	umlal	r6, r7, r4, r1
	umlal	r7, r8, r5, r1
	// ([175-178], 13) blocks
	ldr	r5, [r12, #52]
	ldr	r1, [r14, #700]
	umlal	r9, r10, r1, r5
	umlal	r10, r6, r2, r5
	umlal	r6, r7, r3, r5
	umlal	r7, r8, r4, r5
	// ([174-177], 14) blocks
	ldr	r4, [r12, #56]
	ldr	r5, [r14, #696]
	umlal	r9, r10, r5, r4
	umlal	r10, r6, r1, r4
	umlal	r6, r7, r2, r4
	umlal	r7, r8, r3, r4
	and	r4, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r4, LSR #4	// range < 31
	and	r4, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r4, LSR #4	// range < 31
	and	r4, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r4, LSR #4	// range < 31
	and	r4, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r4, LSR #4	// range < 31
	// ([173-176], 15) blocks
	ldr	r3, [r12, #60]
	ldr	r4, [r14, #692]
	umlal	r9, r10, r4, r3
	umlal	r10, r6, r5, r3
	umlal	r6, r7, r1, r3
	umlal	r7, r8, r2, r3
	str.w r10, [r0, #4]
	str.w r6, [r0, #8]
	str.w r7, [r0, #12]
	str.w r9, [r0], #16
	// ([192-195], 0) blocks
	ldr	r2, [r12]
	ldr	r1, [r14, #780]
	ldr	r5, [r14, #776]
	ldr	r4, [r14, #772]
	ldr	r3, [r14, #768]
	umull	r9, r10, r4, r2
	umull	r6, r7, r1, r2
	umlal	r8, r9, r3, r2
	umlal	r10, r6, r5, r2
	// ([191-194], 1) blocks
	ldr	r1, [r12, #4]
	ldr	r2, [r14, #764]
	umlal	r8, r9, r2, r1
	umlal	r9, r10, r3, r1
	umlal	r10, r6, r4, r1
	umlal	r6, r7, r5, r1
	// ([190-193], 2) blocks
	ldr	r5, [r12, #8]
	ldr	r1, [r14, #760]
	umlal	r8, r9, r1, r5
	umlal	r9, r10, r2, r5
	umlal	r10, r6, r3, r5
	umlal	r6, r7, r4, r5
	// ([189-192], 3) blocks
	ldr	r4, [r12, #12]
	ldr	r5, [r14, #756]
	umlal	r8, r9, r5, r4
	umlal	r9, r10, r1, r4
	umlal	r10, r6, r2, r4
	umlal	r6, r7, r3, r4
	// ([188-191], 4) blocks
	ldr	r3, [r12, #16]
	ldr	r4, [r14, #752]
	umlal	r8, r9, r4, r3
	umlal	r9, r10, r5, r3
	umlal	r10, r6, r1, r3
	umlal	r6, r7, r2, r3
	// ([187-190], 5) blocks
	ldr	r2, [r12, #20]
	ldr	r3, [r14, #748]
	umlal	r8, r9, r3, r2
	umlal	r9, r10, r4, r2
	umlal	r10, r6, r5, r2
	umlal	r6, r7, r1, r2
	// ([186-189], 6) blocks
	ldr	r1, [r12, #24]
	ldr	r2, [r14, #744]
	umlal	r8, r9, r2, r1
	umlal	r9, r10, r3, r1
	umlal	r10, r6, r4, r1
	umlal	r6, r7, r5, r1
	// ([185-188], 7) blocks
	ldr	r5, [r12, #28]
	ldr	r1, [r14, #740]
	umlal	r8, r9, r1, r5
	umlal	r9, r10, r2, r5
	umlal	r10, r6, r3, r5
	umlal	r6, r7, r4, r5
	// ([184-187], 8) blocks
	ldr	r4, [r12, #32]
	ldr	r5, [r14, #736]
	umlal	r8, r9, r5, r4
	umlal	r9, r10, r1, r4
	umlal	r10, r6, r2, r4
	umlal	r6, r7, r3, r4
	// ([183-186], 9) blocks
	ldr	r3, [r12, #36]
	ldr	r4, [r14, #732]
	umlal	r8, r9, r4, r3
	umlal	r9, r10, r5, r3
	umlal	r10, r6, r1, r3
	umlal	r6, r7, r2, r3
	// ([182-185], 10) blocks
	ldr	r2, [r12, #40]
	ldr	r3, [r14, #728]
	umlal	r8, r9, r3, r2
	umlal	r9, r10, r4, r2
	umlal	r10, r6, r5, r2
	umlal	r6, r7, r1, r2
	// ([181-184], 11) blocks
	ldr	r1, [r12, #44]
	ldr	r2, [r14, #724]
	umlal	r8, r9, r2, r1
	umlal	r9, r10, r3, r1
	umlal	r10, r6, r4, r1
	umlal	r6, r7, r5, r1
	// ([180-183], 12) blocks
	ldr	r5, [r12, #48]
	ldr	r1, [r14, #720]
	umlal	r8, r9, r1, r5
	umlal	r9, r10, r2, r5
	umlal	r10, r6, r3, r5
	umlal	r6, r7, r4, r5
	// ([179-182], 13) blocks
	ldr	r4, [r12, #52]
	ldr	r5, [r14, #716]
	umlal	r8, r9, r5, r4
	umlal	r9, r10, r1, r4
	umlal	r10, r6, r2, r4
	umlal	r6, r7, r3, r4
	// ([178-181], 14) blocks
	ldr	r3, [r12, #56]
	ldr	r4, [r14, #712]
	umlal	r8, r9, r4, r3
	umlal	r9, r10, r5, r3
	umlal	r10, r6, r1, r3
	umlal	r6, r7, r2, r3
	and	r3, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r3, LSR #4	// range < 31
	and	r3, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r3, LSR #4	// range < 31
	and	r3, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r3, LSR #4	// range < 31
	and	r3, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r3, LSR #4	// range < 31
	// ([177-180], 15) blocks
	ldr	r2, [r12, #60]
	ldr	r3, [r14, #708]
	umlal	r8, r9, r3, r2
	umlal	r9, r10, r4, r2
	umlal	r10, r6, r5, r2
	umlal	r6, r7, r1, r2
	str.w r9, [r0, #4]
	str.w r10, [r0, #8]
	str.w r6, [r0, #12]
	str.w r8, [r0], #16
	// ([196-199], 0) blocks
	ldr	r1, [r12]
	ldr	r5, [r14, #796]
	ldr	r4, [r14, #792]
	ldr	r3, [r14, #788]
	ldr	r2, [r14, #784]
	umull	r8, r9, r3, r1
	umull	r10, r6, r5, r1
	umlal	r7, r8, r2, r1
	umlal	r9, r10, r4, r1
	// ([195-198], 1) blocks
	ldr	r5, [r12, #4]
	ldr	r1, [r14, #780]
	umlal	r7, r8, r1, r5
	umlal	r8, r9, r2, r5
	umlal	r9, r10, r3, r5
	umlal	r10, r6, r4, r5
	// ([194-197], 2) blocks
	ldr	r4, [r12, #8]
	ldr	r5, [r14, #776]
	umlal	r7, r8, r5, r4
	umlal	r8, r9, r1, r4
	umlal	r9, r10, r2, r4
	umlal	r10, r6, r3, r4
	// ([193-196], 3) blocks
	ldr	r3, [r12, #12]
	ldr	r4, [r14, #772]
	umlal	r7, r8, r4, r3
	umlal	r8, r9, r5, r3
	umlal	r9, r10, r1, r3
	umlal	r10, r6, r2, r3
	// ([192-195], 4) blocks
	ldr	r2, [r12, #16]
	ldr	r3, [r14, #768]
	umlal	r7, r8, r3, r2
	umlal	r8, r9, r4, r2
	umlal	r9, r10, r5, r2
	umlal	r10, r6, r1, r2
	// ([191-194], 5) blocks
	ldr	r1, [r12, #20]
	ldr	r2, [r14, #764]
	umlal	r7, r8, r2, r1
	umlal	r8, r9, r3, r1
	umlal	r9, r10, r4, r1
	umlal	r10, r6, r5, r1
	// ([190-193], 6) blocks
	ldr	r5, [r12, #24]
	ldr	r1, [r14, #760]
	umlal	r7, r8, r1, r5
	umlal	r8, r9, r2, r5
	umlal	r9, r10, r3, r5
	umlal	r10, r6, r4, r5
	// ([189-192], 7) blocks
	ldr	r4, [r12, #28]
	ldr	r5, [r14, #756]
	umlal	r7, r8, r5, r4
	umlal	r8, r9, r1, r4
	umlal	r9, r10, r2, r4
	umlal	r10, r6, r3, r4
	// ([188-191], 8) blocks
	ldr	r3, [r12, #32]
	ldr	r4, [r14, #752]
	umlal	r7, r8, r4, r3
	umlal	r8, r9, r5, r3
	umlal	r9, r10, r1, r3
	umlal	r10, r6, r2, r3
	// ([187-190], 9) blocks
	ldr	r2, [r12, #36]
	ldr	r3, [r14, #748]
	umlal	r7, r8, r3, r2
	umlal	r8, r9, r4, r2
	umlal	r9, r10, r5, r2
	umlal	r10, r6, r1, r2
	// ([186-189], 10) blocks
	ldr	r1, [r12, #40]
	ldr	r2, [r14, #744]
	umlal	r7, r8, r2, r1
	umlal	r8, r9, r3, r1
	umlal	r9, r10, r4, r1
	umlal	r10, r6, r5, r1
	// ([185-188], 11) blocks
	ldr	r5, [r12, #44]
	ldr	r1, [r14, #740]
	umlal	r7, r8, r1, r5
	umlal	r8, r9, r2, r5
	umlal	r9, r10, r3, r5
	umlal	r10, r6, r4, r5
	// ([184-187], 12) blocks
	ldr	r4, [r12, #48]
	ldr	r5, [r14, #736]
	umlal	r7, r8, r5, r4
	umlal	r8, r9, r1, r4
	umlal	r9, r10, r2, r4
	umlal	r10, r6, r3, r4
	// ([183-186], 13) blocks
	ldr	r3, [r12, #52]
	ldr	r4, [r14, #732]
	umlal	r7, r8, r4, r3
	umlal	r8, r9, r5, r3
	umlal	r9, r10, r1, r3
	umlal	r10, r6, r2, r3
	// ([182-185], 14) blocks
	ldr	r2, [r12, #56]
	ldr	r3, [r14, #728]
	umlal	r7, r8, r3, r2
	umlal	r8, r9, r4, r2
	umlal	r9, r10, r5, r2
	umlal	r10, r6, r1, r2
	and	r2, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r2, LSR #4	// range < 31
	and	r2, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r2, LSR #4	// range < 31
	and	r2, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r2, LSR #4	// range < 31
	and	r2, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r2, LSR #4	// range < 31
	// ([181-184], 15) blocks
	ldr	r1, [r12, #60]
	ldr	r2, [r14, #724]
	umlal	r7, r8, r2, r1
	umlal	r8, r9, r3, r1
	umlal	r9, r10, r4, r1
	umlal	r10, r6, r5, r1
	str.w r8, [r0, #4]
	str.w r9, [r0, #8]
	str.w r10, [r0, #12]
	str.w r7, [r0], #16
mul_64:
 // decreasing thread length
	// ([185-188], 15) blocks
	ldr	r5, [r12, #60]
	ldr	r4, [r14, #752]
	ldr	r3, [r14, #748]
	ldr	r2, [r14, #744]
	ldr	r1, [r14, #740]
	umull	r7, r8, r2, r5
	umull	r9, r10, r4, r5
	umlal	r6, r7, r1, r5
	umlal	r8, r9, r3, r5
	// ([186-189], 14) blocks
	ldr	r1, [r12, #56]
	ldr	r5, [r14, #756]
	umlal	r6, r7, r2, r1
	umlal	r7, r8, r3, r1
	umlal	r8, r9, r4, r1
	umlal	r9, r10, r5, r1
	// ([187-190], 13) blocks
	ldr	r2, [r12, #52]
	ldr	r1, [r14, #760]
	umlal	r6, r7, r3, r2
	umlal	r7, r8, r4, r2
	umlal	r8, r9, r5, r2
	umlal	r9, r10, r1, r2
	// ([188-191], 12) blocks
	ldr	r3, [r12, #48]
	ldr	r2, [r14, #764]
	umlal	r6, r7, r4, r3
	umlal	r7, r8, r5, r3
	umlal	r8, r9, r1, r3
	umlal	r9, r10, r2, r3
	// ([189-192], 11) blocks
	ldr	r4, [r12, #44]
	ldr	r3, [r14, #768]
	umlal	r6, r7, r5, r4
	umlal	r7, r8, r1, r4
	umlal	r8, r9, r2, r4
	umlal	r9, r10, r3, r4
	// ([190-193], 10) blocks
	ldr	r5, [r12, #40]
	ldr	r4, [r14, #772]
	umlal	r6, r7, r1, r5
	umlal	r7, r8, r2, r5
	umlal	r8, r9, r3, r5
	umlal	r9, r10, r4, r5
	// ([191-194], 9) blocks
	ldr	r1, [r12, #36]
	ldr	r5, [r14, #776]
	umlal	r6, r7, r2, r1
	umlal	r7, r8, r3, r1
	umlal	r8, r9, r4, r1
	umlal	r9, r10, r5, r1
	// ([192-195], 8) blocks
	ldr	r2, [r12, #32]
	ldr	r1, [r14, #780]
	umlal	r6, r7, r3, r2
	umlal	r7, r8, r4, r2
	umlal	r8, r9, r5, r2
	umlal	r9, r10, r1, r2
	// ([193-196], 7) blocks
	ldr	r3, [r12, #28]
	ldr	r2, [r14, #784]
	umlal	r6, r7, r4, r3
	umlal	r7, r8, r5, r3
	umlal	r8, r9, r1, r3
	umlal	r9, r10, r2, r3
	// ([194-197], 6) blocks
	ldr	r4, [r12, #24]
	ldr	r3, [r14, #788]
	umlal	r6, r7, r5, r4
	umlal	r7, r8, r1, r4
	umlal	r8, r9, r2, r4
	umlal	r9, r10, r3, r4
	// ([195-198], 5) blocks
	ldr	r5, [r12, #20]
	ldr	r4, [r14, #792]
	umlal	r6, r7, r1, r5
	umlal	r7, r8, r2, r5
	umlal	r8, r9, r3, r5
	umlal	r9, r10, r4, r5
	// ([196-199], 4) blocks
	ldr	r1, [r12, #16]
	ldr	r5, [r14, #796]
	umlal	r6, r7, r2, r1
	umlal	r7, r8, r3, r1
	umlal	r8, r9, r4, r1
	umlal	r9, r10, r5, r1
	// ([197-199],3),([198-199],2),(199,1) blocks
	ldr	r1, [r12, #12]
	umlal	r8, r9, r5, r1
	umlal	r7, r8, r4, r1
	umlal	r6, r7, r3, r1
	and	r1, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r1, LSR #4	// range < 31
	ldr	r1, [r12, #8]
	umlal	r7, r8, r5, r1
	umlal	r6, r7, r4, r1
	and	r1, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r1, LSR #4	// range < 31
	ldr	r1, [r12, #4]
	umlal	r6, r7, r5, r1
	and	r1, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r1, LSR #4	// range < 31
	and	r1, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r1, LSR #4	// range < 31
	str.w r7, [r0, #4]
	str.w r8, [r0, #8]
	str.w r9, [r0, #12]
	str.w r6, [r0], #16
	// ([189-192], 15) blocks
	ldr	r4, [r12, #60]
	ldr	r3, [r14, #768]
	ldr	r2, [r14, #764]
	ldr	r1, [r14, #760]
	ldr	r5, [r14, #756]
	umull	r6, r7, r1, r4
	umull	r8, r9, r3, r4
	umlal	r10, r6, r5, r4
	umlal	r7, r8, r2, r4
	// ([190-193], 14) blocks
	ldr	r5, [r12, #56]
	ldr	r4, [r14, #772]
	umlal	r10, r6, r1, r5
	umlal	r6, r7, r2, r5
	umlal	r7, r8, r3, r5
	umlal	r8, r9, r4, r5
	// ([191-194], 13) blocks
	ldr	r1, [r12, #52]
	ldr	r5, [r14, #776]
	umlal	r10, r6, r2, r1
	umlal	r6, r7, r3, r1
	umlal	r7, r8, r4, r1
	umlal	r8, r9, r5, r1
	// ([192-195], 12) blocks
	ldr	r2, [r12, #48]
	ldr	r1, [r14, #780]
	umlal	r10, r6, r3, r2
	umlal	r6, r7, r4, r2
	umlal	r7, r8, r5, r2
	umlal	r8, r9, r1, r2
	// ([193-196], 11) blocks
	ldr	r3, [r12, #44]
	ldr	r2, [r14, #784]
	umlal	r10, r6, r4, r3
	umlal	r6, r7, r5, r3
	umlal	r7, r8, r1, r3
	umlal	r8, r9, r2, r3
	// ([194-197], 10) blocks
	ldr	r4, [r12, #40]
	ldr	r3, [r14, #788]
	umlal	r10, r6, r5, r4
	umlal	r6, r7, r1, r4
	umlal	r7, r8, r2, r4
	umlal	r8, r9, r3, r4
	// ([195-198], 9) blocks
	ldr	r5, [r12, #36]
	ldr	r4, [r14, #792]
	umlal	r10, r6, r1, r5
	umlal	r6, r7, r2, r5
	umlal	r7, r8, r3, r5
	umlal	r8, r9, r4, r5
	// ([196-199], 8) blocks
	ldr	r1, [r12, #32]
	ldr	r5, [r14, #796]
	umlal	r10, r6, r2, r1
	umlal	r6, r7, r3, r1
	umlal	r7, r8, r4, r1
	umlal	r8, r9, r5, r1
	// ([197-199],7),([198-199],6),(199,5) blocks
	ldr	r1, [r12, #28]
	umlal	r7, r8, r5, r1
	umlal	r6, r7, r4, r1
	umlal	r10, r6, r3, r1
	and	r1, r8, #0xF0F0F0F0	// top 4b < 16
	and	r8, r8, #0x0F0F0F0F	// bot 4b < 16
	add	r8, r8, r1, LSR #4	// range < 31
	ldr	r1, [r12, #24]
	umlal	r6, r7, r5, r1
	umlal	r10, r6, r4, r1
	and	r1, r7, #0xF0F0F0F0	// top 4b < 16
	and	r7, r7, #0x0F0F0F0F	// bot 4b < 16
	add	r7, r7, r1, LSR #4	// range < 31
	ldr	r1, [r12, #20]
	umlal	r10, r6, r5, r1
	and	r1, r6, #0xF0F0F0F0	// top 4b < 16
	and	r6, r6, #0x0F0F0F0F	// bot 4b < 16
	add	r6, r6, r1, LSR #4	// range < 31
	and	r1, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r1, LSR #4	// range < 31
	and	r1, r10, #0xF0F0F0F0	// top 4b < 16
	and	r10, r10, #0x0F0F0F0F	// bot 4b < 16
	add	r10, r10, r1, LSR #4	// range < 31
	str.w r6, [r0, #4]
	str.w r7, [r0, #8]
	str.w r8, [r0, #12]
	str.w r10, [r0], #16
	// ([193-196], 15) blocks
	ldr	r3, [r12, #60]
	ldr	r2, [r14, #784]
	ldr	r1, [r14, #780]
	ldr	r5, [r14, #776]
	ldr	r4, [r14, #772]
	umull	r10, r6, r5, r3
	umull	r7, r8, r2, r3
	umlal	r9, r10, r4, r3
	umlal	r6, r7, r1, r3
	// ([194-197], 14) blocks
	ldr	r4, [r12, #56]
	ldr	r3, [r14, #788]
	umlal	r9, r10, r5, r4
	umlal	r10, r6, r1, r4
	umlal	r6, r7, r2, r4
	umlal	r7, r8, r3, r4
	// ([195-198], 13) blocks
	ldr	r5, [r12, #52]
	ldr	r4, [r14, #792]
	umlal	r9, r10, r1, r5
	umlal	r10, r6, r2, r5
	umlal	r6, r7, r3, r5
	umlal	r7, r8, r4, r5
	// ([196-199], 12) blocks
	ldr	r1, [r12, #48]
	ldr	r5, [r14, #796]
	umlal	r9, r10, r2, r1
	umlal	r10, r6, r3, r1
	umlal	r6, r7, r4, r1
	umlal	r7, r8, r5, r1
	// ([197-199],11),([198-199],10),(199,9) blocks
	ldr	r1, [r12, #44]
	umlal	r6, r7, r5, r1
	umlal	r10, r6, r4, r1
	umlal	r9, r10, r3, r1
	ldr	r1, [r12, #40]
	umlal	r10, r6, r5, r1
	umlal	r9, r10, r4, r1
	ldr	r1, [r12, #36]
	umlal	r9, r10, r5, r1
	and	r1, r9, #0xF0F0F0F0	// top 4b < 16
	and	r9, r9, #0x0F0F0F0F	// bot 4b < 16
	add	r9, r9, r1, LSR #4	// range < 31
	str.w r10, [r0, #4]
	str.w r6, [r0, #8]
	str.w r7, [r0, #12]
	str.w r9, [r0], #16
 // mv hh back to h
	mov	r9, #0
	mov	r10, #0
	mov	r6, #0
	mov	r7, #0
	ldr	r3, [r14, #788]
	ldr	r4, [r14, #792]
	ldr	r5, [r14, #796]
	// ([197-199],15),([198-199],14),(199,13) blocks
	ldr	r1, [r12, #60]
	umlal	r10, r6, r5, r1
	umlal	r9, r10, r4, r1
	umlal	r8, r9, r3, r1
	ldr	r1, [r12, #56]
	umlal	r9, r10, r5, r1
	umlal	r8, r9, r4, r1
	ldr	r1, [r12, #52]
	umlal	r8, r9, r5, r1
	str.w r9, [r0, #4]
	str.w r10, [r0, #8]
	str.w r6, [r0, #12]
	str.w r8, [r0], #16
	pop.w {pc}
.p2align 2,,3
.syntax unified
.text
.global __polymul_64x64_jump_head
.type  __polymul_64x64_jump_head, %function
__polymul_64x64_jump_head:
	push.w {lr}
	mov.w r6, #0
	mov r12, r1
	mov r14, r2
	sub.w r14, #740
	b.w mul_64
.p2align 2,,3
.syntax unified
.text
.global __polymul_64x64
.type  __polymul_64x64, %function
__polymul_64x64:
	push.w {lr}
	bl.w mul_head
	mov.w r6, r7
	sub.w r14, #736
	b.w mul_64
.p2align 2,,3
.syntax unified
.text
.global __polymul_64x128_jump_head
.type  __polymul_64x128_jump_head, %function
__polymul_64x128_jump_head:
	push.w {lr}
	mov.w r10, #0
	mov r12, r1
	mov r14, r2
	sub.w r14, #676
	b.w mul_128
.p2align 2,,3
.syntax unified
.text
.global __polymul_64x128
.type  __polymul_64x128, %function
__polymul_64x128:
	push.w {lr}
	bl.w mul_head
	mov.w r10, r7
	sub.w r14, #672
	b.w mul_128
.p2align 2,,3
.syntax unified
.text
.global __polymul_64x192_jump_head
.type  __polymul_64x192_jump_head, %function
__polymul_64x192_jump_head:
	push.w {lr}
	mov.w r9, #0
	mov r12, r1
	mov r14, r2
	sub.w r14, #612
	b.w mul_192
.p2align 2,,3
.syntax unified
.text
.global __polymul_64x192
.type  __polymul_64x192, %function
__polymul_64x192:
	push.w {lr}
	bl.w mul_head
	mov.w r9, r7
	sub.w r14, #608
	b.w mul_192
.p2align 2,,3
.syntax unified
.text
.global __polymul_64x256_jump_head
.type  __polymul_64x256_jump_head, %function
__polymul_64x256_jump_head:
	push.w {lr}
	mov.w r8, #0
	mov r12, r1
	mov r14, r2
	sub.w r14, #548
	b.w mul_256
.p2align 2,,3
.syntax unified
.text
.global __polymul_64x256
.type  __polymul_64x256, %function
__polymul_64x256:
	push.w {lr}
	bl.w mul_head
	mov.w r8, r7
	sub.w r14, #544
	b.w mul_256
.p2align 2,,3
.syntax unified
.text
.global __polymul_64x320_jump_head
.type  __polymul_64x320_jump_head, %function
__polymul_64x320_jump_head:
	push.w {lr}
	mov.w r7, #0
	mov r12, r1
	mov r14, r2
	sub.w r14, #484
	b.w mul_320
.p2align 2,,3
.syntax unified
.text
.global __polymul_64x320
.type  __polymul_64x320, %function
__polymul_64x320:
	push.w {lr}
	bl.w mul_head
	sub.w r14, #480
	b.w mul_320
.p2align 2,,3
.syntax unified
.text
.global __polymul_64x384_jump_head
.type  __polymul_64x384_jump_head, %function
__polymul_64x384_jump_head:
	push.w {lr}
	mov.w r6, #0
	mov r12, r1
	mov r14, r2
	sub.w r14, #420
	b.w mul_384
.p2align 2,,3
.syntax unified
.text
.global __polymul_64x384
.type  __polymul_64x384, %function
__polymul_64x384:
	push.w {lr}
	bl.w mul_head
	mov.w r6, r7
	sub.w r14, #416
	b.w mul_384
.p2align 2,,3
.syntax unified
.text
.global __polymul_64x448_jump_head
.type  __polymul_64x448_jump_head, %function
__polymul_64x448_jump_head:
	push.w {lr}
	mov.w r10, #0
	mov r12, r1
	mov r14, r2
	sub.w r14, #356
	b.w mul_448
.p2align 2,,3
.syntax unified
.text
.global __polymul_64x448
.type  __polymul_64x448, %function
__polymul_64x448:
	push.w {lr}
	bl.w mul_head
	mov.w r10, r7
	sub.w r14, #352
	b.w mul_448
.p2align 2,,3
.syntax unified
.text
.global __polymul_64x512_jump_head
.type  __polymul_64x512_jump_head, %function
__polymul_64x512_jump_head:
	push.w {lr}
	mov.w r9, #0
	mov r12, r1
	mov r14, r2
	sub.w r14, #292
	b.w mul_512
.p2align 2,,3
.syntax unified
.text
.global __polymul_64x512
.type  __polymul_64x512, %function
__polymul_64x512:
	push.w {lr}
	bl.w mul_head
	mov.w r9, r7
	sub.w r14, #288
	b.w mul_512
.p2align 2,,3
.syntax unified
.text
.global __polymul_64x576_jump_head
.type  __polymul_64x576_jump_head, %function
__polymul_64x576_jump_head:
	push.w {lr}
	mov.w r8, #0
	mov r12, r1
	mov r14, r2
	sub.w r14, #228
	b.w mul_576
.p2align 2,,3
.syntax unified
.text
.global __polymul_64x576
.type  __polymul_64x576, %function
__polymul_64x576:
	push.w {lr}
	bl.w mul_head
	mov.w r8, r7
	sub.w r14, #224
	b.w mul_576
.p2align 2,,3
.syntax unified
.text
.global __polymul_64x640_jump_head
.type  __polymul_64x640_jump_head, %function
__polymul_64x640_jump_head:
	push.w {lr}
	mov.w r7, #0
	mov r12, r1
	mov r14, r2
	sub.w r14, #164
	b.w mul_640
.p2align 2,,3
.syntax unified
.text
.global __polymul_64x640
.type  __polymul_64x640, %function
__polymul_64x640:
	push.w {lr}
	bl.w mul_head
	sub.w r14, #160
	b.w mul_640
.p2align 2,,3
.syntax unified
.text
.global __polymul_64x704_jump_head
.type  __polymul_64x704_jump_head, %function
__polymul_64x704_jump_head:
	push.w {lr}
	mov.w r6, #0
	mov r12, r1
	mov r14, r2
	sub.w r14, #100
	b.w mul_704
.p2align 2,,3
.syntax unified
.text
.global __polymul_64x704
.type  __polymul_64x704, %function
__polymul_64x704:
	push.w {lr}
	bl.w mul_head
	mov.w r6, r7
	sub.w r14, #96
	b.w mul_704
.p2align 2,,3
.syntax unified
.text
.global __polymul_64x768_jump_head
.type  __polymul_64x768_jump_head, %function
__polymul_64x768_jump_head:
	push.w {lr}
	mov.w r10, #0
	mov r12, r1
	mov r14, r2
	sub.w r14, #36
	b.w mul_768
.p2align 2,,3
.syntax unified
.text
.global __polymul_64x768
.type  __polymul_64x768, %function
__polymul_64x768:
	push.w {lr}
	bl.w mul_head
	mov.w r10, r7
	sub.w r14, #32
	b.w mul_768
.p2align 2,,3
.syntax unified
.text
.global __polymul_64x800
.type  __polymul_64x800, %function
__polymul_64x800:
	push.w {lr}
	bl.w mul_head
	b.w mul_800
