.p2align 2,,3
.syntax unified
.text

.global gf_polymul_128x128
.type gf_polymul_128x128, %function
@ 128x128 Toom-4
@ void gf_polymul_128x128(uint32_t *h, uint32_t *c, uint32_t *f)
gf_polymul_128x128:
  push.w {r4-r12, lr}
  vpush.w { s16 }
  sub.w sp, sp, #2432
  vmov.w s0, r0
  mov.w r0, sp
  vmov.w s1, r2
  movw.w r2, #6343
  movw.w r3, #32768
  movw.w r4, #21759
  movt.w r4, #10
  add.w lr, r0, #64
gf_polymul_128x128_eval_input_c_body:
  ldr.w r8, [r1, #192]
  ldr.w r7, [r1, #64]
  ldr.w r6, [r1, #128]
  ldr.w r5, [r1], #4
  lsl.w r9, r7, #1
  lsl.w r10, r8, #3
  bfc.w r9, #16, #1
  bfc.w r10, #16, #3
  sadd16.w r9, r9, r10
  smlawb.w r10, r4, r9, r3
  smlawt.w r11, r4, r9, r3
  smulbt.w r10, r2, r10
  smulbt.w r11, r2, r11
  pkhbt.w r10, r10, r11, lsl #16
  ssub16.w r9, r9, r10
  lsl.w r10, r6, #2
  bfc.w r10, #16, #2
  sadd16.w r10, r10, r5
  sadd16.w r11, r10, r9
  ssub16.w r10, r10, r9
  smlawb.w r9, r4, r11, r3
  smlawt.w r12, r4, r11, r3
  smulbt.w r9, r2, r9
  smulbt.w r12, r2, r12
  pkhbt.w r9, r9, r12, lsl #16
  ssub16.w r11, r11, r9
  smlawb.w r9, r4, r10, r3
  smlawt.w r12, r4, r10, r3
  smulbt.w r9, r2, r9
  smulbt.w r12, r2, r12
  pkhbt.w r9, r9, r12, lsl #16
  ssub16.w r10, r10, r9
  lsl.w r9, r5, #3
  lsl.w r12, r6, #1
  bfc.w r9, #16, #3
  bfc.w r12, #16, #1
  sadd16.w r9, r9, r12
  sadd16.w r5, r5, r6
  smlawb.w r6, r4, r9, r3
  smlawt.w r12, r4, r9, r3
  smulbt.w r6, r2, r6
  smulbt.w r12, r2, r12
  pkhbt.w r6, r6, r12, lsl #16
  ssub16.w r9, r9, r6
  lsl.w r12, r7, #2
  bfc.w r12, #16, #2
  sadd16.w r12, r12, r8
  sadd16.w r7, r7, r8
  sadd16.w r9, r9, r12
  smlawb.w r6, r4, r9, r3
  smlawt.w r8, r4, r9, r3
  smulbt.w r6, r2, r6
  smulbt.w r8, r2, r8
  pkhbt.w r6, r6, r8, lsl #16
  ssub16.w r9, r9, r6
  ssub16.w r8, r5, r7
  sadd16.w r7, r5, r7
  smlawb.w r5, r4, r8, r3
  smlawt.w r6, r4, r8, r3
  smulbt.w r5, r2, r5
  smulbt.w r6, r2, r6
  pkhbt.w r5, r5, r6, lsl #16
  ssub16.w r8, r8, r5
  smlawb.w r5, r4, r7, r3
  smlawt.w r6, r4, r7, r3
  smulbt.w r5, r2, r5
  smulbt.w r6, r2, r6
  pkhbt.w r5, r5, r6, lsl #16
  ssub16.w r7, r7, r5
  str.w r10, [r0, #256]
  str.w r11, [r0, #192]
  str.w r8, [r0, #128]
  str.w r7, [r0, #64]
  str.w r9, [r0], #4
  cmp.w r0, lr
  bne.w gf_polymul_128x128_eval_input_c_body
  vmov.w r2, s1
  add.w r0, r0, #256
  vmov.w s1, r1
  movw.w r1, #6343
  movw.w r3, #32768
  movw.w r4, #21759
  movt.w r4, #10
  add.w lr, r0, #64
gf_polymul_128x128_eval_input_d_body:
  ldr.w r8, [r2, #192]
  ldr.w r7, [r2, #64]
  ldr.w r6, [r2, #128]
  ldr.w r5, [r2], #4
  lsl.w r9, r7, #1
  lsl.w r10, r8, #3
  bfc.w r9, #16, #1
  bfc.w r10, #16, #3
  sadd16.w r9, r9, r10
  smlawb.w r10, r4, r9, r3
  smlawt.w r11, r4, r9, r3
  smulbt.w r10, r1, r10
  smulbt.w r11, r1, r11
  pkhbt.w r10, r10, r11, lsl #16
  ssub16.w r9, r9, r10
  lsl.w r10, r6, #2
  bfc.w r10, #16, #2
  sadd16.w r10, r10, r5
  sadd16.w r11, r10, r9
  ssub16.w r10, r10, r9
  smlawb.w r9, r4, r11, r3
  smlawt.w r12, r4, r11, r3
  smulbt.w r9, r1, r9
  smulbt.w r12, r1, r12
  pkhbt.w r9, r9, r12, lsl #16
  ssub16.w r11, r11, r9
  smlawb.w r9, r4, r10, r3
  smlawt.w r12, r4, r10, r3
  smulbt.w r9, r1, r9
  smulbt.w r12, r1, r12
  pkhbt.w r9, r9, r12, lsl #16
  ssub16.w r10, r10, r9
  lsl.w r9, r5, #3
  lsl.w r12, r6, #1
  bfc.w r9, #16, #3
  bfc.w r12, #16, #1
  sadd16.w r9, r9, r12
  sadd16.w r5, r5, r6
  smlawb.w r6, r4, r9, r3
  smlawt.w r12, r4, r9, r3
  smulbt.w r6, r1, r6
  smulbt.w r12, r1, r12
  pkhbt.w r6, r6, r12, lsl #16
  ssub16.w r9, r9, r6
  lsl.w r12, r7, #2
  bfc.w r12, #16, #2
  sadd16.w r12, r12, r8
  sadd16.w r7, r7, r8
  sadd16.w r9, r9, r12
  smlawb.w r6, r4, r9, r3
  smlawt.w r8, r4, r9, r3
  smulbt.w r6, r1, r6
  smulbt.w r8, r1, r8
  pkhbt.w r6, r6, r8, lsl #16
  ssub16.w r9, r9, r6
  ssub16.w r8, r5, r7
  sadd16.w r7, r5, r7
  smlawb.w r5, r4, r8, r3
  smlawt.w r6, r4, r8, r3
  smulbt.w r5, r1, r5
  smulbt.w r6, r1, r6
  pkhbt.w r5, r5, r6, lsl #16
  ssub16.w r8, r8, r5
  smlawb.w r5, r4, r7, r3
  smlawt.w r6, r4, r7, r3
  smulbt.w r5, r1, r5
  smulbt.w r6, r1, r6
  pkhbt.w r5, r5, r6, lsl #16
  ssub16.w r7, r7, r5
  str.w r10, [r0, #256]
  str.w r11, [r0, #192]
  str.w r8, [r0, #128]
  str.w r7, [r0, #64]
  str.w r9, [r0], #4
  cmp.w r0, lr
  bne.w gf_polymul_128x128_eval_input_d_body
  vmov.w r1, s1
  add.w r0, r0, #256
  vmov.w r4, s0
  mov.w r5, r0
  sub.w r6, r1, #64
  sub.w r7, r2, #64
  mov.w r1, r6
  mov.w r2, r7
  bl.w gf_polymul_32x32
  add.w r0, r5, #512
  sub.w r1, r5, #640
  sub.w r2, r5, #320
  bl.w gf_polymul_32x32
  add.w r0, r5, #128
  sub.w r1, r5, #576
  sub.w r2, r5, #256
  bl.w gf_polymul_32x32
  add.w r0, r5, #640
  sub.w r1, r5, #512
  sub.w r2, r5, #192
  bl.w gf_polymul_32x32
  add.w r0, r5, #256
  sub.w r1, r5, #448
  sub.w r2, r5, #128
  bl.w gf_polymul_32x32
  add.w r0, r5, #768
  sub.w r1, r5, #384
  sub.w r2, r5, #64
  bl.w gf_polymul_32x32
  add.w r0, r5, #384
  add.w r1, r6, #192
  add.w r2, r7, #192
  bl.w gf_polymul_32x32
  vmov.w s0, r4
  mov.w r0, r5
  add.w lr, r0, #128
  movw.w r12, #21759
  movt.w r12, #10
  movw.w r11, #6343
	 movw.w r10, :lower16:Toom4Table_6343
	 movt.w r10, :upper16:Toom4Table_6343
	 vldm	r10, {s1-s16} @ read table
  add.w r1, r0, #768
gf_polymul_128x128_interpol_output_body:
  ldr.w r10, [r0, #384]
  ldr.w r9, [r1]
  ldr.w r8, [r0, #256]
  ldr.w r7, [r0, #640]
  ldr.w r6, [r0, #128]
  ldr.w r3, [r0, #512]
  ldr.w r4, [r0], #4
  pkhbt.w r1, r4, r6, lsl #16
  pkhtb.w r2, r6, r4, asr #16
  pkhbt.w r4, r7, r8, lsl #16
  pkhtb.w r5, r8, r7, asr #16
  pkhbt.w r6, r9, r10, lsl #16
  pkhtb.w r7, r10, r9, asr #16
  vmov.w r10, s1
  smuad.w r8, r10, r1
  smuad.w r9, r10, r2
  vmov.w r10, s16 @ bot = A[1][1]
  smlabb.w r8, r10, r3, r8
  smlabt.w r9, r10, r3, r9
  vmov.w r10, s2
  smladx.w r8, r10, r4, r8
  smladx.w r9, r10, r5, r9
  vmov.w r10, s3
  smladx.w r8, r10, r6, r8
  smladx.w r9, r10, r7, r9
  smmulr.w r10, r12, r8
  mls.w r8, r11, r10, r8
  smmulr.w r10, r12, r9
  mls.w r9, r11, r10, r9
  pkhbt.w r8, r8, r9, lsl #16
  str.w r8, [r0, #508]
  vmov.w r10, s4
  smuadx.w r8, r10, r1
  smuadx.w r9, r10, r2
  vmov.w r10, s5
  smlad.w r8, r10, r4, r8
  smlad.w r9, r10, r5, r9
  vmov.w r10, s6
  smlad.w r8, r10, r6, r8
  smlad.w r9, r10, r7, r9
  smmulr.w r10, r12, r8
  mls.w r8, r11, r10, r8
  smmulr.w r10, r12, r9
  mls.w r9, r11, r10, r9
  pkhbt.w r8, r8, r9, lsl #16
  str.w r8, [r0, #124]
  vmov.w r10, s7
  smuad.w r8, r10, r1
  smuad.w r9, r10, r2
  vmov.w r10, s16 @ top = A[3][1]
  smlatb.w r8, r10, r3, r8
  smlatt.w r9, r10, r3, r9
  vmov.w r10, s8
  smlad.w r8, r10, r4, r8
  smlad.w r9, r10, r5, r9
  vmov.w r10, s9 @ top = A[3][6]
  smlatt.w r8, r10, r6, r8
  smlatt.w r9, r10, r7, r9
  smmulr.w r10, r12, r8
  mls.w r8, r11, r10, r8
  smmulr.w r10, r12, r9
  mls.w r9, r11, r10, r9
  pkhbt.w r8, r8, r9, lsl #16
  str.w r8, [r0, #636]
  vmov.w r10, s10
  smuadx.w r8, r10, r1
  smuadx.w r9, r10, r2
  vmov.w r10, s11
  smlad.w r8, r10, r4, r8
  smlad.w r9, r10, r5, r9
  vmov.w r10, s12
  smlad.w r8, r10, r6, r8
  smlad.w r9, r10, r7, r9
  smmulr.w r10, r12, r8
  mls.w r8, r11, r10, r8
  smmulr.w r10, r12, r9
  mls.w r9, r11, r10, r9
  pkhbt.w r8, r8, r9, lsl #16
  str.w r8, [r0, #252]
  vmov.w r10, s13
  smuad.w r8, r10, r1
  smuad.w r9, r10, r2
  vmov.w r10, s9 @ bot = A[5][1]
  smlabb.w r8, r10, r3, r8
  smlabt.w r9, r10, r3, r9
  vmov.w r10, s14
  smladx.w r8, r10, r4, r8
  smladx.w r9, r10, r5, r9
  vmov.w r10, s15
  smladx.w r8, r10, r6, r8
  smladx.w r9, r10, r7, r9
  smmulr.w r10, r12, r8
  mls.w r8, r11, r10, r8
  smmulr.w r10, r12, r9
  mls.w r9, r11, r10, r9
  pkhbt.w r8, r8, r9, lsl #16
  add.w r1, r0, #768
  str.w r8, [r1, #-4]
  cmp.w r0, lr
  bne.w gf_polymul_128x128_interpol_output_body
  sub.w r1, r0, #128
  vmov.w r0, s0
  ldr.w r3, [r1, #4]
  ldr.w r4, [r1, #8]
  ldr.w r5, [r1, #12]
  ldr.w r6, [r1, #16]
  ldr.w r7, [r1, #20]
  ldr.w r8, [r1, #24]
  ldr.w r9, [r1, #28]
  ldr.w r10, [r1, #32]
  ldr.w r11, [r1, #36]
  ldr.w r12, [r1, #40]
  ldr.w lr, [r1, #44]
  ldr.w r2, [r1], #48
  str.w r3, [r0, #4]
  str.w r4, [r0, #8]
  str.w r5, [r0, #12]
  str.w r6, [r0, #16]
  str.w r7, [r0, #20]
  str.w r8, [r0, #24]
  str.w r9, [r0, #28]
  str.w r10, [r0, #32]
  str.w r11, [r0, #36]
  str.w r12, [r0, #40]
  str.w lr, [r0, #44]
  str.w r2, [r0], #48
  ldr.w r3, [r1, #4]
  ldr.w r4, [r1, #8]
  ldr.w r5, [r1, #12]
  ldr.w r2, [r1], #16
  str.w r3, [r0, #4]
  str.w r4, [r0, #8]
  str.w r5, [r0, #12]
  str.w r2, [r0], #16
  add.w lr, r0, #380
gf_polymul_128x128_copy_output_B:
  ldr.w r8, [r1, #452]
  ldr.w r3, [r1, #4]
  ldr.w r9, [r1, #456]
  ldr.w r4, [r1, #8]
  ldr.w r10, [r1, #460]
  ldr.w r5, [r1, #12]
  ldr.w r11, [r1, #464]
  ldr.w r6, [r1, #16]
  ldr.w r7, [r1, #448]
  ldr.w r2, [r1], #20
  sadd16.w r2, r2, r7
  sadd16.w r3, r3, r8
  sadd16.w r4, r4, r9
  sadd16.w r5, r5, r10
  sadd16.w r6, r6, r11
  str.w r3, [r0, #4]
  str.w r4, [r0, #8]
  str.w r5, [r0, #12]
  str.w r6, [r0, #16]
  str.w r2, [r0], #20
  cmp.w r0, lr
  bne.w gf_polymul_128x128_copy_output_B
  ldr.w r3, [r1, #448]
  ldr.w r2, [r1], #4
  sadd16.w r2, r2, r3
  str.w r2, [r0], #4
  ldr.w r3, [r1, #4]
  ldr.w r4, [r1, #8]
  ldr.w r5, [r1, #12]
  ldr.w r6, [r1, #16]
  ldr.w r7, [r1, #20]
  ldr.w r8, [r1, #24]
  ldr.w r9, [r1, #28]
  ldr.w r10, [r1, #32]
  ldr.w r11, [r1, #36]
  ldr.w r12, [r1, #40]
  ldr.w lr, [r1, #44]
  ldr.w r2, [r1], #48
  str.w r3, [r0, #4]
  str.w r4, [r0, #8]
  str.w r5, [r0, #12]
  str.w r6, [r0, #16]
  str.w r7, [r0, #20]
  str.w r8, [r0, #24]
  str.w r9, [r0, #28]
  str.w r10, [r0, #32]
  str.w r11, [r0, #36]
  str.w r12, [r0, #40]
  str.w lr, [r0, #44]
  str.w r2, [r0], #48
  ldr.w r3, [r1, #4]
  ldr.w r4, [r1, #8]
  ldr.w r5, [r1, #12]
  ldr.w r2, [r1], #16
  str.w r3, [r0, #4]
  str.w r4, [r0, #8]
  str.w r5, [r0, #12]
  str.w r2, [r0], #16
  add.w sp, sp, #2432
  vpop.w { s16 }
  pop.w {r4-r12, pc}
Toom4Table_6343:
	.word	4156424190	@ s1
	.word	4248765297	@ s2^
	.word	4246536190	@ s3^
	.word	4190963779	@ s4^
	.word	121243715	@ s5
	.word	263994	@ s6
	.word	4087280543	@ s7
	.word	4179493216	@ s8
	.word	4087285333	@ s9#
	.word	103941153	@ s10^
	.word	4173726753	@ s11
	.word	4294703302	@ s12
	.word	138546275	@ s13
	.word	4110222193	@ s14^
	.word	48499811	@ s15^
	.word	4179493005	@ s16#
@ # two packed coeffs ^ swapped position
Toom4Table_6343_end:
