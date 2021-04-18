from mod3.polymul.utility_polymul import printIn, C1, C2, ar, ac, reduce_mod3_lazy, do_reduction_continue, do_reduction_continue_id4, do_reduction_end, pre_id4_lazy, do_reduction_before_add_pre_id4

import sys
import re
from math import log,ceil,floor,sqrt

#V[loc] = "s%d", "[sp,#%d]", "sp+%d" or "label[%d]" where V[label] = "sp+%d"
from mod3.polymul.loadsave import alloc_save,print_ldr,print_str,alloc_save_no
N = 0
C1 = 0
C2 = 0

# need to sync this list with whatever file that calls this file
# otherwise the results will be wrong
#
alloc_save("h")			# V["h"] = s0	# h = output
alloc_save("g")			# V["g"] = s1	# g = input 1
alloc_save("f")			# V["f"] = s2	# f = input 0
alloc_save("hh")		# V["hh"] = s3	# hh = cursor in h
alloc_save("3")
alloc_save("F")

r_f = "r1"
r_g = "r2"
r_h = "r0"

def start_strip_top (i) :
    printIn("// ([%d-%d], 0) blocks" % (4*i, 4*i+3))
    printIn("ldr	%s, [r12]" % (ar(i,0,4)))
    printIn("ldr	%s, [r14, #%d]" % (ar(i,0,3), 16*i+12))
    printIn("ldr	%s, [r14, #%d]" % (ar(i,0,2), 16*i+8))
    printIn("ldr	%s, [r14, #%d]" % (ar(i,0,1), 16*i+4))
    printIn("ldr	%s, [r14, #%d]" % (ar(i,0,0), 16*i))
    printIn("umull	%s, %s, %s, %s" % (ac(i,1),ac(i,2),ar(i,0,1),ar(i,0,4)))
    printIn("umull	%s, %s, %s, %s" % (ac(i,3),ac(i,4),ar(i,0,3),ar(i,0,4)))
    printIn("umlal	%s, %s, %s, %s" % (ac(i,0),ac(i,1),ar(i,0,0),ar(i,0,4)))
    printIn("umlal	%s, %s, %s, %s" % (ac(i,2),ac(i,3),ar(i,0,2),ar(i,0,4)))

def start_strip_bot (i) :
    j = N // 4 -1
    printIn("// ([%d-%d], %d) blocks" % (4*i-N/4+1, 4*i-N/4+4, j))
    printIn("ldr	%s, [r12, #%d]" % (ar(i,j,4), 4*j))
    printIn("ldr	%s, [r14, #%d]" % (ar(i,j,3), 16*i-N+16))
    printIn("ldr	%s, [r14, #%d]" % (ar(i,j,2), 16*i-N+12))
    printIn("ldr	%s, [r14, #%d]" % (ar(i,j,1), 16*i-N+8))
    printIn("ldr	%s, [r14, #%d]" % (ar(i,j,0), 16*i-N+4))
    printIn("umull	%s, %s, %s, %s" % (ac(i,1),ac(i,2),ar(i,j,1),ar(i,j,4)))
    printIn("umull	%s, %s, %s, %s" % (ac(i,3),ac(i,4),ar(i,j,3),ar(i,j,4)))
    printIn("umlal	%s, %s, %s, %s" % (ac(i,0),ac(i,1),ar(i,j,0),ar(i,j,4)))
    printIn("umlal	%s, %s, %s, %s" % (ac(i,2),ac(i,3),ar(i,j,2),ar(i,j,4)))
    
def continue_strip_top (i,j) :
    print("	// ([%d-%d], %d) blocks" % (4*i-j, 4*i-j+3, j))
    print("	ldr	%s, [r12, #%d]" % (ar(i,j,4), 4*j))
    print("	ldr	%s, [r14, #%d]" % (ar(i,j,0), 16*i-4*j))
    print("	umlal	%s, %s, %s, %s" % (ac(i,0),ac(i,1),ar(i,j,0),ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,1),ac(i,2),ar(i,j,1),ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,2),ac(i,3),ar(i,j,2),ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,3),ac(i,4),ar(i,j,3),ar(i,j,4)))
    if do_reduction_continue(j):
        reduce_mod3_lazy(ac(i,0),ar(i,j,4),"r11")
        reduce_mod3_lazy(ac(i,1),ar(i,j,4),"r11")
        reduce_mod3_lazy(ac(i,2),ar(i,j,4),"r11")
        reduce_mod3_lazy(ac(i,3),ar(i,j,4),"r11")
    if do_reduction_continue_id4(j):
        reduce_mod3_lazy(ac(i,4),ar(i,j,4),"r11")

