from utility_polymul import BASE, MUL_LABEL_HAED_LAST, max_V_coeffi as mul_max_coeffi, ac, r_14, coeffi_per_strip, coeffi_per_block, bytes_per_block

def prologue(coeffi, suffix = ""):
    __polymul_name = "__polymul_" + str(BASE) + "x" + str(coeffi) + "_mod2"
    __polymul_name += suffix
    print(".p2align 2,,3")
    print(".syntax unified")
    print(".text")
    print(".global " + __polymul_name + "")
    print(".type  " + __polymul_name + ", %function")
    print(__polymul_name + ":")
    print("	push.w {lr}")

def epilogue(coeffi):
    print("	b.w mul_%d" % (coeffi))

# i of polymul label
def get_mul_head_id4_reg():
    return ac(BASE//coeffi_per_strip - 1, 4)

def get_mul_label_id0_reg(coeffi, _mul_max_coeffi = mul_max_coeffi):
    label_i = (BASE + _mul_max_coeffi - coeffi) // coeffi_per_strip
    return ac(label_i,0)

# Case 1: head - coeffi_per_block ~ end - coeffi_per_block
def mul_jump_head_4_4(coeffi, _mul_max_coeffi = mul_max_coeffi):
    prologue(coeffi, "_jump_head")
    mul_label_id0_reg = get_mul_label_id0_reg(coeffi, _mul_max_coeffi)
    # initial value
    print("	mov.w %s, #%d" % (mul_label_id0_reg, 0))
    # change horizontal initial index
    shift_blocks = (_mul_max_coeffi - coeffi + coeffi_per_block) // coeffi_per_block
    shift_offset = shift_blocks * bytes_per_block
    print("	sub.w %s, #%d" % (r_14, shift_offset))

    epilogue(coeffi)

# Case 2: head - coeffi_per_block ~ end
def mul_jump_head_4_0(coeffi, _mul_max_coeffi = mul_max_coeffi):
    prologue(coeffi, "_jump_head")

    mul_head_id4_reg = get_mul_head_id4_reg()
    mul_coeffi_id0_reg = get_mul_label_id0_reg(coeffi, _mul_max_coeffi)

    # change horizontal initial index
    shift_blocks = (_mul_max_coeffi - coeffi) // coeffi_per_block
    shift_offset = shift_blocks * bytes_per_block
    print("	bl.w %s" % MUL_LABEL_HAED_LAST)

    if mul_coeffi_id0_reg != mul_head_id4_reg:
        print("	mov.w %s, %s" % (mul_coeffi_id0_reg, mul_head_id4_reg))
    
    if shift_blocks != 0:
        print("	sub.w %s, #%d" % (r_14, shift_offset))
    
    epilogue(coeffi)

def mul_full(coeffi, _mul_max_coeffi = mul_max_coeffi):
    
    prologue(coeffi)

    mul_head_id4_reg = get_mul_head_id4_reg()
    mul_coeffi_id0_reg = get_mul_label_id0_reg(coeffi)

    # change horizontal initial index
    shift_blocks = (_mul_max_coeffi - coeffi) // coeffi_per_block
    shift_offset = shift_blocks * bytes_per_block
    print("	bl.w mul_head")

    if mul_coeffi_id0_reg != mul_head_id4_reg:
        print("	mov.w %s, %s" % (mul_coeffi_id0_reg, mul_head_id4_reg))
    
    if shift_blocks != 0:
        print("	sub.w %s, #%d" % (r_14, shift_offset))

    epilogue(coeffi)