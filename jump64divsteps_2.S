.p2align 2,,3
.syntax	unified
.text
__polymul_32x32:
	push.w {lr}
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #8
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #8
	smulbb.w r7, r3, r5
	smulbb.w r9, r3, r6
	smuadx.w r8, r3, r5
	smuadx.w r10, r3, r6
	smuadx.w r12, r4, r6
	smultt.w r11, r4, r5
	smultt.w lr, r4, r6
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w r9, r3, r5, r9
	smlad.w r11, r3, r6, r11
	vmov.w s3, r5
	vmov.w r4, s2
	movw.w r3, #4591
	smmulr.w r5, r4, r7
	mls.w r7, r3, r5, r7
	smmulr.w r5, r4, r8
	mls.w r8, r3, r5, r8
	pkhbt.w r7, r7, r8, lsl #16
	smmulr.w r5, r4, r9
	mls.w r9, r3, r5, r9
	smmulr.w r5, r4, r10
	mls.w r10, r3, r5, r10
	pkhbt.w r8, r9, r10, lsl #16
	vmov.w r5, s3
	str.w r7, [r0, #0]
	str.w r8, [r0, #4]
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #-4
	smlabb.w r11, r3, r5, r11
	smlabb.w lr, r3, r6, lr
	smladx.w r12, r3, r5, r12
	smuadx.w r10, r3, r6
	smuadx.w r8, r4, r6
	smultt.w r7, r4, r5
	smultt.w r9, r4, r6
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w lr, r3, r5, lr
	smlad.w r7, r3, r6, r7
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #8
	ldr.w r3, [r1, #-4]
	ldr.w r4, [r1], #4
	smlabb.w r11, r3, r5, r11
	smlabb.w lr, r3, r6, lr
	smladx.w r12, r3, r5, r12
	smladx.w r10, r3, r6, r10
	smladx.w r8, r4, r6, r8
	smlatt.w r7, r4, r5, r7
	smlatt.w r9, r4, r6, r9
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w lr, r3, r5, lr
	smlad.w r7, r3, r6, r7
	vmov.w r6, s2
	movw.w r5, #4591
	smmulr.w r3, r6, r11
	mls.w r11, r5, r3, r11
	smmulr.w r3, r6, r12
	mls.w r12, r5, r3, r12
	pkhbt.w r11, r11, r12, lsl #16
	smmulr.w r3, r6, lr
	mls.w lr, r5, r3, lr
	smmulr.w r3, r6, r10
	mls.w r10, r5, r3, r10
	pkhbt.w r12, lr, r10, lsl #16
	ldr.w r3, [r1, #-8]
	str.w r11, [r0, #8]
	str.w r12, [r0, #12]
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #-4
	smlabb.w r7, r3, r5, r7
	smlabb.w r9, r3, r6, r9
	smladx.w r8, r3, r5, r8
	smuadx.w r10, r3, r6
	smuadx.w r12, r4, r6
	smultt.w r11, r4, r5
	smultt.w lr, r4, r6
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w r9, r3, r5, r9
	smlad.w r11, r3, r6, r11
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #8
	ldr.w r5, [r2, #-4]
	ldr.w r6, [r2], #-8
	smlabb.w r7, r3, r5, r7
	smlabb.w r9, r3, r6, r9
	smladx.w r8, r3, r5, r8
	smladx.w r10, r3, r6, r10
	smladx.w r12, r4, r6, r12
	smlatt.w r11, r4, r5, r11
	smlatt.w lr, r4, r6, lr
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w r9, r3, r5, r9
	smlad.w r11, r3, r6, r11
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #8
	ldr.w r5, [r2, #-4]
	ldr.w r6, [r2], #4
	smlabb.w r7, r3, r5, r7
	smlabb.w r9, r3, r6, r9
	smladx.w r8, r3, r5, r8
	smladx.w r10, r3, r6, r10
	smladx.w r12, r4, r6, r12
	smlatt.w r11, r4, r5, r11
	smlatt.w lr, r4, r6, lr
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w r9, r3, r5, r9
	smlad.w r11, r3, r6, r11
	vmov.w s3, r5
	vmov.w r4, s2
	movw.w r3, #4591
	smmulr.w r5, r4, r7
	mls.w r7, r3, r5, r7
	smmulr.w r5, r4, r8
	mls.w r8, r3, r5, r8
	pkhbt.w r7, r7, r8, lsl #16
	smmulr.w r5, r4, r9
	mls.w r9, r3, r5, r9
	smmulr.w r5, r4, r10
	mls.w r10, r3, r5, r10
	pkhbt.w r8, r9, r10, lsl #16
	vmov.w r5, s3
	str.w r7, [r0, #16]
	str.w r8, [r0, #20]
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #-4
	smlabb.w r11, r3, r5, r11
	smlabb.w lr, r3, r6, lr
	smladx.w r12, r3, r5, r12
	smuadx.w r10, r3, r6
	smuadx.w r8, r4, r6
	smultt.w r7, r4, r5
	smultt.w r9, r4, r6
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w lr, r3, r5, lr
	smlad.w r7, r3, r6, r7
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #8
	ldr.w r3, [r1, #-4]
	ldr.w r4, [r1], #-8
	smlabb.w r11, r3, r5, r11
	smlabb.w lr, r3, r6, lr
	smladx.w r12, r3, r5, r12
	smladx.w r10, r3, r6, r10
	smladx.w r8, r4, r6, r8
	smlatt.w r7, r4, r5, r7
	smlatt.w r9, r4, r6, r9
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w lr, r3, r5, lr
	smlad.w r7, r3, r6, r7
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #8
	ldr.w r3, [r1, #-4]
	ldr.w r4, [r1], #-8
	smlabb.w r11, r3, r5, r11
	smlabb.w lr, r3, r6, lr
	smladx.w r12, r3, r5, r12
	smladx.w r10, r3, r6, r10
	smladx.w r8, r4, r6, r8
	smlatt.w r7, r4, r5, r7
	smlatt.w r9, r4, r6, r9
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w lr, r3, r5, lr
	smlad.w r7, r3, r6, r7
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #8
	ldr.w r3, [r1, #-4]
	ldr.w r4, [r1], #4
	smlabb.w r11, r3, r5, r11
	smlabb.w lr, r3, r6, lr
	smladx.w r12, r3, r5, r12
	smladx.w r10, r3, r6, r10
	smladx.w r8, r4, r6, r8
	smlatt.w r7, r4, r5, r7
	smlatt.w r9, r4, r6, r9
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w lr, r3, r5, lr
	smlad.w r7, r3, r6, r7
	vmov.w r6, s2
	movw.w r5, #4591
	smmulr.w r3, r6, r11
	mls.w r11, r5, r3, r11
	smmulr.w r3, r6, r12
	mls.w r12, r5, r3, r12
	pkhbt.w r11, r11, r12, lsl #16
	smmulr.w r3, r6, lr
	mls.w lr, r5, r3, lr
	smmulr.w r3, r6, r10
	mls.w r10, r5, r3, r10
	pkhbt.w r12, lr, r10, lsl #16
	ldr.w r3, [r1, #-8]
	str.w r11, [r0, #24]
	str.w r12, [r0, #28]
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #-4
	smlabb.w r7, r3, r5, r7
	smlabb.w r9, r3, r6, r9
	smladx.w r8, r3, r5, r8
	smuadx.w r10, r3, r6
	smuadx.w r12, r4, r6
	smultt.w r11, r4, r5
	smultt.w lr, r4, r6
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w r9, r3, r5, r9
	smlad.w r11, r3, r6, r11
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #8
	ldr.w r5, [r2, #-4]
	ldr.w r6, [r2], #-8
	smlabb.w r7, r3, r5, r7
	smlabb.w r9, r3, r6, r9
	smladx.w r8, r3, r5, r8
	smladx.w r10, r3, r6, r10
	smladx.w r12, r4, r6, r12
	smlatt.w r11, r4, r5, r11
	smlatt.w lr, r4, r6, lr
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w r9, r3, r5, r9
	smlad.w r11, r3, r6, r11
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #8
	ldr.w r5, [r2, #-4]
	ldr.w r6, [r2], #-8
	smlabb.w r7, r3, r5, r7
	smlabb.w r9, r3, r6, r9
	smladx.w r8, r3, r5, r8
	smladx.w r10, r3, r6, r10
	smladx.w r12, r4, r6, r12
	smlatt.w r11, r4, r5, r11
	smlatt.w lr, r4, r6, lr
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w r9, r3, r5, r9
	smlad.w r11, r3, r6, r11
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #8
	ldr.w r5, [r2, #-4]
	ldr.w r6, [r2], #-8
	smlabb.w r7, r3, r5, r7
	smlabb.w r9, r3, r6, r9
	smladx.w r8, r3, r5, r8
	smladx.w r10, r3, r6, r10
	smladx.w r12, r4, r6, r12
	smlatt.w r11, r4, r5, r11
	smlatt.w lr, r4, r6, lr
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w r9, r3, r5, r9
	smlad.w r11, r3, r6, r11
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #8
	ldr.w r5, [r2, #-4]
	ldr.w r6, [r2], #4
	smlabb.w r7, r3, r5, r7
	smlabb.w r9, r3, r6, r9
	smladx.w r8, r3, r5, r8
	smladx.w r10, r3, r6, r10
	smladx.w r12, r4, r6, r12
	smlatt.w r11, r4, r5, r11
	smlatt.w lr, r4, r6, lr
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w r9, r3, r5, r9
	smlad.w r11, r3, r6, r11
	vmov.w s3, r5
	vmov.w r4, s2
	movw.w r3, #4591
	smmulr.w r5, r4, r7
	mls.w r7, r3, r5, r7
	smmulr.w r5, r4, r8
	mls.w r8, r3, r5, r8
	pkhbt.w r7, r7, r8, lsl #16
	smmulr.w r5, r4, r9
	mls.w r9, r3, r5, r9
	smmulr.w r5, r4, r10
	mls.w r10, r3, r5, r10
	pkhbt.w r8, r9, r10, lsl #16
	vmov.w r5, s3
	str.w r7, [r0, #32]
	str.w r8, [r0, #36]
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #-4
	smlabb.w r11, r3, r5, r11
	smlabb.w lr, r3, r6, lr
	smladx.w r12, r3, r5, r12
	smuadx.w r10, r3, r6
	smuadx.w r8, r4, r6
	smultt.w r7, r4, r5
	smultt.w r9, r4, r6
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w lr, r3, r5, lr
	smlad.w r7, r3, r6, r7
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #8
	ldr.w r3, [r1, #-4]
	ldr.w r4, [r1], #-8
	smlabb.w r11, r3, r5, r11
	smlabb.w lr, r3, r6, lr
	smladx.w r12, r3, r5, r12
	smladx.w r10, r3, r6, r10
	smladx.w r8, r4, r6, r8
	smlatt.w r7, r4, r5, r7
	smlatt.w r9, r4, r6, r9
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w lr, r3, r5, lr
	smlad.w r7, r3, r6, r7
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #8
	ldr.w r3, [r1, #-4]
	ldr.w r4, [r1], #-8
	smlabb.w r11, r3, r5, r11
	smlabb.w lr, r3, r6, lr
	smladx.w r12, r3, r5, r12
	smladx.w r10, r3, r6, r10
	smladx.w r8, r4, r6, r8
	smlatt.w r7, r4, r5, r7
	smlatt.w r9, r4, r6, r9
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w lr, r3, r5, lr
	smlad.w r7, r3, r6, r7
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #8
	ldr.w r3, [r1, #-4]
	ldr.w r4, [r1], #-8
	smlabb.w r11, r3, r5, r11
	smlabb.w lr, r3, r6, lr
	smladx.w r12, r3, r5, r12
	smladx.w r10, r3, r6, r10
	smladx.w r8, r4, r6, r8
	smlatt.w r7, r4, r5, r7
	smlatt.w r9, r4, r6, r9
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w lr, r3, r5, lr
	smlad.w r7, r3, r6, r7
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #8
	ldr.w r3, [r1, #-4]
	ldr.w r4, [r1], #-8
	smlabb.w r11, r3, r5, r11
	smlabb.w lr, r3, r6, lr
	smladx.w r12, r3, r5, r12
	smladx.w r10, r3, r6, r10
	smladx.w r8, r4, r6, r8
	smlatt.w r7, r4, r5, r7
	smlatt.w r9, r4, r6, r9
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w lr, r3, r5, lr
	smlad.w r7, r3, r6, r7
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #8
	ldr.w r3, [r1, #-4]
	ldr.w r4, [r1], #4
	smlabb.w r11, r3, r5, r11
	smlabb.w lr, r3, r6, lr
	smladx.w r12, r3, r5, r12
	smladx.w r10, r3, r6, r10
	smladx.w r8, r4, r6, r8
	smlatt.w r7, r4, r5, r7
	smlatt.w r9, r4, r6, r9
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w lr, r3, r5, lr
	smlad.w r7, r3, r6, r7
	vmov.w r6, s2
	movw.w r5, #4591
	smmulr.w r3, r6, r11
	mls.w r11, r5, r3, r11
	smmulr.w r3, r6, r12
	mls.w r12, r5, r3, r12
	pkhbt.w r11, r11, r12, lsl #16
	smmulr.w r3, r6, lr
	mls.w lr, r5, r3, lr
	smmulr.w r3, r6, r10
	mls.w r10, r5, r3, r10
	pkhbt.w r12, lr, r10, lsl #16
	ldr.w r3, [r1, #-8]
	str.w r11, [r0, #40]
	str.w r12, [r0, #44]
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #-4
	smlabb.w r7, r3, r5, r7
	smlabb.w r9, r3, r6, r9
	smladx.w r8, r3, r5, r8
	smuadx.w r10, r3, r6
	smuadx.w r12, r4, r6
	smultt.w r11, r4, r5
	smultt.w lr, r4, r6
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w r9, r3, r5, r9
	smlad.w r11, r3, r6, r11
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #8
	ldr.w r5, [r2, #-4]
	ldr.w r6, [r2], #-8
	smlabb.w r7, r3, r5, r7
	smlabb.w r9, r3, r6, r9
	smladx.w r8, r3, r5, r8
	smladx.w r10, r3, r6, r10
	smladx.w r12, r4, r6, r12
	smlatt.w r11, r4, r5, r11
	smlatt.w lr, r4, r6, lr
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w r9, r3, r5, r9
	smlad.w r11, r3, r6, r11
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #8
	ldr.w r5, [r2, #-4]
	ldr.w r6, [r2], #-8
	smlabb.w r7, r3, r5, r7
	smlabb.w r9, r3, r6, r9
	smladx.w r8, r3, r5, r8
	smladx.w r10, r3, r6, r10
	smladx.w r12, r4, r6, r12
	smlatt.w r11, r4, r5, r11
	smlatt.w lr, r4, r6, lr
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w r9, r3, r5, r9
	smlad.w r11, r3, r6, r11
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #8
	ldr.w r5, [r2, #-4]
	ldr.w r6, [r2], #-8
	smlabb.w r7, r3, r5, r7
	smlabb.w r9, r3, r6, r9
	smladx.w r8, r3, r5, r8
	smladx.w r10, r3, r6, r10
	smladx.w r12, r4, r6, r12
	smlatt.w r11, r4, r5, r11
	smlatt.w lr, r4, r6, lr
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w r9, r3, r5, r9
	smlad.w r11, r3, r6, r11
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #8
	ldr.w r5, [r2, #-4]
	ldr.w r6, [r2], #-8
	smlabb.w r7, r3, r5, r7
	smlabb.w r9, r3, r6, r9
	smladx.w r8, r3, r5, r8
	smladx.w r10, r3, r6, r10
	smladx.w r12, r4, r6, r12
	smlatt.w r11, r4, r5, r11
	smlatt.w lr, r4, r6, lr
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w r9, r3, r5, r9
	smlad.w r11, r3, r6, r11
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #8
	ldr.w r5, [r2, #-4]
	ldr.w r6, [r2], #-8
	smlabb.w r7, r3, r5, r7
	smlabb.w r9, r3, r6, r9
	smladx.w r8, r3, r5, r8
	smladx.w r10, r3, r6, r10
	smladx.w r12, r4, r6, r12
	smlatt.w r11, r4, r5, r11
	smlatt.w lr, r4, r6, lr
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w r9, r3, r5, r9
	smlad.w r11, r3, r6, r11
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #8
	ldr.w r5, [r2, #-4]
	ldr.w r6, [r2], #4
	smlabb.w r7, r3, r5, r7
	smlabb.w r9, r3, r6, r9
	smladx.w r8, r3, r5, r8
	smladx.w r10, r3, r6, r10
	smladx.w r12, r4, r6, r12
	smlatt.w r11, r4, r5, r11
	smlatt.w lr, r4, r6, lr
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w r9, r3, r5, r9
	smlad.w r11, r3, r6, r11
	vmov.w s3, r5
	vmov.w r4, s2
	movw.w r3, #4591
	smmulr.w r5, r4, r7
	mls.w r7, r3, r5, r7
	smmulr.w r5, r4, r8
	mls.w r8, r3, r5, r8
	pkhbt.w r7, r7, r8, lsl #16
	smmulr.w r5, r4, r9
	mls.w r9, r3, r5, r9
	smmulr.w r5, r4, r10
	mls.w r10, r3, r5, r10
	pkhbt.w r8, r9, r10, lsl #16
	vmov.w r5, s3
	str.w r7, [r0, #48]
	str.w r8, [r0, #52]
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #-4
	smlabb.w r11, r3, r5, r11
	smlabb.w lr, r3, r6, lr
	smladx.w r12, r3, r5, r12
	smuadx.w r10, r3, r6
	smuadx.w r8, r4, r6
	smultt.w r7, r4, r5
	smultt.w r9, r4, r6
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w lr, r3, r5, lr
	smlad.w r7, r3, r6, r7
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #8
	ldr.w r3, [r1, #-4]
	ldr.w r4, [r1], #-8
	smlabb.w r11, r3, r5, r11
	smlabb.w lr, r3, r6, lr
	smladx.w r12, r3, r5, r12
	smladx.w r10, r3, r6, r10
	smladx.w r8, r4, r6, r8
	smlatt.w r7, r4, r5, r7
	smlatt.w r9, r4, r6, r9
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w lr, r3, r5, lr
	smlad.w r7, r3, r6, r7
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #8
	ldr.w r3, [r1, #-4]
	ldr.w r4, [r1], #-8
	smlabb.w r11, r3, r5, r11
	smlabb.w lr, r3, r6, lr
	smladx.w r12, r3, r5, r12
	smladx.w r10, r3, r6, r10
	smladx.w r8, r4, r6, r8
	smlatt.w r7, r4, r5, r7
	smlatt.w r9, r4, r6, r9
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w lr, r3, r5, lr
	smlad.w r7, r3, r6, r7
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #8
	ldr.w r3, [r1, #-4]
	ldr.w r4, [r1], #-8
	smlabb.w r11, r3, r5, r11
	smlabb.w lr, r3, r6, lr
	smladx.w r12, r3, r5, r12
	smladx.w r10, r3, r6, r10
	smladx.w r8, r4, r6, r8
	smlatt.w r7, r4, r5, r7
	smlatt.w r9, r4, r6, r9
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w lr, r3, r5, lr
	smlad.w r7, r3, r6, r7
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #8
	ldr.w r3, [r1, #-4]
	ldr.w r4, [r1], #-8
	smlabb.w r11, r3, r5, r11
	smlabb.w lr, r3, r6, lr
	smladx.w r12, r3, r5, r12
	smladx.w r10, r3, r6, r10
	smladx.w r8, r4, r6, r8
	smlatt.w r7, r4, r5, r7
	smlatt.w r9, r4, r6, r9
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w lr, r3, r5, lr
	smlad.w r7, r3, r6, r7
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #8
	ldr.w r3, [r1, #-4]
	ldr.w r4, [r1], #-8
	smlabb.w r11, r3, r5, r11
	smlabb.w lr, r3, r6, lr
	smladx.w r12, r3, r5, r12
	smladx.w r10, r3, r6, r10
	smladx.w r8, r4, r6, r8
	smlatt.w r7, r4, r5, r7
	smlatt.w r9, r4, r6, r9
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w lr, r3, r5, lr
	smlad.w r7, r3, r6, r7
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #8
	ldr.w r3, [r1, #-4]
	ldr.w r4, [r1], #-8
	smlabb.w r11, r3, r5, r11
	smlabb.w lr, r3, r6, lr
	smladx.w r12, r3, r5, r12
	smladx.w r10, r3, r6, r10
	smladx.w r8, r4, r6, r8
	smlatt.w r7, r4, r5, r7
	smlatt.w r9, r4, r6, r9
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w lr, r3, r5, lr
	smlad.w r7, r3, r6, r7
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #-4
	ldr.w r3, [r1, #-4]
	ldr.w r4, [r1], #4
	smlabb.w r11, r3, r5, r11
	smlabb.w lr, r3, r6, lr
	smladx.w r12, r3, r5, r12
	smladx.w r10, r3, r6, r10
	smladx.w r8, r4, r6, r8
	smlatt.w r7, r4, r5, r7
	smlatt.w r9, r4, r6, r9
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w lr, r3, r5, lr
	smlad.w r7, r3, r6, r7
	vmov.w s3, r5
	vmov.w r4, s2
	movw.w r3, #4591
	smmulr.w r5, r4, r11
	mls.w r11, r3, r5, r11
	smmulr.w r5, r4, r12
	mls.w r12, r3, r5, r12
	pkhbt.w r11, r11, r12, lsl #16
	smmulr.w r5, r4, lr
	mls.w lr, r3, r5, lr
	smmulr.w r5, r4, r10
	mls.w r10, r3, r5, r10
	pkhbt.w r12, lr, r10, lsl #16
	vmov.w r5, s3
	str.w r11, [r0, #56]
	str.w r12, [r0, #60]
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #8
	smlabb.w r7, r3, r5, r7
	smlabb.w r9, r3, r6, r9
	smladx.w r8, r3, r5, r8
	smuadx.w r10, r3, r6
	smuadx.w r12, r4, r6
	smultt.w r11, r4, r5
	smultt.w lr, r4, r6
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w r9, r3, r5, r9
	smlad.w r11, r3, r6, r11
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #8
	ldr.w r5, [r2, #-4]
	ldr.w r6, [r2], #-8
	smlabb.w r7, r3, r5, r7
	smlabb.w r9, r3, r6, r9
	smladx.w r8, r3, r5, r8
	smladx.w r10, r3, r6, r10
	smladx.w r12, r4, r6, r12
	smlatt.w r11, r4, r5, r11
	smlatt.w lr, r4, r6, lr
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w r9, r3, r5, r9
	smlad.w r11, r3, r6, r11
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #8
	ldr.w r5, [r2, #-4]
	ldr.w r6, [r2], #-8
	smlabb.w r7, r3, r5, r7
	smlabb.w r9, r3, r6, r9
	smladx.w r8, r3, r5, r8
	smladx.w r10, r3, r6, r10
	smladx.w r12, r4, r6, r12
	smlatt.w r11, r4, r5, r11
	smlatt.w lr, r4, r6, lr
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w r9, r3, r5, r9
	smlad.w r11, r3, r6, r11
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #8
	ldr.w r5, [r2, #-4]
	ldr.w r6, [r2], #-8
	smlabb.w r7, r3, r5, r7
	smlabb.w r9, r3, r6, r9
	smladx.w r8, r3, r5, r8
	smladx.w r10, r3, r6, r10
	smladx.w r12, r4, r6, r12
	smlatt.w r11, r4, r5, r11
	smlatt.w lr, r4, r6, lr
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w r9, r3, r5, r9
	smlad.w r11, r3, r6, r11
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #8
	ldr.w r5, [r2, #-4]
	ldr.w r6, [r2], #-8
	smlabb.w r7, r3, r5, r7
	smlabb.w r9, r3, r6, r9
	smladx.w r8, r3, r5, r8
	smladx.w r10, r3, r6, r10
	smladx.w r12, r4, r6, r12
	smlatt.w r11, r4, r5, r11
	smlatt.w lr, r4, r6, lr
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w r9, r3, r5, r9
	smlad.w r11, r3, r6, r11
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #8
	ldr.w r5, [r2, #-4]
	ldr.w r6, [r2], #-8
	smlabb.w r7, r3, r5, r7
	smlabb.w r9, r3, r6, r9
	smladx.w r8, r3, r5, r8
	smladx.w r10, r3, r6, r10
	smladx.w r12, r4, r6, r12
	smlatt.w r11, r4, r5, r11
	smlatt.w lr, r4, r6, lr
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w r9, r3, r5, r9
	smlad.w r11, r3, r6, r11
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #-4
	ldr.w r5, [r2, #-4]
	ldr.w r6, [r2], #4
	smlabb.w r7, r3, r5, r7
	smlabb.w r9, r3, r6, r9
	smladx.w r8, r3, r5, r8
	smladx.w r10, r3, r6, r10
	smladx.w r12, r4, r6, r12
	smlatt.w r11, r4, r5, r11
	smlatt.w lr, r4, r6, lr
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w r9, r3, r5, r9
	smlad.w r11, r3, r6, r11
	vmov.w r6, s2
	movw.w r5, #4591
	smmulr.w r3, r6, r7
	mls.w r7, r5, r3, r7
	smmulr.w r3, r6, r8
	mls.w r8, r5, r3, r8
	pkhbt.w r7, r7, r8, lsl #16
	smmulr.w r3, r6, r9
	mls.w r9, r5, r3, r9
	smmulr.w r3, r6, r10
	mls.w r10, r5, r3, r10
	pkhbt.w r8, r9, r10, lsl #16
	ldr.w r3, [r1, #4]
	str.w r7, [r0, #64]
	str.w r8, [r0, #68]
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #8
	smlabb.w r11, r3, r5, r11
	smlabb.w lr, r3, r6, lr
	smladx.w r12, r3, r5, r12
	smuadx.w r10, r3, r6
	smuadx.w r8, r4, r6
	smultt.w r7, r4, r5
	smultt.w r9, r4, r6
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w lr, r3, r5, lr
	smlad.w r7, r3, r6, r7
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #8
	ldr.w r3, [r1, #-4]
	ldr.w r4, [r1], #-8
	smlabb.w r11, r3, r5, r11
	smlabb.w lr, r3, r6, lr
	smladx.w r12, r3, r5, r12
	smladx.w r10, r3, r6, r10
	smladx.w r8, r4, r6, r8
	smlatt.w r7, r4, r5, r7
	smlatt.w r9, r4, r6, r9
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w lr, r3, r5, lr
	smlad.w r7, r3, r6, r7
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #8
	ldr.w r3, [r1, #-4]
	ldr.w r4, [r1], #-8
	smlabb.w r11, r3, r5, r11
	smlabb.w lr, r3, r6, lr
	smladx.w r12, r3, r5, r12
	smladx.w r10, r3, r6, r10
	smladx.w r8, r4, r6, r8
	smlatt.w r7, r4, r5, r7
	smlatt.w r9, r4, r6, r9
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w lr, r3, r5, lr
	smlad.w r7, r3, r6, r7
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #8
	ldr.w r3, [r1, #-4]
	ldr.w r4, [r1], #-8
	smlabb.w r11, r3, r5, r11
	smlabb.w lr, r3, r6, lr
	smladx.w r12, r3, r5, r12
	smladx.w r10, r3, r6, r10
	smladx.w r8, r4, r6, r8
	smlatt.w r7, r4, r5, r7
	smlatt.w r9, r4, r6, r9
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w lr, r3, r5, lr
	smlad.w r7, r3, r6, r7
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #8
	ldr.w r3, [r1, #-4]
	ldr.w r4, [r1], #-8
	smlabb.w r11, r3, r5, r11
	smlabb.w lr, r3, r6, lr
	smladx.w r12, r3, r5, r12
	smladx.w r10, r3, r6, r10
	smladx.w r8, r4, r6, r8
	smlatt.w r7, r4, r5, r7
	smlatt.w r9, r4, r6, r9
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w lr, r3, r5, lr
	smlad.w r7, r3, r6, r7
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #-4
	ldr.w r3, [r1, #-4]
	ldr.w r4, [r1], #4
	smlabb.w r11, r3, r5, r11
	smlabb.w lr, r3, r6, lr
	smladx.w r12, r3, r5, r12
	smladx.w r10, r3, r6, r10
	smladx.w r8, r4, r6, r8
	smlatt.w r7, r4, r5, r7
	smlatt.w r9, r4, r6, r9
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w lr, r3, r5, lr
	smlad.w r7, r3, r6, r7
	vmov.w s3, r5
	vmov.w r4, s2
	movw.w r3, #4591
	smmulr.w r5, r4, r11
	mls.w r11, r3, r5, r11
	smmulr.w r5, r4, r12
	mls.w r12, r3, r5, r12
	pkhbt.w r11, r11, r12, lsl #16
	smmulr.w r5, r4, lr
	mls.w lr, r3, r5, lr
	smmulr.w r5, r4, r10
	mls.w r10, r3, r5, r10
	pkhbt.w r12, lr, r10, lsl #16
	vmov.w r5, s3
	str.w r11, [r0, #72]
	str.w r12, [r0, #76]
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #8
	smlabb.w r7, r3, r5, r7
	smlabb.w r9, r3, r6, r9
	smladx.w r8, r3, r5, r8
	smuadx.w r10, r3, r6
	smuadx.w r12, r4, r6
	smultt.w r11, r4, r5
	smultt.w lr, r4, r6
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w r9, r3, r5, r9
	smlad.w r11, r3, r6, r11
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #8
	ldr.w r5, [r2, #-4]
	ldr.w r6, [r2], #-8
	smlabb.w r7, r3, r5, r7
	smlabb.w r9, r3, r6, r9
	smladx.w r8, r3, r5, r8
	smladx.w r10, r3, r6, r10
	smladx.w r12, r4, r6, r12
	smlatt.w r11, r4, r5, r11
	smlatt.w lr, r4, r6, lr
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w r9, r3, r5, r9
	smlad.w r11, r3, r6, r11
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #8
	ldr.w r5, [r2, #-4]
	ldr.w r6, [r2], #-8
	smlabb.w r7, r3, r5, r7
	smlabb.w r9, r3, r6, r9
	smladx.w r8, r3, r5, r8
	smladx.w r10, r3, r6, r10
	smladx.w r12, r4, r6, r12
	smlatt.w r11, r4, r5, r11
	smlatt.w lr, r4, r6, lr
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w r9, r3, r5, r9
	smlad.w r11, r3, r6, r11
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #8
	ldr.w r5, [r2, #-4]
	ldr.w r6, [r2], #-8
	smlabb.w r7, r3, r5, r7
	smlabb.w r9, r3, r6, r9
	smladx.w r8, r3, r5, r8
	smladx.w r10, r3, r6, r10
	smladx.w r12, r4, r6, r12
	smlatt.w r11, r4, r5, r11
	smlatt.w lr, r4, r6, lr
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w r9, r3, r5, r9
	smlad.w r11, r3, r6, r11
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #-4
	ldr.w r5, [r2, #-4]
	ldr.w r6, [r2], #4
	smlabb.w r7, r3, r5, r7
	smlabb.w r9, r3, r6, r9
	smladx.w r8, r3, r5, r8
	smladx.w r10, r3, r6, r10
	smladx.w r12, r4, r6, r12
	smlatt.w r11, r4, r5, r11
	smlatt.w lr, r4, r6, lr
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w r9, r3, r5, r9
	smlad.w r11, r3, r6, r11
	vmov.w r6, s2
	movw.w r5, #4591
	smmulr.w r3, r6, r7
	mls.w r7, r5, r3, r7
	smmulr.w r3, r6, r8
	mls.w r8, r5, r3, r8
	pkhbt.w r7, r7, r8, lsl #16
	smmulr.w r3, r6, r9
	mls.w r9, r5, r3, r9
	smmulr.w r3, r6, r10
	mls.w r10, r5, r3, r10
	pkhbt.w r8, r9, r10, lsl #16
	ldr.w r3, [r1, #4]
	str.w r7, [r0, #80]
	str.w r8, [r0, #84]
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #8
	smlabb.w r11, r3, r5, r11
	smlabb.w lr, r3, r6, lr
	smladx.w r12, r3, r5, r12
	smuadx.w r10, r3, r6
	smuadx.w r8, r4, r6
	smultt.w r7, r4, r5
	smultt.w r9, r4, r6
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w lr, r3, r5, lr
	smlad.w r7, r3, r6, r7
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #8
	ldr.w r3, [r1, #-4]
	ldr.w r4, [r1], #-8
	smlabb.w r11, r3, r5, r11
	smlabb.w lr, r3, r6, lr
	smladx.w r12, r3, r5, r12
	smladx.w r10, r3, r6, r10
	smladx.w r8, r4, r6, r8
	smlatt.w r7, r4, r5, r7
	smlatt.w r9, r4, r6, r9
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w lr, r3, r5, lr
	smlad.w r7, r3, r6, r7
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #8
	ldr.w r3, [r1, #-4]
	ldr.w r4, [r1], #-8
	smlabb.w r11, r3, r5, r11
	smlabb.w lr, r3, r6, lr
	smladx.w r12, r3, r5, r12
	smladx.w r10, r3, r6, r10
	smladx.w r8, r4, r6, r8
	smlatt.w r7, r4, r5, r7
	smlatt.w r9, r4, r6, r9
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w lr, r3, r5, lr
	smlad.w r7, r3, r6, r7
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #-4
	ldr.w r3, [r1, #-4]
	ldr.w r4, [r1], #4
	smlabb.w r11, r3, r5, r11
	smlabb.w lr, r3, r6, lr
	smladx.w r12, r3, r5, r12
	smladx.w r10, r3, r6, r10
	smladx.w r8, r4, r6, r8
	smlatt.w r7, r4, r5, r7
	smlatt.w r9, r4, r6, r9
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w lr, r3, r5, lr
	smlad.w r7, r3, r6, r7
	vmov.w s3, r5
	vmov.w r4, s2
	movw.w r3, #4591
	smmulr.w r5, r4, r11
	mls.w r11, r3, r5, r11
	smmulr.w r5, r4, r12
	mls.w r12, r3, r5, r12
	pkhbt.w r11, r11, r12, lsl #16
	smmulr.w r5, r4, lr
	mls.w lr, r3, r5, lr
	smmulr.w r5, r4, r10
	mls.w r10, r3, r5, r10
	pkhbt.w r12, lr, r10, lsl #16
	vmov.w r5, s3
	str.w r11, [r0, #88]
	str.w r12, [r0, #92]
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #8
	smlabb.w r7, r3, r5, r7
	smlabb.w r9, r3, r6, r9
	smladx.w r8, r3, r5, r8
	smuadx.w r10, r3, r6
	smuadx.w r12, r4, r6
	smultt.w r11, r4, r5
	smultt.w lr, r4, r6
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w r9, r3, r5, r9
	smlad.w r11, r3, r6, r11
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #8
	ldr.w r5, [r2, #-4]
	ldr.w r6, [r2], #-8
	smlabb.w r7, r3, r5, r7
	smlabb.w r9, r3, r6, r9
	smladx.w r8, r3, r5, r8
	smladx.w r10, r3, r6, r10
	smladx.w r12, r4, r6, r12
	smlatt.w r11, r4, r5, r11
	smlatt.w lr, r4, r6, lr
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w r9, r3, r5, r9
	smlad.w r11, r3, r6, r11
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #-4
	ldr.w r5, [r2, #-4]
	ldr.w r6, [r2], #4
	smlabb.w r7, r3, r5, r7
	smlabb.w r9, r3, r6, r9
	smladx.w r8, r3, r5, r8
	smladx.w r10, r3, r6, r10
	smladx.w r12, r4, r6, r12
	smlatt.w r11, r4, r5, r11
	smlatt.w lr, r4, r6, lr
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w r9, r3, r5, r9
	smlad.w r11, r3, r6, r11
	vmov.w r6, s2
	movw.w r5, #4591
	smmulr.w r3, r6, r7
	mls.w r7, r5, r3, r7
	smmulr.w r3, r6, r8
	mls.w r8, r5, r3, r8
	pkhbt.w r7, r7, r8, lsl #16
	smmulr.w r3, r6, r9
	mls.w r9, r5, r3, r9
	smmulr.w r3, r6, r10
	mls.w r10, r5, r3, r10
	pkhbt.w r8, r9, r10, lsl #16
	ldr.w r3, [r1, #4]
	str.w r7, [r0, #96]
	str.w r8, [r0, #100]
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #8
	smlabb.w r11, r3, r5, r11
	smlabb.w lr, r3, r6, lr
	smladx.w r12, r3, r5, r12
	smuadx.w r10, r3, r6
	smuadx.w r8, r4, r6
	smultt.w r7, r4, r5
	smultt.w r9, r4, r6
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w lr, r3, r5, lr
	smlad.w r7, r3, r6, r7
	ldr.w r6, [r2, #4]
	ldr.w r5, [r2], #8
	ldr.w r3, [r1, #-4]
	ldr.w r4, [r1], #4
	smlabb.w r11, r3, r5, r11
	smlabb.w lr, r3, r6, lr
	smladx.w r12, r3, r5, r12
	smladx.w r10, r3, r6, r10
	smladx.w r8, r4, r6, r8
	smlatt.w r7, r4, r5, r7
	smlatt.w r9, r4, r6, r9
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w lr, r3, r5, lr
	smlad.w r7, r3, r6, r7
	vmov.w s3, r5
	vmov.w r4, s2
	movw.w r3, #4591
	smmulr.w r5, r4, r11
	mls.w r11, r3, r5, r11
	smmulr.w r5, r4, r12
	mls.w r12, r3, r5, r12
	pkhbt.w r11, r11, r12, lsl #16
	smmulr.w r5, r4, lr
	mls.w lr, r3, r5, lr
	smmulr.w r5, r4, r10
	mls.w r10, r3, r5, r10
	pkhbt.w r12, lr, r10, lsl #16
	vmov.w r5, s3
	str.w r11, [r0, #104]
	str.w r12, [r0, #108]
	ldr.w r4, [r1, #4]
	ldr.w r3, [r1], #8
	smlabb.w r7, r3, r5, r7
	smlabb.w r9, r3, r6, r9
	smladx.w r8, r3, r5, r8
	smuadx.w r10, r3, r6
	smuadx.w r12, r4, r6
	smultt.w r11, r4, r5
	smultt.w lr, r4, r6
	smladx.w r10, r4, r5, r10
	pkhbt.w r3, r4, r3
	smlad.w r9, r3, r5, r9
	smlad.w r11, r3, r6, r11
	vmov.w r6, s2
	movw.w r5, #4591
	smmulr.w r3, r6, r7
	mls.w r7, r5, r3, r7
	smmulr.w r3, r6, r8
	mls.w r8, r5, r3, r8
	pkhbt.w r7, r7, r8, lsl #16
	smmulr.w r3, r6, r9
	mls.w r9, r5, r3, r9
	smmulr.w r3, r6, r10
	mls.w r10, r5, r3, r10
	pkhbt.w r8, r9, r10, lsl #16
	smmulr.w r3, r6, r11
	mls.w r11, r5, r3, r11
	smmulr.w r3, r6, r12
	mls.w r12, r5, r3, r12
	pkhbt.w r9, r11, r12, lsl #16
	smmulr.w r3, r6, lr
	mls.w r10, r5, r3, lr
	ubfx.w r10, r10, #0, #16
	str.w r7, [r0, #112]
	str.w r8, [r0, #116]
	str.w r9, [r0, #120]
	str.w r10, [r0, #124]
	pop.w {pc}
.p2align 2,,3
.syntax	unified
.text
__polyadd_64:
	push.w {lr}
	mov.w r2, 4591
	vmov.w r3, s2
	movw.w r4, #32768
	ldr.w r5, [r1, #0]
	ldr.w r6, [r1, #4]
	ldr.w r7, [r1, #8]
	ldr.w r8, [r1, #12]
	ldr.w r9, [r0, #0]
	ldr.w r10, [r0, #4]
	ldr.w r11, [r0, #8]
	ldr.w r12, [r0, #12]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #0]
	str.w r6, [r0, #4]
	str.w r7, [r0, #8]
	str.w r8, [r0, #12]
	ldr.w r5, [r1, #16]
	ldr.w r6, [r1, #20]
	ldr.w r7, [r1, #24]
	ldr.w r8, [r1, #28]
	ldr.w r9, [r0, #16]
	ldr.w r10, [r0, #20]
	ldr.w r11, [r0, #24]
	ldr.w r12, [r0, #28]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #16]
	str.w r6, [r0, #20]
	str.w r7, [r0, #24]
	str.w r8, [r0, #28]
	ldr.w r5, [r1, #32]
	ldr.w r6, [r1, #36]
	ldr.w r7, [r1, #40]
	ldr.w r8, [r1, #44]
	ldr.w r9, [r0, #32]
	ldr.w r10, [r0, #36]
	ldr.w r11, [r0, #40]
	ldr.w r12, [r0, #44]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #32]
	str.w r6, [r0, #36]
	str.w r7, [r0, #40]
	str.w r8, [r0, #44]
	ldr.w r5, [r1, #48]
	ldr.w r6, [r1, #52]
	ldr.w r7, [r1, #56]
	ldr.w r8, [r1, #60]
	ldr.w r9, [r0, #48]
	ldr.w r10, [r0, #52]
	ldr.w r11, [r0, #56]
	ldr.w r12, [r0, #60]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #48]
	str.w r6, [r0, #52]
	str.w r7, [r0, #56]
	str.w r8, [r0, #60]
	ldr.w r5, [r1, #64]
	ldr.w r6, [r1, #68]
	ldr.w r7, [r1, #72]
	ldr.w r8, [r1, #76]
	ldr.w r9, [r0, #64]
	ldr.w r10, [r0, #68]
	ldr.w r11, [r0, #72]
	ldr.w r12, [r0, #76]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #64]
	str.w r6, [r0, #68]
	str.w r7, [r0, #72]
	str.w r8, [r0, #76]
	ldr.w r5, [r1, #80]
	ldr.w r6, [r1, #84]
	ldr.w r7, [r1, #88]
	ldr.w r8, [r1, #92]
	ldr.w r9, [r0, #80]
	ldr.w r10, [r0, #84]
	ldr.w r11, [r0, #88]
	ldr.w r12, [r0, #92]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #80]
	str.w r6, [r0, #84]
	str.w r7, [r0, #88]
	str.w r8, [r0, #92]
	ldr.w r5, [r1, #96]
	ldr.w r6, [r1, #100]
	ldr.w r7, [r1, #104]
	ldr.w r8, [r1, #108]
	ldr.w r9, [r0, #96]
	ldr.w r10, [r0, #100]
	ldr.w r11, [r0, #104]
	ldr.w r12, [r0, #108]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #96]
	str.w r6, [r0, #100]
	str.w r7, [r0, #104]
	str.w r8, [r0, #108]
	ldr.w r5, [r1, #112]
	ldr.w r6, [r1, #116]
	ldr.w r7, [r1, #120]
	ldr.w r8, [r1, #124]
	ldr.w r9, [r0, #112]
	ldr.w r10, [r0, #116]
	ldr.w r11, [r0, #120]
	ldr.w r12, [r0, #124]
	sadd16.w r5,r5,r9
	sadd16.w r6,r6,r10
	sadd16.w r7,r7,r11
	sadd16.w r8,r8,r12
	smlawb.w r10, r3, r5, r4
	smlawt.w r9, r3, r5, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r5, r5, r10
	smlawb.w r10, r3, r6, r4
	smlawt.w r9, r3, r6, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r6, r6, r10
	smlawb.w r10, r3, r7, r4
	smlawt.w r9, r3, r7, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r7, r7, r10
	smlawb.w r10, r3, r8, r4
	smlawt.w r9, r3, r8, r4
	smulbt.w r10, r2, r10
	smulbt.w r9, r2, r9
	pkhbt.w r10, r10, r9, LSL #16
	ssub16.w r8, r8, r10
	str.w r5, [r0, #112]
	str.w r6, [r0, #116]
	str.w r7, [r0, #120]
	str.w r8, [r0, #124]
	pop.w {pc}
.p2align 2,,3
.syntax	unified
.data
b64_1: .space 132
.text
b1_addr:
	.word b64_1
	.word b64_1+2
.global	__gf_polymul_32x32_2x2_x_2x2
.type 	__gf_polymul_32x32_2x2_x_2x2, %function
@ void __gf_polymul_32x32_2x2_x_2x2(int *M,int *S_M1,int *fh,int *gh)
__gf_polymul_32x32_2x2_x_2x2:
	push {r1-r12, lr}
	vmov.w s0, s1, r0, r1
	vmov.w s4, r2
	movw.w r7, #18015
	movt.w r7, #14
	vmov.w s2, r7
	movw.w r11, #0
	ldr.w r7, b1_addr
	ldr.w r0, b1_addr+4
	str.w r11, [r7]
	vmov.w s5, s6, r7, r0
	bl	__polymul_32x32
	vmov.w r0, s0
	vmov.w r1, s1
	add.w r1, #128
	bl	__polymul_32x32
	vmov.w r1, s5
	bl	__polyadd_64
	vmov.w r0, s6
	vmov.w r1, s1
	vmov.w r2, s4
	add.w r1, #64
	bl	__polymul_32x32
	vmov.w r0, s0
	vmov.w r1, s1
	add.w r0, #128
	add.w r1, #192
	bl	__polymul_32x32
	vmov.w r1, s5
	bl	__polyadd_64
	vmov.w r0, s6
	vmov.w r1, s1
	vmov.w r2, s4
	add.w r2, #128
	bl	__polymul_32x32
	vmov.w r0, s0
	vmov.w r1, s1
	add.w r0, #256
	add.w r1, #128
	bl	__polymul_32x32
	vmov.w r1, s5
	bl	__polyadd_64
	vmov.w r0, s6
	vmov.w r1, s1
	vmov.w r2, s4
	add.w r1, #64
	add.w r2, #128
	bl	__polymul_32x32
	vmov.w r0, s0
	vmov.w r1, s1
	add.w r0, #384
	add.w r1, #192
	bl	__polymul_32x32
	vmov.w r1, s5
	bl	__polyadd_64
	pop {r1-r12, pc}
