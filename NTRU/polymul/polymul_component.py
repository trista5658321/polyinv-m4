import sys, pathlib

ROOT_PATH = str(pathlib.Path(__file__).parent.absolute().parent.parent)
sys.path.append(ROOT_PATH)

from NTRU.const import coeffi_per_strip, coeffi_per_block, bytes_per_block

r_12 = "r1" # "left coeffi"
r_14 = "r2" # "top coeffi"

def reduce_mod2 (rd, rs):
    print("	and.w	%s, %s, #0x11111111" % (rd, rs))

def get_block_id_end(top_coeffi):
    return top_coeffi // coeffi_per_block

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

def start_strip_bot (i, j, head_coeffi) :
    blocks_start = 4*(i - head_coeffi//coeffi_per_strip)
    i_offset_start = ((coeffi_per_strip*i - head_coeffi) // coeffi_per_block) * bytes_per_block

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

def end_strip_bot (i, j, block_id_end):
    
    j_offset_start = bytes_per_block*(j-4) # j at bot

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
    
def end_strip_top_2b (i, part) :
    print("	str.w %s, [r0, #4]" % (ac(i,1+2*part)))
    print("	str.w %s, [r0], #8" % (ac(i,0+2*part)))