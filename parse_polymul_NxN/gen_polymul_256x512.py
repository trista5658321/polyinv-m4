import sys, pathlib
sys.path.append(str(pathlib.Path(__file__).parent.absolute().parent))

from utility import printIn, head, end, get_qR2inv

# s0: dest
# s2: qR2inv
# s3: g | f (1st mul end: f+128)
# s4: g+512 (g_h) [s19]
# s1: flag, default: 1 [s20]
# s5: c0 addr [s17]
# s6: c0' addr

def data_config():
    print(".text")
    print("Toom4Table_4591_2x2:")
    printIn(".word 4194697214")
    printIn(".word 66848888  ")
    printIn(".word 145489918 ")
    printIn(".word 4219667963")
    printIn(".word 87754235  ")
    printIn(".word 263483    ")
    printIn(".word 4144690955")
    printIn(".word 16713465  ")
    printIn(".word 4144758733")
    printIn(".word 75236093  ")
    printIn(".word 4207215357")
    printIn(".word 4294703813")
    printIn(".word 100272375 ")
    printIn(".word 4261546104")
    printIn(".word 4149545207")
    printIn(".word 16777012  ")

# r0: sp, r1: f, s3: g
def get_toom_C(label_postfix = ""):
    printIn("movw.w r2, #4591")
    printIn("movw.w r3, #32768")
    printIn("vmov.w r4, s2")
    printIn("add.w lr, r0, #128")
    print("gf_polymul_256x256_eval_input_c_body" + label_postfix + ":")
    printIn("ldr.w r8, [r1, #384]")
    printIn("ldr.w r7, [r1, #128]")
    printIn("ldr.w r6, [r1, #256]")
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
    printIn("str.w r10, [r0, #512]")
    printIn("str.w r11, [r0, #384]")
    printIn("str.w r8, [r0, #256]")
    printIn("str.w r7, [r0, #128]")
    printIn("str.w r9, [r0], #4")
    printIn("cmp.w r0, lr")
    printIn("bne.w gf_polymul_256x256_eval_input_c_body" + label_postfix)
    printIn("vmov.w r2, s3")
    printIn("add.w r0, r0, #512")
    printIn("vmov.w s3, r1")
    printIn("movw.w r1, #4591")
    printIn("movw.w r3, #32768")
    printIn("vmov.w r4, s2")
    printIn("add.w lr, r0, #128")
    print("gf_polymul_256x256_eval_input_d_body" + label_postfix + ":")
    printIn("ldr.w r8, [r2, #384]")
    printIn("ldr.w r7, [r2, #128]")
    printIn("ldr.w r6, [r2, #256]")
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
    printIn("str.w r10, [r0, #512]")
    printIn("str.w r11, [r0, #384]")
    printIn("str.w r8, [r0, #256]")
    printIn("str.w r7, [r0, #128]")
    printIn("str.w r9, [r0], #4")
    printIn("cmp.w r0, lr")
    printIn("bne.w gf_polymul_256x256_eval_input_d_body" + label_postfix)
    printIn("vmov.w r1, s3")
    printIn("add.w r0, r0, #512")
    # printIn("vmov.w r4, s0")
    printIn("vmov.w r4, s3")
    printIn("mov.w r5, r0")
    printIn("sub.w r6, r1, #128")
    printIn("sub.w r7, r2, #128")
    printIn("mov.w r1, r6")
    printIn("mov.w r2, r7")
    printIn("bl.w gf_polymul_64x64")
    printIn("add.w r0, r5, #1024")
    printIn("sub.w r1, r5, #1280")
    printIn("sub.w r2, r5, #640")
    printIn("bl.w gf_polymul_64x64")
    printIn("add.w r0, r5, #256")
    printIn("sub.w r1, r5, #1152")
    printIn("sub.w r2, r5, #512")
    printIn("bl.w gf_polymul_64x64")
    printIn("add.w r0, r5, #1280")
    printIn("sub.w r1, r5, #1024")
    printIn("sub.w r2, r5, #384")
    printIn("bl.w gf_polymul_64x64")
    printIn("add.w r0, r5, #512")
    printIn("sub.w r1, r5, #896")
    printIn("sub.w r2, r5, #256")
    printIn("bl.w gf_polymul_64x64")
    printIn("add.w r0, r5, #1536")
    printIn("sub.w r1, r5, #768")
    printIn("sub.w r2, r5, #128")
    printIn("bl.w gf_polymul_64x64")
    printIn("add.w r0, r5, #768")
    printIn("add.w r1, r6, #384")
    printIn("add.w r2, r7, #384")
    printIn("bl.w gf_polymul_64x64")
    # printIn("vmov.w s0, r4")
    printIn("vmov.w s3, r4")
    printIn("mov.w r0, r5")
    printIn("add.w lr, r0, #256")
    printIn("vmov.w r12, s2")
    printIn("movw.w r11, #4591")
    printIn("add.w r1, r0, #1536")
    print("gf_polymul_256x256_interpol_output_body" + label_postfix + ":")
    printIn("ldr.w r10, [r0, #768]")
    printIn("ldr.w r9, [r1]")
    printIn("ldr.w r8, [r0, #512]")
    printIn("ldr.w r7, [r0, #1280]")
    printIn("ldr.w r6, [r0, #256]")
    printIn("ldr.w r3, [r0, #1024]")
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
    printIn("str.w r8, [r0, #1020]")
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
    printIn("str.w r8, [r0, #252]")
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
    printIn("str.w r8, [r0, #1276]")
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
    printIn("str.w r8, [r0, #508]")
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
    printIn("add.w r1, r0, #1536")
    printIn("str.w r8, [r1, #-4]")
    printIn("cmp.w r0, lr")
    printIn("bne.w gf_polymul_256x256_interpol_output_body" + label_postfix)
    # f * g (256x256) get c_0 - c_5

