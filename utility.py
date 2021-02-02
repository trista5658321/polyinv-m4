LENGTH = 256
LENGTH_1 = LENGTH 
LENGTH_2 = LENGTH * 2

S_Q_R2INV = "s2"

def printIn(asm):
    print("\t" + asm)

def head(name, params, data_config):
    print(".p2align 2,,3")
    print(".syntax	unified")

    if data_config:
        data_config()
    else:
        print(".text")

    print(".global	" + name + "")
    print(".type 	" + name + ", %function")
    print("@ void " + name + params)
    print(name + ":")
    printIn("push {r1-r12, lr}")

def _func_head(name, func):
    print(".p2align 2,,3")
    print(".syntax	unified")
    print(".text")
    print(name + ":")
    printIn("push.w {lr}")
    func()
    printIn("pop.w {pc}")

def end():
    printIn("pop {r1-r12, pc}")

def get_q(rd):
    printIn("mov.w " + rd + ", 4591")

def get_2P15(rd):
    printIn("movw.w " + rd + ", #32768")

def get_qR2inv(rd, init = False):
    if not init:
        printIn("vmov.w " + rd + ", " + S_Q_R2INV)
    else:
        printIn("movw.w " + rd + ", #18015")
        printIn("movt.w " + rd + ", #14")
        printIn("vmov.w " + S_Q_R2INV + ", " + rd)

def barrett(x, q, qR2inv, tmp):
    if x == tmp:
        print("barrett error: rd == A")
    printIn("smmulr " + tmp + ", " + x + ", " + qR2inv)
    printIn("mls " + x + ", " + tmp + ", " + q + ", " + x)

def barrett_16x2i (x, q, qR2inv, _2P15, high_16, low_16):
    printIn("smlawb.w " + low_16 + ", " + qR2inv + ", " + x + ", " + _2P15)
    printIn("smlawt.w " + high_16 + ", " + qR2inv + ", " + x + ", " + _2P15)
    printIn("smulbt.w " + low_16 + ", " + q + ", " + low_16)
    printIn("smulbt.w " + high_16 + ", " + q + ", " + high_16)
    printIn("pkhbt.w " + low_16 + ", " + low_16 + ", " + high_16 + ", LSL #16")
    printIn("ssub16.w " + x + ", " + x + ", " + low_16)

def bl_polymul(__polymul_name):
    printIn("bl	" + __polymul_name)

def bl_polyadd(__polyadd_name):
    printIn("bl	" + __polyadd_name)