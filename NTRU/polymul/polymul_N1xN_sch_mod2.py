#!/usr/bin/env python
import sys
import re
from math import log,ceil,floor,sqrt
from utility_polymul import r_12, r_14, ac, ar, BASE, do_jump_head_4_0, coeffi_per_strip, coeffi_per_block, bytes_per_block, reduce_mod2
from polymul_head_last import SCH_polymul_mod2_head_last

N = 0
N1 = 0

r_h = "r0"
    
def start_strip_top (i):
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

    for id in range(5):
        reduce_mod2(ac(i,id), ac(i,id))

def start_strip_top_2b (i, part):
    print("	// ([%d-%d], 0) blocks" % (4*i + 2*part, 4*i+1 + 2*part))
    print("	ldr.w	%s, [%s]" % (ar(i,0,4), r_12))
    
    coeffi_a = ar(i,0,0+2*part)
    coeffi_b = ar(i,0,1+2*part)
    result_0 = ac(i,0+2*part)
    result_1 = ac(i,1+2*part)
    result_2 = ac(i,2+2*part)

    print("	ldr.w	%s, [%s, #%d]" % (coeffi_b, r_14, 16*i+4 + 2*part*4))
    print("	ldr.w	%s, [%s, #%d]" % (coeffi_a, r_14, 16*i + 2*part*4))
    print("	umull	%s, %s, %s, %s" % (result_1, result_2, coeffi_b, ar(i,0,4)))
    print("	umlal	%s, %s, %s, %s" % (result_0, result_1, coeffi_a, ar(i,0,4)))

    for id in range(2*part, 3+2*part):
        reduce_mod2(ac(i,id), ac(i,id))

def start_strip_bot (i, j) :
    i_offset_start = ((coeffi_per_strip*i-N1) // coeffi_per_block) * bytes_per_block
    blocks_start = 4*(i - N1//coeffi_per_strip)
    print("	// ([%d-%d], %d) blocks" % (blocks_start+1, blocks_start+4, j))
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,4), r_12, 4*j))
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,3), r_14, i_offset_start+16))
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,2), r_14, i_offset_start+12))
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,1), r_14, i_offset_start+8))
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,0), r_14, i_offset_start+4))
    print("	umull	%s, %s, %s, %s" % (ac(i,1),ac(i,2),ar(i,j,1),ar(i,j,4)))
    print("	umull	%s, %s, %s, %s" % (ac(i,3),ac(i,4),ar(i,j,3),ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,0),ac(i,1),ar(i,j,0),ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,2),ac(i,3),ar(i,j,2),ar(i,j,4)))

    for id in range(5):
        reduce_mod2(ac(i,id), ac(i,id))
    
def continue_strip_top (i,j) :
    print("	// ([%d-%d], %d) blocks" % (4*i-j, 4*i-j+3, j))
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,4), r_12, 4*j))
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,0), r_14, 16*i-4*j))
    print("	umlal	%s, %s, %s, %s" % (ac(i,0),ac(i,1),ar(i,j,0),ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,1),ac(i,2),ar(i,j,1),ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,2),ac(i,3),ar(i,j,2),ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,3),ac(i,4),ar(i,j,3),ar(i,j,4)))

    for id in range(5):
        reduce_mod2(ac(i,id), ac(i,id))

def continue_strip_top_2b (i,j, part) :
    print("	// ([%d-%d], %d) blocks" % (4*i-j + 2*part, 4*i-j+1 + 2*part, j))
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,4), r_12, 4*j))

    coeffi_a = ar(i,j,0+2*part)
    coeffi_b = ar(i,j,1+2*part)
    result_0 = ac(i,0+2*part)
    result_1 = ac(i,1+2*part)
    result_2 = ac(i,2+2*part)

    print("	ldr.w	%s, [%s, #%d]" % (coeffi_a, r_14, 16*i-4*j + 2*part*4))
    print("	umlal	%s, %s, %s, %s" % (result_0,result_1,coeffi_a,ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (result_1,result_2,coeffi_b,ar(i,j,4)))

    for id in range(2*part, 3+2*part):
        reduce_mod2(ac(i,id), ac(i,id))

def continue_strip_bot (i,j) :
    print("	// ([%d-%d], %d) blocks" % (4*i-j, 4*i-j+3, j))
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,4), r_12, 4*j))
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,3), r_14, 16*i-4*j+12))
    print("	umlal	%s, %s, %s, %s" % (ac(i,0),ac(i,1),ar(i,j,0),ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,1),ac(i,2),ar(i,j,1),ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,2),ac(i,3),ar(i,j,2),ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,3),ac(i,4),ar(i,j,3),ar(i,j,4)))

    for id in range(5):
        reduce_mod2(ac(i,id), ac(i,id))
        
