#!/usr/bin/env python
import sys
import re
from math import log,ceil,floor,sqrt

N = 0
N1 = 0
C1 = 14
C2 = 18
MAX1 = 15
MAX2 = 21

def do_reduction_continue(j):
    block_counts = j+1
    # 第一次需 lazy (63 adds // 4 = 15) & 後續需 lazy (56 adds // 4 = 14)
    if block_counts >= MAX1 and (block_counts - MAX1) % C1 == 0: 
        return True
    return False

def do_reduction_continue_id4(j): # ac(i, 4)
    block_counts = j+1
    # 第一次需 lazy (63 adds // 3 = 21) & 後續需 lazy (56 adds // 3 = 18)
    if block_counts >= MAX2 and (block_counts - MAX2) % C2 == 0: 
        return True
    return False

def do_reduction_end(j):
    block_counts = j+1
    if do_reduction_continue(j):
        return True
    # lazy + lazy: 2*(30 + 24 adds) = 252 <= 255 (max 6 blocks)
    if block_counts > 7 and block_counts < MAX1:
        ## for N1 == 32 (do -3 before addition)
        if N1 == 32: return False
        return True
    if block_counts >= MAX1 and (block_counts - MAX1) % C1 > 6: 
        return True
    return False

def pre_id4_lazy(j):
    block_counts = j+1
    if block_counts >= MAX2:
        return True
    return False

r_f = "r1"
r_g = "r2"
r_h = "r0"

# rotating holder for array elements
def ar (i,j,k) : # five registers
    return('r' + str(1+(4*i+k-j) % 5))

# rotating accumulator k during round i
def ac (i,k) : # five registers
    return('r' + str(6+(4*i+k) % 5))
    
def reduce_mod3_5 (X, scr, r03) : # at most 5, r03 = 0x03030303 
    print("	usub8	%s, %s, %s		// >= 3 ?" % (scr, X, r03))
    print("	sel	%s, %s, %s		// select" % (X, scr, X))

def reduce_mod3_11 (X, scr, r03) : # r03 = 0x03030303, good for 4 adds
    print("	bic	%s, %s, %s		// top 3b < 3" % (scr, X, r03))
    print("	and	%s, %s, %s		// bot 2b < 4" % (X, X, r03))
    print("	add	%s, %s, %s, LSR #2	// range <=5" % (X, X, scr))
    reduce_mod3_5 (X, scr, r03)
    
def reduce_mod3_32 (X, scr, r03) : # r03 = 0x03030303, good for 8 adds
    print("	bic	%s, %s, %s		// top 3b < 8" % (scr, X, r03))
    print("	and	%s, %s, %s		// bot 2b < 4" % (X, X, r03))
    print("	add	%s, %s, %s, LSR #2	// range <=10" % (X, X, scr))
    reduce_mod3_11 (X, scr, r03)
    
def reduce_mod3_lazy (X, scr, r03) :
    # print("#ifdef __thumb2__"	)
    print("	and	%s, %s, #0xF0F0F0F0	// top 4b < 16" % (scr, X))
    print("	and	%s, %s, #0x0F0F0F0F	// bot 4b < 16" % (X, X))
    print("	add	%s, %s, %s, LSR #4	// range < 31" % (X, X, scr))
    # print("#else")
    # print_ldr(r03, "F", "reload #0x0F0F0F0F")
    # print("	bic	%s, %s, %s	// top 4b < 16" % (scr, X, r03))
    # print("	and	%s, %s, %s	// bot 4b < 16" % (X, X, r03))
    # print("	add	%s, %s, %s, LSR #4	// range < 31" % (X, X, scr))
    # print_ldr(r03, "3", "reload #0x03030303")
    # print("#endif")
    
def reduce_mod3_full (X, scr, r03) :  
    reduce_mod3_lazy (X, scr, r03)
    reduce_mod3_32 (X, scr, r03) 

