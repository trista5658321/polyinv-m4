// void __update_fg_128x656 (int *f, int*g, int *M1);
.p2align 2,,3
.syntax unified
.text
.global __update_fg_128x656
.type __update_fg_128x656, %function
__update_fg_128x656:
	push.w {r3-r12,lr}
	ldr r11, =0x03030303
	vmov.w s0, s1, r0, r1
	vmov.w s2, r2
	sub.w sp, #2644
	mov.w r0, sp
	movw.w lr, #0
	str.w lr, [r0], #1
	vmov.w r1, s2
	vmov.w r2, s0
	bl __polymul_128x656_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #128
	bl __polymul_128x656_jump_head
	vmov.w r1, s2
	vmov.w r2, s0
	add.w r1, #256
	sub.w r0, #1
	bl __polymul_128x656_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #384
	bl __polymul_128x656_jump_head
	mov.w r10, sp
	vmov.w r0, r1, s0, s1
	add.w r10, #4
	add.w lr, r0, #656
add_loop_656:
	ldr.w r2, [r10, #1320]
	ldr.w r3, [r10, #1324]
	ldr.w r4, [r10, #1328]
	ldr.w r5, [r10, #1332]
	ldr.w r6, [r10, #1980]
	ldr.w r7, [r10, #1984]
	ldr.w r8, [r10, #1988]
	ldr.w r9, [r10, #1992]
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
	ldr.w r6, [r10, #660]
	ldr.w r7, [r10, #664]
	ldr.w r8, [r10, #668]
	ldr.w r9, [r10, #672]
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
	bne.w add_loop_656
	add.w sp, #2644
	pop.w {r3-r12,pc}
// void __update_fg_128x544 (int *f, int*g, int *M1);
.p2align 2,,3
.syntax unified
.text
.global __update_fg_128x544
.type __update_fg_128x544, %function
__update_fg_128x544:
	push.w {r3-r12,lr}
	ldr r11, =0x03030303
	vmov.w s0, s1, r0, r1
	vmov.w s2, r2
	sub.w sp, #2196
	mov.w r0, sp
	movw.w lr, #0
	str.w lr, [r0], #1
	vmov.w r1, s2
	vmov.w r2, s0
	bl __polymul_128x544_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #128
	bl __polymul_128x544_jump_head
	vmov.w r1, s2
	vmov.w r2, s0
	add.w r1, #256
	sub.w r0, #1
	bl __polymul_128x544_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #384
	bl __polymul_128x544_jump_head
	mov.w r10, sp
	vmov.w r0, r1, s0, s1
	add.w r10, #4
	add.w lr, r0, #544
add_loop_544:
	ldr.w r2, [r10, #1096]
	ldr.w r3, [r10, #1100]
	ldr.w r4, [r10, #1104]
	ldr.w r5, [r10, #1108]
	ldr.w r6, [r10, #1644]
	ldr.w r7, [r10, #1648]
	ldr.w r8, [r10, #1652]
	ldr.w r9, [r10, #1656]
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
	ldr.w r6, [r10, #548]
	ldr.w r7, [r10, #552]
	ldr.w r8, [r10, #556]
	ldr.w r9, [r10, #560]
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
	bne.w add_loop_544
	add.w sp, #2196
	pop.w {r3-r12,pc}
// void __update_fg_128x416 (int *f, int*g, int *M1);
.p2align 2,,3
.syntax unified
.text
.global __update_fg_128x416
.type __update_fg_128x416, %function
__update_fg_128x416:
	push.w {r3-r12,lr}
	ldr r11, =0x03030303
	vmov.w s0, s1, r0, r1
	vmov.w s2, r2
	sub.w sp, #1684
	mov.w r0, sp
	movw.w lr, #0
	str.w lr, [r0], #1
	vmov.w r1, s2
	vmov.w r2, s0
	bl __polymul_128x416_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #128
	bl __polymul_128x416_jump_head
	vmov.w r1, s2
	vmov.w r2, s0
	add.w r1, #256
	sub.w r0, #1
	bl __polymul_128x416_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #384
	bl __polymul_128x416_jump_head
	mov.w r10, sp
	vmov.w r0, r1, s0, s1
	add.w r10, #4
	add.w lr, r0, #416
add_loop_416:
	ldr.w r2, [r10, #840]
	ldr.w r3, [r10, #844]
	ldr.w r4, [r10, #848]
	ldr.w r5, [r10, #852]
	ldr.w r6, [r10, #1260]
	ldr.w r7, [r10, #1264]
	ldr.w r8, [r10, #1268]
	ldr.w r9, [r10, #1272]
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
	ldr.w r6, [r10, #420]
	ldr.w r7, [r10, #424]
	ldr.w r8, [r10, #428]
	ldr.w r9, [r10, #432]
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
	bne.w add_loop_416
	add.w sp, #1684
	pop.w {r3-r12,pc}
// void __update_fg_128x288 (int *f, int*g, int *M1);
.p2align 2,,3
.syntax unified
.text
.global __update_fg_128x288
.type __update_fg_128x288, %function
__update_fg_128x288:
	push.w {r3-r12,lr}
	ldr r11, =0x03030303
	vmov.w s0, s1, r0, r1
	vmov.w s2, r2
	sub.w sp, #1172
	mov.w r0, sp
	movw.w lr, #0
	str.w lr, [r0], #1
	vmov.w r1, s2
	vmov.w r2, s0
	bl __polymul_128x288_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #128
	bl __polymul_128x288_jump_head
	vmov.w r1, s2
	vmov.w r2, s0
	add.w r1, #256
	sub.w r0, #1
	bl __polymul_128x288_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #384
	bl __polymul_128x288_jump_head
	mov.w r10, sp
	vmov.w r0, r1, s0, s1
	add.w r10, #4
	add.w lr, r0, #288
add_loop_288:
	ldr.w r2, [r10, #584]
	ldr.w r3, [r10, #588]
	ldr.w r4, [r10, #592]
	ldr.w r5, [r10, #596]
	ldr.w r6, [r10, #876]
	ldr.w r7, [r10, #880]
	ldr.w r8, [r10, #884]
	ldr.w r9, [r10, #888]
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
	ldr.w r6, [r10, #292]
	ldr.w r7, [r10, #296]
	ldr.w r8, [r10, #300]
	ldr.w r9, [r10, #304]
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
	bne.w add_loop_288
	add.w sp, #1172
	pop.w {r3-r12,pc}
// void __update_fg_128x160 (int *f, int*g, int *M1);
.p2align 2,,3
.syntax unified
.text
.global __update_fg_128x160
.type __update_fg_128x160, %function
__update_fg_128x160:
	push.w {r3-r12,lr}
	ldr r11, =0x03030303
	vmov.w s0, s1, r0, r1
	vmov.w s2, r2
	sub.w sp, #660
	mov.w r0, sp
	movw.w lr, #0
	str.w lr, [r0], #1
	vmov.w r1, s2
	vmov.w r2, s0
	bl __polymul_128x160_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #128
	bl __polymul_128x160_jump_head
	vmov.w r1, s2
	vmov.w r2, s0
	add.w r1, #256
	sub.w r0, #1
	bl __polymul_128x160_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #384
	bl __polymul_128x160_jump_head
	mov.w r10, sp
	vmov.w r0, r1, s0, s1
	add.w r10, #4
	add.w lr, r0, #160
add_loop_160:
	ldr.w r2, [r10, #328]
	ldr.w r3, [r10, #332]
	ldr.w r4, [r10, #336]
	ldr.w r5, [r10, #340]
	ldr.w r6, [r10, #492]
	ldr.w r7, [r10, #496]
	ldr.w r8, [r10, #500]
	ldr.w r9, [r10, #504]
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
	ldr.w r6, [r10, #164]
	ldr.w r7, [r10, #168]
	ldr.w r8, [r10, #172]
	ldr.w r9, [r10, #176]
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
	bne.w add_loop_160
	add.w sp, #660
	pop.w {r3-r12,pc}
// void __update_fg_32x32 (int *f, int*g, int *M1);
.p2align 2,,3
.syntax unified
.text
.global __update_fg_32x32
.type __update_fg_32x32, %function
__update_fg_32x32:
	push.w {r3-r12,lr}
	ldr r11, =0x03030303
	vmov.w s0, s1, r0, r1
	vmov.w s2, r2
	sub.w sp, #148
	mov.w r0, sp
	movw.w lr, #0
	str.w lr, [r0], #1
	vmov.w r1, s2
	vmov.w r2, s0
	bl __polymul_32x32_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #32
	bl __polymul_32x32_jump_head
	vmov.w r1, s2
	vmov.w r2, s0
	add.w r1, #64
	sub.w r0, #1
	bl __polymul_32x32_jump_head
	vmov.w r1, s2
	vmov.w r2, s1
	add.w r1, #96
	bl __polymul_32x32_jump_head
	mov.w r10, sp
	vmov.w r0, r1, s0, s1
	add.w r10, #4
	add.w lr, r0, #32
add_loop_32:
	ldr.w r2, [r10, #72]
	ldr.w r3, [r10, #76]
	ldr.w r4, [r10, #80]
	ldr.w r5, [r10, #84]
	ldr.w r6, [r10, #108]
	ldr.w r7, [r10, #112]
	ldr.w r8, [r10, #116]
	ldr.w r9, [r10, #120]
	usub8.w r12, r2, r11 // >= 3 ?
	sel.w r2, r12, r2 // select
	usub8.w r12, r3, r11 // >= 3 ?
	sel.w r3, r12, r3 // select
	usub8.w r12, r4, r11 // >= 3 ?
	sel.w r4, r12, r4 // select
	usub8.w r12, r5, r11 // >= 3 ?
	sel.w r5, r12, r5 // select
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
	ldr.w r6, [r10, #36]
	ldr.w r7, [r10, #40]
	ldr.w r8, [r10, #44]
	ldr.w r9, [r10, #48]
	ldr.w r3, [r10, #4]
	ldr.w r4, [r10, #8]
	ldr.w r5, [r10, #12]
	ldr.w r2, [r10], #16
	usub8.w r12, r2, r11 // >= 3 ?
	sel.w r2, r12, r2 // select
	usub8.w r12, r3, r11 // >= 3 ?
	sel.w r3, r12, r3 // select
	usub8.w r12, r4, r11 // >= 3 ?
	sel.w r4, r12, r4 // select
	usub8.w r12, r5, r11 // >= 3 ?
	sel.w r5, r12, r5 // select
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
	bne.w add_loop_32
	add.w sp, #148
	pop.w {r3-r12,pc}
