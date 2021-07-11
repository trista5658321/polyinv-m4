from utility_polymul import BASE, MUL_LABEL_HAED_LAST, ar, ac, r_f, r_g, coeffi_per_strip, coeffi_per_block, reduce_mod2


def SCH_polymul_mod2_head_last():
    print("%s:" % MUL_LABEL_HAED_LAST)
    print("	push.w {lr}")

    i = BASE//coeffi_per_strip - 1
    r12_list = [ar(i,0,4), ac(i,0), ac(i,1), ac(i,2)]
    r14_list = [ar(i,0,0), ar(i,0,1), ar(i,0,2), ar(i,0,3)]
    result_list = [ac(i,3), ac(i,4)]

    loop_count = BASE // (4 * coeffi_per_block)

    for k in range(loop_count):
        for idx in range(4):
            print("	ldr	%s, [%s, #%d]" % (r12_list[idx], r_f, 16*k + 4*idx))
        for idx in range(4):
            print("	ldr	%s, [%s, #%d]" % (r14_list[idx], r_g, 16*(i-k) + 12 - 4*idx))

        if k == 0:
            print("	umull	%s, %s, %s, %s" % (result_list[0], result_list[1], r12_list[0], r14_list[0]))
        else:
            print("	umlal	%s, %s, %s, %s" % (result_list[0], result_list[1], r12_list[0], r14_list[0]))
            
            reduce_mod2(result_list[0], result_list[0])
            reduce_mod2(result_list[1], result_list[1])
            
        for idx in range(1, 4):
            print("	umlal	%s, %s, %s, %s" % (result_list[0], result_list[1], r12_list[idx], r14_list[idx]))
            
            reduce_mod2(result_list[0], result_list[0])
            reduce_mod2(result_list[1], result_list[1])
    
    print("	str.w %s, [r0], #4" % (result_list[0]))
    
    print("	pop.w {pc}")