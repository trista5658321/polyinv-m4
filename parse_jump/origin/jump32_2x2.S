.p2align 2,,3
.syntax unified
.text

.global __gf_polymul_16x16_2x2_x_2x2
.type __gf_polymul_16x16_2x2_x_2x2, %function
__gf_polymul_16x16_2x2_x_2x2:
    push.w {r4-r12, lr}
    vpush.w {s16-s31}
    movw.w lr, #18015
    movt.w lr, #14
    vmov.w s0, s1, r0, lr

// ================

    ldr.w r3, [r1, #0]
    ldr.w r4, [r1, #4]
    ldr.w r5, [r2, #0]
    ldr.w r6, [r2, #4]
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
    vmov.w s2, s3, r7, r8
    vmov.w s4, s5, r9, r10
    ldr.w r3, [r1, #8]
    ldr.w r4, [r1, #12]
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
    ldr.w r5, [r2, #8]
    ldr.w r6, [r2, #12]
    ldr.w r3, [r1, #0]
    ldr.w r4, [r1, #4]
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
    ldr.w r3, [r1, #0]
    vmov.w s6, s7, r11, r12
    vmov.w s8, s9, lr, r10
    ldr.w r5, [r2, #16]
    ldr.w r6, [r2, #20]
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
    ldr.w r3, [r1, #8]
    ldr.w r4, [r1, #12]
    ldr.w r5, [r2, #8]
    ldr.w r6, [r2, #12]
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
    ldr.w r3, [r1, #16]
    ldr.w r4, [r1, #20]
    ldr.w r5, [r2, #0]
    ldr.w r6, [r2, #4]
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
    vmov.w s10, s11, r7, r8
    vmov.w s12, s13, r9, r10
    ldr.w r3, [r1, #24]
    ldr.w r4, [r1, #28]
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
    ldr.w r5, [r2, #8]
    ldr.w r6, [r2, #12]
    ldr.w r3, [r1, #16]
    ldr.w r4, [r1, #20]
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
    ldr.w r5, [r2, #16]
    ldr.w r6, [r2, #20]
    ldr.w r3, [r1, #8]
    ldr.w r4, [r1, #12]
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
    ldr.w r5, [r2, #24]
    ldr.w r6, [r2, #28]
    ldr.w r3, [r1, #0]
    ldr.w r4, [r1, #4]
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
    vmov.w s14, s15, r11, r12
    vmov.w s16, s17, lr, r10
    ldr.w r3, [r1, #8]
    ldr.w r4, [r1, #12]
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
    ldr.w r3, [r1, #16]
    ldr.w r4, [r1, #20]
    ldr.w r5, [r2, #16]
    ldr.w r6, [r2, #20]
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
    ldr.w r3, [r1, #24]
    ldr.w r4, [r1, #28]
    ldr.w r5, [r2, #8]
    ldr.w r6, [r2, #12]
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
    ldr.w r3, [r1, #24]
    vmov.w s18, s19, r7, r8
    vmov.w s20, s21, r9, r10
    ldr.w r5, [r2, #16]
    ldr.w r6, [r2, #20]
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
    ldr.w r5, [r2, #24]
    ldr.w r6, [r2, #28]
    ldr.w r3, [r1, #16]
    ldr.w r4, [r1, #20]
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
    vmov.w s22, s23, r11, r12
    vmov.w s24, s25, lr, r10
    ldr.w r3, [r1, #24]
    ldr.w r4, [r1, #28]
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
    vmov.w s26, s27, r7, r8
    vmov.w s28, s29, r9, r10
    vmov.w s30, s31, r11, r12
    vmov.w r3, s1
    mov.w r4, 4591
    smmulr.w r7, lr, r3
    mls.w lr, r4, r7, lr
    strh.w lr, [r0, #62]

// ================

    add.w r1, #32
    add.w r2, #64

    ldr.w r3, [r1, #0]
    ldr.w r4, [r1, #4]
    ldr.w r5, [r2, #0]
    ldr.w r6, [r2, #4]
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
    vmov.w r3, r4, s2, s3
    add r8, r3
    add r9, r4
    vmov.w r3, s4
    add.w r10, r3
    vmov.w r3, s1
    mov.w r4, 4591
    smmulr.w r0, r7, r3
    mls.w r7, r4, r0, r7
    smmulr.w r0, r8, r3
    mls.w r8, r4, r0, r8
    smmulr.w r0, r9, r3
    mls.w r9, r4, r0, r9
    smmulr.w r0, r10, r3
    mls.w r10, r4, r0, r10
    pkhbt r7, r7, r8, lsl #16
    pkhbt r9, r9, r10, lsl #16
    vmov.w r0, s0
    str.w r7, [r0, #0]
    str.w r9, [r0, #4]
    ldr.w r3, [r1, #8]
    ldr.w r4, [r1, #12]
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
    ldr.w r5, [r2, #8]
    ldr.w r6, [r2, #12]
    ldr.w r3, [r1, #0]
    ldr.w r4, [r1, #4]
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
    ldr.w r3, [r1, #0]
    vmov.w r5, r6, s5, s6
    add r11, r5
    add r12, r6
    vmov.w r5, r6, s7, s8
    add lr, r5
    add r10, r6
    vmov.w r5, s1
    mov.w r6, 4591
    smmulr.w r0, r11, r5
    mls.w r11, r6, r0, r11
    smmulr.w r0, r12, r5
    mls.w r12, r6, r0, r12
    smmulr.w r0, lr, r5
    mls.w lr, r6, r0, lr
    smmulr.w r0, r10, r5
    mls.w r10, r6, r0, r10
    pkhbt r11, r11, r12, lsl #16
    pkhbt lr, lr, r10, lsl #16
    vmov.w r0, s0
    str.w r11, [r0, #8]
    str.w lr, [r0, #12]
    ldr.w r5, [r2, #16]
    ldr.w r6, [r2, #20]
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
    ldr.w r3, [r1, #8]
    ldr.w r4, [r1, #12]
    ldr.w r5, [r2, #8]
    ldr.w r6, [r2, #12]
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
    ldr.w r3, [r1, #16]
    ldr.w r4, [r1, #20]
    ldr.w r5, [r2, #0]
    ldr.w r6, [r2, #4]
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
    vmov.w r3, r4, s9, s10
    add r7, r3
    add r8, r4
    vmov.w r3, r4, s11, s12
    add r9, r3
    add r10, r4
    vmov.w r3, s1
    mov.w r4, 4591
    smmulr.w r0, r7, r3
    mls.w r7, r4, r0, r7
    smmulr.w r0, r8, r3
    mls.w r8, r4, r0, r8
    smmulr.w r0, r9, r3
    mls.w r9, r4, r0, r9
    smmulr.w r0, r10, r3
    mls.w r10, r4, r0, r10
    pkhbt r7, r7, r8, lsl #16
    pkhbt r9, r9, r10, lsl #16
    vmov.w r0, s0
    str.w r7, [r0, #16]
    str.w r9, [r0, #20]
    ldr.w r3, [r1, #24]
    ldr.w r4, [r1, #28]
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
    ldr.w r5, [r2, #8]
    ldr.w r6, [r2, #12]
    ldr.w r3, [r1, #16]
    ldr.w r4, [r1, #20]
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
    ldr.w r5, [r2, #16]
    ldr.w r6, [r2, #20]
    ldr.w r3, [r1, #8]
    ldr.w r4, [r1, #12]
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
    ldr.w r5, [r2, #24]
    ldr.w r6, [r2, #28]
    ldr.w r3, [r1, #0]
    ldr.w r4, [r1, #4]
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
    vmov.w r3, r4, s13, s14
    add r11, r3
    add r12, r4
    vmov.w r3, r4, s15, s16
    add lr, r3
    add r10, r4
    vmov.w r3, s1
    mov.w r4, 4591
    smmulr.w r0, r11, r3
    mls.w r11, r4, r0, r11
    smmulr.w r0, r12, r3
    mls.w r12, r4, r0, r12
    smmulr.w r0, lr, r3
    mls.w lr, r4, r0, lr
    smmulr.w r0, r10, r3
    mls.w r10, r4, r0, r10
    pkhbt r11, r11, r12, lsl #16
    pkhbt lr, lr, r10, lsl #16
    vmov.w r0, s0
    str.w r11, [r0, #24]
    str.w lr, [r0, #28]
    ldr.w r3, [r1, #8]
    ldr.w r4, [r1, #12]
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
    ldr.w r3, [r1, #16]
    ldr.w r4, [r1, #20]
    ldr.w r5, [r2, #16]
    ldr.w r6, [r2, #20]
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
    ldr.w r3, [r1, #24]
    ldr.w r4, [r1, #28]
    ldr.w r5, [r2, #8]
    ldr.w r6, [r2, #12]
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
    ldr.w r3, [r1, #24]
    vmov.w r5, r6, s17, s18
    add r7, r5
    add r8, r6
    vmov.w r5, r6, s19, s20
    add r9, r5
    add r10, r6
    vmov.w r5, s1
    mov.w r6, 4591
    smmulr.w r0, r7, r5
    mls.w r7, r6, r0, r7
    smmulr.w r0, r8, r5
    mls.w r8, r6, r0, r8
    smmulr.w r0, r9, r5
    mls.w r9, r6, r0, r9
    smmulr.w r0, r10, r5
    mls.w r10, r6, r0, r10
    pkhbt r7, r7, r8, lsl #16
    pkhbt r9, r9, r10, lsl #16
    vmov.w r0, s0
    str.w r7, [r0, #32]
    str.w r9, [r0, #36]
    ldr.w r5, [r2, #16]
    ldr.w r6, [r2, #20]
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
    ldr.w r5, [r2, #24]
    ldr.w r6, [r2, #28]
    ldr.w r3, [r1, #16]
    ldr.w r4, [r1, #20]
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
    vmov.w r3, r4, s21, s22
    add r11, r3
    add r12, r4
    vmov.w r3, r4, s23, s24
    add lr, r3
    add r10, r4
    vmov.w r3, s1
    mov.w r4, 4591
    smmulr.w r0, r11, r3
    mls.w r11, r4, r0, r11
    smmulr.w r0, r12, r3
    mls.w r12, r4, r0, r12
    smmulr.w r0, lr, r3
    mls.w lr, r4, r0, lr
    smmulr.w r0, r10, r3
    mls.w r10, r4, r0, r10
    pkhbt r11, r11, r12, lsl #16
    pkhbt lr, lr, r10, lsl #16
    vmov.w r0, s0
    str.w r11, [r0, #40]
    str.w lr, [r0, #44]
    ldr.w r3, [r1, #24]
    ldr.w r4, [r1, #28]
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
    vmov.w r3, r4, s25, s26
    add r7, r3
    add r8, r4
    vmov.w r3, r4, s27, s28
    add r9, r3
    add r10, r4
    vmov.w r3, r4, s29, s30
    add r11, r3
    add r12, r4
    vmov.w r3, s31
    add.w lr, r3
    vmov.w r3, s1
    mov.w r4, 4591
    smmulr.w r5, r7, r3
    mls.w r7, r4, r5, r7
    smmulr.w r5, r8, r3
    mls.w r8, r4, r5, r8
    smmulr.w r5, r9, r3
    mls.w r9, r4, r5, r9
    smmulr.w r5, r10, r3
    mls.w r10, r4, r5, r10
    smmulr.w r5, r11, r3
    mls.w r11, r4, r5, r11
    smmulr.w r5, r12, r3
    mls.w r12, r4, r5, r12
    smmulr.w r5, lr, r3
    mls.w lr, r4, r5, lr
    pkhbt r7, r7, r8, lsl #16
    pkhbt r9, r9, r10, lsl #16
    pkhbt r11, r11, r12, lsl #16
    str.w r7, [r0, #48]
    str.w r9, [r0, #52]
    str.w r11, [r0, #56]
    strh.w lr, [r0, #60]

// ================================

    add.w r0, #64
    vmov.w s0, r0
    sub.w r1, #32
    sub.w r2, #32

    ldr.w r3, [r1, #0]
    ldr.w r4, [r1, #4]
    ldr.w r5, [r2, #0]
    ldr.w r6, [r2, #4]
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
    vmov.w s2, s3, r7, r8
    vmov.w s4, s5, r9, r10
    ldr.w r3, [r1, #8]
    ldr.w r4, [r1, #12]
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
    ldr.w r5, [r2, #8]
    ldr.w r6, [r2, #12]
    ldr.w r3, [r1, #0]
    ldr.w r4, [r1, #4]
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
    ldr.w r3, [r1, #0]
    vmov.w s6, s7, r11, r12
    vmov.w s8, s9, lr, r10
    ldr.w r5, [r2, #16]
    ldr.w r6, [r2, #20]
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
    ldr.w r3, [r1, #8]
    ldr.w r4, [r1, #12]
    ldr.w r5, [r2, #8]
    ldr.w r6, [r2, #12]
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
    ldr.w r3, [r1, #16]
    ldr.w r4, [r1, #20]
    ldr.w r5, [r2, #0]
    ldr.w r6, [r2, #4]
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
    vmov.w s10, s11, r7, r8
    vmov.w s12, s13, r9, r10
    ldr.w r3, [r1, #24]
    ldr.w r4, [r1, #28]
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
    ldr.w r5, [r2, #8]
    ldr.w r6, [r2, #12]
    ldr.w r3, [r1, #16]
    ldr.w r4, [r1, #20]
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
    ldr.w r5, [r2, #16]
    ldr.w r6, [r2, #20]
    ldr.w r3, [r1, #8]
    ldr.w r4, [r1, #12]
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
    ldr.w r5, [r2, #24]
    ldr.w r6, [r2, #28]
    ldr.w r3, [r1, #0]
    ldr.w r4, [r1, #4]
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
    vmov.w s14, s15, r11, r12
    vmov.w s16, s17, lr, r10
    ldr.w r3, [r1, #8]
    ldr.w r4, [r1, #12]
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
    ldr.w r3, [r1, #16]
    ldr.w r4, [r1, #20]
    ldr.w r5, [r2, #16]
    ldr.w r6, [r2, #20]
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
    ldr.w r3, [r1, #24]
    ldr.w r4, [r1, #28]
    ldr.w r5, [r2, #8]
    ldr.w r6, [r2, #12]
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
    ldr.w r3, [r1, #24]
    vmov.w s18, s19, r7, r8
    vmov.w s20, s21, r9, r10
    ldr.w r5, [r2, #16]
    ldr.w r6, [r2, #20]
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
    ldr.w r5, [r2, #24]
    ldr.w r6, [r2, #28]
    ldr.w r3, [r1, #16]
    ldr.w r4, [r1, #20]
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
    vmov.w s22, s23, r11, r12
    vmov.w s24, s25, lr, r10
    ldr.w r3, [r1, #24]
    ldr.w r4, [r1, #28]
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
    vmov.w s26, s27, r7, r8
    vmov.w s28, s29, r9, r10
    vmov.w s30, s31, r11, r12
    vmov.w r3, s1
    mov.w r4, 4591
    smmulr.w r7, lr, r3
    mls.w lr, r4, r7, lr
    strh.w lr, [r0, #62]

// ================

    add.w r1, #32
    add.w r2, #64

    ldr.w r3, [r1, #0]
    ldr.w r4, [r1, #4]
    ldr.w r5, [r2, #0]
    ldr.w r6, [r2, #4]
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
    vmov.w r3, r4, s2, s3
    add r8, r3
    add r9, r4
    vmov.w r3, s4
    add.w r10, r3
    vmov.w r3, s1
    mov.w r4, 4591
    smmulr.w r0, r7, r3
    mls.w r7, r4, r0, r7
    smmulr.w r0, r8, r3
    mls.w r8, r4, r0, r8
    smmulr.w r0, r9, r3
    mls.w r9, r4, r0, r9
    smmulr.w r0, r10, r3
    mls.w r10, r4, r0, r10
    pkhbt r7, r7, r8, lsl #16
    pkhbt r9, r9, r10, lsl #16
    vmov.w r0, s0
    str.w r7, [r0, #0]
    str.w r9, [r0, #4]
    ldr.w r3, [r1, #8]
    ldr.w r4, [r1, #12]
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
    ldr.w r5, [r2, #8]
    ldr.w r6, [r2, #12]
    ldr.w r3, [r1, #0]
    ldr.w r4, [r1, #4]
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
    ldr.w r3, [r1, #0]
    vmov.w r5, r6, s5, s6
    add r11, r5
    add r12, r6
    vmov.w r5, r6, s7, s8
    add lr, r5
    add r10, r6
    vmov.w r5, s1
    mov.w r6, 4591
    smmulr.w r0, r11, r5
    mls.w r11, r6, r0, r11
    smmulr.w r0, r12, r5
    mls.w r12, r6, r0, r12
    smmulr.w r0, lr, r5
    mls.w lr, r6, r0, lr
    smmulr.w r0, r10, r5
    mls.w r10, r6, r0, r10
    pkhbt r11, r11, r12, lsl #16
    pkhbt lr, lr, r10, lsl #16
    vmov.w r0, s0
    str.w r11, [r0, #8]
    str.w lr, [r0, #12]
    ldr.w r5, [r2, #16]
    ldr.w r6, [r2, #20]
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
    ldr.w r3, [r1, #8]
    ldr.w r4, [r1, #12]
    ldr.w r5, [r2, #8]
    ldr.w r6, [r2, #12]
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
    ldr.w r3, [r1, #16]
    ldr.w r4, [r1, #20]
    ldr.w r5, [r2, #0]
    ldr.w r6, [r2, #4]
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
    vmov.w r3, r4, s9, s10
    add r7, r3
    add r8, r4
    vmov.w r3, r4, s11, s12
    add r9, r3
    add r10, r4
    vmov.w r3, s1
    mov.w r4, 4591
    smmulr.w r0, r7, r3
    mls.w r7, r4, r0, r7
    smmulr.w r0, r8, r3
    mls.w r8, r4, r0, r8
    smmulr.w r0, r9, r3
    mls.w r9, r4, r0, r9
    smmulr.w r0, r10, r3
    mls.w r10, r4, r0, r10
    pkhbt r7, r7, r8, lsl #16
    pkhbt r9, r9, r10, lsl #16
    vmov.w r0, s0
    str.w r7, [r0, #16]
    str.w r9, [r0, #20]
    ldr.w r3, [r1, #24]
    ldr.w r4, [r1, #28]
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
    ldr.w r5, [r2, #8]
    ldr.w r6, [r2, #12]
    ldr.w r3, [r1, #16]
    ldr.w r4, [r1, #20]
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
    ldr.w r5, [r2, #16]
    ldr.w r6, [r2, #20]
    ldr.w r3, [r1, #8]
    ldr.w r4, [r1, #12]
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
    ldr.w r5, [r2, #24]
    ldr.w r6, [r2, #28]
    ldr.w r3, [r1, #0]
    ldr.w r4, [r1, #4]
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
    vmov.w r3, r4, s13, s14
    add r11, r3
    add r12, r4
    vmov.w r3, r4, s15, s16
    add lr, r3
    add r10, r4
    vmov.w r3, s1
    mov.w r4, 4591
    smmulr.w r0, r11, r3
    mls.w r11, r4, r0, r11
    smmulr.w r0, r12, r3
    mls.w r12, r4, r0, r12
    smmulr.w r0, lr, r3
    mls.w lr, r4, r0, lr
    smmulr.w r0, r10, r3
    mls.w r10, r4, r0, r10
    pkhbt r11, r11, r12, lsl #16
    pkhbt lr, lr, r10, lsl #16
    vmov.w r0, s0
    str.w r11, [r0, #24]
    str.w lr, [r0, #28]
    ldr.w r3, [r1, #8]
    ldr.w r4, [r1, #12]
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
    ldr.w r3, [r1, #16]
    ldr.w r4, [r1, #20]
    ldr.w r5, [r2, #16]
    ldr.w r6, [r2, #20]
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
    ldr.w r3, [r1, #24]
    ldr.w r4, [r1, #28]
    ldr.w r5, [r2, #8]
    ldr.w r6, [r2, #12]
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
    ldr.w r3, [r1, #24]
    vmov.w r5, r6, s17, s18
    add r7, r5
    add r8, r6
    vmov.w r5, r6, s19, s20
    add r9, r5
    add r10, r6
    vmov.w r5, s1
    mov.w r6, 4591
    smmulr.w r0, r7, r5
    mls.w r7, r6, r0, r7
    smmulr.w r0, r8, r5
    mls.w r8, r6, r0, r8
    smmulr.w r0, r9, r5
    mls.w r9, r6, r0, r9
    smmulr.w r0, r10, r5
    mls.w r10, r6, r0, r10
    pkhbt r7, r7, r8, lsl #16
    pkhbt r9, r9, r10, lsl #16
    vmov.w r0, s0
    str.w r7, [r0, #32]
    str.w r9, [r0, #36]
    ldr.w r5, [r2, #16]
    ldr.w r6, [r2, #20]
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
    ldr.w r5, [r2, #24]
    ldr.w r6, [r2, #28]
    ldr.w r3, [r1, #16]
    ldr.w r4, [r1, #20]
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
    vmov.w r3, r4, s21, s22
    add r11, r3
    add r12, r4
    vmov.w r3, r4, s23, s24
    add lr, r3
    add r10, r4
    vmov.w r3, s1
    mov.w r4, 4591
    smmulr.w r0, r11, r3
    mls.w r11, r4, r0, r11
    smmulr.w r0, r12, r3
    mls.w r12, r4, r0, r12
    smmulr.w r0, lr, r3
    mls.w lr, r4, r0, lr
    smmulr.w r0, r10, r3
    mls.w r10, r4, r0, r10
    pkhbt r11, r11, r12, lsl #16
    pkhbt lr, lr, r10, lsl #16
    vmov.w r0, s0
    str.w r11, [r0, #40]
    str.w lr, [r0, #44]
    ldr.w r3, [r1, #24]
    ldr.w r4, [r1, #28]
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
    vmov.w r3, r4, s25, s26
    add r7, r3
    add r8, r4
    vmov.w r3, r4, s27, s28
    add r9, r3
    add r10, r4
    vmov.w r3, r4, s29, s30
    add r11, r3
    add r12, r4
    vmov.w r3, s31
    add.w lr, r3
    vmov.w r3, s1
    mov.w r4, 4591
    smmulr.w r5, r7, r3
    mls.w r7, r4, r5, r7
    smmulr.w r5, r8, r3
    mls.w r8, r4, r5, r8
    smmulr.w r5, r9, r3
    mls.w r9, r4, r5, r9
    smmulr.w r5, r10, r3
    mls.w r10, r4, r5, r10
    smmulr.w r5, r11, r3
    mls.w r11, r4, r5, r11
    smmulr.w r5, r12, r3
    mls.w r12, r4, r5, r12
    smmulr.w r5, lr, r3
    mls.w lr, r4, r5, lr
    pkhbt r7, r7, r8, lsl #16
    pkhbt r9, r9, r10, lsl #16
    pkhbt r11, r11, r12, lsl #16
    str.w r7, [r0, #48]
    str.w r9, [r0, #52]
    str.w r11, [r0, #56]
    strh.w lr, [r0, #60]

// ================================

    add.w r0, #64
    vmov.w s0, r0
    add.w r1, #32
    sub.w r2, #96

    ldr.w r3, [r1, #0]
    ldr.w r4, [r1, #4]
    ldr.w r5, [r2, #0]
    ldr.w r6, [r2, #4]
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
    vmov.w s2, s3, r7, r8
    vmov.w s4, s5, r9, r10
    ldr.w r3, [r1, #8]
    ldr.w r4, [r1, #12]
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
    ldr.w r5, [r2, #8]
    ldr.w r6, [r2, #12]
    ldr.w r3, [r1, #0]
    ldr.w r4, [r1, #4]
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
    ldr.w r3, [r1, #0]
    vmov.w s6, s7, r11, r12
    vmov.w s8, s9, lr, r10
    ldr.w r5, [r2, #16]
    ldr.w r6, [r2, #20]
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
    ldr.w r3, [r1, #8]
    ldr.w r4, [r1, #12]
    ldr.w r5, [r2, #8]
    ldr.w r6, [r2, #12]
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
    ldr.w r3, [r1, #16]
    ldr.w r4, [r1, #20]
    ldr.w r5, [r2, #0]
    ldr.w r6, [r2, #4]
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
    vmov.w s10, s11, r7, r8
    vmov.w s12, s13, r9, r10
    ldr.w r3, [r1, #24]
    ldr.w r4, [r1, #28]
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
    ldr.w r5, [r2, #8]
    ldr.w r6, [r2, #12]
    ldr.w r3, [r1, #16]
    ldr.w r4, [r1, #20]
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
    ldr.w r5, [r2, #16]
    ldr.w r6, [r2, #20]
    ldr.w r3, [r1, #8]
    ldr.w r4, [r1, #12]
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
    ldr.w r5, [r2, #24]
    ldr.w r6, [r2, #28]
    ldr.w r3, [r1, #0]
    ldr.w r4, [r1, #4]
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
    vmov.w s14, s15, r11, r12
    vmov.w s16, s17, lr, r10
    ldr.w r3, [r1, #8]
    ldr.w r4, [r1, #12]
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
    ldr.w r3, [r1, #16]
    ldr.w r4, [r1, #20]
    ldr.w r5, [r2, #16]
    ldr.w r6, [r2, #20]
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
    ldr.w r3, [r1, #24]
    ldr.w r4, [r1, #28]
    ldr.w r5, [r2, #8]
    ldr.w r6, [r2, #12]
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
    ldr.w r3, [r1, #24]
    vmov.w s18, s19, r7, r8
    vmov.w s20, s21, r9, r10
    ldr.w r5, [r2, #16]
    ldr.w r6, [r2, #20]
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
    ldr.w r5, [r2, #24]
    ldr.w r6, [r2, #28]
    ldr.w r3, [r1, #16]
    ldr.w r4, [r1, #20]
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
    vmov.w s22, s23, r11, r12
    vmov.w s24, s25, lr, r10
    ldr.w r3, [r1, #24]
    ldr.w r4, [r1, #28]
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
    vmov.w s26, s27, r7, r8
    vmov.w s28, s29, r9, r10
    vmov.w s30, s31, r11, r12
    vmov.w r3, s1
    mov.w r4, 4591
    smmulr.w r7, lr, r3
    mls.w lr, r4, r7, lr
    strh.w lr, [r0, #62]

// ================

    add.w r1, #32
    add.w r2, #64

    ldr.w r3, [r1, #0]
    ldr.w r4, [r1, #4]
    ldr.w r5, [r2, #0]
    ldr.w r6, [r2, #4]
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
    vmov.w r3, r4, s2, s3
    add r8, r3
    add r9, r4
    vmov.w r3, s4
    add.w r10, r3
    vmov.w r3, s1
    mov.w r4, 4591
    smmulr.w r0, r7, r3
    mls.w r7, r4, r0, r7
    smmulr.w r0, r8, r3
    mls.w r8, r4, r0, r8
    smmulr.w r0, r9, r3
    mls.w r9, r4, r0, r9
    smmulr.w r0, r10, r3
    mls.w r10, r4, r0, r10
    pkhbt r7, r7, r8, lsl #16
    pkhbt r9, r9, r10, lsl #16
    vmov.w r0, s0
    str.w r7, [r0, #0]
    str.w r9, [r0, #4]
    ldr.w r3, [r1, #8]
    ldr.w r4, [r1, #12]
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
    ldr.w r5, [r2, #8]
    ldr.w r6, [r2, #12]
    ldr.w r3, [r1, #0]
    ldr.w r4, [r1, #4]
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
    ldr.w r3, [r1, #0]
    vmov.w r5, r6, s5, s6
    add r11, r5
    add r12, r6
    vmov.w r5, r6, s7, s8
    add lr, r5
    add r10, r6
    vmov.w r5, s1
    mov.w r6, 4591
    smmulr.w r0, r11, r5
    mls.w r11, r6, r0, r11
    smmulr.w r0, r12, r5
    mls.w r12, r6, r0, r12
    smmulr.w r0, lr, r5
    mls.w lr, r6, r0, lr
    smmulr.w r0, r10, r5
    mls.w r10, r6, r0, r10
    pkhbt r11, r11, r12, lsl #16
    pkhbt lr, lr, r10, lsl #16
    vmov.w r0, s0
    str.w r11, [r0, #8]
    str.w lr, [r0, #12]
    ldr.w r5, [r2, #16]
    ldr.w r6, [r2, #20]
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
    ldr.w r3, [r1, #8]
    ldr.w r4, [r1, #12]
    ldr.w r5, [r2, #8]
    ldr.w r6, [r2, #12]
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
    ldr.w r3, [r1, #16]
    ldr.w r4, [r1, #20]
    ldr.w r5, [r2, #0]
    ldr.w r6, [r2, #4]
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
    vmov.w r3, r4, s9, s10
    add r7, r3
    add r8, r4
    vmov.w r3, r4, s11, s12
    add r9, r3
    add r10, r4
    vmov.w r3, s1
    mov.w r4, 4591
    smmulr.w r0, r7, r3
    mls.w r7, r4, r0, r7
    smmulr.w r0, r8, r3
    mls.w r8, r4, r0, r8
    smmulr.w r0, r9, r3
    mls.w r9, r4, r0, r9
    smmulr.w r0, r10, r3
    mls.w r10, r4, r0, r10
    pkhbt r7, r7, r8, lsl #16
    pkhbt r9, r9, r10, lsl #16
    vmov.w r0, s0
    str.w r7, [r0, #16]
    str.w r9, [r0, #20]
    ldr.w r3, [r1, #24]
    ldr.w r4, [r1, #28]
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
    ldr.w r5, [r2, #8]
    ldr.w r6, [r2, #12]
    ldr.w r3, [r1, #16]
    ldr.w r4, [r1, #20]
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
    ldr.w r5, [r2, #16]
    ldr.w r6, [r2, #20]
    ldr.w r3, [r1, #8]
    ldr.w r4, [r1, #12]
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
    ldr.w r5, [r2, #24]
    ldr.w r6, [r2, #28]
    ldr.w r3, [r1, #0]
    ldr.w r4, [r1, #4]
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
    vmov.w r3, r4, s13, s14
    add r11, r3
    add r12, r4
    vmov.w r3, r4, s15, s16
    add lr, r3
    add r10, r4
    vmov.w r3, s1
    mov.w r4, 4591
    smmulr.w r0, r11, r3
    mls.w r11, r4, r0, r11
    smmulr.w r0, r12, r3
    mls.w r12, r4, r0, r12
    smmulr.w r0, lr, r3
    mls.w lr, r4, r0, lr
    smmulr.w r0, r10, r3
    mls.w r10, r4, r0, r10
    pkhbt r11, r11, r12, lsl #16
    pkhbt lr, lr, r10, lsl #16
    vmov.w r0, s0
    str.w r11, [r0, #24]
    str.w lr, [r0, #28]
    ldr.w r3, [r1, #8]
    ldr.w r4, [r1, #12]
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
    ldr.w r3, [r1, #16]
    ldr.w r4, [r1, #20]
    ldr.w r5, [r2, #16]
    ldr.w r6, [r2, #20]
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
    ldr.w r3, [r1, #24]
    ldr.w r4, [r1, #28]
    ldr.w r5, [r2, #8]
    ldr.w r6, [r2, #12]
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
    ldr.w r3, [r1, #24]
    vmov.w r5, r6, s17, s18
    add r7, r5
    add r8, r6
    vmov.w r5, r6, s19, s20
    add r9, r5
    add r10, r6
    vmov.w r5, s1
    mov.w r6, 4591
    smmulr.w r0, r7, r5
    mls.w r7, r6, r0, r7
    smmulr.w r0, r8, r5
    mls.w r8, r6, r0, r8
    smmulr.w r0, r9, r5
    mls.w r9, r6, r0, r9
    smmulr.w r0, r10, r5
    mls.w r10, r6, r0, r10
    pkhbt r7, r7, r8, lsl #16
    pkhbt r9, r9, r10, lsl #16
    vmov.w r0, s0
    str.w r7, [r0, #32]
    str.w r9, [r0, #36]
    ldr.w r5, [r2, #16]
    ldr.w r6, [r2, #20]
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
    ldr.w r5, [r2, #24]
    ldr.w r6, [r2, #28]
    ldr.w r3, [r1, #16]
    ldr.w r4, [r1, #20]
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
    vmov.w r3, r4, s21, s22
    add r11, r3
    add r12, r4
    vmov.w r3, r4, s23, s24
    add lr, r3
    add r10, r4
    vmov.w r3, s1
    mov.w r4, 4591
    smmulr.w r0, r11, r3
    mls.w r11, r4, r0, r11
    smmulr.w r0, r12, r3
    mls.w r12, r4, r0, r12
    smmulr.w r0, lr, r3
    mls.w lr, r4, r0, lr
    smmulr.w r0, r10, r3
    mls.w r10, r4, r0, r10
    pkhbt r11, r11, r12, lsl #16
    pkhbt lr, lr, r10, lsl #16
    vmov.w r0, s0
    str.w r11, [r0, #40]
    str.w lr, [r0, #44]
    ldr.w r3, [r1, #24]
    ldr.w r4, [r1, #28]
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
    vmov.w r3, r4, s25, s26
    add r7, r3
    add r8, r4
    vmov.w r3, r4, s27, s28
    add r9, r3
    add r10, r4
    vmov.w r3, r4, s29, s30
    add r11, r3
    add r12, r4
    vmov.w r3, s31
    add.w lr, r3
    vmov.w r3, s1
    mov.w r4, 4591
    smmulr.w r5, r7, r3
    mls.w r7, r4, r5, r7
    smmulr.w r5, r8, r3
    mls.w r8, r4, r5, r8
    smmulr.w r5, r9, r3
    mls.w r9, r4, r5, r9
    smmulr.w r5, r10, r3
    mls.w r10, r4, r5, r10
    smmulr.w r5, r11, r3
    mls.w r11, r4, r5, r11
    smmulr.w r5, r12, r3
    mls.w r12, r4, r5, r12
    smmulr.w r5, lr, r3
    mls.w lr, r4, r5, lr
    pkhbt r7, r7, r8, lsl #16
    pkhbt r9, r9, r10, lsl #16
    pkhbt r11, r11, r12, lsl #16
    str.w r7, [r0, #48]
    str.w r9, [r0, #52]
    str.w r11, [r0, #56]
    strh.w lr, [r0, #60]

// ================================

    add.w r0, #64
    vmov.w s0, r0
    sub.w r1, #32
    sub.w r2, #32

    ldr.w r3, [r1, #0]
    ldr.w r4, [r1, #4]
    ldr.w r5, [r2, #0]
    ldr.w r6, [r2, #4]
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
    vmov.w s2, s3, r7, r8
    vmov.w s4, s5, r9, r10
    ldr.w r3, [r1, #8]
    ldr.w r4, [r1, #12]
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
    ldr.w r5, [r2, #8]
    ldr.w r6, [r2, #12]
    ldr.w r3, [r1, #0]
    ldr.w r4, [r1, #4]
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
    ldr.w r3, [r1, #0]
    vmov.w s6, s7, r11, r12
    vmov.w s8, s9, lr, r10
    ldr.w r5, [r2, #16]
    ldr.w r6, [r2, #20]
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
    ldr.w r3, [r1, #8]
    ldr.w r4, [r1, #12]
    ldr.w r5, [r2, #8]
    ldr.w r6, [r2, #12]
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
    ldr.w r3, [r1, #16]
    ldr.w r4, [r1, #20]
    ldr.w r5, [r2, #0]
    ldr.w r6, [r2, #4]
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
    vmov.w s10, s11, r7, r8
    vmov.w s12, s13, r9, r10
    ldr.w r3, [r1, #24]
    ldr.w r4, [r1, #28]
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
    ldr.w r5, [r2, #8]
    ldr.w r6, [r2, #12]
    ldr.w r3, [r1, #16]
    ldr.w r4, [r1, #20]
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
    ldr.w r5, [r2, #16]
    ldr.w r6, [r2, #20]
    ldr.w r3, [r1, #8]
    ldr.w r4, [r1, #12]
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
    ldr.w r5, [r2, #24]
    ldr.w r6, [r2, #28]
    ldr.w r3, [r1, #0]
    ldr.w r4, [r1, #4]
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
    vmov.w s14, s15, r11, r12
    vmov.w s16, s17, lr, r10
    ldr.w r3, [r1, #8]
    ldr.w r4, [r1, #12]
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
    ldr.w r3, [r1, #16]
    ldr.w r4, [r1, #20]
    ldr.w r5, [r2, #16]
    ldr.w r6, [r2, #20]
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
    ldr.w r3, [r1, #24]
    ldr.w r4, [r1, #28]
    ldr.w r5, [r2, #8]
    ldr.w r6, [r2, #12]
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
    ldr.w r3, [r1, #24]
    vmov.w s18, s19, r7, r8
    vmov.w s20, s21, r9, r10
    ldr.w r5, [r2, #16]
    ldr.w r6, [r2, #20]
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
    ldr.w r5, [r2, #24]
    ldr.w r6, [r2, #28]
    ldr.w r3, [r1, #16]
    ldr.w r4, [r1, #20]
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
    vmov.w s22, s23, r11, r12
    vmov.w s24, s25, lr, r10
    ldr.w r3, [r1, #24]
    ldr.w r4, [r1, #28]
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
    vmov.w s26, s27, r7, r8
    vmov.w s28, s29, r9, r10
    vmov.w s30, s31, r11, r12
    vmov.w r3, s1
    mov.w r4, 4591
    smmulr.w r7, lr, r3
    mls.w lr, r4, r7, lr
    strh.w lr, [r0, #62]

// ================

    add.w r1, #32
    add.w r2, #64

    ldr.w r3, [r1, #0]
    ldr.w r4, [r1, #4]
    ldr.w r5, [r2, #0]
    ldr.w r6, [r2, #4]
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
    vmov.w r3, r4, s2, s3
    add r8, r3
    add r9, r4
    vmov.w r3, s4
    add.w r10, r3
    vmov.w r3, s1
    mov.w r4, 4591
    smmulr.w r0, r7, r3
    mls.w r7, r4, r0, r7
    smmulr.w r0, r8, r3
    mls.w r8, r4, r0, r8
    smmulr.w r0, r9, r3
    mls.w r9, r4, r0, r9
    smmulr.w r0, r10, r3
    mls.w r10, r4, r0, r10
    pkhbt r7, r7, r8, lsl #16
    pkhbt r9, r9, r10, lsl #16
    vmov.w r0, s0
    str.w r7, [r0, #0]
    str.w r9, [r0, #4]
    ldr.w r3, [r1, #8]
    ldr.w r4, [r1, #12]
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
    ldr.w r5, [r2, #8]
    ldr.w r6, [r2, #12]
    ldr.w r3, [r1, #0]
    ldr.w r4, [r1, #4]
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
    ldr.w r3, [r1, #0]
    vmov.w r5, r6, s5, s6
    add r11, r5
    add r12, r6
    vmov.w r5, r6, s7, s8
    add lr, r5
    add r10, r6
    vmov.w r5, s1
    mov.w r6, 4591
    smmulr.w r0, r11, r5
    mls.w r11, r6, r0, r11
    smmulr.w r0, r12, r5
    mls.w r12, r6, r0, r12
    smmulr.w r0, lr, r5
    mls.w lr, r6, r0, lr
    smmulr.w r0, r10, r5
    mls.w r10, r6, r0, r10
    pkhbt r11, r11, r12, lsl #16
    pkhbt lr, lr, r10, lsl #16
    vmov.w r0, s0
    str.w r11, [r0, #8]
    str.w lr, [r0, #12]
    ldr.w r5, [r2, #16]
    ldr.w r6, [r2, #20]
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
    ldr.w r3, [r1, #8]
    ldr.w r4, [r1, #12]
    ldr.w r5, [r2, #8]
    ldr.w r6, [r2, #12]
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
    ldr.w r3, [r1, #16]
    ldr.w r4, [r1, #20]
    ldr.w r5, [r2, #0]
    ldr.w r6, [r2, #4]
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
    vmov.w r3, r4, s9, s10
    add r7, r3
    add r8, r4
    vmov.w r3, r4, s11, s12
    add r9, r3
    add r10, r4
    vmov.w r3, s1
    mov.w r4, 4591
    smmulr.w r0, r7, r3
    mls.w r7, r4, r0, r7
    smmulr.w r0, r8, r3
    mls.w r8, r4, r0, r8
    smmulr.w r0, r9, r3
    mls.w r9, r4, r0, r9
    smmulr.w r0, r10, r3
    mls.w r10, r4, r0, r10
    pkhbt r7, r7, r8, lsl #16
    pkhbt r9, r9, r10, lsl #16
    vmov.w r0, s0
    str.w r7, [r0, #16]
    str.w r9, [r0, #20]
    ldr.w r3, [r1, #24]
    ldr.w r4, [r1, #28]
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
    ldr.w r5, [r2, #8]
    ldr.w r6, [r2, #12]
    ldr.w r3, [r1, #16]
    ldr.w r4, [r1, #20]
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
    ldr.w r5, [r2, #16]
    ldr.w r6, [r2, #20]
    ldr.w r3, [r1, #8]
    ldr.w r4, [r1, #12]
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
    ldr.w r5, [r2, #24]
    ldr.w r6, [r2, #28]
    ldr.w r3, [r1, #0]
    ldr.w r4, [r1, #4]
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
    vmov.w r3, r4, s13, s14
    add r11, r3
    add r12, r4
    vmov.w r3, r4, s15, s16
    add lr, r3
    add r10, r4
    vmov.w r3, s1
    mov.w r4, 4591
    smmulr.w r0, r11, r3
    mls.w r11, r4, r0, r11
    smmulr.w r0, r12, r3
    mls.w r12, r4, r0, r12
    smmulr.w r0, lr, r3
    mls.w lr, r4, r0, lr
    smmulr.w r0, r10, r3
    mls.w r10, r4, r0, r10
    pkhbt r11, r11, r12, lsl #16
    pkhbt lr, lr, r10, lsl #16
    vmov.w r0, s0
    str.w r11, [r0, #24]
    str.w lr, [r0, #28]
    ldr.w r3, [r1, #8]
    ldr.w r4, [r1, #12]
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
    ldr.w r3, [r1, #16]
    ldr.w r4, [r1, #20]
    ldr.w r5, [r2, #16]
    ldr.w r6, [r2, #20]
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
    ldr.w r3, [r1, #24]
    ldr.w r4, [r1, #28]
    ldr.w r5, [r2, #8]
    ldr.w r6, [r2, #12]
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
    ldr.w r3, [r1, #24]
    vmov.w r5, r6, s17, s18
    add r7, r5
    add r8, r6
    vmov.w r5, r6, s19, s20
    add r9, r5
    add r10, r6
    vmov.w r5, s1
    mov.w r6, 4591
    smmulr.w r0, r7, r5
    mls.w r7, r6, r0, r7
    smmulr.w r0, r8, r5
    mls.w r8, r6, r0, r8
    smmulr.w r0, r9, r5
    mls.w r9, r6, r0, r9
    smmulr.w r0, r10, r5
    mls.w r10, r6, r0, r10
    pkhbt r7, r7, r8, lsl #16
    pkhbt r9, r9, r10, lsl #16
    vmov.w r0, s0
    str.w r7, [r0, #32]
    str.w r9, [r0, #36]
    ldr.w r5, [r2, #16]
    ldr.w r6, [r2, #20]
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
    ldr.w r5, [r2, #24]
    ldr.w r6, [r2, #28]
    ldr.w r3, [r1, #16]
    ldr.w r4, [r1, #20]
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
    vmov.w r3, r4, s21, s22
    add r11, r3
    add r12, r4
    vmov.w r3, r4, s23, s24
    add lr, r3
    add r10, r4
    vmov.w r3, s1
    mov.w r4, 4591
    smmulr.w r0, r11, r3
    mls.w r11, r4, r0, r11
    smmulr.w r0, r12, r3
    mls.w r12, r4, r0, r12
    smmulr.w r0, lr, r3
    mls.w lr, r4, r0, lr
    smmulr.w r0, r10, r3
    mls.w r10, r4, r0, r10
    pkhbt r11, r11, r12, lsl #16
    pkhbt lr, lr, r10, lsl #16
    vmov.w r0, s0
    str.w r11, [r0, #40]
    str.w lr, [r0, #44]
    ldr.w r3, [r1, #24]
    ldr.w r4, [r1, #28]
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
    vmov.w r3, r4, s25, s26
    add r7, r3
    add r8, r4
    vmov.w r3, r4, s27, s28
    add r9, r3
    add r10, r4
    vmov.w r3, r4, s29, s30
    add r11, r3
    add r12, r4
    vmov.w r3, s31
    add.w lr, r3
    vmov.w r3, s1
    mov.w r4, 4591
    smmulr.w r5, r7, r3
    mls.w r7, r4, r5, r7
    smmulr.w r5, r8, r3
    mls.w r8, r4, r5, r8
    smmulr.w r5, r9, r3
    mls.w r9, r4, r5, r9
    smmulr.w r5, r10, r3
    mls.w r10, r4, r5, r10
    smmulr.w r5, r11, r3
    mls.w r11, r4, r5, r11
    smmulr.w r5, r12, r3
    mls.w r12, r4, r5, r12
    smmulr.w r5, lr, r3
    mls.w lr, r4, r5, lr
    pkhbt r7, r7, r8, lsl #16
    pkhbt r9, r9, r10, lsl #16
    pkhbt r11, r11, r12, lsl #16
    str.w r7, [r0, #48]
    str.w r9, [r0, #52]
    str.w r11, [r0, #56]
    strh.w lr, [r0, #60]

    vpop.w {s16-s31}
    pop.w {r4-r12, pc}
