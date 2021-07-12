// void __update_fg_32x32_mod2 (int *f, int*g, int *M1);
.p2align 2,,3
.syntax unified
.text
.global __update_fg_32x32_mod2
.type __update_fg_32x32_mod2, %function
__update_fg_32x32_mod2:
	push.w {r3-r12,lr}
	vmov.w s0, s1, r0, r1
	vmov.w s2, r2
	sub.w sp, #84
	mov.w r0, sp
	vmov.w r1, s2
	vmov.w r2, s0
	bl __polymul_32x32_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #16
	bl __polymul_32x32_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s0
	add.w r1, #32
	bl __polymul_32x32_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #48
	bl __polymul_32x32_mod2_jump_head
	mov.w r10, sp
	vmov.w r0, r1, s0, s1
	add.w lr, r0, #16
	add.w r10, #4
	ldr.w r11, [r10, #-4]
	ldr.w r12, [r10, #16]
	and.w r11, r11, #0x1
	and.w r12, r12, #0x1
add_loop_32:
	ldr.w r2, [r10, #40]
	ldr.w r3, [r10, #44]
	ldr.w r4, [r10, #48]
	ldr.w r5, [r10, #52]
	ldr.w r6, [r10, #60]
	ldr.w r7, [r10, #64]
	ldr.w r8, [r10, #68]
	ldr.w r9, [r10, #72]
	vmov.w r0, r1, s0, s1
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	str.w r3, [r1, #4]
	str.w r4, [r1, #8]
	str.w r5, [r1, #12]
	str.w r2, [r1], #16
	ldr.w r6, [r10, #20]
	ldr.w r7, [r10, #24]
	ldr.w r8, [r10, #28]
	ldr.w r9, [r10, #32]
	ldr.w r3, [r10, #4]
	ldr.w r4, [r10, #8]
	ldr.w r5, [r10, #12]
	ldr.w r2, [r10], #16
	vmov.w s0, s1, r0, r1
	and.w r1, r2, #0x1
	eor.w r2, r11, r2, LSL #4
	and.w r11, r3, #0x1
	eor.w r3, r1, r3, LSL #4
	and.w r1, r4, #0x1
	eor.w r4, r11, r4, LSL #4
	and.w r11, r5, #0x1
	eor.w r5, r1, r5, LSL #4
	and.w r2, r6, #0x1
	eor.w r6, r12, r6, LSL #4
	and.w r12, r7, #0x1
	eor.w r7, r2, r7, LSL #4
	and.w r2, r8, #0x1
	eor.w r8, r12, r8, LSL #4
	and.w r12, r9, #0x1
	eor.w r9, r2, r9, LSL #4
	vmov.w r0, r1, s0, s1
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r5, [r0, #12]
	str.w r2, [r0], #16
	cmp.w r0, lr
	bne.w add_loop_32
	add.w sp, #84
	pop.w {r3-r12,pc}
// void __update_fg_32x64_mod2 (int *f, int*g, int *M1);
.p2align 2,,3
.syntax unified
.text
.global __update_fg_32x64_mod2
.type __update_fg_32x64_mod2, %function
__update_fg_32x64_mod2:
	push.w {r3-r12,lr}
	vmov.w s0, s1, r0, r1
	vmov.w s2, r2
	sub.w sp, #148
	mov.w r0, sp
	vmov.w r1, s2
	vmov.w r2, s0
	bl __polymul_32x64_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #16
	bl __polymul_32x64_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s0
	add.w r1, #32
	bl __polymul_32x64_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #48
	bl __polymul_32x64_mod2_jump_head
	mov.w r10, sp
	vmov.w r0, r1, s0, s1
	add.w lr, r0, #32
	add.w r10, #4
	ldr.w r11, [r10, #-4]
	ldr.w r12, [r10, #32]
	and.w r11, r11, #0x1
	and.w r12, r12, #0x1
add_loop_64:
	ldr.w r2, [r10, #72]
	ldr.w r3, [r10, #76]
	ldr.w r4, [r10, #80]
	ldr.w r5, [r10, #84]
	ldr.w r6, [r10, #108]
	ldr.w r7, [r10, #112]
	ldr.w r8, [r10, #116]
	ldr.w r9, [r10, #120]
	vmov.w r0, r1, s0, s1
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	str.w r3, [r1, #4]
	str.w r4, [r1, #8]
	str.w r5, [r1, #12]
	str.w r2, [r1], #16
	ldr.w r6, [r10, #36]
	ldr.w r7, [r10, #40]
	ldr.w r8, [r10, #44]
	ldr.w r9, [r10, #48]
	ldr.w r3, [r10, #4]
	ldr.w r4, [r10, #8]
	ldr.w r5, [r10, #12]
	ldr.w r2, [r10], #16
	vmov.w s0, s1, r0, r1
	and.w r1, r2, #0x1
	eor.w r2, r11, r2, LSL #4
	and.w r11, r3, #0x1
	eor.w r3, r1, r3, LSL #4
	and.w r1, r4, #0x1
	eor.w r4, r11, r4, LSL #4
	and.w r11, r5, #0x1
	eor.w r5, r1, r5, LSL #4
	and.w r2, r6, #0x1
	eor.w r6, r12, r6, LSL #4
	and.w r12, r7, #0x1
	eor.w r7, r2, r7, LSL #4
	and.w r2, r8, #0x1
	eor.w r8, r12, r8, LSL #4
	and.w r12, r9, #0x1
	eor.w r9, r2, r9, LSL #4
	vmov.w r0, r1, s0, s1
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r5, [r0, #12]
	str.w r2, [r0], #16
	cmp.w r0, lr
	bne.w add_loop_64
	add.w sp, #148
	pop.w {r3-r12,pc}
// void __update_fg_32x96_mod2 (int *f, int*g, int *M1);
.p2align 2,,3
.syntax unified
.text
.global __update_fg_32x96_mod2
.type __update_fg_32x96_mod2, %function
__update_fg_32x96_mod2:
	push.w {r3-r12,lr}
	vmov.w s0, s1, r0, r1
	vmov.w s2, r2
	sub.w sp, #212
	mov.w r0, sp
	vmov.w r1, s2
	vmov.w r2, s0
	bl __polymul_32x96_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #16
	bl __polymul_32x96_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s0
	add.w r1, #32
	bl __polymul_32x96_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #48
	bl __polymul_32x96_mod2_jump_head
	mov.w r10, sp
	vmov.w r0, r1, s0, s1
	add.w lr, r0, #48
	add.w r10, #4
	ldr.w r11, [r10, #-4]
	ldr.w r12, [r10, #48]
	and.w r11, r11, #0x1
	and.w r12, r12, #0x1
add_loop_96:
	ldr.w r2, [r10, #104]
	ldr.w r3, [r10, #108]
	ldr.w r4, [r10, #112]
	ldr.w r5, [r10, #116]
	ldr.w r6, [r10, #156]
	ldr.w r7, [r10, #160]
	ldr.w r8, [r10, #164]
	ldr.w r9, [r10, #168]
	vmov.w r0, r1, s0, s1
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	str.w r3, [r1, #4]
	str.w r4, [r1, #8]
	str.w r5, [r1, #12]
	str.w r2, [r1], #16
	ldr.w r6, [r10, #52]
	ldr.w r7, [r10, #56]
	ldr.w r8, [r10, #60]
	ldr.w r9, [r10, #64]
	ldr.w r3, [r10, #4]
	ldr.w r4, [r10, #8]
	ldr.w r5, [r10, #12]
	ldr.w r2, [r10], #16
	vmov.w s0, s1, r0, r1
	and.w r1, r2, #0x1
	eor.w r2, r11, r2, LSL #4
	and.w r11, r3, #0x1
	eor.w r3, r1, r3, LSL #4
	and.w r1, r4, #0x1
	eor.w r4, r11, r4, LSL #4
	and.w r11, r5, #0x1
	eor.w r5, r1, r5, LSL #4
	and.w r2, r6, #0x1
	eor.w r6, r12, r6, LSL #4
	and.w r12, r7, #0x1
	eor.w r7, r2, r7, LSL #4
	and.w r2, r8, #0x1
	eor.w r8, r12, r8, LSL #4
	and.w r12, r9, #0x1
	eor.w r9, r2, r9, LSL #4
	vmov.w r0, r1, s0, s1
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r5, [r0, #12]
	str.w r2, [r0], #16
	cmp.w r0, lr
	bne.w add_loop_96
	add.w sp, #212
	pop.w {r3-r12,pc}
// void __update_fg_32x128_mod2 (int *f, int*g, int *M1);
.p2align 2,,3
.syntax unified
.text
.global __update_fg_32x128_mod2
.type __update_fg_32x128_mod2, %function
__update_fg_32x128_mod2:
	push.w {r3-r12,lr}
	vmov.w s0, s1, r0, r1
	vmov.w s2, r2
	sub.w sp, #276
	mov.w r0, sp
	vmov.w r1, s2
	vmov.w r2, s0
	bl __polymul_32x128_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #16
	bl __polymul_32x128_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s0
	add.w r1, #32
	bl __polymul_32x128_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #48
	bl __polymul_32x128_mod2_jump_head
	mov.w r10, sp
	vmov.w r0, r1, s0, s1
	add.w lr, r0, #64
	add.w r10, #4
	ldr.w r11, [r10, #-4]
	ldr.w r12, [r10, #64]
	and.w r11, r11, #0x1
	and.w r12, r12, #0x1
add_loop_128:
	ldr.w r2, [r10, #136]
	ldr.w r3, [r10, #140]
	ldr.w r4, [r10, #144]
	ldr.w r5, [r10, #148]
	ldr.w r6, [r10, #204]
	ldr.w r7, [r10, #208]
	ldr.w r8, [r10, #212]
	ldr.w r9, [r10, #216]
	vmov.w r0, r1, s0, s1
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	str.w r3, [r1, #4]
	str.w r4, [r1, #8]
	str.w r5, [r1, #12]
	str.w r2, [r1], #16
	ldr.w r6, [r10, #68]
	ldr.w r7, [r10, #72]
	ldr.w r8, [r10, #76]
	ldr.w r9, [r10, #80]
	ldr.w r3, [r10, #4]
	ldr.w r4, [r10, #8]
	ldr.w r5, [r10, #12]
	ldr.w r2, [r10], #16
	vmov.w s0, s1, r0, r1
	and.w r1, r2, #0x1
	eor.w r2, r11, r2, LSL #4
	and.w r11, r3, #0x1
	eor.w r3, r1, r3, LSL #4
	and.w r1, r4, #0x1
	eor.w r4, r11, r4, LSL #4
	and.w r11, r5, #0x1
	eor.w r5, r1, r5, LSL #4
	and.w r2, r6, #0x1
	eor.w r6, r12, r6, LSL #4
	and.w r12, r7, #0x1
	eor.w r7, r2, r7, LSL #4
	and.w r2, r8, #0x1
	eor.w r8, r12, r8, LSL #4
	and.w r12, r9, #0x1
	eor.w r9, r2, r9, LSL #4
	vmov.w r0, r1, s0, s1
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r5, [r0, #12]
	str.w r2, [r0], #16
	cmp.w r0, lr
	bne.w add_loop_128
	add.w sp, #276
	pop.w {r3-r12,pc}
// void __update_fg_32x160_mod2 (int *f, int*g, int *M1);
.p2align 2,,3
.syntax unified
.text
.global __update_fg_32x160_mod2
.type __update_fg_32x160_mod2, %function
__update_fg_32x160_mod2:
	push.w {r3-r12,lr}
	vmov.w s0, s1, r0, r1
	vmov.w s2, r2
	sub.w sp, #340
	mov.w r0, sp
	vmov.w r1, s2
	vmov.w r2, s0
	bl __polymul_32x160_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #16
	bl __polymul_32x160_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s0
	add.w r1, #32
	bl __polymul_32x160_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #48
	bl __polymul_32x160_mod2_jump_head
	mov.w r10, sp
	vmov.w r0, r1, s0, s1
	add.w lr, r0, #80
	add.w r10, #4
	ldr.w r11, [r10, #-4]
	ldr.w r12, [r10, #80]
	and.w r11, r11, #0x1
	and.w r12, r12, #0x1
add_loop_160:
	ldr.w r2, [r10, #168]
	ldr.w r3, [r10, #172]
	ldr.w r4, [r10, #176]
	ldr.w r5, [r10, #180]
	ldr.w r6, [r10, #252]
	ldr.w r7, [r10, #256]
	ldr.w r8, [r10, #260]
	ldr.w r9, [r10, #264]
	vmov.w r0, r1, s0, s1
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	str.w r3, [r1, #4]
	str.w r4, [r1, #8]
	str.w r5, [r1, #12]
	str.w r2, [r1], #16
	ldr.w r6, [r10, #84]
	ldr.w r7, [r10, #88]
	ldr.w r8, [r10, #92]
	ldr.w r9, [r10, #96]
	ldr.w r3, [r10, #4]
	ldr.w r4, [r10, #8]
	ldr.w r5, [r10, #12]
	ldr.w r2, [r10], #16
	vmov.w s0, s1, r0, r1
	and.w r1, r2, #0x1
	eor.w r2, r11, r2, LSL #4
	and.w r11, r3, #0x1
	eor.w r3, r1, r3, LSL #4
	and.w r1, r4, #0x1
	eor.w r4, r11, r4, LSL #4
	and.w r11, r5, #0x1
	eor.w r5, r1, r5, LSL #4
	and.w r2, r6, #0x1
	eor.w r6, r12, r6, LSL #4
	and.w r12, r7, #0x1
	eor.w r7, r2, r7, LSL #4
	and.w r2, r8, #0x1
	eor.w r8, r12, r8, LSL #4
	and.w r12, r9, #0x1
	eor.w r9, r2, r9, LSL #4
	vmov.w r0, r1, s0, s1
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r5, [r0, #12]
	str.w r2, [r0], #16
	cmp.w r0, lr
	bne.w add_loop_160
	add.w sp, #340
	pop.w {r3-r12,pc}
// void __update_fg_32x192_mod2 (int *f, int*g, int *M1);
.p2align 2,,3
.syntax unified
.text
.global __update_fg_32x192_mod2
.type __update_fg_32x192_mod2, %function
__update_fg_32x192_mod2:
	push.w {r3-r12,lr}
	vmov.w s0, s1, r0, r1
	vmov.w s2, r2
	sub.w sp, #404
	mov.w r0, sp
	vmov.w r1, s2
	vmov.w r2, s0
	bl __polymul_32x192_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #16
	bl __polymul_32x192_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s0
	add.w r1, #32
	bl __polymul_32x192_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #48
	bl __polymul_32x192_mod2_jump_head
	mov.w r10, sp
	vmov.w r0, r1, s0, s1
	add.w lr, r0, #96
	add.w r10, #4
	ldr.w r11, [r10, #-4]
	ldr.w r12, [r10, #96]
	and.w r11, r11, #0x1
	and.w r12, r12, #0x1
add_loop_192:
	ldr.w r2, [r10, #200]
	ldr.w r3, [r10, #204]
	ldr.w r4, [r10, #208]
	ldr.w r5, [r10, #212]
	ldr.w r6, [r10, #300]
	ldr.w r7, [r10, #304]
	ldr.w r8, [r10, #308]
	ldr.w r9, [r10, #312]
	vmov.w r0, r1, s0, s1
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	str.w r3, [r1, #4]
	str.w r4, [r1, #8]
	str.w r5, [r1, #12]
	str.w r2, [r1], #16
	ldr.w r6, [r10, #100]
	ldr.w r7, [r10, #104]
	ldr.w r8, [r10, #108]
	ldr.w r9, [r10, #112]
	ldr.w r3, [r10, #4]
	ldr.w r4, [r10, #8]
	ldr.w r5, [r10, #12]
	ldr.w r2, [r10], #16
	vmov.w s0, s1, r0, r1
	and.w r1, r2, #0x1
	eor.w r2, r11, r2, LSL #4
	and.w r11, r3, #0x1
	eor.w r3, r1, r3, LSL #4
	and.w r1, r4, #0x1
	eor.w r4, r11, r4, LSL #4
	and.w r11, r5, #0x1
	eor.w r5, r1, r5, LSL #4
	and.w r2, r6, #0x1
	eor.w r6, r12, r6, LSL #4
	and.w r12, r7, #0x1
	eor.w r7, r2, r7, LSL #4
	and.w r2, r8, #0x1
	eor.w r8, r12, r8, LSL #4
	and.w r12, r9, #0x1
	eor.w r9, r2, r9, LSL #4
	vmov.w r0, r1, s0, s1
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r5, [r0, #12]
	str.w r2, [r0], #16
	cmp.w r0, lr
	bne.w add_loop_192
	add.w sp, #404
	pop.w {r3-r12,pc}
// void __update_fg_32x224_mod2 (int *f, int*g, int *M1);
.p2align 2,,3
.syntax unified
.text
.global __update_fg_32x224_mod2
.type __update_fg_32x224_mod2, %function
__update_fg_32x224_mod2:
	push.w {r3-r12,lr}
	vmov.w s0, s1, r0, r1
	vmov.w s2, r2
	sub.w sp, #468
	mov.w r0, sp
	vmov.w r1, s2
	vmov.w r2, s0
	bl __polymul_32x224_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #16
	bl __polymul_32x224_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s0
	add.w r1, #32
	bl __polymul_32x224_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #48
	bl __polymul_32x224_mod2_jump_head
	mov.w r10, sp
	vmov.w r0, r1, s0, s1
	add.w lr, r0, #112
	add.w r10, #4
	ldr.w r11, [r10, #-4]
	ldr.w r12, [r10, #112]
	and.w r11, r11, #0x1
	and.w r12, r12, #0x1
add_loop_224:
	ldr.w r2, [r10, #232]
	ldr.w r3, [r10, #236]
	ldr.w r4, [r10, #240]
	ldr.w r5, [r10, #244]
	ldr.w r6, [r10, #348]
	ldr.w r7, [r10, #352]
	ldr.w r8, [r10, #356]
	ldr.w r9, [r10, #360]
	vmov.w r0, r1, s0, s1
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	str.w r3, [r1, #4]
	str.w r4, [r1, #8]
	str.w r5, [r1, #12]
	str.w r2, [r1], #16
	ldr.w r6, [r10, #116]
	ldr.w r7, [r10, #120]
	ldr.w r8, [r10, #124]
	ldr.w r9, [r10, #128]
	ldr.w r3, [r10, #4]
	ldr.w r4, [r10, #8]
	ldr.w r5, [r10, #12]
	ldr.w r2, [r10], #16
	vmov.w s0, s1, r0, r1
	and.w r1, r2, #0x1
	eor.w r2, r11, r2, LSL #4
	and.w r11, r3, #0x1
	eor.w r3, r1, r3, LSL #4
	and.w r1, r4, #0x1
	eor.w r4, r11, r4, LSL #4
	and.w r11, r5, #0x1
	eor.w r5, r1, r5, LSL #4
	and.w r2, r6, #0x1
	eor.w r6, r12, r6, LSL #4
	and.w r12, r7, #0x1
	eor.w r7, r2, r7, LSL #4
	and.w r2, r8, #0x1
	eor.w r8, r12, r8, LSL #4
	and.w r12, r9, #0x1
	eor.w r9, r2, r9, LSL #4
	vmov.w r0, r1, s0, s1
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r5, [r0, #12]
	str.w r2, [r0], #16
	cmp.w r0, lr
	bne.w add_loop_224
	add.w sp, #468
	pop.w {r3-r12,pc}
// void __update_fg_32x256_mod2 (int *f, int*g, int *M1);
.p2align 2,,3
.syntax unified
.text
.global __update_fg_32x256_mod2
.type __update_fg_32x256_mod2, %function
__update_fg_32x256_mod2:
	push.w {r3-r12,lr}
	vmov.w s0, s1, r0, r1
	vmov.w s2, r2
	sub.w sp, #532
	mov.w r0, sp
	vmov.w r1, s2
	vmov.w r2, s0
	bl __polymul_32x256_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #16
	bl __polymul_32x256_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s0
	add.w r1, #32
	bl __polymul_32x256_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #48
	bl __polymul_32x256_mod2_jump_head
	mov.w r10, sp
	vmov.w r0, r1, s0, s1
	add.w lr, r0, #128
	add.w r10, #4
	ldr.w r11, [r10, #-4]
	ldr.w r12, [r10, #128]
	and.w r11, r11, #0x1
	and.w r12, r12, #0x1
add_loop_256:
	ldr.w r2, [r10, #264]
	ldr.w r3, [r10, #268]
	ldr.w r4, [r10, #272]
	ldr.w r5, [r10, #276]
	ldr.w r6, [r10, #396]
	ldr.w r7, [r10, #400]
	ldr.w r8, [r10, #404]
	ldr.w r9, [r10, #408]
	vmov.w r0, r1, s0, s1
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	str.w r3, [r1, #4]
	str.w r4, [r1, #8]
	str.w r5, [r1, #12]
	str.w r2, [r1], #16
	ldr.w r6, [r10, #132]
	ldr.w r7, [r10, #136]
	ldr.w r8, [r10, #140]
	ldr.w r9, [r10, #144]
	ldr.w r3, [r10, #4]
	ldr.w r4, [r10, #8]
	ldr.w r5, [r10, #12]
	ldr.w r2, [r10], #16
	vmov.w s0, s1, r0, r1
	and.w r1, r2, #0x1
	eor.w r2, r11, r2, LSL #4
	and.w r11, r3, #0x1
	eor.w r3, r1, r3, LSL #4
	and.w r1, r4, #0x1
	eor.w r4, r11, r4, LSL #4
	and.w r11, r5, #0x1
	eor.w r5, r1, r5, LSL #4
	and.w r2, r6, #0x1
	eor.w r6, r12, r6, LSL #4
	and.w r12, r7, #0x1
	eor.w r7, r2, r7, LSL #4
	and.w r2, r8, #0x1
	eor.w r8, r12, r8, LSL #4
	and.w r12, r9, #0x1
	eor.w r9, r2, r9, LSL #4
	vmov.w r0, r1, s0, s1
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r5, [r0, #12]
	str.w r2, [r0], #16
	cmp.w r0, lr
	bne.w add_loop_256
	add.w sp, #532
	pop.w {r3-r12,pc}
// void __update_fg_32x288_mod2 (int *f, int*g, int *M1);
.p2align 2,,3
.syntax unified
.text
.global __update_fg_32x288_mod2
.type __update_fg_32x288_mod2, %function
__update_fg_32x288_mod2:
	push.w {r3-r12,lr}
	vmov.w s0, s1, r0, r1
	vmov.w s2, r2
	sub.w sp, #596
	mov.w r0, sp
	vmov.w r1, s2
	vmov.w r2, s0
	bl __polymul_32x288_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #16
	bl __polymul_32x288_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s0
	add.w r1, #32
	bl __polymul_32x288_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #48
	bl __polymul_32x288_mod2_jump_head
	mov.w r10, sp
	vmov.w r0, r1, s0, s1
	add.w lr, r0, #144
	add.w r10, #4
	ldr.w r11, [r10, #-4]
	ldr.w r12, [r10, #144]
	and.w r11, r11, #0x1
	and.w r12, r12, #0x1
add_loop_288:
	ldr.w r2, [r10, #296]
	ldr.w r3, [r10, #300]
	ldr.w r4, [r10, #304]
	ldr.w r5, [r10, #308]
	ldr.w r6, [r10, #444]
	ldr.w r7, [r10, #448]
	ldr.w r8, [r10, #452]
	ldr.w r9, [r10, #456]
	vmov.w r0, r1, s0, s1
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	str.w r3, [r1, #4]
	str.w r4, [r1, #8]
	str.w r5, [r1, #12]
	str.w r2, [r1], #16
	ldr.w r6, [r10, #148]
	ldr.w r7, [r10, #152]
	ldr.w r8, [r10, #156]
	ldr.w r9, [r10, #160]
	ldr.w r3, [r10, #4]
	ldr.w r4, [r10, #8]
	ldr.w r5, [r10, #12]
	ldr.w r2, [r10], #16
	vmov.w s0, s1, r0, r1
	and.w r1, r2, #0x1
	eor.w r2, r11, r2, LSL #4
	and.w r11, r3, #0x1
	eor.w r3, r1, r3, LSL #4
	and.w r1, r4, #0x1
	eor.w r4, r11, r4, LSL #4
	and.w r11, r5, #0x1
	eor.w r5, r1, r5, LSL #4
	and.w r2, r6, #0x1
	eor.w r6, r12, r6, LSL #4
	and.w r12, r7, #0x1
	eor.w r7, r2, r7, LSL #4
	and.w r2, r8, #0x1
	eor.w r8, r12, r8, LSL #4
	and.w r12, r9, #0x1
	eor.w r9, r2, r9, LSL #4
	vmov.w r0, r1, s0, s1
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r5, [r0, #12]
	str.w r2, [r0], #16
	cmp.w r0, lr
	bne.w add_loop_288
	add.w sp, #596
	pop.w {r3-r12,pc}
// void __update_fg_32x320_mod2 (int *f, int*g, int *M1);
.p2align 2,,3
.syntax unified
.text
.global __update_fg_32x320_mod2
.type __update_fg_32x320_mod2, %function
__update_fg_32x320_mod2:
	push.w {r3-r12,lr}
	vmov.w s0, s1, r0, r1
	vmov.w s2, r2
	sub.w sp, #660
	mov.w r0, sp
	vmov.w r1, s2
	vmov.w r2, s0
	bl __polymul_32x320_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #16
	bl __polymul_32x320_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s0
	add.w r1, #32
	bl __polymul_32x320_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #48
	bl __polymul_32x320_mod2_jump_head
	mov.w r10, sp
	vmov.w r0, r1, s0, s1
	add.w lr, r0, #160
	add.w r10, #4
	ldr.w r11, [r10, #-4]
	ldr.w r12, [r10, #160]
	and.w r11, r11, #0x1
	and.w r12, r12, #0x1
add_loop_320:
	ldr.w r2, [r10, #328]
	ldr.w r3, [r10, #332]
	ldr.w r4, [r10, #336]
	ldr.w r5, [r10, #340]
	ldr.w r6, [r10, #492]
	ldr.w r7, [r10, #496]
	ldr.w r8, [r10, #500]
	ldr.w r9, [r10, #504]
	vmov.w r0, r1, s0, s1
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	str.w r3, [r1, #4]
	str.w r4, [r1, #8]
	str.w r5, [r1, #12]
	str.w r2, [r1], #16
	ldr.w r6, [r10, #164]
	ldr.w r7, [r10, #168]
	ldr.w r8, [r10, #172]
	ldr.w r9, [r10, #176]
	ldr.w r3, [r10, #4]
	ldr.w r4, [r10, #8]
	ldr.w r5, [r10, #12]
	ldr.w r2, [r10], #16
	vmov.w s0, s1, r0, r1
	and.w r1, r2, #0x1
	eor.w r2, r11, r2, LSL #4
	and.w r11, r3, #0x1
	eor.w r3, r1, r3, LSL #4
	and.w r1, r4, #0x1
	eor.w r4, r11, r4, LSL #4
	and.w r11, r5, #0x1
	eor.w r5, r1, r5, LSL #4
	and.w r2, r6, #0x1
	eor.w r6, r12, r6, LSL #4
	and.w r12, r7, #0x1
	eor.w r7, r2, r7, LSL #4
	and.w r2, r8, #0x1
	eor.w r8, r12, r8, LSL #4
	and.w r12, r9, #0x1
	eor.w r9, r2, r9, LSL #4
	vmov.w r0, r1, s0, s1
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r5, [r0, #12]
	str.w r2, [r0], #16
	cmp.w r0, lr
	bne.w add_loop_320
	add.w sp, #660
	pop.w {r3-r12,pc}
// void __update_fg_32x352_mod2 (int *f, int*g, int *M1);
.p2align 2,,3
.syntax unified
.text
.global __update_fg_32x352_mod2
.type __update_fg_32x352_mod2, %function
__update_fg_32x352_mod2:
	push.w {r3-r12,lr}
	vmov.w s0, s1, r0, r1
	vmov.w s2, r2
	sub.w sp, #724
	mov.w r0, sp
	vmov.w r1, s2
	vmov.w r2, s0
	bl __polymul_32x352_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #16
	bl __polymul_32x352_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s0
	add.w r1, #32
	bl __polymul_32x352_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #48
	bl __polymul_32x352_mod2_jump_head
	mov.w r10, sp
	vmov.w r0, r1, s0, s1
	add.w lr, r0, #176
	add.w r10, #4
	ldr.w r11, [r10, #-4]
	ldr.w r12, [r10, #176]
	and.w r11, r11, #0x1
	and.w r12, r12, #0x1
add_loop_352:
	ldr.w r2, [r10, #360]
	ldr.w r3, [r10, #364]
	ldr.w r4, [r10, #368]
	ldr.w r5, [r10, #372]
	ldr.w r6, [r10, #540]
	ldr.w r7, [r10, #544]
	ldr.w r8, [r10, #548]
	ldr.w r9, [r10, #552]
	vmov.w r0, r1, s0, s1
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	str.w r3, [r1, #4]
	str.w r4, [r1, #8]
	str.w r5, [r1, #12]
	str.w r2, [r1], #16
	ldr.w r6, [r10, #180]
	ldr.w r7, [r10, #184]
	ldr.w r8, [r10, #188]
	ldr.w r9, [r10, #192]
	ldr.w r3, [r10, #4]
	ldr.w r4, [r10, #8]
	ldr.w r5, [r10, #12]
	ldr.w r2, [r10], #16
	vmov.w s0, s1, r0, r1
	and.w r1, r2, #0x1
	eor.w r2, r11, r2, LSL #4
	and.w r11, r3, #0x1
	eor.w r3, r1, r3, LSL #4
	and.w r1, r4, #0x1
	eor.w r4, r11, r4, LSL #4
	and.w r11, r5, #0x1
	eor.w r5, r1, r5, LSL #4
	and.w r2, r6, #0x1
	eor.w r6, r12, r6, LSL #4
	and.w r12, r7, #0x1
	eor.w r7, r2, r7, LSL #4
	and.w r2, r8, #0x1
	eor.w r8, r12, r8, LSL #4
	and.w r12, r9, #0x1
	eor.w r9, r2, r9, LSL #4
	vmov.w r0, r1, s0, s1
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r5, [r0, #12]
	str.w r2, [r0], #16
	cmp.w r0, lr
	bne.w add_loop_352
	add.w sp, #724
	pop.w {r3-r12,pc}
// void __update_fg_32x384_mod2 (int *f, int*g, int *M1);
.p2align 2,,3
.syntax unified
.text
.global __update_fg_32x384_mod2
.type __update_fg_32x384_mod2, %function
__update_fg_32x384_mod2:
	push.w {r3-r12,lr}
	vmov.w s0, s1, r0, r1
	vmov.w s2, r2
	sub.w sp, #788
	mov.w r0, sp
	vmov.w r1, s2
	vmov.w r2, s0
	bl __polymul_32x384_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #16
	bl __polymul_32x384_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s0
	add.w r1, #32
	bl __polymul_32x384_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #48
	bl __polymul_32x384_mod2_jump_head
	mov.w r10, sp
	vmov.w r0, r1, s0, s1
	add.w lr, r0, #192
	add.w r10, #4
	ldr.w r11, [r10, #-4]
	ldr.w r12, [r10, #192]
	and.w r11, r11, #0x1
	and.w r12, r12, #0x1
add_loop_384:
	ldr.w r2, [r10, #392]
	ldr.w r3, [r10, #396]
	ldr.w r4, [r10, #400]
	ldr.w r5, [r10, #404]
	ldr.w r6, [r10, #588]
	ldr.w r7, [r10, #592]
	ldr.w r8, [r10, #596]
	ldr.w r9, [r10, #600]
	vmov.w r0, r1, s0, s1
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	str.w r3, [r1, #4]
	str.w r4, [r1, #8]
	str.w r5, [r1, #12]
	str.w r2, [r1], #16
	ldr.w r6, [r10, #196]
	ldr.w r7, [r10, #200]
	ldr.w r8, [r10, #204]
	ldr.w r9, [r10, #208]
	ldr.w r3, [r10, #4]
	ldr.w r4, [r10, #8]
	ldr.w r5, [r10, #12]
	ldr.w r2, [r10], #16
	vmov.w s0, s1, r0, r1
	and.w r1, r2, #0x1
	eor.w r2, r11, r2, LSL #4
	and.w r11, r3, #0x1
	eor.w r3, r1, r3, LSL #4
	and.w r1, r4, #0x1
	eor.w r4, r11, r4, LSL #4
	and.w r11, r5, #0x1
	eor.w r5, r1, r5, LSL #4
	and.w r2, r6, #0x1
	eor.w r6, r12, r6, LSL #4
	and.w r12, r7, #0x1
	eor.w r7, r2, r7, LSL #4
	and.w r2, r8, #0x1
	eor.w r8, r12, r8, LSL #4
	and.w r12, r9, #0x1
	eor.w r9, r2, r9, LSL #4
	vmov.w r0, r1, s0, s1
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r5, [r0, #12]
	str.w r2, [r0], #16
	cmp.w r0, lr
	bne.w add_loop_384
	add.w sp, #788
	pop.w {r3-r12,pc}
// void __update_fg_32x416_mod2 (int *f, int*g, int *M1);
.p2align 2,,3
.syntax unified
.text
.global __update_fg_32x416_mod2
.type __update_fg_32x416_mod2, %function
__update_fg_32x416_mod2:
	push.w {r3-r12,lr}
	vmov.w s0, s1, r0, r1
	vmov.w s2, r2
	sub.w sp, #852
	mov.w r0, sp
	vmov.w r1, s2
	vmov.w r2, s0
	bl __polymul_32x416_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #16
	bl __polymul_32x416_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s0
	add.w r1, #32
	bl __polymul_32x416_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #48
	bl __polymul_32x416_mod2_jump_head
	mov.w r10, sp
	vmov.w r0, r1, s0, s1
	add.w lr, r0, #208
	add.w r10, #4
	ldr.w r11, [r10, #-4]
	ldr.w r12, [r10, #208]
	and.w r11, r11, #0x1
	and.w r12, r12, #0x1
add_loop_416:
	ldr.w r2, [r10, #424]
	ldr.w r3, [r10, #428]
	ldr.w r4, [r10, #432]
	ldr.w r5, [r10, #436]
	ldr.w r6, [r10, #636]
	ldr.w r7, [r10, #640]
	ldr.w r8, [r10, #644]
	ldr.w r9, [r10, #648]
	vmov.w r0, r1, s0, s1
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	str.w r3, [r1, #4]
	str.w r4, [r1, #8]
	str.w r5, [r1, #12]
	str.w r2, [r1], #16
	ldr.w r6, [r10, #212]
	ldr.w r7, [r10, #216]
	ldr.w r8, [r10, #220]
	ldr.w r9, [r10, #224]
	ldr.w r3, [r10, #4]
	ldr.w r4, [r10, #8]
	ldr.w r5, [r10, #12]
	ldr.w r2, [r10], #16
	vmov.w s0, s1, r0, r1
	and.w r1, r2, #0x1
	eor.w r2, r11, r2, LSL #4
	and.w r11, r3, #0x1
	eor.w r3, r1, r3, LSL #4
	and.w r1, r4, #0x1
	eor.w r4, r11, r4, LSL #4
	and.w r11, r5, #0x1
	eor.w r5, r1, r5, LSL #4
	and.w r2, r6, #0x1
	eor.w r6, r12, r6, LSL #4
	and.w r12, r7, #0x1
	eor.w r7, r2, r7, LSL #4
	and.w r2, r8, #0x1
	eor.w r8, r12, r8, LSL #4
	and.w r12, r9, #0x1
	eor.w r9, r2, r9, LSL #4
	vmov.w r0, r1, s0, s1
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r5, [r0, #12]
	str.w r2, [r0], #16
	cmp.w r0, lr
	bne.w add_loop_416
	add.w sp, #852
	pop.w {r3-r12,pc}
// void __update_fg_32x448_mod2 (int *f, int*g, int *M1);
.p2align 2,,3
.syntax unified
.text
.global __update_fg_32x448_mod2
.type __update_fg_32x448_mod2, %function
__update_fg_32x448_mod2:
	push.w {r3-r12,lr}
	vmov.w s0, s1, r0, r1
	vmov.w s2, r2
	sub.w sp, #916
	mov.w r0, sp
	vmov.w r1, s2
	vmov.w r2, s0
	bl __polymul_32x448_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #16
	bl __polymul_32x448_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s0
	add.w r1, #32
	bl __polymul_32x448_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #48
	bl __polymul_32x448_mod2_jump_head
	mov.w r10, sp
	vmov.w r0, r1, s0, s1
	add.w lr, r0, #224
	add.w r10, #4
	ldr.w r11, [r10, #-4]
	ldr.w r12, [r10, #224]
	and.w r11, r11, #0x1
	and.w r12, r12, #0x1
add_loop_448:
	ldr.w r2, [r10, #456]
	ldr.w r3, [r10, #460]
	ldr.w r4, [r10, #464]
	ldr.w r5, [r10, #468]
	ldr.w r6, [r10, #684]
	ldr.w r7, [r10, #688]
	ldr.w r8, [r10, #692]
	ldr.w r9, [r10, #696]
	vmov.w r0, r1, s0, s1
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	str.w r3, [r1, #4]
	str.w r4, [r1, #8]
	str.w r5, [r1, #12]
	str.w r2, [r1], #16
	ldr.w r6, [r10, #228]
	ldr.w r7, [r10, #232]
	ldr.w r8, [r10, #236]
	ldr.w r9, [r10, #240]
	ldr.w r3, [r10, #4]
	ldr.w r4, [r10, #8]
	ldr.w r5, [r10, #12]
	ldr.w r2, [r10], #16
	vmov.w s0, s1, r0, r1
	and.w r1, r2, #0x1
	eor.w r2, r11, r2, LSL #4
	and.w r11, r3, #0x1
	eor.w r3, r1, r3, LSL #4
	and.w r1, r4, #0x1
	eor.w r4, r11, r4, LSL #4
	and.w r11, r5, #0x1
	eor.w r5, r1, r5, LSL #4
	and.w r2, r6, #0x1
	eor.w r6, r12, r6, LSL #4
	and.w r12, r7, #0x1
	eor.w r7, r2, r7, LSL #4
	and.w r2, r8, #0x1
	eor.w r8, r12, r8, LSL #4
	and.w r12, r9, #0x1
	eor.w r9, r2, r9, LSL #4
	vmov.w r0, r1, s0, s1
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r5, [r0, #12]
	str.w r2, [r0], #16
	cmp.w r0, lr
	bne.w add_loop_448
	add.w sp, #916
	pop.w {r3-r12,pc}
// void __update_fg_32x480_mod2 (int *f, int*g, int *M1);
.p2align 2,,3
.syntax unified
.text
.global __update_fg_32x480_mod2
.type __update_fg_32x480_mod2, %function
__update_fg_32x480_mod2:
	push.w {r3-r12,lr}
	vmov.w s0, s1, r0, r1
	vmov.w s2, r2
	sub.w sp, #980
	mov.w r0, sp
	vmov.w r1, s2
	vmov.w r2, s0
	bl __polymul_32x480_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #16
	bl __polymul_32x480_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s0
	add.w r1, #32
	bl __polymul_32x480_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #48
	bl __polymul_32x480_mod2_jump_head
	mov.w r10, sp
	vmov.w r0, r1, s0, s1
	add.w lr, r0, #240
	add.w r10, #4
	ldr.w r11, [r10, #-4]
	ldr.w r12, [r10, #240]
	and.w r11, r11, #0x1
	and.w r12, r12, #0x1
add_loop_480:
	ldr.w r2, [r10, #488]
	ldr.w r3, [r10, #492]
	ldr.w r4, [r10, #496]
	ldr.w r5, [r10, #500]
	ldr.w r6, [r10, #732]
	ldr.w r7, [r10, #736]
	ldr.w r8, [r10, #740]
	ldr.w r9, [r10, #744]
	vmov.w r0, r1, s0, s1
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	str.w r3, [r1, #4]
	str.w r4, [r1, #8]
	str.w r5, [r1, #12]
	str.w r2, [r1], #16
	ldr.w r6, [r10, #244]
	ldr.w r7, [r10, #248]
	ldr.w r8, [r10, #252]
	ldr.w r9, [r10, #256]
	ldr.w r3, [r10, #4]
	ldr.w r4, [r10, #8]
	ldr.w r5, [r10, #12]
	ldr.w r2, [r10], #16
	vmov.w s0, s1, r0, r1
	and.w r1, r2, #0x1
	eor.w r2, r11, r2, LSL #4
	and.w r11, r3, #0x1
	eor.w r3, r1, r3, LSL #4
	and.w r1, r4, #0x1
	eor.w r4, r11, r4, LSL #4
	and.w r11, r5, #0x1
	eor.w r5, r1, r5, LSL #4
	and.w r2, r6, #0x1
	eor.w r6, r12, r6, LSL #4
	and.w r12, r7, #0x1
	eor.w r7, r2, r7, LSL #4
	and.w r2, r8, #0x1
	eor.w r8, r12, r8, LSL #4
	and.w r12, r9, #0x1
	eor.w r9, r2, r9, LSL #4
	vmov.w r0, r1, s0, s1
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r5, [r0, #12]
	str.w r2, [r0], #16
	cmp.w r0, lr
	bne.w add_loop_480
	add.w sp, #980
	pop.w {r3-r12,pc}
// void __update_fg_32x512_mod2 (int *f, int*g, int *M1);
.p2align 2,,3
.syntax unified
.text
.global __update_fg_32x512_mod2
.type __update_fg_32x512_mod2, %function
__update_fg_32x512_mod2:
	push.w {r3-r12,lr}
	vmov.w s0, s1, r0, r1
	vmov.w s2, r2
	sub.w sp, #1044
	mov.w r0, sp
	vmov.w r1, s2
	vmov.w r2, s0
	bl __polymul_32x512_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #16
	bl __polymul_32x512_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s0
	add.w r1, #32
	bl __polymul_32x512_mod2_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #48
	bl __polymul_32x512_mod2_jump_head
	mov.w r10, sp
	vmov.w r0, r1, s0, s1
	add.w lr, r0, #256
	add.w r10, #4
	ldr.w r11, [r10, #-4]
	ldr.w r12, [r10, #256]
	and.w r11, r11, #0x1
	and.w r12, r12, #0x1
add_loop_512:
	ldr.w r2, [r10, #520]
	ldr.w r3, [r10, #524]
	ldr.w r4, [r10, #528]
	ldr.w r5, [r10, #532]
	ldr.w r6, [r10, #780]
	ldr.w r7, [r10, #784]
	ldr.w r8, [r10, #788]
	ldr.w r9, [r10, #792]
	vmov.w r0, r1, s0, s1
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	str.w r3, [r1, #4]
	str.w r4, [r1, #8]
	str.w r5, [r1, #12]
	str.w r2, [r1], #16
	ldr.w r6, [r10, #260]
	ldr.w r7, [r10, #264]
	ldr.w r8, [r10, #268]
	ldr.w r9, [r10, #272]
	ldr.w r3, [r10, #4]
	ldr.w r4, [r10, #8]
	ldr.w r5, [r10, #12]
	ldr.w r2, [r10], #16
	vmov.w s0, s1, r0, r1
	and.w r1, r2, #0x1
	eor.w r2, r11, r2, LSL #4
	and.w r11, r3, #0x1
	eor.w r3, r1, r3, LSL #4
	and.w r1, r4, #0x1
	eor.w r4, r11, r4, LSL #4
	and.w r11, r5, #0x1
	eor.w r5, r1, r5, LSL #4
	and.w r2, r6, #0x1
	eor.w r6, r12, r6, LSL #4
	and.w r12, r7, #0x1
	eor.w r7, r2, r7, LSL #4
	and.w r2, r8, #0x1
	eor.w r8, r12, r8, LSL #4
	and.w r12, r9, #0x1
	eor.w r9, r2, r9, LSL #4
	vmov.w r0, r1, s0, s1
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r5, [r0, #12]
	str.w r2, [r0], #16
	cmp.w r0, lr
	bne.w add_loop_512
	add.w sp, #1044
	pop.w {r3-r12,pc}