def start_strip_top (i) :
    print("	// ([%d-%d], 0) blocks" % (4*i, 4*i+3))
    print("	ldr	%s, [r12]" % (ar(i,0,4)))
    print("	ldr	%s, [r14, #%d]" % (ar(i,0,3), 16*i+12))
    print("	ldr	%s, [r14, #%d]" % (ar(i,0,2), 16*i+8))
    print("	ldr	%s, [r14, #%d]" % (ar(i,0,1), 16*i+4))
    print("	ldr	%s, [r14, #%d]" % (ar(i,0,0), 16*i))
    print("	umull	%s, %s, %s, %s" % (ac(i,1),ac(i,2),ar(i,0,1),ar(i,0,4)))
    print("	umull	%s, %s, %s, %s" % (ac(i,3),ac(i,4),ar(i,0,3),ar(i,0,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,0),ac(i,1),ar(i,0,0),ar(i,0,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,2),ac(i,3),ar(i,0,2),ar(i,0,4)))

def start_strip_bot (i, j) :
    print("	// ([%d-%d], %d) blocks" % (4*i-N1/4+1, 4*i-N1/4+4, j))
    print("	ldr	%s, [r12, #%d]" % (ar(i,j,4), 4*j))
    print("	ldr	%s, [r14, #%d]" % (ar(i,j,3), 16*i-N1+16))
    print("	ldr	%s, [r14, #%d]" % (ar(i,j,2), 16*i-N1+12))
    print("	ldr	%s, [r14, #%d]" % (ar(i,j,1), 16*i-N1+8))
    print("	ldr	%s, [r14, #%d]" % (ar(i,j,0), 16*i-N1+4))
    print("	umull	%s, %s, %s, %s" % (ac(i,1),ac(i,2),ar(i,j,1),ar(i,j,4)))
    print("	umull	%s, %s, %s, %s" % (ac(i,3),ac(i,4),ar(i,j,3),ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,0),ac(i,1),ar(i,j,0),ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,2),ac(i,3),ar(i,j,2),ar(i,j,4)))
    
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

    if do_reduction_continue((N1//4)-j-1):
        reduce_mod3_lazy(ac(i,0),ar(i,j,4),"r11")
        reduce_mod3_lazy(ac(i,1),ar(i,j,4),"r11")
        reduce_mod3_lazy(ac(i,2),ar(i,j,4),"r11")
        reduce_mod3_lazy(ac(i,3),ar(i,j,4),"r11")
    if do_reduction_continue_id4((N1//4)-j-1):
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

    if do_reduction_continue_id4(j+3):
        reduce_mod3_lazy(ac(i,4),ar(i,j,4),"r11")
    
    print("	str.w %s, [r0, #4]" % (ac(i,1)))
    print("	str.w %s, [r0, #8]" % (ac(i,2)))
    print("	str.w %s, [r0, #12]" % (ac(i,3)))
    print("	str.w %s, [r0], #16" % (ac(i,0)))
    
def end_strip_top_2 (i) :
    j = N1 // 4 - 1
    if do_reduction_end(j):
        reduce_mod3_lazy(ac(i,0),ar(i,j,4),"r11")
        reduce_mod3_lazy(ac(i,1),ar(i,j,4),"r11")
        reduce_mod3_lazy(ac(i,2),ar(i,j,4),"r11")
        reduce_mod3_lazy(ac(i,3),ar(i,j,4),"r11")

    print("	str.w %s, [r0, #4]" % (ac(i,1)))
    print("	str.w %s, [r0, #8]" % (ac(i,2)))
    print("	str.w %s, [r0, #12]" % (ac(i,3)))
    print("	str.w %s, [r0], #16" % (ac(i,0)))

def end_strip_bot (i) :
    j = 4 * i - N // 4 + 4 # [4]
    id4_blocks_count = N1//4-j # [4]

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

    if do_reduction_end(id0_blocks_count-1):
        reduce_mod3_lazy(ac(i,0),ar(i,j,4),"r11")

    if not pre_id4_lazy(id0_blocks_count+1):
        id0_blocks_count += 1
        if do_reduction_end(id0_blocks_count-1):
            reduce_mod3_lazy(ac(i,0),ar(i,j,4),"r11")

    print("	str.w %s, [r0, #4]" % (ac(i,1)))
    print("	str.w %s, [r0, #8]" % (ac(i,2)))
    print("	str.w %s, [r0, #12]" % (ac(i,3)))
    print("	str.w %s, [r0], #16" % (ac(i,0)))
   
def mid_loop():
    ### loop ###

    flag = "r11"
    print("	add.w %s, r14, #%d" % (flag, N))
    print("	add.w r14, #%d" % (N1))
    add_loop = "_loop_%d" % (N)
    print(add_loop + ":")

    fix_i = N1 // 16 - 1
    # for i in range(N1//16, N//16):
        
    print("	mov.w %s, %s" % (ac(fix_i,0), ac(fix_i,4)))
    
    # start_strip_top (i)
    print("	// ([%d-%d], 0) blocks" % (4*fix_i, 4*fix_i+3))
    print("	ldr	%s, [r12]" % (ar(fix_i,0,4)))
    print("	ldr	%s, [r14, #%d]" % (ar(fix_i,0,1), 4))
    print("	ldr	%s, [r14, #%d]" % (ar(fix_i,0,2), 8))
    print("	ldr	%s, [r14, #%d]" % (ar(fix_i,0,3), 12))
    print("	ldr	%s, [r14], #%d" % (ar(fix_i,0,0), 16))
    print("	umull	%s, %s, %s, %s" % (ac(fix_i,1),ac(fix_i,2),ar(fix_i,0,1),ar(fix_i,0,4)))
    print("	umull	%s, %s, %s, %s" % (ac(fix_i,3),ac(fix_i,4),ar(fix_i,0,3),ar(fix_i,0,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(fix_i,0),ac(fix_i,1),ar(fix_i,0,0),ar(fix_i,0,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(fix_i,2),ac(fix_i,3),ar(fix_i,0,2),ar(fix_i,0,4)))

    for j in range(1, N1//4) :
        # continue_strip_top (i,j)
        print("	// ([%d-%d], %d) blocks" % (4*fix_i-j, 4*fix_i-j+3, j))
        print("	ldr	%s, [r12, #%d]" % (ar(fix_i,j,4), 4*j))
        # print("	ldr	%s, [r14, #%d]" % (ar(fix_i,j,0), 16*fix_i-4*j))
        print("	ldr	%s, [r14, #%d]" % (ar(fix_i,j,0), -16-4*j))
        print("	umlal	%s, %s, %s, %s" % (ac(fix_i,0),ac(fix_i,1),ar(fix_i,j,0),ar(fix_i,j,4)))
        print("	umlal	%s, %s, %s, %s" % (ac(fix_i,1),ac(fix_i,2),ar(fix_i,j,1),ar(fix_i,j,4)))
        print("	umlal	%s, %s, %s, %s" % (ac(fix_i,2),ac(fix_i,3),ar(fix_i,j,2),ar(fix_i,j,4)))
        print("	umlal	%s, %s, %s, %s" % (ac(fix_i,3),ac(fix_i,4),ar(fix_i,j,3),ar(fix_i,j,4)))
        # if (j % C1 == C1 - 1) :
        #     reduce_mod3_lazy(ac(fix_i,0),ar(fix_i,j,4),"r11")
        #     reduce_mod3_lazy(ac(fix_i,1),ar(fix_i,j,4),"r11")
        #     reduce_mod3_lazy(ac(fix_i,2),ar(fix_i,j,4),"r11")
        #     reduce_mod3_lazy(ac(fix_i,3),ar(fix_i,j,4),"r11")
        # if (j % C2 == C2 - 1) :
        #     reduce_mod3_lazy(ac(fix_i,4),ar(fix_i,j,4),"r11")
    
    print("	ldr	%s, =0x03030303" % (ar(fix_i,j,3)))
    # end_strip_top_2(i)
    tmp_r03 = ar(fix_i,j,3)
    j = N1 // 4 - 1
    lower_bound = 6 # need reduction
    if (j > lower_bound) and j % C1 > 4: # maximum = 30 + 20 adds
        reduce_mod3_lazy(ac(fix_i,0),ar(fix_i,j,4),tmp_r03)
    if ((j+1) > lower_bound) and ((j+1) % C1 > 4): # maximum = 30 + 20 adds
        reduce_mod3_lazy(ac(fix_i,1),ar(fix_i,j,4),tmp_r03)
    if ((j+2) > lower_bound) and ((j+2) % C1 > 4): # maximum = 30 + 20 adds
        reduce_mod3_lazy(ac(fix_i,2),ar(fix_i,j,4),tmp_r03)
    if ((j+3) > lower_bound) and ((j+3) % C1 > 4): # maximum = 30 + 20 adds
        reduce_mod3_lazy(ac(fix_i,3),ar(fix_i,j,4),tmp_r03)

    print("	str.w %s, [r0, #4]" % (ac(fix_i,1)))
    print("	str.w %s, [r0, #8]" % (ac(fix_i,2)))
    print("	str.w %s, [r0, #12]" % (ac(fix_i,3)))
    print("	str.w %s, [r0], #16" % (ac(fix_i,0)))

    print("	cmp.w %s, %s" % ("r14", flag))
    print("	bne.w " + add_loop)
    print("	sub.w r14, #%d" % (N))
    print("	ldr	%s, =0x03030303" % ("r11"))
    ### loop end ###

    
def SCH_polymul32x32N_mod3(N1,N,C1,C2,rf,rg,rh, loop) :

    globals()["C1"]=C1
    globals()["C2"]=C2
    globals()["N1"]=N1
    globals()["N"]=N


    #assert (N>16)
    # alloc_save_no("N",str(N))
    # alloc_save_no("C1",str(C1))
    # alloc_save_no("C2",str(C2))

    # print_str(rh,"h","save h")
    # print_str(rh,"hh","save hh")
    # print_str(rf,"f","save f")
    # print_str(rg,"g","save g")
    
    # print("sch3_0:			// increasing thread length")
    print(" // increasing thread length")
    print("	mov	%s, #0" % (ac(0,0)))
    print("	mov	r12, %s" % rf)
    print("	mov	r14, %s" % rg)
    if N1 > 32:
        print("	ldr	r11, =0x03030303")

    # print("#ifndef __thumb2__")
    # print_str("r11", "3", "save #0x03030303")
    # print("	ldr	r11, =0x0f0f0f0f")
    # print_str("r11", "F", "save #0x0F0F0F0F")
    # print_ldr("r11", "3", "reload #0x03030303")
    # print("#endif")
    
    
    
    # print("sch3_1:			// later blocks")
    print(" // later blocks")
    
    if loop:
        for i in range(0,N1//16) : # i is thread count
            start_strip_top (i)
            for j in range(1, 4*i+1) :
                continue_strip_top (i,j)
            end_strip_top (i)

        mid_loop()

    else:
        for i in range(0,N//16) : # i is thread count
            start_strip_top (i)

            if i < N1//16:
                for j in range(1, 4*i+1) :
                    continue_strip_top (i,j)
            else:
                for j in range(1, N1//4) :
                    continue_strip_top (i,j)

            if i < N1//16: # for N1 = 32
                end_strip_top (i)
            else:
                end_strip_top_2(i)
            
    # print("sch3_10:			// decreasing thread length")
    print(" // decreasing thread length")
    # for i in range(N//16, N//8-1) :
    for i in range(N//16, (N1+N)//16-1) :
        start_strip_bot (i, N1 // 4 -1)
        for j in range(N1//4-2, 4*i-N//4+3, -1) :
            continue_strip_bot (i,j)
        end_strip_bot (i) 
        
        
    # print("sch3_20:			// mv hh back to h")
    print(" // mv hh back to h")
    # i = N//8 - 1
    i = (N1+N)//16-1
    print("	mov	%s, #0" % (ac(i,1)))
    print("	mov	%s, #0" % (ac(i,2)))
    print("	mov	%s, #0" % (ac(i,3)))
    print("	mov	%s, #0" % (ac(i,4)))
    # j = N // 4
    j = N1 // 4
    print("	ldr	%s, [r14, #%d]" % (ar(i,j,1), N-12))
    print("	ldr	%s, [r14, #%d]" % (ar(i,j,2), N-8))
    print("	ldr	%s, [r14, #%d]" % (ar(i,j,3), N-4))
    end_strip_bot(i)

def polymul(N1, NN, C1, C2, loop = True):
    # N >= N1
    SCH_polymul32x32N_mod3(N1,NN,C1,C2,"r1","r2","r0", loop)    

