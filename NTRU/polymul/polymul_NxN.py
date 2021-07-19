import sys, pathlib

ROOT_PATH = str(pathlib.Path(__file__).absolute().parent.parent.parent)
sys.path.append(ROOT_PATH)

from utility import LENGTH
from NTRU.const import coeffi_per_strip, coeffi_per_block, bytes_per_block
from NTRU.polymul.polymul_component import ac, ar, r_14, get_block_id_end, start_strip_top, continue_strip_top, end_strip_top, start_strip_bot, continue_strip_bot, end_strip_bot

coeffi = LENGTH # n x n
N = coeffi

__polymul_name = "__polymul_" + str(coeffi) + "x" + str(coeffi) + "_mod2"
print(".p2align 2,,3")
print(".syntax unified")
print(".text")
print(".global " + __polymul_name + "")
print(".type  " + __polymul_name + ", %function")
print(__polymul_name + ":")

block_id_end = get_block_id_end(N)

print(" // increasing thread length")
print("	push.w {lr}")
print("	mov	%s, #0" % (ac(0,0)))

print(" // later blocks")

for i in range(N//coeffi_per_strip) : # i is thread count (amount of strips at the top)
    start_strip_top (i)
    for j in range(1, 4*i+1) :
        continue_strip_top (i,j)
    end_strip_top (i)

print(" // decreasing thread length")
for i in range(N//coeffi_per_strip, (N+N)//coeffi_per_strip-1) :

    j_last_idx = N // coeffi_per_block -1
    j_top_at_i = 4*(i - N//coeffi_per_strip) # not included

    start_strip_bot (i, j_last_idx, N)

    for j in range(j_last_idx - 1, j_top_at_i + 3, -1) :
        continue_strip_bot (i,j)
    end_strip_bot (i, j_top_at_i + 4, block_id_end) 
    
print(" // mv hh back to h")

i = (N+N)//coeffi_per_strip-1
print("	mov	%s, #0" % (ac(i,1)))
print("	mov	%s, #0" % (ac(i,2)))
print("	mov	%s, #0" % (ac(i,3)))
print("	mov	%s, #0" % (ac(i,4)))

j = N // coeffi_per_block
end_offset = (N // coeffi_per_block) * bytes_per_block
print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,1), r_14, end_offset-12))
print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,2), r_14, end_offset-8))
print("	ldr.w	%s, [%s, #%d]" % (ar(i,j,3), r_14, end_offset-4))
end_strip_bot(i, j, block_id_end)
print("	pop.w {pc}")