def gf_polymul_256x256_copy_output_C(rs,label_postfix = ""):
    rd = ["r1" , "r12"][rs == "r1"]
    printIn("add.w lr, r0, #88")
    print("gf_polymul_256x256_copy_output_C" + label_postfix + ":")
    printIn("ldr.w r3, [" + rs + ", #4]")
    printIn("ldr.w r4, [" + rs + ", #8]")
    printIn("ldr.w r5, [" + rs + ", #12]")
    printIn("ldr.w r6, [" + rs + ", #16]")
    printIn("ldr.w r7, [" + rs + ", #20]")
    printIn("ldr.w r8, [" + rs + ", #24]")
    printIn("ldr.w r9, [" + rs + ", #28]")
    printIn("ldr.w r10, [" + rs + ", #32]")
    printIn("ldr.w r11, [" + rs + ", #36]")
    printIn("ldr.w " + rd + ", [" + rs + ", #40]")
    printIn("ldr.w r2, [" + rs + "], #44")
    printIn("str.w r3, [r0, #4]")
    printIn("str.w r4, [r0, #8]")
    printIn("str.w r5, [r0, #12]")
    printIn("str.w r6, [r0, #16]")
    printIn("str.w r7, [r0, #20]")
    printIn("str.w r8, [r0, #24]")
    printIn("str.w r9, [r0, #28]")
    printIn("str.w r10, [r0, #32]")
    printIn("str.w r11, [r0, #36]")
    printIn("str.w " + rd + ", [r0, #40]")
    printIn("str.w r2, [r0], #44")
    printIn("cmp.w r0, lr")
    printIn("bne.w gf_polymul_256x256_copy_output_C" + label_postfix)
    printIn("ldr.w r3, [" + rs + ", #4]")
    printIn("ldr.w r4, [" + rs + ", #8]")
    printIn("ldr.w r5, [" + rs + ", #12]")
    printIn("ldr.w r6, [" + rs + ", #16]")
    printIn("ldr.w r7, [" + rs + ", #20]")
    printIn("ldr.w r8, [" + rs + ", #24]")
    printIn("ldr.w r9, [" + rs + ", #28]")
    printIn("ldr.w r10, [" + rs + ", #32]")
    printIn("ldr.w r11, [" + rs + ", #36]")
    printIn("ldr.w r2, [" + rs + "], #40")
    printIn("str.w r3, [r0, #4]")
    printIn("str.w r4, [r0, #8]")
    printIn("str.w r5, [r0, #12]")
    printIn("str.w r6, [r0, #16]")
    printIn("str.w r7, [r0, #20]")
    printIn("str.w r8, [r0, #24]")
    printIn("str.w r9, [r0, #28]")
    printIn("str.w r10, [r0, #32]")
    printIn("str.w r11, [r0, #36]")
    printIn("str.w r2, [r0], #40")