def continue_strip_bot (i,j) :
    print("	// ([%d-%d], %d) blocks" % (4*i-j, 4*i-j+3, j))
    print("	ldr	%s, [r12, #%d]" % (ar(i,j,4), 4*j))
    print("	ldr	%s, [r14, #%d]" % (ar(i,j,3), 16*i-4*j+12))
    print("	umlal	%s, %s, %s, %s" % (ac(i,0),ac(i,1),ar(i,j,0),ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,1),ac(i,2),ar(i,j,1),ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,2),ac(i,3),ar(i,j,2),ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,3),ac(i,4),ar(i,j,3),ar(i,j,4)))
    if do_reduction_continue((N//4)-j-1):
        reduce_mod3_lazy(ac(i,0),ar(i,j,4),"r11")
        reduce_mod3_lazy(ac(i,1),ar(i,j,4),"r11")
        reduce_mod3_lazy(ac(i,2),ar(i,j,4),"r11")
        reduce_mod3_lazy(ac(i,3),ar(i,j,4),"r11")
    if do_reduction_continue_id4((N//4)-j-1):
        reduce_mod3_lazy(ac(i,4),ar(i,j,4),"r11")
        
def end_strip_top (i) :
    j = 4 * i
    print("	// ([0-2],%d), ([0-1],%d), (0,%d) blocks" % (4*i+1,4*i+2,4*i+3))

    # [0] reduction (before store)
    if do_reduction_end(j):
        reduce_mod3_lazy(ac(i,0),ar(i,j,4),"r11")

    print("	ldr	%s, [r12, #%d]" % (ar(i,j,4), 16*i+4))
    print("	umlal	%s, %s, %s, %s" % (ac(i,3),ac(i,4),ar(i,j,2),ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,2),ac(i,3),ar(i,j,1),ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,1),ac(i,2),ar(i,j,0),ar(i,j,4)))

    # [1] reduction (before store)
    if do_reduction_end(j+1):
        reduce_mod3_lazy(ac(i,1),ar(i,j,4),"r11")

    if do_reduction_continue(j+1):
        reduce_mod3_lazy(ac(i,2),ar(i,j,4),"r11")
        reduce_mod3_lazy(ac(i,3),ar(i,j,4),"r11")
    if do_reduction_continue_id4(j+1):
        reduce_mod3_lazy(ac(i,4),ar(i,j,4),"r11")
    
    print("	ldr	%s, [r12, #%d]" % (ar(i,j,4), 16*i+8))
    print("	umlal	%s, %s, %s, %s" % (ac(i,3),ac(i,4),ar(i,j,1),ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,2),ac(i,3),ar(i,j,0),ar(i,j,4)))

    # [2] reduction (before store)
    if do_reduction_end(j+2):
        reduce_mod3_lazy(ac(i,2),ar(i,j,4),"r11")

    if do_reduction_continue(j+2):
        reduce_mod3_lazy(ac(i,3),ar(i,j,4),"r11")
    if do_reduction_continue_id4(j+2):
        reduce_mod3_lazy(ac(i,4),ar(i,j,4),"r11")

    print("	ldr	%s, [r12, #%d]" % (ar(i,j,4), 16*i+12))
    print("	umlal	%s, %s, %s, %s" % (ac(i,3),ac(i,4),ar(i,j,0),ar(i,j,4)))
    
    # [3] reduction (before store)
    if do_reduction_end(j+3):
        reduce_mod3_lazy(ac(i,3),ar(i,j,4),"r11")

    if do_reduction_before_add_pre_id4(j+3):
        reduce_mod3_lazy(ac(i,4),ar(i,j,4),"r11")
    
    print("	str.w %s, [r0, #4]" % (ac(i,1)))
    print("	str.w %s, [r0, #8]" % (ac(i,2)))
    print("	str.w %s, [r0, #12]" % (ac(i,3)))
    print("	str.w %s, [r0], #16" % (ac(i,0)))
    
def end_strip_bot (i) :
    j = 4 * i - N // 4 + 4
    id4_blocks_count = N//4-j

    # [4]
    if do_reduction_before_add_pre_id4(id4_blocks_count-1):
        reduce_mod3_lazy(ac(i,4),ar(i,j,4),"r11")

    print("	// ([%d-%d],%d),([%d-%d],%d),(%d,%d) blocks" % (N//4-3,N//4-1,j-1,N//4-2,N//4-1,j-2,N//4-1,j-3))

    print("	ldr	%s, [r12, #%d]" % (ar(i,j,4), 16*i-N+12))
    print("	umlal	%s, %s, %s, %s" % (ac(i,2),ac(i,3),ar(i,j,3),ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,1),ac(i,2),ar(i,j,2),ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,0),ac(i,1),ar(i,j,1),ar(i,j,4)))
    
    # [3] reduction (before store)
    if do_reduction_end(id4_blocks_count+1-1):
        reduce_mod3_lazy(ac(i,3),ar(i,j,4),"r11")

    if do_reduction_continue(id4_blocks_count+1-1):
        reduce_mod3_lazy(ac(i,0),ar(i,j,4),"r11")
        reduce_mod3_lazy(ac(i,1),ar(i,j,4),"r11")
        reduce_mod3_lazy(ac(i,2),ar(i,j,4),"r11")

    print("	ldr	%s, [r12, #%d]" % (ar(i,j,4), 16*i-N+8))
    print("	umlal	%s, %s, %s, %s" % (ac(i,1),ac(i,2),ar(i,j,3),ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,0),ac(i,1),ar(i,j,2),ar(i,j,4)))
    
    # [2] reduction (before store)
    if do_reduction_end(id4_blocks_count+2-1):
        reduce_mod3_lazy(ac(i,2),ar(i,j,4),"r11")

    if do_reduction_continue(id4_blocks_count+2-1):
        reduce_mod3_lazy(ac(i,0),ar(i,j,4),"r11")
        reduce_mod3_lazy(ac(i,1),ar(i,j,4),"r11")

    print("	ldr	%s, [r12, #%d]" % (ar(i,j,4), 16*i-N+4))
    print("	umlal	%s, %s, %s, %s" % (ac(i,0),ac(i,1),ar(i,j,3),ar(i,j,4)))
    
    # [0,1] reduction (before store)
    if do_reduction_end(id4_blocks_count+3-1):
        reduce_mod3_lazy(ac(i,1),ar(i,j,4),"r11")
    
    id0_blocks_count = id4_blocks_count+3
    # print(id0_blocks_count)
    # print(pre_id4_lazy(id0_blocks_count+1))

    if do_reduction_end(id0_blocks_count-1):
        reduce_mod3_lazy(ac(i,0),ar(i,j,4),"r11")

    elif not pre_id4_lazy(id0_blocks_count+1):
        id0_blocks_count += 1
        if do_reduction_end(id0_blocks_count-1):
            reduce_mod3_lazy(ac(i,0),ar(i,j,4),"r11")

    print("	str.w %s, [r0, #4]" % (ac(i,1)))
    print("	str.w %s, [r0, #8]" % (ac(i,2)))
    print("	str.w %s, [r0, #12]" % (ac(i,3)))
    print("	str.w %s, [r0], #16" % (ac(i,0)))
   
    
