import sys, pathlib
sys.path.append(str(pathlib.Path(__file__).parent.absolute().parent))

from utility import printIn

def polymul(label_postfix = ""):
    printIn("sub.w sp, sp, #2432")
    printIn("vmov.w s9, r0")
    printIn("mov.w r0, sp")
    printIn("vmov.w s3, r2")
    printIn("movw.w r2, #4591")
    printIn("movw.w r3, #32768")
    printIn("vmov.w r4, s2")
    printIn("add.w lr, r0, #64")
    print("gf_polymul_128x128_eval_input_c_body" + label_postfix + ":")
    printIn("ldr.w r8, [r1, #192]")
    printIn("ldr.w r7, [r1, #64]")
    printIn("ldr.w r6, [r1, #128]")
    printIn("ldr.w r5, [r1], #4")
    printIn("lsl.w r9, r7, #1")
    printIn("lsl.w r10, r8, #3")
    printIn("bfc.w r9, #16, #1")
    printIn("bfc.w r10, #16, #3")
    printIn("sadd16.w r9, r9, r10")
    printIn("smlawb.w r10, r4, r9, r3")
    printIn("smlawt.w r11, r4, r9, r3")
    printIn("smulbt.w r10, r2, r10")
    printIn("smulbt.w r11, r2, r11")
    printIn("pkhbt.w r10, r10, r11, lsl #16")
    printIn("ssub16.w r9, r9, r10")
    printIn("lsl.w r10, r6, #2")
    printIn("bfc.w r10, #16, #2")
    printIn("sadd16.w r10, r10, r5")
    printIn("sadd16.w r11, r10, r9")
    printIn("ssub16.w r10, r10, r9")
    printIn("smlawb.w r9, r4, r11, r3")
    printIn("smlawt.w r12, r4, r11, r3")
    printIn("smulbt.w r9, r2, r9")
    printIn("smulbt.w r12, r2, r12")
    printIn("pkhbt.w r9, r9, r12, lsl #16")
    printIn("ssub16.w r11, r11, r9")
    printIn("smlawb.w r9, r4, r10, r3")
    printIn("smlawt.w r12, r4, r10, r3")
    printIn("smulbt.w r9, r2, r9")
    printIn("smulbt.w r12, r2, r12")
    printIn("pkhbt.w r9, r9, r12, lsl #16")
    printIn("ssub16.w r10, r10, r9")
    printIn("lsl.w r9, r5, #3")
    printIn("lsl.w r12, r6, #1")
    printIn("bfc.w r9, #16, #3")
    printIn("bfc.w r12, #16, #1")
    printIn("sadd16.w r9, r9, r12")
    printIn("sadd16.w r5, r5, r6")
    printIn("smlawb.w r6, r4, r9, r3")
    printIn("smlawt.w r12, r4, r9, r3")
    printIn("smulbt.w r6, r2, r6")
    printIn("smulbt.w r12, r2, r12")
    printIn("pkhbt.w r6, r6, r12, lsl #16")
    printIn("ssub16.w r9, r9, r6")
    printIn("lsl.w r12, r7, #2")
    printIn("bfc.w r12, #16, #2")
    printIn("sadd16.w r12, r12, r8")
    printIn("sadd16.w r7, r7, r8")
    printIn("sadd16.w r9, r9, r12")
    printIn("smlawb.w r6, r4, r9, r3")
    printIn("smlawt.w r8, r4, r9, r3")
    printIn("smulbt.w r6, r2, r6")
    printIn("smulbt.w r8, r2, r8")
    printIn("pkhbt.w r6, r6, r8, lsl #16")
    printIn("ssub16.w r9, r9, r6")
    printIn("ssub16.w r8, r5, r7")
    printIn("sadd16.w r7, r5, r7")
    printIn("smlawb.w r5, r4, r8, r3")
    printIn("smlawt.w r6, r4, r8, r3")
    printIn("smulbt.w r5, r2, r5")
    printIn("smulbt.w r6, r2, r6")
    printIn("pkhbt.w r5, r5, r6, lsl #16")
    printIn("ssub16.w r8, r8, r5")
    printIn("smlawb.w r5, r4, r7, r3")
    printIn("smlawt.w r6, r4, r7, r3")
    printIn("smulbt.w r5, r2, r5")
    printIn("smulbt.w r6, r2, r6")
    printIn("pkhbt.w r5, r5, r6, lsl #16")
    printIn("ssub16.w r7, r7, r5")
    printIn("str.w r10, [r0, #256]")
    printIn("str.w r11, [r0, #192]")
    printIn("str.w r8, [r0, #128]")
    printIn("str.w r7, [r0, #64]")
    printIn("str.w r9, [r0], #4")
    printIn("cmp.w r0, lr")
    printIn("bne.w gf_polymul_128x128_eval_input_c_body" + label_postfix)
    printIn("vmov.w r2, s3")
    printIn("add.w r0, r0, #256")
    printIn("vmov.w s3, r1")
    printIn("movw.w r1, #4591")
    printIn("movw.w r3, #32768")
    printIn("vmov.w r4, s2")
    printIn("add.w lr, r0, #64")
    print("gf_polymul_128x128_eval_input_d_body" + label_postfix + ":")
    printIn("ldr.w r8, [r2, #192]")
    printIn("ldr.w r7, [r2, #64]")
    printIn("ldr.w r6, [r2, #128]")
    printIn("ldr.w r5, [r2], #4")
    printIn("lsl.w r9, r7, #1")
    printIn("lsl.w r10, r8, #3")
    printIn("bfc.w r9, #16, #1")
    printIn("bfc.w r10, #16, #3")
    printIn("sadd16.w r9, r9, r10")
    printIn("smlawb.w r10, r4, r9, r3")
    printIn("smlawt.w r11, r4, r9, r3")
    printIn("smulbt.w r10, r1, r10")
    printIn("smulbt.w r11, r1, r11")
    printIn("pkhbt.w r10, r10, r11, lsl #16")
    printIn("ssub16.w r9, r9, r10")
    printIn("lsl.w r10, r6, #2")
    printIn("bfc.w r10, #16, #2")
    printIn("sadd16.w r10, r10, r5")
    printIn("sadd16.w r11, r10, r9")
    printIn("ssub16.w r10, r10, r9")
    printIn("smlawb.w r9, r4, r11, r3")
    printIn("smlawt.w r12, r4, r11, r3")
    printIn("smulbt.w r9, r1, r9")
    printIn("smulbt.w r12, r1, r12")
    printIn("pkhbt.w r9, r9, r12, lsl #16")
    printIn("ssub16.w r11, r11, r9")
    printIn("smlawb.w r9, r4, r10, r3")
    printIn("smlawt.w r12, r4, r10, r3")
    printIn("smulbt.w r9, r1, r9")
    printIn("smulbt.w r12, r1, r12")
    printIn("pkhbt.w r9, r9, r12, lsl #16")
    printIn("ssub16.w r10, r10, r9")
    printIn("lsl.w r9, r5, #3")
    printIn("lsl.w r12, r6, #1")
    printIn("bfc.w r9, #16, #3")
    printIn("bfc.w r12, #16, #1")
    printIn("sadd16.w r9, r9, r12")
    printIn("sadd16.w r5, r5, r6")
    printIn("smlawb.w r6, r4, r9, r3")
    printIn("smlawt.w r12, r4, r9, r3")
    printIn("smulbt.w r6, r1, r6")
    printIn("smulbt.w r12, r1, r12")
    printIn("pkhbt.w r6, r6, r12, lsl #16")
    printIn("ssub16.w r9, r9, r6")
    printIn("lsl.w r12, r7, #2")
    printIn("bfc.w r12, #16, #2")
    printIn("sadd16.w r12, r12, r8")
    printIn("sadd16.w r7, r7, r8")
    printIn("sadd16.w r9, r9, r12")
    printIn("smlawb.w r6, r4, r9, r3")
    printIn("smlawt.w r8, r4, r9, r3")
    printIn("smulbt.w r6, r1, r6")
    printIn("smulbt.w r8, r1, r8")
    printIn("pkhbt.w r6, r6, r8, lsl #16")
    printIn("ssub16.w r9, r9, r6")
    printIn("ssub16.w r8, r5, r7")
    printIn("sadd16.w r7, r5, r7")
    printIn("smlawb.w r5, r4, r8, r3")
    printIn("smlawt.w r6, r4, r8, r3")
    printIn("smulbt.w r5, r1, r5")
    printIn("smulbt.w r6, r1, r6")
    printIn("pkhbt.w r5, r5, r6, lsl #16")
    printIn("ssub16.w r8, r8, r5")
    printIn("smlawb.w r5, r4, r7, r3")
    printIn("smlawt.w r6, r4, r7, r3")
    printIn("smulbt.w r5, r1, r5")
    printIn("smulbt.w r6, r1, r6")
    printIn("pkhbt.w r5, r5, r6, lsl #16")
    printIn("ssub16.w r7, r7, r5")
    printIn("str.w r10, [r0, #256]")
    printIn("str.w r11, [r0, #192]")
    printIn("str.w r8, [r0, #128]")
    printIn("str.w r7, [r0, #64]")
    printIn("str.w r9, [r0], #4")
    printIn("cmp.w r0, lr")
    printIn("bne.w gf_polymul_128x128_eval_input_d_body" + label_postfix)
    printIn("vmov.w r1, s3")
    printIn("add.w r0, r0, #256")
    printIn("vmov.w r4, s9")
    printIn("mov.w r5, r0")
    printIn("sub.w r6, r1, #64")
    printIn("sub.w r7, r2, #64")
    printIn("mov.w r1, r6")
    printIn("mov.w r2, r7")
    printIn("bl.w gf_polymul_32x32")
    printIn("add.w r0, r5, #512")
    printIn("sub.w r1, r5, #640")
    printIn("sub.w r2, r5, #320")
    printIn("bl.w gf_polymul_32x32")
    printIn("add.w r0, r5, #128")
    printIn("sub.w r1, r5, #576")
    printIn("sub.w r2, r5, #256")
    printIn("bl.w gf_polymul_32x32")
    printIn("add.w r0, r5, #640")
    printIn("sub.w r1, r5, #512")
    printIn("sub.w r2, r5, #192")
    printIn("bl.w gf_polymul_32x32")
    printIn("add.w r0, r5, #256")
    printIn("sub.w r1, r5, #448")
    printIn("sub.w r2, r5, #128")
    printIn("bl.w gf_polymul_32x32")
    printIn("add.w r0, r5, #768")
    printIn("sub.w r1, r5, #384")
    printIn("sub.w r2, r5, #64")
    printIn("bl.w gf_polymul_32x32")
    printIn("add.w r0, r5, #384")
    printIn("add.w r1, r6, #192")
    printIn("add.w r2, r7, #192")
    printIn("bl.w gf_polymul_32x32")
    printIn("vmov.w s9, r4")
    printIn("mov.w r0, r5")
    printIn("add.w lr, r0, #128")
    printIn("vmov.w r12, s2")
    printIn("movw.w r11, #4591")
    printIn("add.w r1, r0, #768")
    print("gf_polymul_128x128_interpol_output_body" + label_postfix + ":")
    printIn("ldr.w r10, [r0, #384]")
    printIn("ldr.w r9, [r1]")
    printIn("ldr.w r8, [r0, #256]")
    printIn("ldr.w r7, [r0, #640]")
    printIn("ldr.w r6, [r0, #128]")
    printIn("ldr.w r3, [r0, #512]")
    printIn("ldr.w r4, [r0], #4")
    printIn("pkhbt.w r1, r4, r6, lsl #16")
    printIn("pkhtb.w r2, r6, r4, asr #16")
    printIn("pkhbt.w r4, r7, r8, lsl #16")
    printIn("pkhtb.w r5, r8, r7, asr #16")
    printIn("pkhbt.w r6, r9, r10, lsl #16")
    printIn("pkhtb.w r7, r10, r9, asr #16")
    printIn("vmov.w r10, s10")
    printIn("smuad.w r8, r10, r1")
    printIn("smuad.w r9, r10, r2")
    printIn("vmov.w r10, s25 @ bot = A[1][1]")
    printIn("smlabb.w r8, r10, r3, r8")
    printIn("smlabt.w r9, r10, r3, r9")
    printIn("vmov.w r10, s11")
    printIn("smladx.w r8, r10, r4, r8")
    printIn("smladx.w r9, r10, r5, r9")
    printIn("vmov.w r10, s12")
    printIn("smladx.w r8, r10, r6, r8")
    printIn("smladx.w r9, r10, r7, r9")
    printIn("smmulr.w r10, r12, r8")
    printIn("mls.w r8, r11, r10, r8")
    printIn("smmulr.w r10, r12, r9")
    printIn("mls.w r9, r11, r10, r9")
    printIn("pkhbt.w r8, r8, r9, lsl #16")
    printIn("str.w r8, [r0, #508]")
    printIn("vmov.w r10, s13")
    printIn("smuadx.w r8, r10, r1")
    printIn("smuadx.w r9, r10, r2")
    printIn("vmov.w r10, s14")
    printIn("smlad.w r8, r10, r4, r8")
    printIn("smlad.w r9, r10, r5, r9")
    printIn("vmov.w r10, s15")
    printIn("smlad.w r8, r10, r6, r8")
    printIn("smlad.w r9, r10, r7, r9")
    printIn("smmulr.w r10, r12, r8")
    printIn("mls.w r8, r11, r10, r8")
    printIn("smmulr.w r10, r12, r9")
    printIn("mls.w r9, r11, r10, r9")
    printIn("pkhbt.w r8, r8, r9, lsl #16")
    printIn("str.w r8, [r0, #124]")
    printIn("vmov.w r10, s16")
    printIn("smuad.w r8, r10, r1")
    printIn("smuad.w r9, r10, r2")
    printIn("vmov.w r10, s25 @ top = A[3][1]")
    printIn("smlatb.w r8, r10, r3, r8")
    printIn("smlatt.w r9, r10, r3, r9")
    printIn("vmov.w r10, s17")
    printIn("smlad.w r8, r10, r4, r8")
    printIn("smlad.w r9, r10, r5, r9")
    printIn("vmov.w r10, s18 @ top = A[3][6]")
    printIn("smlatt.w r8, r10, r6, r8")
    printIn("smlatt.w r9, r10, r7, r9")
    printIn("smmulr.w r10, r12, r8")
    printIn("mls.w r8, r11, r10, r8")
    printIn("smmulr.w r10, r12, r9")
    printIn("mls.w r9, r11, r10, r9")
    printIn("pkhbt.w r8, r8, r9, lsl #16")
    printIn("str.w r8, [r0, #636]")
    printIn("vmov.w r10, s19")
    printIn("smuadx.w r8, r10, r1")
    printIn("smuadx.w r9, r10, r2")
    printIn("vmov.w r10, s20")
    printIn("smlad.w r8, r10, r4, r8")
    printIn("smlad.w r9, r10, r5, r9")
    printIn("vmov.w r10, s21")
    printIn("smlad.w r8, r10, r6, r8")
    printIn("smlad.w r9, r10, r7, r9")
    printIn("smmulr.w r10, r12, r8")
    printIn("mls.w r8, r11, r10, r8")
    printIn("smmulr.w r10, r12, r9")
    printIn("mls.w r9, r11, r10, r9")
    printIn("pkhbt.w r8, r8, r9, lsl #16")
    printIn("str.w r8, [r0, #252]")
    printIn("vmov.w r10, s22")
    printIn("smuad.w r8, r10, r1")
    printIn("smuad.w r9, r10, r2")
    printIn("vmov.w r10, s18 @ bot = A[5][1]")
    printIn("smlabb.w r8, r10, r3, r8")
    printIn("smlabt.w r9, r10, r3, r9")
    printIn("vmov.w r10, s23")
    printIn("smladx.w r8, r10, r4, r8")
    printIn("smladx.w r9, r10, r5, r9")
    printIn("vmov.w r10, s24")
    printIn("smladx.w r8, r10, r6, r8")
    printIn("smladx.w r9, r10, r7, r9")
    printIn("smmulr.w r10, r12, r8")
    printIn("mls.w r8, r11, r10, r8")
    printIn("smmulr.w r10, r12, r9")
    printIn("mls.w r9, r11, r10, r9")
    printIn("pkhbt.w r8, r8, r9, lsl #16")
    printIn("add.w r1, r0, #768")
    printIn("str.w r8, [r1, #-4]")
    printIn("cmp.w r0, lr")
    printIn("bne.w gf_polymul_128x128_interpol_output_body" + label_postfix)
    printIn("sub.w r1, r0, #128")
    printIn("vmov.w r0, s9")
    printIn("ldr.w r3, [r1, #4]")
    printIn("ldr.w r4, [r1, #8]")
    printIn("ldr.w r5, [r1, #12]")
    printIn("ldr.w r6, [r1, #16]")
    printIn("ldr.w r7, [r1, #20]")
    printIn("ldr.w r8, [r1, #24]")
    printIn("ldr.w r9, [r1, #28]")
    printIn("ldr.w r10, [r1, #32]")
    printIn("ldr.w r11, [r1, #36]")
    printIn("ldr.w r12, [r1, #40]")
    printIn("ldr.w lr, [r1, #44]")
    printIn("ldr.w r2, [r1], #48")
    printIn("str.w r3, [r0, #4]")
    printIn("str.w r4, [r0, #8]")
    printIn("str.w r5, [r0, #12]")
    printIn("str.w r6, [r0, #16]")
    printIn("str.w r7, [r0, #20]")
    printIn("str.w r8, [r0, #24]")
    printIn("str.w r9, [r0, #28]")
    printIn("str.w r10, [r0, #32]")
    printIn("str.w r11, [r0, #36]")
    printIn("str.w r12, [r0, #40]")
    printIn("str.w lr, [r0, #44]")
    printIn("str.w r2, [r0], #48")
    printIn("ldr.w r3, [r1, #4]")
    printIn("ldr.w r4, [r1, #8]")
    printIn("ldr.w r5, [r1, #12]")
    printIn("ldr.w r2, [r1], #16")
    printIn("str.w r3, [r0, #4]")
    printIn("str.w r4, [r0, #8]")
    printIn("str.w r5, [r0, #12]")
    printIn("str.w r2, [r0], #16")
    printIn("add.w lr, r0, #380")
    print("gf_polymul_128x128_copy_output_B" + label_postfix + ":")
    printIn("ldr.w r8, [r1, #452]")
    printIn("ldr.w r3, [r1, #4]")
    printIn("ldr.w r9, [r1, #456]")
    printIn("ldr.w r4, [r1, #8]")
    printIn("ldr.w r10, [r1, #460]")
    printIn("ldr.w r5, [r1, #12]")
    printIn("ldr.w r11, [r1, #464]")
    printIn("ldr.w r6, [r1, #16]")
    printIn("ldr.w r7, [r1, #448]")
    printIn("ldr.w r2, [r1], #20")
    printIn("sadd16.w r2, r2, r7")
    printIn("sadd16.w r3, r3, r8")
    printIn("sadd16.w r4, r4, r9")
    printIn("sadd16.w r5, r5, r10")
    printIn("sadd16.w r6, r6, r11")
    printIn("str.w r3, [r0, #4]")
    printIn("str.w r4, [r0, #8]")
    printIn("str.w r5, [r0, #12]")
    printIn("str.w r6, [r0, #16]")
    printIn("str.w r2, [r0], #20")
    printIn("cmp.w r0, lr")
    printIn("bne.w gf_polymul_128x128_copy_output_B" + label_postfix)
    printIn("ldr.w r3, [r1, #448]")
    printIn("ldr.w r2, [r1], #4")
    printIn("sadd16.w r2, r2, r3")
    printIn("str.w r2, [r0], #4")
    printIn("ldr.w r3, [r1, #4]")
    printIn("ldr.w r4, [r1, #8]")
    printIn("ldr.w r5, [r1, #12]")
    printIn("ldr.w r6, [r1, #16]")
    printIn("ldr.w r7, [r1, #20]")
    printIn("ldr.w r8, [r1, #24]")
    printIn("ldr.w r9, [r1, #28]")
    printIn("ldr.w r10, [r1, #32]")
    printIn("ldr.w r11, [r1, #36]")
    printIn("ldr.w r12, [r1, #40]")
    printIn("ldr.w lr, [r1, #44]")
    printIn("ldr.w r2, [r1], #48")
    printIn("str.w r3, [r0, #4]")
    printIn("str.w r4, [r0, #8]")
    printIn("str.w r5, [r0, #12]")
    printIn("str.w r6, [r0, #16]")
    printIn("str.w r7, [r0, #20]")
    printIn("str.w r8, [r0, #24]")
    printIn("str.w r9, [r0, #28]")
    printIn("str.w r10, [r0, #32]")
    printIn("str.w r11, [r0, #36]")
    printIn("str.w r12, [r0, #40]")
    printIn("str.w lr, [r0, #44]")
    printIn("str.w r2, [r0], #48")
    printIn("ldr.w r3, [r1, #4]")
    printIn("ldr.w r4, [r1, #8]")
    printIn("ldr.w r5, [r1, #12]")
    printIn("ldr.w r2, [r1], #16")
    printIn("str.w r3, [r0, #4]")
    printIn("str.w r4, [r0, #8]")
    printIn("str.w r5, [r0, #12]")
    printIn("str.w r2, [r0], #16")
    printIn("add.w sp, sp, #2432")