def gf_polymul_256x256_copy_output_B(rd, label_postfix = ""):
    printIn("add.w lr, r0, #380")

    print("gf_polymul_256x256_copy_output_B" + label_postfix + ":")
    printIn("ldr.w r8, [" + rd + ", #900]")
    printIn("ldr.w r3, [" + rd + ", #4]")
    printIn("ldr.w r9, [" + rd + ", #904]")
    printIn("ldr.w r4, [" + rd + ", #8]")
    printIn("ldr.w r10, [" + rd + ", #908]")
    printIn("ldr.w r5, [" + rd + ", #12]")
    printIn("ldr.w r11, [" + rd + ", #912]")
    printIn("ldr.w r6, [" + rd + ", #16]")
    printIn("ldr.w r7, [" + rd + ", #896]")
    printIn("ldr.w r2, [" + rd + "], #20")
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
    printIn("bne.w gf_polymul_256x256_copy_output_B" + label_postfix)
    # printIn("ldr.w r5, [" + rd + ", #900]")
    # printIn("ldr.w r3, [" + rd + ", #4]")
    # printIn("ldr.w r4, [" + rd + ", #896]")
    # printIn("ldr.w r2, [" + rd + "], #8")
    # printIn("sadd16.w r2, r2, r4")
    # printIn("sadd16.w r3, r3, r5")
    # printIn("str.w r3, [r0, #4]")
    # printIn("str.w r2, [r0], #8")

    printIn("ldr.w r4, [" + rd + ", #896]")
    printIn("ldr.w r2, [" + rd + "], #4")
    printIn("sadd16.w r2, r2, r4")
    printIn("str.w r2, [r0], #4")

def gf_polymul_256x256_copy_output_overlap_A(two, one, label_postfix = ""):
    printIn("add.w lr, r0, #120")
    print("gf_polymul_256x256_copy_output_overlap_A" + label_postfix + ":")
    printIn("ldr.w r3, [" + two + ", #4]")
    printIn("ldr.w r4, [" + two + ", #8]")
    
    printIn("ldr.w r8, [" + two + ", #896]")
    printIn("ldr.w r9, [" + two + ", #900]")
    printIn("ldr.w r10, [" + two + ", #904]")

    printIn("ldr.w r2, [" + two + "], #12")

    printIn("ldr.w r6, [" + one + ", #4]")
    printIn("ldr.w r7, [" + one + ", #8]")
    printIn("ldr.w r5, [" + one + "], #12")

    printIn("sadd16.w r2, r2, r5")
    printIn("sadd16.w r3, r3, r6")
    printIn("sadd16.w r4, r4, r7")
    printIn("sadd16.w r2, r2, r8")
    printIn("sadd16.w r3, r3, r9")
    printIn("sadd16.w r4, r4, r10")
    
    printIn("str.w r3, [r0, #4]")
    printIn("str.w r4, [r0, #8]")
    printIn("str.w r2, [r0], #12")
    printIn("cmp.w r0, lr")
    printIn("bne.w gf_polymul_256x256_copy_output_overlap_A" + label_postfix)

    printIn("ldr.w r3, [" + two + ", #4]")
    printIn("ldr.w r8, [" + two + ", #896]")
    printIn("ldr.w r9, [" + two + ", #900]")
    printIn("ldr.w r2, [" + two + "], #8")
    printIn("ldr.w r6, [" + one + ", #4]")
    printIn("ldr.w r5, [" + one + "], #8")
    printIn("sadd16.w r2, r2, r5")
    printIn("sadd16.w r3, r3, r6")
    printIn("sadd16.w r2, r2, r8")
    printIn("sadd16.w r3, r3, r9")
    printIn("str.w r3, [r0, #4]")
    printIn("str.w r2, [r0], #8")

def gf_polymul_256x256_copy_output_overlap_B(two, two_1, label_postfix = ""):
    printIn("add.w lr, r0, #256")
    print("gf_polymul_256x256_copy_output_overlap_B" + label_postfix + ":")
    printIn("ldr.w r3, [" + two + ", #4]")
    printIn("ldr.w r4, [" + two + ", #896]")
    printIn("ldr.w r5, [" + two + ", #900]")
    printIn("ldr.w r2, [" + two + "], #8")

    printIn("ldr.w r7, [" + two_1 + ", #4]")
    printIn("ldr.w r8, [" + two_1 + ", #896]")
    printIn("ldr.w r9, [" + two_1 + ", #900]")
    printIn("ldr.w r6, [" + two_1 + "], #8")

    printIn("sadd16.w r2, r2, r4")
    printIn("sadd16.w r3, r3, r5")

    printIn("sadd16.w r2, r2, r6")
    printIn("sadd16.w r3, r3, r7")

    printIn("sadd16.w r2, r2, r8")
    printIn("sadd16.w r3, r3, r9")
    
    printIn("str.w r3, [r0, #4]")
    printIn("str.w r2, [r0], #8")
    printIn("cmp.w r0, lr")
    printIn("bne.w gf_polymul_256x256_copy_output_overlap_B" + label_postfix)