def SCH_polymulNxN_mod3(N,C1,C2,rf,rg,rh) :
    globals()["C1"]=C1
    globals()["C2"]=C2
    globals()["N"]=N

    #assert (N>16)
    alloc_save_no("N",str(N))
    alloc_save_no("C1",str(C1))
    alloc_save_no("C2",str(C2))

    # print_str(rh,"h","save h")
    # print_str(rh,"hh","save hh")
    # print_str(rf,"f","save f")
    # print_str(rg,"g","save g")
    
    print("sch3_0:			// increasing thread length")
    print("	mov	%s, #0" % (ac(0,0)))
    print("	mov	r12, %s" % rf)
    print("	mov	r14, %s" % rg)
    print("	ldr	r11, =0x03030303")

    # print("#ifndef __thumb2__")
    # print_str("r11", "3", "save #0x03030303")
    # print("	ldr	r11, =0x0f0f0f0f")
    # print_str("r11", "F", "save #0x0F0F0F0F")
    # print_ldr("r11", "3", "reload #0x03030303")
    # print("#endif")
    
    print("sch3_1:			// later blocks")
    for i in range(0,N//16) : # i is thread count
        start_strip_top (i)
        for j in range(1, 4*i+1) :
            continue_strip_top (i,j)
        end_strip_top (i) 
            
    print("sch3_10:			// decreasing thread length")
    for i in range(N//16, N//8-1) :
        start_strip_bot (i)
        for j in range(N//4-2, 4*i-N//4+3, -1) :
            continue_strip_bot (i,j)
        end_strip_bot (i) 
        
        
    print("sch3_20:			// mv hh back to h")
    i = N//8 - 1
    print("	mov	%s, #0" % (ac(i,1)))
    print("	mov	%s, #0" % (ac(i,2)))
    print("	mov	%s, #0" % (ac(i,3)))
    print("	mov	%s, #0" % (ac(i,4)))
    j = N// 4
    print("	ldr	%s, [r14, #%d]" % (ar(i,j,1), N-12))
    print("	ldr	%s, [r14, #%d]" % (ar(i,j,2), N-8))
    print("	ldr	%s, [r14, #%d]" % (ar(i,j,3), N-4))
    end_strip_bot(i)

    

