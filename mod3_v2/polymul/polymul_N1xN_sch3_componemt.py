#!/usr/bin/env python
import sys
import re
from math import log,ceil,floor,sqrt
from utility import do_reduction_continue, do_reduction_continue_id4, do_reduction_end, pre_id4_lazy

N = 0
N1 = 0

r_f = "r1"
r_g = "r2"
r_h = "r0"

r_12 = "r1"
r_14 = "r2"

# rotating holder for array elements
def ar (i,j,k) : # five registers
    num = 1 + (4*i+k-j) % 5
    if num == 1:
        num = 12
    if num == 2:
        num = 14
    return('r' + str(num))

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
    print("	and	%s, %s, #0xF0F0F0F0	// top 4b < 16" % (scr, X))
    print("	and	%s, %s, #0x0F0F0F0F	// bot 4b < 16" % (X, X))
    print("	add	%s, %s, %s, LSR #4	// range < 31" % (X, X, scr))
    
def reduce_mod3_full (X, scr, r03) :  
    reduce_mod3_lazy (X, scr, r03)
    reduce_mod3_32 (X, scr, r03) 

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

    if not pre_id4_lazy(id0_blocks_count+1):
        id0_blocks_count += 1
        if do_reduction_end(id0_blocks_count-1):
            reduce_mod3_lazy(ac(i,0),ar(i,j,4),"r11")

    print("	str.w %s, [r0, #4]" % (ac(i,1)))
    print("	str.w %s, [r0, #8]" % (ac(i,2)))
    print("	str.w %s, [r0, #12]" % (ac(i,3)))
    print("	str.w %s, [r0], #16" % (ac(i,0)))
  
def SCH_polymul_N1xN_mod3(N1,N, _N) :
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
    plus_label = -1
    if _N % N1 != 0:
        plus_label = first_component_blocks // 16 + (_N % N1) // 16
    second_label = first_component_blocks // 16 + N1 // 16

    for i in range(0,N//16) : # i is thread count
        if i == N1 // 16:
            print("mul_%d:" % (N))
        if plus_label > 0 and i == plus_label:
            print("mul_%d:" % (_N))
        if i >= second_label and (i-second_label) % (N1//16) == 0:
            print("mul_%d:" % (N - first_component_blocks - 16*(i-second_label) ))
            
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


def func_head(BASE, N, coeffi, jump_head = False):
    __polymul_name = "__polymul_" + str(BASE) + "x" + str(coeffi)
    if jump_head:
        __polymul_name += "_jump_head"
    print(".p2align 2,,3")
    print(".syntax unified")
    print(".text")
    print(".global " + __polymul_name + "")
    print(".type  " + __polymul_name + ", %function")
    print(__polymul_name + ":")
    print("	push.w {lr}")

    label_i = (BASE+N) // 16 - coeffi // 16
    mul_head_id4_reg = ac(BASE//16-1,4)
    mul_coeffi_id0_reg = ac(label_i,0)

    # change horizontal initial index
    shift_blocks = N - coeffi

    if jump_head:
        print("	mov.w %s, #%d" % (mul_coeffi_id0_reg, 0))
        # print("	mov %s, r1" % (r_12))
        # print("	mov %s, r2" % (r_14))
        shift_blocks += 4

    else:
        print("	bl.w mul_head")

        if mul_coeffi_id0_reg != mul_head_id4_reg:
            print("	mov.w %s, %s" % (mul_coeffi_id0_reg, mul_head_id4_reg))
    
    if shift_blocks != 0:
        print("	sub.w %s, #%d" % (r_14, shift_blocks))

    print("	b.w mul_%d" % (coeffi))

def polymul(N1, NN, _N):
    # N >= N1
    globals()["N1"]=N1
    globals()["N"]=NN

    print(".p2align 2,,3")
    print(".syntax unified")
    print(".text")
    SCH_polymul_N1xN_mod3(N1,NN,_N)

def gen_mul():
    BASE = 64
    N = int(sys.argv[1])
    _N = int(sys.argv[2])
    over_divsteps = 2*(_N - N) + 1
    max_V_coeffi = ceil((over_divsteps + N) / 16) * 16

    max_coeffi = max_V_coeffi

    polymul(BASE, max_coeffi, _N)

    for i in range(1, _N//BASE+1):
        coeffi = BASE * i
        func_head(BASE, max_coeffi, coeffi, True)
        if coeffi != _N: # for update_VS
            func_head(BASE, max_coeffi, coeffi, False)
    
    if _N % BASE != 0: # for update_fg
        func_head(BASE, max_coeffi, _N, True)
    
    if max_coeffi != _N:
        func_head(BASE, max_coeffi, max_coeffi, False)
    
    # for update_VS
    __polymul_name = "__polymul_" + str(BASE) + "x" + str(_N)
    print(".p2align 2,,3")
    print(".syntax unified")
    print(".text")
    print(".global " + __polymul_name + "")
    print(".type  " + __polymul_name + ", %function")
    print(__polymul_name + ":")
    SCH_polymul_N1xN_mod3_jump_end(BASE, _N)

gen_mul()