# s5: c0 addr
# s6: c0' addr
def output(label_postfix = ""):
    # r1: f * g_l c_0 addr
    printIn("vmov.w r1, s5")
    printIn("vmov.w r0, s0")
    printIn("add.w lr, r0, #88")
    print("gf_polymul_256x256_copy_output_A" + label_postfix + ":")
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
    printIn("ldr.w r2, [r1], #44")
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
    printIn("str.w r2, [r0], #44")
    printIn("cmp.w r0, lr")
    printIn("bne.w gf_polymul_256x256_copy_output_A" + label_postfix)
    printIn("ldr.w r3, [r1, #4]")
    printIn("ldr.w r4, [r1, #8]")
    printIn("ldr.w r5, [r1, #12]")
    printIn("ldr.w r6, [r1, #16]")
    printIn("ldr.w r7, [r1, #20]")
    printIn("ldr.w r8, [r1, #24]")
    printIn("ldr.w r9, [r1, #28]")
    printIn("ldr.w r10, [r1, #32]")
    printIn("ldr.w r11, [r1, #36]")
    printIn("ldr.w r2, [r1], #40")
    printIn("str.w r3, [r0, #4]")
    printIn("str.w r4, [r0, #8]")
    printIn("str.w r5, [r0, #12]")
    printIn("str.w r6, [r0, #16]")
    printIn("str.w r7, [r0, #20]")
    printIn("str.w r8, [r0, #24]")
    printIn("str.w r9, [r0, #28]")
    printIn("str.w r10, [r0, #32]")
    printIn("str.w r11, [r0, #36]")
    printIn("str.w r2, [r0], #40")

    # printIn("add.w lr, r0, #760")

    # printIn("add.w lr, r0, #380")
    # print("gf_polymul_256x256_copy_output_B" + label_postfix + ":")
    # printIn("ldr.w r8, [r1, #900]")
    # printIn("ldr.w r3, [r1, #4]")
    # printIn("ldr.w r9, [r1, #904]")
    # printIn("ldr.w r4, [r1, #8]")
    # printIn("ldr.w r10, [r1, #908]")
    # printIn("ldr.w r5, [r1, #12]")
    # printIn("ldr.w r11, [r1, #912]")
    # printIn("ldr.w r6, [r1, #16]")
    # printIn("ldr.w r7, [r1, #896]")
    # printIn("ldr.w r2, [r1], #20")
    # printIn("sadd16.w r2, r2, r7")
    # printIn("sadd16.w r3, r3, r8")
    # printIn("sadd16.w r4, r4, r9")
    # printIn("sadd16.w r5, r5, r10")
    # printIn("sadd16.w r6, r6, r11")
    # printIn("str.w r3, [r0, #4]")
    # printIn("str.w r4, [r0, #8]")
    # printIn("str.w r5, [r0, #12]")
    # printIn("str.w r6, [r0, #16]")
    # printIn("str.w r2, [r0], #20")
    # printIn("cmp.w r0, lr")
    # printIn("bne.w gf_polymul_256x256_copy_output_B" + label_postfix)
    # # printIn("ldr.w r5, [r1, #900]")
    # # printIn("ldr.w r3, [r1, #4]")
    # # printIn("ldr.w r4, [r1, #896]")
    # # printIn("ldr.w r2, [r1], #8")
    # # printIn("sadd16.w r2, r2, r4")
    # # printIn("sadd16.w r3, r3, r5")
    # # printIn("str.w r3, [r0, #4]")
    # # printIn("str.w r2, [r0], #8")

    # printIn("ldr.w r4, [r1, #896]")
    # printIn("ldr.w r2, [r1], #4")
    # printIn("sadd16.w r2, r2, r4")
    # printIn("str.w r2, [r0], #4")

    gf_polymul_256x256_copy_output_B("r1")
    
    printIn("vmov.w r12, s6")

    gf_polymul_256x256_copy_output_overlap_A("r1", "r12")
    gf_polymul_256x256_copy_output_overlap_B("r1", "r12")
    gf_polymul_256x256_copy_output_overlap_A("r12", "r1", "_0")

    gf_polymul_256x256_copy_output_B("r12", "_0")
    gf_polymul_256x256_copy_output_C("r12")
    # printIn("add.w lr, r0, #88")
    # print("gf_polymul_256x256_copy_output_C" + label_postfix + ":")
    # printIn("ldr.w r3, [r1, #4]")
    # printIn("ldr.w r4, [r1, #8]")
    # printIn("ldr.w r5, [r1, #12]")
    # printIn("ldr.w r6, [r1, #16]")
    # printIn("ldr.w r7, [r1, #20]")
    # printIn("ldr.w r8, [r1, #24]")
    # printIn("ldr.w r9, [r1, #28]")
    # printIn("ldr.w r10, [r1, #32]")
    # printIn("ldr.w r11, [r1, #36]")
    # printIn("ldr.w r12, [r1, #40]")
    # printIn("ldr.w r2, [r1], #44")
    # printIn("str.w r3, [r0, #4]")
    # printIn("str.w r4, [r0, #8]")
    # printIn("str.w r5, [r0, #12]")
    # printIn("str.w r6, [r0, #16]")
    # printIn("str.w r7, [r0, #20]")
    # printIn("str.w r8, [r0, #24]")
    # printIn("str.w r9, [r0, #28]")
    # printIn("str.w r10, [r0, #32]")
    # printIn("str.w r11, [r0, #36]")
    # printIn("str.w r12, [r0, #40]")
    # printIn("str.w r2, [r0], #44")
    # printIn("cmp.w r0, lr")
    # printIn("bne.w gf_polymul_256x256_copy_output_C" + label_postfix)
    # printIn("ldr.w r3, [r1, #4]")
    # printIn("ldr.w r4, [r1, #8]")
    # printIn("ldr.w r5, [r1, #12]")
    # printIn("ldr.w r6, [r1, #16]")
    # printIn("ldr.w r7, [r1, #20]")
    # printIn("ldr.w r8, [r1, #24]")
    # printIn("ldr.w r9, [r1, #28]")
    # printIn("ldr.w r10, [r1, #32]")
    # printIn("ldr.w r11, [r1, #36]")
    # printIn("ldr.w r2, [r1], #40")
    # printIn("str.w r3, [r0, #4]")
    # printIn("str.w r4, [r0, #8]")
    # printIn("str.w r5, [r0, #12]")
    # printIn("str.w r6, [r0, #16]")
    # printIn("str.w r7, [r0, #20]")
    # printIn("str.w r8, [r0, #24]")
    # printIn("str.w r9, [r0, #28]")
    # printIn("str.w r10, [r0, #32]")
    # printIn("str.w r11, [r0, #36]")
    # printIn("str.w r2, [r0], #40")

