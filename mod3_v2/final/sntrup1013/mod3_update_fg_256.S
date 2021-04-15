// void __update_fg_256x256 (int *f, int*g, int *M1);
.p2align 2,,3
.syntax unified
.text
.global __update_fg_256x256
.type __update_fg_256x256, %function
__update_fg_256x256:
	push.w {r3-r12,lr}
	ldr r11, =0x03030303
	vmov.w s0, s1, r0, r1
	vmov.w s2, r2
	sub.w sp, #1028
	mov.w r0, sp
	movw.w lr, #0
	str.w lr, [r0], #1
	vmov.w r1, s2
	vmov.w r2, s0
	bl __polymul_256x256_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #256
	bl __polymul_256x256_jump_head
	vmov.w r1, s2
	vmov.w r2, s0
	add.w r1, #512
	sub.w r0, #1
	bl __polymul_256x256_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #768
	bl __polymul_256x256_jump_head
	mov.w r10, sp
	vmov.w r0, r1, s0, s1
	add.w r10, #4
	add.w lr, r0, #240
add_loop_256:
	ldr.w r2, [r10, #512]
	ldr.w r3, [r10, #516]
	ldr.w r4, [r10, #520]
	ldr.w r5, [r10, #524]
	ldr.w r6, [r10, #768]
	ldr.w r7, [r10, #772]
	ldr.w r8, [r10, #776]
	ldr.w r9, [r10, #780]
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	and.w r12, r2, #0xF0F0F0F0 // top 4b < 16
	and.w r2, r2, #0x0F0F0F0F // bot 4b < 16
	add.w r2, r2, r12, LSR #4 // range < 31
	bic.w r12, r2, r11 // top 3b < 8
	and.w r2, r2, r11 // bot 2b < 4
	add.w r2, r2, r12, LSR #2 // range <=10
	bic.w r12, r2, r11 // top 3b < 3
	and.w r2, r2, r11 // bot 2b < 4
	add.w r2, r2, r12, LSR #2 // range <=5
	usub8.w r12, r2, r11 // >= 3 ?
	sel.w r2, r12, r2 // select
	and.w r12, r3, #0xF0F0F0F0 // top 4b < 16
	and.w r3, r3, #0x0F0F0F0F // bot 4b < 16
	add.w r3, r3, r12, LSR #4 // range < 31
	bic.w r12, r3, r11 // top 3b < 8
	and.w r3, r3, r11 // bot 2b < 4
	add.w r3, r3, r12, LSR #2 // range <=10
	bic.w r12, r3, r11 // top 3b < 3
	and.w r3, r3, r11 // bot 2b < 4
	add.w r3, r3, r12, LSR #2 // range <=5
	usub8.w r12, r3, r11 // >= 3 ?
	sel.w r3, r12, r3 // select
	and.w r12, r4, #0xF0F0F0F0 // top 4b < 16
	and.w r4, r4, #0x0F0F0F0F // bot 4b < 16
	add.w r4, r4, r12, LSR #4 // range < 31
	bic.w r12, r4, r11 // top 3b < 8
	and.w r4, r4, r11 // bot 2b < 4
	add.w r4, r4, r12, LSR #2 // range <=10
	bic.w r12, r4, r11 // top 3b < 3
	and.w r4, r4, r11 // bot 2b < 4
	add.w r4, r4, r12, LSR #2 // range <=5
	usub8.w r12, r4, r11 // >= 3 ?
	sel.w r4, r12, r4 // select
	and.w r12, r5, #0xF0F0F0F0 // top 4b < 16
	and.w r5, r5, #0x0F0F0F0F // bot 4b < 16
	add.w r5, r5, r12, LSR #4 // range < 31
	bic.w r12, r5, r11 // top 3b < 8
	and.w r5, r5, r11 // bot 2b < 4
	add.w r5, r5, r12, LSR #2 // range <=10
	bic.w r12, r5, r11 // top 3b < 3
	and.w r5, r5, r11 // bot 2b < 4
	add.w r5, r5, r12, LSR #2 // range <=5
	usub8.w r12, r5, r11 // >= 3 ?
	sel.w r5, r12, r5 // select
	str.w r3, [r1, #4]
	str.w r4, [r1, #8]
	str.w r5, [r1, #12]
	str.w r2, [r1], #16
	ldr.w r6, [r10, #256]
	ldr.w r7, [r10, #260]
	ldr.w r8, [r10, #264]
	ldr.w r9, [r10, #268]
	ldr.w r3, [r10, #4]
	ldr.w r4, [r10, #8]
	ldr.w r5, [r10, #12]
	ldr.w r2, [r10], #16
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	and.w r12, r2, #0xF0F0F0F0 // top 4b < 16
	and.w r2, r2, #0x0F0F0F0F // bot 4b < 16
	add.w r2, r2, r12, LSR #4 // range < 31
	bic.w r12, r2, r11 // top 3b < 8
	and.w r2, r2, r11 // bot 2b < 4
	add.w r2, r2, r12, LSR #2 // range <=10
	bic.w r12, r2, r11 // top 3b < 3
	and.w r2, r2, r11 // bot 2b < 4
	add.w r2, r2, r12, LSR #2 // range <=5
	usub8.w r12, r2, r11 // >= 3 ?
	sel.w r2, r12, r2 // select
	and.w r12, r3, #0xF0F0F0F0 // top 4b < 16
	and.w r3, r3, #0x0F0F0F0F // bot 4b < 16
	add.w r3, r3, r12, LSR #4 // range < 31
	bic.w r12, r3, r11 // top 3b < 8
	and.w r3, r3, r11 // bot 2b < 4
	add.w r3, r3, r12, LSR #2 // range <=10
	bic.w r12, r3, r11 // top 3b < 3
	and.w r3, r3, r11 // bot 2b < 4
	add.w r3, r3, r12, LSR #2 // range <=5
	usub8.w r12, r3, r11 // >= 3 ?
	sel.w r3, r12, r3 // select
	and.w r12, r4, #0xF0F0F0F0 // top 4b < 16
	and.w r4, r4, #0x0F0F0F0F // bot 4b < 16
	add.w r4, r4, r12, LSR #4 // range < 31
	bic.w r12, r4, r11 // top 3b < 8
	and.w r4, r4, r11 // bot 2b < 4
	add.w r4, r4, r12, LSR #2 // range <=10
	bic.w r12, r4, r11 // top 3b < 3
	and.w r4, r4, r11 // bot 2b < 4
	add.w r4, r4, r12, LSR #2 // range <=5
	usub8.w r12, r4, r11 // >= 3 ?
	sel.w r4, r12, r4 // select
	and.w r12, r5, #0xF0F0F0F0 // top 4b < 16
	and.w r5, r5, #0x0F0F0F0F // bot 4b < 16
	add.w r5, r5, r12, LSR #4 // range < 31
	bic.w r12, r5, r11 // top 3b < 8
	and.w r5, r5, r11 // bot 2b < 4
	add.w r5, r5, r12, LSR #2 // range <=10
	bic.w r12, r5, r11 // top 3b < 3
	and.w r5, r5, r11 // bot 2b < 4
	add.w r5, r5, r12, LSR #2 // range <=5
	usub8.w r12, r5, r11 // >= 3 ?
	sel.w r5, r12, r5 // select
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r5, [r0, #12]
	str.w r2, [r0], #16
	cmp.w r0, lr
	bne.w add_loop_256
	ldr.w r2, [r10, #512]
	ldr.w r3, [r10, #516]
	ldr.w r4, [r10, #520]
	ldr.w r6, [r10, #768]
	ldr.w r7, [r10, #772]
	ldr.w r8, [r10, #776]
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	and.w r12, r2, #0xF0F0F0F0 // top 4b < 16
	and.w r2, r2, #0x0F0F0F0F // bot 4b < 16
	add.w r2, r2, r12, LSR #4 // range < 31
	bic.w r12, r2, r11 // top 3b < 8
	and.w r2, r2, r11 // bot 2b < 4
	add.w r2, r2, r12, LSR #2 // range <=10
	bic.w r12, r2, r11 // top 3b < 3
	and.w r2, r2, r11 // bot 2b < 4
	add.w r2, r2, r12, LSR #2 // range <=5
	usub8.w r12, r2, r11 // >= 3 ?
	sel.w r2, r12, r2 // select
	and.w r12, r3, #0xF0F0F0F0 // top 4b < 16
	and.w r3, r3, #0x0F0F0F0F // bot 4b < 16
	add.w r3, r3, r12, LSR #4 // range < 31
	bic.w r12, r3, r11 // top 3b < 8
	and.w r3, r3, r11 // bot 2b < 4
	add.w r3, r3, r12, LSR #2 // range <=10
	bic.w r12, r3, r11 // top 3b < 3
	and.w r3, r3, r11 // bot 2b < 4
	add.w r3, r3, r12, LSR #2 // range <=5
	usub8.w r12, r3, r11 // >= 3 ?
	sel.w r3, r12, r3 // select
	and.w r12, r4, #0xF0F0F0F0 // top 4b < 16
	and.w r4, r4, #0x0F0F0F0F // bot 4b < 16
	add.w r4, r4, r12, LSR #4 // range < 31
	bic.w r12, r4, r11 // top 3b < 8
	and.w r4, r4, r11 // bot 2b < 4
	add.w r4, r4, r12, LSR #2 // range <=10
	bic.w r12, r4, r11 // top 3b < 3
	and.w r4, r4, r11 // bot 2b < 4
	add.w r4, r4, r12, LSR #2 // range <=5
	usub8.w r12, r4, r11 // >= 3 ?
	sel.w r4, r12, r4 // select
	str.w r3, [r1, #4]
	str.w r4, [r1, #8]
	str.w r2, [r1], #12
	ldr.w r6, [r10, #256]
	ldr.w r7, [r10, #260]
	ldr.w r8, [r10, #264]
	ldr.w r3, [r10, #4]
	ldr.w r4, [r10, #8]
	ldr.w r2, [r10], #12
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	and.w r12, r2, #0xF0F0F0F0 // top 4b < 16
	and.w r2, r2, #0x0F0F0F0F // bot 4b < 16
	add.w r2, r2, r12, LSR #4 // range < 31
	bic.w r12, r2, r11 // top 3b < 8
	and.w r2, r2, r11 // bot 2b < 4
	add.w r2, r2, r12, LSR #2 // range <=10
	bic.w r12, r2, r11 // top 3b < 3
	and.w r2, r2, r11 // bot 2b < 4
	add.w r2, r2, r12, LSR #2 // range <=5
	usub8.w r12, r2, r11 // >= 3 ?
	sel.w r2, r12, r2 // select
	and.w r12, r3, #0xF0F0F0F0 // top 4b < 16
	and.w r3, r3, #0x0F0F0F0F // bot 4b < 16
	add.w r3, r3, r12, LSR #4 // range < 31
	bic.w r12, r3, r11 // top 3b < 8
	and.w r3, r3, r11 // bot 2b < 4
	add.w r3, r3, r12, LSR #2 // range <=10
	bic.w r12, r3, r11 // top 3b < 3
	and.w r3, r3, r11 // bot 2b < 4
	add.w r3, r3, r12, LSR #2 // range <=5
	usub8.w r12, r3, r11 // >= 3 ?
	sel.w r3, r12, r3 // select
	and.w r12, r4, #0xF0F0F0F0 // top 4b < 16
	and.w r4, r4, #0x0F0F0F0F // bot 4b < 16
	add.w r4, r4, r12, LSR #4 // range < 31
	bic.w r12, r4, r11 // top 3b < 8
	and.w r4, r4, r11 // bot 2b < 4
	add.w r4, r4, r12, LSR #2 // range <=10
	bic.w r12, r4, r11 // top 3b < 3
	and.w r4, r4, r11 // bot 2b < 4
	add.w r4, r4, r12, LSR #2 // range <=5
	usub8.w r12, r4, r11 // >= 3 ?
	sel.w r4, r12, r4 // select
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r2, [r0], #12
	add.w sp, #1028
	pop.w {r3-r12,pc}
// void __update_fg_256x512 (int *f, int*g, int *M1);
.p2align 2,,3
.syntax unified
.text
.global __update_fg_256x512
.type __update_fg_256x512, %function
__update_fg_256x512:
	push.w {r3-r12,lr}
	ldr r11, =0x03030303
	vmov.w s0, s1, r0, r1
	vmov.w s2, r2
	sub.w sp, #2052
	mov.w r0, sp
	movw.w lr, #0
	str.w lr, [r0], #1
	vmov.w r1, s2
	vmov.w r2, s0
	bl __polymul_256x512_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #256
	bl __polymul_256x512_jump_head
	vmov.w r1, s2
	vmov.w r2, s0
	add.w r1, #512
	sub.w r0, #1
	bl __polymul_256x512_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #768
	bl __polymul_256x512_jump_head
	mov.w r10, sp
	vmov.w r0, r1, s0, s1
	add.w r10, #4
	add.w lr, r0, #496
add_loop_512:
	ldr.w r2, [r10, #1024]
	ldr.w r3, [r10, #1028]
	ldr.w r4, [r10, #1032]
	ldr.w r5, [r10, #1036]
	ldr.w r6, [r10, #1536]
	ldr.w r7, [r10, #1540]
	ldr.w r8, [r10, #1544]
	ldr.w r9, [r10, #1548]
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	and.w r12, r2, #0xF0F0F0F0 // top 4b < 16
	and.w r2, r2, #0x0F0F0F0F // bot 4b < 16
	add.w r2, r2, r12, LSR #4 // range < 31
	bic.w r12, r2, r11 // top 3b < 8
	and.w r2, r2, r11 // bot 2b < 4
	add.w r2, r2, r12, LSR #2 // range <=10
	bic.w r12, r2, r11 // top 3b < 3
	and.w r2, r2, r11 // bot 2b < 4
	add.w r2, r2, r12, LSR #2 // range <=5
	usub8.w r12, r2, r11 // >= 3 ?
	sel.w r2, r12, r2 // select
	and.w r12, r3, #0xF0F0F0F0 // top 4b < 16
	and.w r3, r3, #0x0F0F0F0F // bot 4b < 16
	add.w r3, r3, r12, LSR #4 // range < 31
	bic.w r12, r3, r11 // top 3b < 8
	and.w r3, r3, r11 // bot 2b < 4
	add.w r3, r3, r12, LSR #2 // range <=10
	bic.w r12, r3, r11 // top 3b < 3
	and.w r3, r3, r11 // bot 2b < 4
	add.w r3, r3, r12, LSR #2 // range <=5
	usub8.w r12, r3, r11 // >= 3 ?
	sel.w r3, r12, r3 // select
	and.w r12, r4, #0xF0F0F0F0 // top 4b < 16
	and.w r4, r4, #0x0F0F0F0F // bot 4b < 16
	add.w r4, r4, r12, LSR #4 // range < 31
	bic.w r12, r4, r11 // top 3b < 8
	and.w r4, r4, r11 // bot 2b < 4
	add.w r4, r4, r12, LSR #2 // range <=10
	bic.w r12, r4, r11 // top 3b < 3
	and.w r4, r4, r11 // bot 2b < 4
	add.w r4, r4, r12, LSR #2 // range <=5
	usub8.w r12, r4, r11 // >= 3 ?
	sel.w r4, r12, r4 // select
	and.w r12, r5, #0xF0F0F0F0 // top 4b < 16
	and.w r5, r5, #0x0F0F0F0F // bot 4b < 16
	add.w r5, r5, r12, LSR #4 // range < 31
	bic.w r12, r5, r11 // top 3b < 8
	and.w r5, r5, r11 // bot 2b < 4
	add.w r5, r5, r12, LSR #2 // range <=10
	bic.w r12, r5, r11 // top 3b < 3
	and.w r5, r5, r11 // bot 2b < 4
	add.w r5, r5, r12, LSR #2 // range <=5
	usub8.w r12, r5, r11 // >= 3 ?
	sel.w r5, r12, r5 // select
	str.w r3, [r1, #4]
	str.w r4, [r1, #8]
	str.w r5, [r1, #12]
	str.w r2, [r1], #16
	ldr.w r6, [r10, #512]
	ldr.w r7, [r10, #516]
	ldr.w r8, [r10, #520]
	ldr.w r9, [r10, #524]
	ldr.w r3, [r10, #4]
	ldr.w r4, [r10, #8]
	ldr.w r5, [r10, #12]
	ldr.w r2, [r10], #16
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	and.w r12, r2, #0xF0F0F0F0 // top 4b < 16
	and.w r2, r2, #0x0F0F0F0F // bot 4b < 16
	add.w r2, r2, r12, LSR #4 // range < 31
	bic.w r12, r2, r11 // top 3b < 8
	and.w r2, r2, r11 // bot 2b < 4
	add.w r2, r2, r12, LSR #2 // range <=10
	bic.w r12, r2, r11 // top 3b < 3
	and.w r2, r2, r11 // bot 2b < 4
	add.w r2, r2, r12, LSR #2 // range <=5
	usub8.w r12, r2, r11 // >= 3 ?
	sel.w r2, r12, r2 // select
	and.w r12, r3, #0xF0F0F0F0 // top 4b < 16
	and.w r3, r3, #0x0F0F0F0F // bot 4b < 16
	add.w r3, r3, r12, LSR #4 // range < 31
	bic.w r12, r3, r11 // top 3b < 8
	and.w r3, r3, r11 // bot 2b < 4
	add.w r3, r3, r12, LSR #2 // range <=10
	bic.w r12, r3, r11 // top 3b < 3
	and.w r3, r3, r11 // bot 2b < 4
	add.w r3, r3, r12, LSR #2 // range <=5
	usub8.w r12, r3, r11 // >= 3 ?
	sel.w r3, r12, r3 // select
	and.w r12, r4, #0xF0F0F0F0 // top 4b < 16
	and.w r4, r4, #0x0F0F0F0F // bot 4b < 16
	add.w r4, r4, r12, LSR #4 // range < 31
	bic.w r12, r4, r11 // top 3b < 8
	and.w r4, r4, r11 // bot 2b < 4
	add.w r4, r4, r12, LSR #2 // range <=10
	bic.w r12, r4, r11 // top 3b < 3
	and.w r4, r4, r11 // bot 2b < 4
	add.w r4, r4, r12, LSR #2 // range <=5
	usub8.w r12, r4, r11 // >= 3 ?
	sel.w r4, r12, r4 // select
	and.w r12, r5, #0xF0F0F0F0 // top 4b < 16
	and.w r5, r5, #0x0F0F0F0F // bot 4b < 16
	add.w r5, r5, r12, LSR #4 // range < 31
	bic.w r12, r5, r11 // top 3b < 8
	and.w r5, r5, r11 // bot 2b < 4
	add.w r5, r5, r12, LSR #2 // range <=10
	bic.w r12, r5, r11 // top 3b < 3
	and.w r5, r5, r11 // bot 2b < 4
	add.w r5, r5, r12, LSR #2 // range <=5
	usub8.w r12, r5, r11 // >= 3 ?
	sel.w r5, r12, r5 // select
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r5, [r0, #12]
	str.w r2, [r0], #16
	cmp.w r0, lr
	bne.w add_loop_512
	ldr.w r2, [r10, #1024]
	ldr.w r3, [r10, #1028]
	ldr.w r4, [r10, #1032]
	ldr.w r6, [r10, #1536]
	ldr.w r7, [r10, #1540]
	ldr.w r8, [r10, #1544]
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	and.w r12, r2, #0xF0F0F0F0 // top 4b < 16
	and.w r2, r2, #0x0F0F0F0F // bot 4b < 16
	add.w r2, r2, r12, LSR #4 // range < 31
	bic.w r12, r2, r11 // top 3b < 8
	and.w r2, r2, r11 // bot 2b < 4
	add.w r2, r2, r12, LSR #2 // range <=10
	bic.w r12, r2, r11 // top 3b < 3
	and.w r2, r2, r11 // bot 2b < 4
	add.w r2, r2, r12, LSR #2 // range <=5
	usub8.w r12, r2, r11 // >= 3 ?
	sel.w r2, r12, r2 // select
	and.w r12, r3, #0xF0F0F0F0 // top 4b < 16
	and.w r3, r3, #0x0F0F0F0F // bot 4b < 16
	add.w r3, r3, r12, LSR #4 // range < 31
	bic.w r12, r3, r11 // top 3b < 8
	and.w r3, r3, r11 // bot 2b < 4
	add.w r3, r3, r12, LSR #2 // range <=10
	bic.w r12, r3, r11 // top 3b < 3
	and.w r3, r3, r11 // bot 2b < 4
	add.w r3, r3, r12, LSR #2 // range <=5
	usub8.w r12, r3, r11 // >= 3 ?
	sel.w r3, r12, r3 // select
	and.w r12, r4, #0xF0F0F0F0 // top 4b < 16
	and.w r4, r4, #0x0F0F0F0F // bot 4b < 16
	add.w r4, r4, r12, LSR #4 // range < 31
	bic.w r12, r4, r11 // top 3b < 8
	and.w r4, r4, r11 // bot 2b < 4
	add.w r4, r4, r12, LSR #2 // range <=10
	bic.w r12, r4, r11 // top 3b < 3
	and.w r4, r4, r11 // bot 2b < 4
	add.w r4, r4, r12, LSR #2 // range <=5
	usub8.w r12, r4, r11 // >= 3 ?
	sel.w r4, r12, r4 // select
	str.w r3, [r1, #4]
	str.w r4, [r1, #8]
	str.w r2, [r1], #12
	ldr.w r6, [r10, #512]
	ldr.w r7, [r10, #516]
	ldr.w r8, [r10, #520]
	ldr.w r3, [r10, #4]
	ldr.w r4, [r10, #8]
	ldr.w r2, [r10], #12
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	and.w r12, r2, #0xF0F0F0F0 // top 4b < 16
	and.w r2, r2, #0x0F0F0F0F // bot 4b < 16
	add.w r2, r2, r12, LSR #4 // range < 31
	bic.w r12, r2, r11 // top 3b < 8
	and.w r2, r2, r11 // bot 2b < 4
	add.w r2, r2, r12, LSR #2 // range <=10
	bic.w r12, r2, r11 // top 3b < 3
	and.w r2, r2, r11 // bot 2b < 4
	add.w r2, r2, r12, LSR #2 // range <=5
	usub8.w r12, r2, r11 // >= 3 ?
	sel.w r2, r12, r2 // select
	and.w r12, r3, #0xF0F0F0F0 // top 4b < 16
	and.w r3, r3, #0x0F0F0F0F // bot 4b < 16
	add.w r3, r3, r12, LSR #4 // range < 31
	bic.w r12, r3, r11 // top 3b < 8
	and.w r3, r3, r11 // bot 2b < 4
	add.w r3, r3, r12, LSR #2 // range <=10
	bic.w r12, r3, r11 // top 3b < 3
	and.w r3, r3, r11 // bot 2b < 4
	add.w r3, r3, r12, LSR #2 // range <=5
	usub8.w r12, r3, r11 // >= 3 ?
	sel.w r3, r12, r3 // select
	and.w r12, r4, #0xF0F0F0F0 // top 4b < 16
	and.w r4, r4, #0x0F0F0F0F // bot 4b < 16
	add.w r4, r4, r12, LSR #4 // range < 31
	bic.w r12, r4, r11 // top 3b < 8
	and.w r4, r4, r11 // bot 2b < 4
	add.w r4, r4, r12, LSR #2 // range <=10
	bic.w r12, r4, r11 // top 3b < 3
	and.w r4, r4, r11 // bot 2b < 4
	add.w r4, r4, r12, LSR #2 // range <=5
	usub8.w r12, r4, r11 // >= 3 ?
	sel.w r4, r12, r4 // select
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r2, [r0], #12
	add.w sp, #2052
	pop.w {r3-r12,pc}
// void __update_fg_256x768 (int *f, int*g, int *M1);
.p2align 2,,3
.syntax unified
.text
.global __update_fg_256x768
.type __update_fg_256x768, %function
__update_fg_256x768:
	push.w {r3-r12,lr}
	ldr r11, =0x03030303
	vmov.w s0, s1, r0, r1
	vmov.w s2, r2
	sub.w sp, #3076
	mov.w r0, sp
	movw.w lr, #0
	str.w lr, [r0], #1
	vmov.w r1, s2
	vmov.w r2, s0
	bl __polymul_256x768_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #256
	bl __polymul_256x768_jump_head
	vmov.w r1, s2
	vmov.w r2, s0
	add.w r1, #512
	sub.w r0, #1
	bl __polymul_256x768_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #768
	bl __polymul_256x768_jump_head
	mov.w r10, sp
	vmov.w r0, r1, s0, s1
	add.w r10, #4
	add.w lr, r0, #752
add_loop_768:
	ldr.w r2, [r10, #1536]
	ldr.w r3, [r10, #1540]
	ldr.w r4, [r10, #1544]
	ldr.w r5, [r10, #1548]
	ldr.w r6, [r10, #2304]
	ldr.w r7, [r10, #2308]
	ldr.w r8, [r10, #2312]
	ldr.w r9, [r10, #2316]
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	and.w r12, r2, #0xF0F0F0F0 // top 4b < 16
	and.w r2, r2, #0x0F0F0F0F // bot 4b < 16
	add.w r2, r2, r12, LSR #4 // range < 31
	bic.w r12, r2, r11 // top 3b < 8
	and.w r2, r2, r11 // bot 2b < 4
	add.w r2, r2, r12, LSR #2 // range <=10
	bic.w r12, r2, r11 // top 3b < 3
	and.w r2, r2, r11 // bot 2b < 4
	add.w r2, r2, r12, LSR #2 // range <=5
	usub8.w r12, r2, r11 // >= 3 ?
	sel.w r2, r12, r2 // select
	and.w r12, r3, #0xF0F0F0F0 // top 4b < 16
	and.w r3, r3, #0x0F0F0F0F // bot 4b < 16
	add.w r3, r3, r12, LSR #4 // range < 31
	bic.w r12, r3, r11 // top 3b < 8
	and.w r3, r3, r11 // bot 2b < 4
	add.w r3, r3, r12, LSR #2 // range <=10
	bic.w r12, r3, r11 // top 3b < 3
	and.w r3, r3, r11 // bot 2b < 4
	add.w r3, r3, r12, LSR #2 // range <=5
	usub8.w r12, r3, r11 // >= 3 ?
	sel.w r3, r12, r3 // select
	and.w r12, r4, #0xF0F0F0F0 // top 4b < 16
	and.w r4, r4, #0x0F0F0F0F // bot 4b < 16
	add.w r4, r4, r12, LSR #4 // range < 31
	bic.w r12, r4, r11 // top 3b < 8
	and.w r4, r4, r11 // bot 2b < 4
	add.w r4, r4, r12, LSR #2 // range <=10
	bic.w r12, r4, r11 // top 3b < 3
	and.w r4, r4, r11 // bot 2b < 4
	add.w r4, r4, r12, LSR #2 // range <=5
	usub8.w r12, r4, r11 // >= 3 ?
	sel.w r4, r12, r4 // select
	and.w r12, r5, #0xF0F0F0F0 // top 4b < 16
	and.w r5, r5, #0x0F0F0F0F // bot 4b < 16
	add.w r5, r5, r12, LSR #4 // range < 31
	bic.w r12, r5, r11 // top 3b < 8
	and.w r5, r5, r11 // bot 2b < 4
	add.w r5, r5, r12, LSR #2 // range <=10
	bic.w r12, r5, r11 // top 3b < 3
	and.w r5, r5, r11 // bot 2b < 4
	add.w r5, r5, r12, LSR #2 // range <=5
	usub8.w r12, r5, r11 // >= 3 ?
	sel.w r5, r12, r5 // select
	str.w r3, [r1, #4]
	str.w r4, [r1, #8]
	str.w r5, [r1, #12]
	str.w r2, [r1], #16
	ldr.w r6, [r10, #768]
	ldr.w r7, [r10, #772]
	ldr.w r8, [r10, #776]
	ldr.w r9, [r10, #780]
	ldr.w r3, [r10, #4]
	ldr.w r4, [r10, #8]
	ldr.w r5, [r10, #12]
	ldr.w r2, [r10], #16
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	and.w r12, r2, #0xF0F0F0F0 // top 4b < 16
	and.w r2, r2, #0x0F0F0F0F // bot 4b < 16
	add.w r2, r2, r12, LSR #4 // range < 31
	bic.w r12, r2, r11 // top 3b < 8
	and.w r2, r2, r11 // bot 2b < 4
	add.w r2, r2, r12, LSR #2 // range <=10
	bic.w r12, r2, r11 // top 3b < 3
	and.w r2, r2, r11 // bot 2b < 4
	add.w r2, r2, r12, LSR #2 // range <=5
	usub8.w r12, r2, r11 // >= 3 ?
	sel.w r2, r12, r2 // select
	and.w r12, r3, #0xF0F0F0F0 // top 4b < 16
	and.w r3, r3, #0x0F0F0F0F // bot 4b < 16
	add.w r3, r3, r12, LSR #4 // range < 31
	bic.w r12, r3, r11 // top 3b < 8
	and.w r3, r3, r11 // bot 2b < 4
	add.w r3, r3, r12, LSR #2 // range <=10
	bic.w r12, r3, r11 // top 3b < 3
	and.w r3, r3, r11 // bot 2b < 4
	add.w r3, r3, r12, LSR #2 // range <=5
	usub8.w r12, r3, r11 // >= 3 ?
	sel.w r3, r12, r3 // select
	and.w r12, r4, #0xF0F0F0F0 // top 4b < 16
	and.w r4, r4, #0x0F0F0F0F // bot 4b < 16
	add.w r4, r4, r12, LSR #4 // range < 31
	bic.w r12, r4, r11 // top 3b < 8
	and.w r4, r4, r11 // bot 2b < 4
	add.w r4, r4, r12, LSR #2 // range <=10
	bic.w r12, r4, r11 // top 3b < 3
	and.w r4, r4, r11 // bot 2b < 4
	add.w r4, r4, r12, LSR #2 // range <=5
	usub8.w r12, r4, r11 // >= 3 ?
	sel.w r4, r12, r4 // select
	and.w r12, r5, #0xF0F0F0F0 // top 4b < 16
	and.w r5, r5, #0x0F0F0F0F // bot 4b < 16
	add.w r5, r5, r12, LSR #4 // range < 31
	bic.w r12, r5, r11 // top 3b < 8
	and.w r5, r5, r11 // bot 2b < 4
	add.w r5, r5, r12, LSR #2 // range <=10
	bic.w r12, r5, r11 // top 3b < 3
	and.w r5, r5, r11 // bot 2b < 4
	add.w r5, r5, r12, LSR #2 // range <=5
	usub8.w r12, r5, r11 // >= 3 ?
	sel.w r5, r12, r5 // select
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r5, [r0, #12]
	str.w r2, [r0], #16
	cmp.w r0, lr
	bne.w add_loop_768
	ldr.w r2, [r10, #1536]
	ldr.w r3, [r10, #1540]
	ldr.w r4, [r10, #1544]
	ldr.w r6, [r10, #2304]
	ldr.w r7, [r10, #2308]
	ldr.w r8, [r10, #2312]
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	and.w r12, r2, #0xF0F0F0F0 // top 4b < 16
	and.w r2, r2, #0x0F0F0F0F // bot 4b < 16
	add.w r2, r2, r12, LSR #4 // range < 31
	bic.w r12, r2, r11 // top 3b < 8
	and.w r2, r2, r11 // bot 2b < 4
	add.w r2, r2, r12, LSR #2 // range <=10
	bic.w r12, r2, r11 // top 3b < 3
	and.w r2, r2, r11 // bot 2b < 4
	add.w r2, r2, r12, LSR #2 // range <=5
	usub8.w r12, r2, r11 // >= 3 ?
	sel.w r2, r12, r2 // select
	and.w r12, r3, #0xF0F0F0F0 // top 4b < 16
	and.w r3, r3, #0x0F0F0F0F // bot 4b < 16
	add.w r3, r3, r12, LSR #4 // range < 31
	bic.w r12, r3, r11 // top 3b < 8
	and.w r3, r3, r11 // bot 2b < 4
	add.w r3, r3, r12, LSR #2 // range <=10
	bic.w r12, r3, r11 // top 3b < 3
	and.w r3, r3, r11 // bot 2b < 4
	add.w r3, r3, r12, LSR #2 // range <=5
	usub8.w r12, r3, r11 // >= 3 ?
	sel.w r3, r12, r3 // select
	and.w r12, r4, #0xF0F0F0F0 // top 4b < 16
	and.w r4, r4, #0x0F0F0F0F // bot 4b < 16
	add.w r4, r4, r12, LSR #4 // range < 31
	bic.w r12, r4, r11 // top 3b < 8
	and.w r4, r4, r11 // bot 2b < 4
	add.w r4, r4, r12, LSR #2 // range <=10
	bic.w r12, r4, r11 // top 3b < 3
	and.w r4, r4, r11 // bot 2b < 4
	add.w r4, r4, r12, LSR #2 // range <=5
	usub8.w r12, r4, r11 // >= 3 ?
	sel.w r4, r12, r4 // select
	str.w r3, [r1, #4]
	str.w r4, [r1, #8]
	str.w r2, [r1], #12
	ldr.w r6, [r10, #768]
	ldr.w r7, [r10, #772]
	ldr.w r8, [r10, #776]
	ldr.w r3, [r10, #4]
	ldr.w r4, [r10, #8]
	ldr.w r2, [r10], #12
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	and.w r12, r2, #0xF0F0F0F0 // top 4b < 16
	and.w r2, r2, #0x0F0F0F0F // bot 4b < 16
	add.w r2, r2, r12, LSR #4 // range < 31
	bic.w r12, r2, r11 // top 3b < 8
	and.w r2, r2, r11 // bot 2b < 4
	add.w r2, r2, r12, LSR #2 // range <=10
	bic.w r12, r2, r11 // top 3b < 3
	and.w r2, r2, r11 // bot 2b < 4
	add.w r2, r2, r12, LSR #2 // range <=5
	usub8.w r12, r2, r11 // >= 3 ?
	sel.w r2, r12, r2 // select
	and.w r12, r3, #0xF0F0F0F0 // top 4b < 16
	and.w r3, r3, #0x0F0F0F0F // bot 4b < 16
	add.w r3, r3, r12, LSR #4 // range < 31
	bic.w r12, r3, r11 // top 3b < 8
	and.w r3, r3, r11 // bot 2b < 4
	add.w r3, r3, r12, LSR #2 // range <=10
	bic.w r12, r3, r11 // top 3b < 3
	and.w r3, r3, r11 // bot 2b < 4
	add.w r3, r3, r12, LSR #2 // range <=5
	usub8.w r12, r3, r11 // >= 3 ?
	sel.w r3, r12, r3 // select
	and.w r12, r4, #0xF0F0F0F0 // top 4b < 16
	and.w r4, r4, #0x0F0F0F0F // bot 4b < 16
	add.w r4, r4, r12, LSR #4 // range < 31
	bic.w r12, r4, r11 // top 3b < 8
	and.w r4, r4, r11 // bot 2b < 4
	add.w r4, r4, r12, LSR #2 // range <=10
	bic.w r12, r4, r11 // top 3b < 3
	and.w r4, r4, r11 // bot 2b < 4
	add.w r4, r4, r12, LSR #2 // range <=5
	usub8.w r12, r4, r11 // >= 3 ?
	sel.w r4, r12, r4 // select
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r2, [r0], #12
	add.w sp, #3076
	pop.w {r3-r12,pc}
// void __update_fg_256x1024 (int *f, int*g, int *M1);
.p2align 2,,3
.syntax unified
.text
.global __update_fg_256x1024
.type __update_fg_256x1024, %function
__update_fg_256x1024:
	push.w {r3-r12,lr}
	ldr r11, =0x03030303
	vmov.w s0, s1, r0, r1
	vmov.w s2, r2
	movw.w r12, #4100
	sub.w sp, r12
	mov.w r0, sp
	movw.w lr, #0
	str.w lr, [r0], #1
	vmov.w r1, s2
	vmov.w r2, s0
	bl __polymul_256x1024_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #256
	bl __polymul_256x1024_jump_head
	vmov.w r1, s2
	vmov.w r2, s0
	add.w r1, #512
	sub.w r0, #1
	bl __polymul_256x1024_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #768
	bl __polymul_256x1024_jump_head
	mov.w r10, sp
	vmov.w r0, r1, s0, s1
	add.w r10, #4
	add.w lr, r0, #1008
add_loop_1024:
	ldr.w r2, [r10, #2048]
	ldr.w r3, [r10, #2052]
	ldr.w r4, [r10, #2056]
	ldr.w r5, [r10, #2060]
	ldr.w r6, [r10, #3072]
	ldr.w r7, [r10, #3076]
	ldr.w r8, [r10, #3080]
	ldr.w r9, [r10, #3084]
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	and.w r12, r2, #0xF0F0F0F0 // top 4b < 16
	and.w r2, r2, #0x0F0F0F0F // bot 4b < 16
	add.w r2, r2, r12, LSR #4 // range < 31
	bic.w r12, r2, r11 // top 3b < 8
	and.w r2, r2, r11 // bot 2b < 4
	add.w r2, r2, r12, LSR #2 // range <=10
	bic.w r12, r2, r11 // top 3b < 3
	and.w r2, r2, r11 // bot 2b < 4
	add.w r2, r2, r12, LSR #2 // range <=5
	usub8.w r12, r2, r11 // >= 3 ?
	sel.w r2, r12, r2 // select
	and.w r12, r3, #0xF0F0F0F0 // top 4b < 16
	and.w r3, r3, #0x0F0F0F0F // bot 4b < 16
	add.w r3, r3, r12, LSR #4 // range < 31
	bic.w r12, r3, r11 // top 3b < 8
	and.w r3, r3, r11 // bot 2b < 4
	add.w r3, r3, r12, LSR #2 // range <=10
	bic.w r12, r3, r11 // top 3b < 3
	and.w r3, r3, r11 // bot 2b < 4
	add.w r3, r3, r12, LSR #2 // range <=5
	usub8.w r12, r3, r11 // >= 3 ?
	sel.w r3, r12, r3 // select
	and.w r12, r4, #0xF0F0F0F0 // top 4b < 16
	and.w r4, r4, #0x0F0F0F0F // bot 4b < 16
	add.w r4, r4, r12, LSR #4 // range < 31
	bic.w r12, r4, r11 // top 3b < 8
	and.w r4, r4, r11 // bot 2b < 4
	add.w r4, r4, r12, LSR #2 // range <=10
	bic.w r12, r4, r11 // top 3b < 3
	and.w r4, r4, r11 // bot 2b < 4
	add.w r4, r4, r12, LSR #2 // range <=5
	usub8.w r12, r4, r11 // >= 3 ?
	sel.w r4, r12, r4 // select
	and.w r12, r5, #0xF0F0F0F0 // top 4b < 16
	and.w r5, r5, #0x0F0F0F0F // bot 4b < 16
	add.w r5, r5, r12, LSR #4 // range < 31
	bic.w r12, r5, r11 // top 3b < 8
	and.w r5, r5, r11 // bot 2b < 4
	add.w r5, r5, r12, LSR #2 // range <=10
	bic.w r12, r5, r11 // top 3b < 3
	and.w r5, r5, r11 // bot 2b < 4
	add.w r5, r5, r12, LSR #2 // range <=5
	usub8.w r12, r5, r11 // >= 3 ?
	sel.w r5, r12, r5 // select
	str.w r3, [r1, #4]
	str.w r4, [r1, #8]
	str.w r5, [r1, #12]
	str.w r2, [r1], #16
	ldr.w r6, [r10, #1024]
	ldr.w r7, [r10, #1028]
	ldr.w r8, [r10, #1032]
	ldr.w r9, [r10, #1036]
	ldr.w r3, [r10, #4]
	ldr.w r4, [r10, #8]
	ldr.w r5, [r10, #12]
	ldr.w r2, [r10], #16
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	add.w r5, r9
	and.w r12, r2, #0xF0F0F0F0 // top 4b < 16
	and.w r2, r2, #0x0F0F0F0F // bot 4b < 16
	add.w r2, r2, r12, LSR #4 // range < 31
	bic.w r12, r2, r11 // top 3b < 8
	and.w r2, r2, r11 // bot 2b < 4
	add.w r2, r2, r12, LSR #2 // range <=10
	bic.w r12, r2, r11 // top 3b < 3
	and.w r2, r2, r11 // bot 2b < 4
	add.w r2, r2, r12, LSR #2 // range <=5
	usub8.w r12, r2, r11 // >= 3 ?
	sel.w r2, r12, r2 // select
	and.w r12, r3, #0xF0F0F0F0 // top 4b < 16
	and.w r3, r3, #0x0F0F0F0F // bot 4b < 16
	add.w r3, r3, r12, LSR #4 // range < 31
	bic.w r12, r3, r11 // top 3b < 8
	and.w r3, r3, r11 // bot 2b < 4
	add.w r3, r3, r12, LSR #2 // range <=10
	bic.w r12, r3, r11 // top 3b < 3
	and.w r3, r3, r11 // bot 2b < 4
	add.w r3, r3, r12, LSR #2 // range <=5
	usub8.w r12, r3, r11 // >= 3 ?
	sel.w r3, r12, r3 // select
	and.w r12, r4, #0xF0F0F0F0 // top 4b < 16
	and.w r4, r4, #0x0F0F0F0F // bot 4b < 16
	add.w r4, r4, r12, LSR #4 // range < 31
	bic.w r12, r4, r11 // top 3b < 8
	and.w r4, r4, r11 // bot 2b < 4
	add.w r4, r4, r12, LSR #2 // range <=10
	bic.w r12, r4, r11 // top 3b < 3
	and.w r4, r4, r11 // bot 2b < 4
	add.w r4, r4, r12, LSR #2 // range <=5
	usub8.w r12, r4, r11 // >= 3 ?
	sel.w r4, r12, r4 // select
	and.w r12, r5, #0xF0F0F0F0 // top 4b < 16
	and.w r5, r5, #0x0F0F0F0F // bot 4b < 16
	add.w r5, r5, r12, LSR #4 // range < 31
	bic.w r12, r5, r11 // top 3b < 8
	and.w r5, r5, r11 // bot 2b < 4
	add.w r5, r5, r12, LSR #2 // range <=10
	bic.w r12, r5, r11 // top 3b < 3
	and.w r5, r5, r11 // bot 2b < 4
	add.w r5, r5, r12, LSR #2 // range <=5
	usub8.w r12, r5, r11 // >= 3 ?
	sel.w r5, r12, r5 // select
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r5, [r0, #12]
	str.w r2, [r0], #16
	cmp.w r0, lr
	bne.w add_loop_1024
	ldr.w r2, [r10, #2048]
	ldr.w r3, [r10, #2052]
	ldr.w r4, [r10, #2056]
	ldr.w r6, [r10, #3072]
	ldr.w r7, [r10, #3076]
	ldr.w r8, [r10, #3080]
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	and.w r12, r2, #0xF0F0F0F0 // top 4b < 16
	and.w r2, r2, #0x0F0F0F0F // bot 4b < 16
	add.w r2, r2, r12, LSR #4 // range < 31
	bic.w r12, r2, r11 // top 3b < 8
	and.w r2, r2, r11 // bot 2b < 4
	add.w r2, r2, r12, LSR #2 // range <=10
	bic.w r12, r2, r11 // top 3b < 3
	and.w r2, r2, r11 // bot 2b < 4
	add.w r2, r2, r12, LSR #2 // range <=5
	usub8.w r12, r2, r11 // >= 3 ?
	sel.w r2, r12, r2 // select
	and.w r12, r3, #0xF0F0F0F0 // top 4b < 16
	and.w r3, r3, #0x0F0F0F0F // bot 4b < 16
	add.w r3, r3, r12, LSR #4 // range < 31
	bic.w r12, r3, r11 // top 3b < 8
	and.w r3, r3, r11 // bot 2b < 4
	add.w r3, r3, r12, LSR #2 // range <=10
	bic.w r12, r3, r11 // top 3b < 3
	and.w r3, r3, r11 // bot 2b < 4
	add.w r3, r3, r12, LSR #2 // range <=5
	usub8.w r12, r3, r11 // >= 3 ?
	sel.w r3, r12, r3 // select
	and.w r12, r4, #0xF0F0F0F0 // top 4b < 16
	and.w r4, r4, #0x0F0F0F0F // bot 4b < 16
	add.w r4, r4, r12, LSR #4 // range < 31
	bic.w r12, r4, r11 // top 3b < 8
	and.w r4, r4, r11 // bot 2b < 4
	add.w r4, r4, r12, LSR #2 // range <=10
	bic.w r12, r4, r11 // top 3b < 3
	and.w r4, r4, r11 // bot 2b < 4
	add.w r4, r4, r12, LSR #2 // range <=5
	usub8.w r12, r4, r11 // >= 3 ?
	sel.w r4, r12, r4 // select
	str.w r3, [r1, #4]
	str.w r4, [r1, #8]
	str.w r2, [r1], #12
	ldr.w r6, [r10, #1024]
	ldr.w r7, [r10, #1028]
	ldr.w r8, [r10, #1032]
	ldr.w r3, [r10, #4]
	ldr.w r4, [r10, #8]
	ldr.w r2, [r10], #12
	add.w r2, r6
	add.w r3, r7
	add.w r4, r8
	and.w r12, r2, #0xF0F0F0F0 // top 4b < 16
	and.w r2, r2, #0x0F0F0F0F // bot 4b < 16
	add.w r2, r2, r12, LSR #4 // range < 31
	bic.w r12, r2, r11 // top 3b < 8
	and.w r2, r2, r11 // bot 2b < 4
	add.w r2, r2, r12, LSR #2 // range <=10
	bic.w r12, r2, r11 // top 3b < 3
	and.w r2, r2, r11 // bot 2b < 4
	add.w r2, r2, r12, LSR #2 // range <=5
	usub8.w r12, r2, r11 // >= 3 ?
	sel.w r2, r12, r2 // select
	and.w r12, r3, #0xF0F0F0F0 // top 4b < 16
	and.w r3, r3, #0x0F0F0F0F // bot 4b < 16
	add.w r3, r3, r12, LSR #4 // range < 31
	bic.w r12, r3, r11 // top 3b < 8
	and.w r3, r3, r11 // bot 2b < 4
	add.w r3, r3, r12, LSR #2 // range <=10
	bic.w r12, r3, r11 // top 3b < 3
	and.w r3, r3, r11 // bot 2b < 4
	add.w r3, r3, r12, LSR #2 // range <=5
	usub8.w r12, r3, r11 // >= 3 ?
	sel.w r3, r12, r3 // select
	and.w r12, r4, #0xF0F0F0F0 // top 4b < 16
	and.w r4, r4, #0x0F0F0F0F // bot 4b < 16
	add.w r4, r4, r12, LSR #4 // range < 31
	bic.w r12, r4, r11 // top 3b < 8
	and.w r4, r4, r11 // bot 2b < 4
	add.w r4, r4, r12, LSR #2 // range <=10
	bic.w r12, r4, r11 // top 3b < 3
	and.w r4, r4, r11 // bot 2b < 4
	add.w r4, r4, r12, LSR #2 // range <=5
	usub8.w r12, r4, r11 // >= 3 ?
	sel.w r4, r12, r4 // select
	str.w r3, [r0, #4]
	str.w r4, [r0, #8]
	str.w r2, [r0], #12
	movw.w r12, #4100
	add.w sp, r12
	pop.w {r3-r12,pc}