def end_strip_top (i) :
    j = 4 * i
    print("	// ([0-2],%d), ([0-1],%d), (0,%d) blocks" % (4*i+1,4*i+2,4*i+3))
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,4), r_12, 16*i+4))
    print("	umlal	%s, %s, %s, %s" % (ac(i,3),ac(i,4),ar(i,j,2),ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,2),ac(i,3),ar(i,j,1),ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,1),ac(i,2),ar(i,j,0),ar(i,j,4)))

    for id in range(1,5):
        reduce_mod2(ac(i,id), ac(i,id))
    
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,4), r_12, 16*i+8))
    print("	umlal	%s, %s, %s, %s" % (ac(i,3),ac(i,4),ar(i,j,1),ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,2),ac(i,3),ar(i,j,0),ar(i,j,4)))

    for id in range(2,5):
        reduce_mod2(ac(i,id), ac(i,id))

    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,4), r_12, 16*i+12))
    print("	umlal	%s, %s, %s, %s" % (ac(i,3),ac(i,4),ar(i,j,0),ar(i,j,4)))
    
    for id in range(3,5):
        reduce_mod2(ac(i,id), ac(i,id))
    
    print("	str.w %s, [r0, #4]" % (ac(i,1)))
    print("	str.w %s, [r0, #8]" % (ac(i,2)))
    print("	str.w %s, [r0, #12]" % (ac(i,3)))
    print("	str.w %s, [r0], #16" % (ac(i,0)))
    
def end_strip_top_2 (i) :
    print("	str.w %s, [r0, #4]" % (ac(i,1)))
    print("	str.w %s, [r0, #8]" % (ac(i,2)))
    print("	str.w %s, [r0, #12]" % (ac(i,3)))
    print("	str.w %s, [r0], #16" % (ac(i,0)))

def end_strip_top_2b (i, part) :
    print("	str.w %s, [r0, #4]" % (ac(i,1+2*part)))
    print("	str.w %s, [r0], #8" % (ac(i,0+2*part)))

def end_strip_bot (i, j):
    
    j_offset_start = bytes_per_block*(j-4) # j at bot
    block_id_end = N // coeffi_per_block

    print("	// ([%d-%d],%d),([%d-%d],%d),(%d,%d) blocks" % (block_id_end-3,block_id_end-1,j-1, block_id_end-2,block_id_end-1,j-2, block_id_end-1,j-3))
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,4), r_12, j_offset_start+12))
    print("	umlal	%s, %s, %s, %s" % (ac(i,2),ac(i,3),ar(i,j,3),ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,1),ac(i,2),ar(i,j,2),ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,0),ac(i,1),ar(i,j,1),ar(i,j,4)))
    
    for id in range(4):
        reduce_mod2(ac(i,id), ac(i,id))

    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,4), r_12, j_offset_start+8))
    print("	umlal	%s, %s, %s, %s" % (ac(i,1),ac(i,2),ar(i,j,3),ar(i,j,4)))
    print("	umlal	%s, %s, %s, %s" % (ac(i,0),ac(i,1),ar(i,j,2),ar(i,j,4)))
    
    for id in range(3):
        reduce_mod2(ac(i,id), ac(i,id))

    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,4), r_12, j_offset_start+4))
    print("	umlal	%s, %s, %s, %s" % (ac(i,0),ac(i,1),ar(i,j,3),ar(i,j,4)))
    
    for id in range(2):
        reduce_mod2(ac(i,id), ac(i,id))

    print("	str.w %s, [r0, #4]" % (ac(i,1)))
    print("	str.w %s, [r0, #8]" % (ac(i,2)))
    print("	str.w %s, [r0, #12]" % (ac(i,3)))
    print("	str.w %s, [r0], #16" % (ac(i,0)))
  
