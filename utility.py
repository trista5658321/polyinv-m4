import sys

LENGTH = 64

argv_len = len(sys.argv)

if argv_len > 1:
    LENGTH = int(sys.argv[1])

LENGTH_1 = LENGTH
LENGTH_2 = LENGTH

if argv_len > 3:
    LENGTH_1 = LENGTH * int(sys.argv[2])
    LENGTH_2 = LENGTH * int(sys.argv[3])

S_Q_R2INV = "s2"

def printIn(asm):
    print("\t" + asm)

def head(name, params, data_config = None):
    print(".p2align 2,,3")
    print(".syntax unified")

    if data_config:
        data_config()
    else:
        print(".text")

    print(".global " + name + "")
    print(".type  " + name + ", %function")
    print("@ void " + name + params)
    print(name + ":")
    printIn("push {r1-r12, lr}")

def _func_head(name, func, *args):
    print(".p2align 2,,3")
    print(".syntax unified")
    print(".text")
    print(name + ":")
    printIn("push.w {lr}")
    if args:
        func(*args)
    else:
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

def montgomery(low, high, tmp, q, qinv):
    printIn("mul.w %s, %s, %s" % (tmp, low, qinv))
    printIn("smlal %s, %s, %s, %s" % (low, high, tmp, q))

def barrett_16x2i (x, q, qR2inv, _2P15, high_16, low_16):
    printIn("smlawb.w " + low_16 + ", " + qR2inv + ", " + x + ", " + _2P15)
    printIn("smlawt.w " + high_16 + ", " + qR2inv + ", " + x + ", " + _2P15)
    printIn("smulbt.w " + low_16 + ", " + q + ", " + low_16)
    printIn("smulbt.w " + high_16 + ", " + q + ", " + high_16)
    printIn("pkhbt.w " + low_16 + ", " + low_16 + ", " + high_16 + ", LSL #16")
    printIn("ssub16.w " + x + ", " + x + ", " + low_16)

def bl_polymul(__polymul_name):
    printIn("bl " + __polymul_name)

def bl_polyadd(__polyadd_name):
    printIn("bl " + __polyadd_name)

def prologue_mod3(name, params, regs, s_regs = "") :
    print("// void %s %s;" % (name, params))
    print(".p2align 2,,3")
    print(".syntax unified")
    print(".text")
    print(".global %s" % (name))
    print(".type %s, %%function" % (name))
    print("%s:" % (name))
    printIn("push.w {%s,lr}" % (regs))
    if s_regs:
        printIn("vpush.w {%s}" % (s_regs))

def epilogue_mod3(regs, s_regs = "") :
    if s_regs:
        printIn("vpop.w {%s}" % (s_regs))
    printIn("pop.w {%s,pc}" % (regs))

def reduce_mod3_5 (X, scr, r03) : # at most 5, r03 = 0x03030303 
    printIn("usub8.w %s, %s, %s // >= 3 ?" % (scr, X, r03))
    printIn("sel.w %s, %s, %s // select" % (X, scr, X))

def reduce_mod3_11 (X, scr, r03) : # r03 = 0x03030303, good for 4 adds
    printIn("bic.w %s, %s, %s // top 3b < 3" % (scr, X, r03))
    printIn("and.w %s, %s, %s // bot 2b < 4" % (X, X, r03))
    printIn("add.w %s, %s, %s, LSR #2 // range <=5" % (X, X, scr))
    reduce_mod3_5 (X, scr, r03)
    
def reduce_mod3_32 (X, scr, r03) : # r03 = 0x03030303, good for 8/12 adds
    printIn("bic.w %s, %s, %s // top 3b < 8" % (scr, X, r03))
    printIn("and.w %s, %s, %s // bot 2b < 4" % (X, X, r03))
    printIn("add.w %s, %s, %s, LSR #2 // range <=10" % (X, X, scr))
    reduce_mod3_11 (X, scr, r03)

def reduce_mod3_lazy (X, scr, r03) : # r03 = 0x03030303, good for 16 adds
    printIn("and.w %s, %s, #0xF0F0F0F0 // top 4b < 16" % (scr, X))
    printIn("and.w %s, %s, #0x0F0F0F0F // bot 4b < 16" % (X, X))
    printIn("add.w %s, %s, %s, LSR #4 // range < 31" % (X, X, scr))

def reduce_mod3_full (X, scr, r03) :
    reduce_mod3_lazy(X, scr, r03)
    reduce_mod3_32(X, scr, r03)

# For stack
VALID_CONST_MAX_12 = 4092
def set_stack(space, pos = "start", tmp = "r12"):
    cmd = "sub.w"
    if pos != "start":
        cmd = "add.w"
    
    if space > VALID_CONST_MAX_12:
        printIn("movw.w %s, #%d" % (tmp, space))
        printIn("%s sp, %s" % (cmd, tmp))
    else:
        printIn("%s sp, #%d" % (cmd, space))
