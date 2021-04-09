from utility_polymul import BASE, MUL_LABEL_HAED_LAST, ar, ac, do_reduction_continue, do_reduction_continue_id4, do_reduction_end, reduce_mod3_lazy, r_f, r_g


def SCH_polymul_mod3_head_last():
    print("%s:" % MUL_LABEL_HAED_LAST)
    print("	push.w {lr}")

    i = BASE//16 - 1
    r12_list = [ar(i,0,4), ac(i,0), ac(i,1), ac(i,2)]
    r14_list = [ar(i,0,0), ar(i,0,1), ar(i,0,2), ar(i,0,3)]
    result_list = [ac(i,3), ac(i,4)]

    for k in range(BASE//16):
        for idx in range(4):
            print("	ldr	%s, [%s, #%d]" % (r12_list[idx], r_f, 16*k + 4*idx))
        for idx in range(4):
            print("	ldr	%s, [%s, #%d]" % (r14_list[idx], r_g, 16*(i-k) + 12 - 4*idx))

        if k == 0:
            print("	umull	%s, %s, %s, %s" % (result_list[0], result_list[1], r12_list[0], r14_list[0]))
        else:
            print("	umlal	%s, %s, %s, %s" % (result_list[0], result_list[1], r12_list[0], r14_list[0]))
            j = 4*k
            if do_reduction_continue(j):
                reduce_mod3_lazy(result_list[0], r12_list[0], "r11")
            if do_reduction_continue_id4(j):
                reduce_mod3_lazy(result_list[1], r12_list[0], "r11")
        for idx in range(1, 4):
            print("	umlal	%s, %s, %s, %s" % (result_list[0], result_list[1], r12_list[idx], r14_list[idx]))
            j = 4*k + idx
            if do_reduction_continue(j):
                reduce_mod3_lazy(result_list[0], r12_list[0], "r11")
            if do_reduction_continue_id4(j):
                reduce_mod3_lazy(result_list[1], r12_list[0], "r11")

    if do_reduction_end(BASE//4):
        reduce_mod3_lazy(result_list[0], r12_list[0], "r11")
    
    print("	str.w %s, [r0], #4" % (result_list[0]))
    
    print("	pop.w {pc}")