def SCH_polymul_N1xN_mod2(N1,N, _P) :
    print("mul_head:")
    print(" // increasing thread length")
    print("	push.w {lr}")
    print("	mov	%s, #0" % (ac(0,0)))
    
    print(" // later blocks")
    strips_of_base = N1 // coeffi_per_strip
    first_label = strips_of_base # max mul start from this
    _P_label = (N - _P) / coeffi_per_strip + first_label
    _P_label_dot = _P_label - int(_P_label)
    cut_half = (_P_label_dot == 0.5)
    assert(_P_label_dot == 0 or _P_label_dot == 0.5)
    first_component_coeffis = N % N1
    BASE_label = first_component_coeffis // coeffi_per_strip + first_label

    for i in range(0,N//coeffi_per_strip) : # i is thread count (amount of strips at the top)
        if i == first_label:
            print("mul_%d:" % (N))
        elif i == _P_label:
            print("mul_%d:" % (_P))
        elif i >= BASE_label and (i-BASE_label) % (strips_of_base) == 0:
            print("mul_%d:" % (N - first_component_coeffis - coeffi_per_strip*(i-BASE_label)))
        
        if (2*_P) % BASE != 0:
            done_coeffis = N1 - (_P % N1) # max coeffi num in f and g = _P - done_coeffis
            first_label_for_fg_mul = _P_label + (done_coeffis / coeffi_per_strip)
            if i >= first_label_for_fg_mul and (i - first_label_for_fg_mul) % (strips_of_base) == 0:
                print("mul_%d:" % (_P - done_coeffis - coeffi_per_strip*(i-first_label_for_fg_mul)))
        
        if cut_half and i == N1 // coeffi_per_strip:
            for part in range(2):
                start_strip_top_2b(i, part)
                for j in range(1, N1//coeffi_per_block) :
                    continue_strip_top_2b (i,j,part)
                end_strip_top_2b(i, part)
                if part == 0:
                    print("mul_%d:" % (_P))

        else:
            start_strip_top (i)

            if i < N1 // coeffi_per_strip:
                for j in range(1, 4*i+1) :
                    continue_strip_top (i,j)
            else:
                for j in range(1, N1//coeffi_per_block) :
                    continue_strip_top (i,j)

            if i < N1 // coeffi_per_strip: # for N1 = 32
                end_strip_top (i)
                if i == N1 // coeffi_per_strip - 1:
                    print("	pop.w {pc}")
            else:
                end_strip_top_2(i)

    print("mul_%d:" % (N1))
    
    print(" // decreasing thread length")
    for i in range(N//coeffi_per_strip, (N1+N)//coeffi_per_strip-1) :

        j_last_idx = N1 // coeffi_per_block -1
        j_top_at_i = 4*(i - N//coeffi_per_strip) # not included

        start_strip_bot (i, j_last_idx)

        for j in range(j_last_idx - 1, j_top_at_i + 3, -1) :
            continue_strip_bot (i,j)
        end_strip_bot (i, j_top_at_i + 4) 
        
    print(" // mv hh back to h")

    i = (N1+N)//coeffi_per_strip-1
    print("	mov	%s, #0" % (ac(i,1)))
    print("	mov	%s, #0" % (ac(i,2)))
    print("	mov	%s, #0" % (ac(i,3)))
    print("	mov	%s, #0" % (ac(i,4)))

    j = N1 // coeffi_per_block
    end_offset = (N // coeffi_per_block) * bytes_per_block
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,1), r_14, end_offset-12))
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,2), r_14, end_offset-8))
    print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,3), r_14, end_offset-4))
    end_strip_bot(i, j)
    print("	pop.w {pc}")

def SCH_polymul_N1xN_mod2_jump_end(N1,N) :
    assert(N1 % coeffi_per_strip == 0)
    assert(N % 16 == 0)

    print(" // increasing thread length")
    print("	push.w {lr}")
    print("	mov	%s, #0" % (ac(0,0)))

    for i in range(N//coeffi_per_strip) : # i is thread count
        start_strip_top (i)

        if i < N1 // coeffi_per_strip:
            for j in range(1, 4*i+1) :
                continue_strip_top (i,j)
        else:
            for j in range(1, N1//coeffi_per_block) :
                continue_strip_top (i,j)

        if i < N1 // coeffi_per_strip: # for N1 = 32
            end_strip_top (i)
        else:
            end_strip_top_2(i)

    mul_blocks_remainder = N % coeffi_per_strip
    if mul_blocks_remainder:
        i = N//coeffi_per_strip
        print("	// ([%d-%d], 0) blocks" % (4*i, 4*i+1))
        print("	ldr.w	%s, [%s]" % (ar(i,0,4), r_12))
        print("	ldr.w	%s, [%s, #%d]" % (ar(i,0,1), r_14, 16*i+4))
        print("	ldr.w	%s, [%s, #%d]" % (ar(i,0,0), r_14, 16*i))
        print("	umull	%s, %s, %s, %s" % (ac(i,1),ac(i,2),ar(i,0,1),ar(i,0,4)))
        print("	umlal	%s, %s, %s, %s" % (ac(i,0),ac(i,1),ar(i,0,0),ar(i,0,4)))

        for j in range(1, N1//coeffi_per_block):
            print("	// ([%d-%d], %d) blocks" % (4*i-j, 4*i-j+1, j))
            print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,4), r_12, 4*j))
            print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,0), r_14, 16*i-4*j))
            print("	umlal	%s, %s, %s, %s" % (ac(i,0),ac(i,1),ar(i,j,0),ar(i,j,4)))
            print("	umlal	%s, %s, %s, %s" % (ac(i,1),ac(i,2),ar(i,j,1),ar(i,j,4)))

            for id in range(3):
                reduce_mod2(ac(i,id), ac(i,id))
        
        print("	str.w %s, [r0, #4]" % (ac(i,1)))
        print("	str.w %s, [r0], #8" % (ac(i,0)))

    print("	pop.w {pc}")

def polymul(N1, NN, _N):
    assert(NN >= N1)
    assert(N1 % coeffi_per_strip ==0)
    assert(NN % coeffi_per_strip ==0)
    assert(_N % 16 ==0)

    globals()["N1"]=N1
    globals()["N"]=NN

    print(".p2align 2,,3")
    print(".syntax unified")
    print(".text")

    if do_jump_head_4_0:
        SCH_polymul_mod2_head_last()

    SCH_polymul_N1xN_mod2(N1,NN,_N)