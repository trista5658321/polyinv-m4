#!/usr/bin/env python
import sys
import re
from math import log,ceil,floor,sqrt
from utility_polymul import r_f, r_g, r_12, r_14, ac, ar, do_reduction_continue, do_reduction_continue_id4, do_reduction_end, pre_id4_lazy, do_reduction_before_add_pre_id4, BASE, P, _P, max_V_coeffi, _P_ZERO_coeffi
from polymul_head_last import SCH_polymul_mod3_head_last

N = 0
N1 = 0

r_h = "r0"
    
def reduce_mod3_lazy (X, scr, r03) :
    print("	and.w	%s, %s, #0xF0F0F0F0	// top 4b < 16" % (scr, X))
    print("	and.w	%s, %s, #0x0F0F0F0F	// bot 4b < 16" % (X, X))
    print("	add.w	%s, %s, %s, LSR #4	// range < 31" % (X, X, scr))
    
def start_strip_top (i) :
    print("	// ([%d-%d], 0) blocks" % (4*i, 4*i+3))
    print("	ldr.w	%s, [%s]" % (ar(i,0,4), r_12))
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,0,3), r_14, 16*i+12))
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,0,2), r_14, 16*i+8))
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,0,1), r_14, 16*i+4))
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,0,0), r_14, 16*i))
    print("	umull	%s, %s, %s, %s" % (ac(i,1),ac(i,2),ar(i,0,1),ar(i,0,4)))
    print("	umull	%s, %s, %s, %s" % (ac(i,3),ac(i,4),ar(i,0,3),ar(i,0,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,0),ac(i,1),ar(i,0,0),ar(i,0,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,2),ac(i,3),ar(i,0,2),ar(i,0,4)))

def start_strip_bot (i, j) :
    print("	// ([%d-%d], %d) blocks" % (4*i-N1/4+1, 4*i-N1/4+4, j))
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,4), r_12, 4*j))
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,3), r_14, 16*i-N1+16))
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,2), r_14, 16*i-N1+12))
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,1), r_14, 16*i-N1+8))
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,0), r_14, 16*i-N1+4))
    print("	umull	%s, %s, %s, %s" % (ac(i,1),ac(i,2),ar(i,j,1),ar(i,j,4)))
    print("	umull	%s, %s, %s, %s" % (ac(i,3),ac(i,4),ar(i,j,3),ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,0),ac(i,1),ar(i,j,0),ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,2),ac(i,3),ar(i,j,2),ar(i,j,4)))
    
def continue_strip_top (i,j) :
    print("	// ([%d-%d], %d) blocks" % (4*i-j, 4*i-j+3, j))
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,4), r_12, 4*j))
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,0), r_14, 16*i-4*j))
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
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,4), r_12, 4*j))
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,3), r_14, 16*i-4*j+12))
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

    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,4), r_12, 16*i+4))
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
    
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,4), r_12, 16*i+8))
    print("	umlal	%s, %s, %s, %s" % (ac(i,3),ac(i,4),ar(i,j,1),ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,2),ac(i,3),ar(i,j,0),ar(i,j,4)))

    # [2] reduction (before store)
    if do_reduction_end(j+2):
        reduce_mod3_lazy(ac(i,2),ar(i,j,4),"r11")

    if do_reduction_continue(j+2):
        reduce_mod3_lazy(ac(i,3),ar(i,j,4),"r11")
    if do_reduction_continue_id4(j+2):
        reduce_mod3_lazy(ac(i,4),ar(i,j,4),"r11")

    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,4), r_12, 16*i+12))
    print("	umlal	%s, %s, %s, %s" % (ac(i,3),ac(i,4),ar(i,j,0),ar(i,j,4)))
    
    # [3] reduction (before store)
    if do_reduction_end(j+3):
        reduce_mod3_lazy(ac(i,3),ar(i,j,4),"r11")

    # [4]
    if do_reduction_before_add_pre_id4(j+3):
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

    if do_reduction_before_add_pre_id4(j):
        reduce_mod3_lazy(ac(i,4),ar(i,j,4),"r11")

    print("	str.w %s, [r0, #4]" % (ac(i,1)))
    print("	str.w %s, [r0, #8]" % (ac(i,2)))
    print("	str.w %s, [r0, #12]" % (ac(i,3)))
    print("	str.w %s, [r0], #16" % (ac(i,0)))

