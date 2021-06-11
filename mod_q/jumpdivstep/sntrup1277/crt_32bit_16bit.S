.macro montgomery_mul res0, res1, coef0, coef1, qinv, q, tmp
    smull \res0, \res1, \coef0, \coef1
    mul.w \tmp, \res0, \qinv
    smlal \res0, \res1, \tmp, \q
.endm

.macro barrett_reduce_negq_bot tar, qinv, q, tmp
    smmulr \tmp, \tar, \qinv
    smlabb \tar, \tmp, \q, \tar
.endm

.macro barrett_reduce_negq_top tar, qinv, q, tmp
    smmulr \tmp, \tar, \qinv
    smlabt \tar, \tmp, \q, \tar
.endm

.align
.syntax unified
.text
prime_pad:
    .word 7757398
    .word 2409205759
    .word 10063873
    .word 559168
    .word 280158719
    .word 3778611542
    .word 545116

.equ length, 2560
.global crt_32bit_16bit
.type crt_32bit_16bit, %function
crt_32bit_16bit:
    push {r4-r11, lr}
    adr.w lr, prime_pad
    ldm lr, {r6-r12}
    add.w lr, r0, #2*length
    vmov s0, lr
    vmov s1, r6
crt_32bit_16bit_body:
.rept 8
    ldm r1!, {r3-r4}
    vmov r6, s1
    montgomery_mul r5, r3, r3, r6, r7, r8, lr
    montgomery_mul r5, r4, r4, r6, r7, r8, lr
    ldr.w r5, [r2], #4
    sbfx r6, r5, #16, #16
    sbfx r5, r5, #0, #16
    sub.w r5, r5, r3
    sub.w r6, r6, r4
    barrett_reduce_negq_bot r5, r9, r10, lr
    barrett_reduce_negq_bot r6, r9, r10, lr
    smulbt r5, r5, r10
    smulbt r6, r6, r10
    barrett_reduce_negq_bot r5, r9, r10, lr
    barrett_reduce_negq_bot r6, r9, r10, lr
    smlabb r5, r5, r11, r3
    smlabb r6, r6, r11, r4
    barrett_reduce_negq_top r5, r12, r11, lr
    barrett_reduce_negq_top r6, r12, r11, lr
    pkhbt r5, r5, r6, lsl #16
    str.w r5, [r0], #4
.endr
    vmov lr, s0
    cmp.w r0, lr
    bne.w crt_32bit_16bit_body
    pop {r4-r11, pc}
    