def polymul(label_postfix = ""):
    printIn("vmov.w s0, r0")
    printIn("mov.w r0, sp")
    printIn("vmov.w s3, r2")
    # set flag
    printIn("mov.w r3, #0")
    printIn("vmov.w s1, r3")
    # store g_h
    printIn("add.w r3, r2, #512")
    printIn("vmov.w s4, r3")

    # mul twice: f * g_l, f * g_h
    # r0: sp, r1: f, s3: g
    print("gf_polymul_256x256_begin:")
    get_toom_C()

    # compare if f * g_h
    printIn("vmov.w r10, s1")
    printIn("cmp.w r10, #1")
    printIn("beq.w output")
    
    # store c_0 position
    printIn("sub.w r1, r0, #256")
    printIn("vmov.w s5, r1")
    # set flag
    printIn("add.w r10, #1")
    printIn("vmov.w s1, r10")
    # params
    printIn("add.w r0, r1, #1792")
    printIn("vmov.w r1, s3")
    printIn("sub.w r1, r1, #128")
    printIn("vmov.w s3, s4")
    printIn("b.w gf_polymul_256x256_begin")

    print("output:")
    # store c_0' position
    printIn("sub.w r1, r0, #256")
    printIn("vmov.w s6, r1")
    output()
    

def main():
    f_name = "__polymul_256x512"
    f_params = "(int *h, int *f,int *g)"
    head(f_name, f_params, data_config)
    printIn("vpush.w { s16-s25 }")
    printIn("adr lr, Toom4Table_4591_2x2")
    printIn("vldm lr, {s10-s25}")
    printIn("sub.w sp, sp, #6144")
    get_qR2inv("r5", True)
    polymul()
    printIn("add.w sp, sp, #6144")
    printIn("vpop.w { s16-s25 }")
    end()

main()