def end_strip_bot (i) :
    j = 4 * i - N // 4 + 4 # [4]
    id4_blocks_count = N1//4-j # [4]

    # [4]
    if do_reduction_before_add_pre_id4(id4_blocks_count-1):
        reduce_mod3_lazy(ac(i,4),ar(i,j,4),"r11")

    print("	// ([%d-%d],%d),([%d-%d],%d),(%d,%d) blocks" % (N//4-3,N//4-1,j-1,N//4-2,N//4-1,j-2,N//4-1,j-3))

    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,4), r_12, 16*i-N+12))
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

    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,4), r_12, 16*i-N+8))
    print("	umlal	%s, %s, %s, %s" % (ac(i,1),ac(i,2),ar(i,j,3),ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,0),ac(i,1),ar(i,j,2),ar(i,j,4)))
    
    # [2] reduction (before store)
    if do_reduction_end(id4_blocks_count+2-1):
        reduce_mod3_lazy(ac(i,2),ar(i,j,4),"r11")

    if do_reduction_continue(id4_blocks_count+2-1):
        reduce_mod3_lazy(ac(i,0),ar(i,j,4),"r11")
        reduce_mod3_lazy(ac(i,1),ar(i,j,4),"r11")

    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,4), r_12, 16*i-N+4))
    print("	umlal	%s, %s, %s, %s" % (ac(i,0),ac(i,1),ar(i,j,3),ar(i,j,4)))
    
    # [0,1] reduction (before store)
    if do_reduction_end(id4_blocks_count+3-1):
        reduce_mod3_lazy(ac(i,1),ar(i,j,4),"r11")
    
    id0_blocks_count = id4_blocks_count+3

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
  
def SCH_polymul_N1xN_mod3(N1,N, _P) :
    print("mul_head:")
    print(" // increasing thread length")
    print("	push.w {lr}")
    print("	mov	%s, #0" % (ac(0,0)))
    # print("	mov	%s, %s" % (r_12, r_f))
    # print("	mov	%s, %s" % (r_14, r_g))
    # if N1 > 32:
    #     print("	ldr.w	r11, =0x03030303")
    
    print(" // later blocks")
    first_component_blocks = N % N1
    first_label = N1 // 16
    _P_label = (N - _P) // 16 + first_label
    BASE_label = first_component_blocks // 16 + first_label

    for i in range(0,N//16) : # i is thread count
        if i == first_label:
            print("mul_%d:" % (N))
        elif i == _P_label:
            print("mul_%d:" % (_P))
        elif i >= BASE_label and (i-BASE_label) % (N1//16) == 0:
            print("mul_%d:" % (N - first_component_blocks - 16*(i-BASE_label) ))
        
        if (2*_P) % BASE != 0: 
            first_component_blocks_1 = N1 - (_P % N1)
            first_label_1 = _P_label + (first_component_blocks_1 // 16)
            if i >= first_label_1 and (i - first_label_1) % (N1 // 16) == 0:
                print("mul_%d:" % (_P - first_component_blocks_1 - 16*(i-first_label_1)))
            
        start_strip_top (i)

        if i < N1//16:
            for j in range(1, 4*i+1) :
                continue_strip_top (i,j)
        else:
            for j in range(1, N1//4) :
                continue_strip_top (i,j)

        if i < N1//16: # for N1 = 32
            end_strip_top (i)
            if i == N1 // 16 - 1:
                print("	pop.w {pc}")
        else:
            end_strip_top_2(i)

    print("mul_%d:" % (N1))
    
    print(" // decreasing thread length")
    # for i in range(N//16, N//8-1) :
    for i in range(N//16, (N1+N)//16-1) :
        start_strip_bot (i, N1 // 4 -1)
        for j in range(N1//4-2, 4*i-N//4+3, -1) :
            continue_strip_bot (i,j)
        end_strip_bot (i) 
        
    print(" // mv hh back to h")

    i = (N1+N)//16-1
    print("	mov	%s, #0" % (ac(i,1)))
    print("	mov	%s, #0" % (ac(i,2)))
    print("	mov	%s, #0" % (ac(i,3)))
    print("	mov	%s, #0" % (ac(i,4)))

    j = N1 // 4
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,1), r_14, N-12))
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,2), r_14, N-8))
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,3), r_14, N-4))
    end_strip_bot(i)
    print("	pop.w {pc}")

def SCH_polymul_N1xN_mod3_jump_end(N1,N) :
    print(" // increasing thread length")
    print("	push.w {lr}")
    print("	mov	%s, #0" % (ac(0,0)))
    # print("	mov	%s, %s" % (r_12, r_f))
    # print("	mov	%s, %s" % (r_14, r_g))

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

    print("	pop.w {pc}")

def polymul(N1, NN, _N):
    # N >= N1
    globals()["N1"]=N1
    globals()["N"]=NN

    print(".p2align 2,,3")
    print(".syntax unified")
    print(".text")
    if _P_ZERO_coeffi < 7:
        SCH_polymul_mod3_head_last()

    SCH_polymul_N1xN_mod3(N1,NN,_N)