# ref: https://github.com/B03901108/Karatsuba-and-Toom-Cook-on-M4

#!/usr/bin/python
import sys
import re
import numpy
from Toom4_Matrix import Toom4Table

_2P15 = (1 << 15)

try: NN = int(sys.argv[1])
except: NN = 768

try: q = int(sys.argv[2])
except: q = 4591

qR2inv = round(2**32 / q)

# fixed setting
output_mode = 't'
ftn_name_T4 = 'gf_polymul_%sx%s' % (NN, NN)
smaller_mult = 'gf_polymul_%sx%s' % (NN//4, NN//4)
no_small_input = 'y'

# try: output_mode = sys.argv[2]
# except: output_mode = 't'
# try: ftn_name_T4 = sys.argv[3]
# except: ftn_name_T4 = 'Toom4_mult_asm'
# try: smaller_mult = sys.argv[4]
# except: smaller_mult = 'Karatsuba_mult_asm'
# try: no_small_input = sys.argv[5]
# except: no_small_input = 'n'



assert(NN > 0)
assert(NN % 8 == 0)
assert((output_mode == 't') or (output_mode == 'nt')) #TODO: output_mode == 'nt'
assert((no_small_input == 'y') or (no_small_input == 'n'))

def str_offset_check(rs, offset, tmp):
	if offset > 4092:
		print('  movw.w %s, #%d' % (tmp, offset))
		print('  str.w %s, [r0, %s]' % (rs, tmp))
	else:
		print('  str.w %s, [r0, #%d]' % (rs, offset))

def ldr_offset_check(rd, offset, tmp, rs="r0"):
	if offset > 4092:
		print('  movw.w %s, #%d' % (tmp, offset))
		print('  ldr.w %s, [%s, %s]' % (rd, rs, tmp))
	else:
		print('  ldr.w %s, [%s, #%d]' % (rd, rs, offset))

#assert intIn is an integer
def is_constant(intIn):
	bin_str = numpy.binary_repr(intIn, width=32)
	if len(bin_str.strip('0')) <= 8: return True
	if (bin_str[0 : 8] == bin_str[16 : 24]) and (bin_str[8 : 16] == bin_str[24 : 32]):
		if (bin_str[0 : 8] == '0' * 8): return True
		if (bin_str[8 : 16] == '0' * 8): return True
		if (bin_str[0 : 8] == bin_str[8 : 16]): return True
	return False


def barrett_16x2(regIn, regLow, regHigh, reg_qR2inv, reg__2P15, reg_q):
	print('  smlawb.w %s, %s, %s, %s' % (regLow, reg_qR2inv, regIn, reg__2P15))
	print('  smlawt.w %s, %s, %s, %s' % (regHigh, reg_qR2inv, regIn, reg__2P15))
	print('  smulbt.w %s, %s, %s' % (regLow, reg_q, regLow))
	print('  smulbt.w %s, %s, %s' % (regHigh, reg_q, regHigh))
	print('  pkhbt.w %s, %s, %s, lsl #16' % (regLow, regLow, regHigh))
	print('  ssub16.w %s, %s, %s' % (regIn, regIn, regLow))


def barrett_32x2(regInL, regInH, reg_tmp, reg_qR2inv, reg_q):
	print('  smmulr.w %s, %s, %s' % (reg_tmp, reg_qR2inv, regInL))
	print('  mls.w %s, %s, %s, %s' % (regInL, reg_q, reg_tmp, regInL))
	print('  smmulr.w %s, %s, %s' % (reg_tmp, reg_qR2inv, regInH))
	print('  mls.w %s, %s, %s, %s' % (regInH, reg_q, reg_tmp, regInH))
	print('  pkhbt.w %s, %s, %s, lsl #16' % (regInL, regInL, regInH))


def print_prologue():
	print('.p2align 2,,3')
	print('.syntax unified')
	print('.text')
	print('')


#to_be_optimized: use sp itself w/o the uncanny bug
def print_Toom4():
	print('.global %s' % (ftn_name_T4))
	print('.type %s,' % (ftn_name_T4), end=' ')
	print('%function')
	print('@ %dx%d Toom-4' % (NN, NN))
	output_type = 'uint32_t *' if output_mode == 't' else 'int32_t *'
	print('@ void %s(%sh, uint32_t *c, uint32_t *f)' % (ftn_name_T4, output_type))
	print('%s:' % (ftn_name_T4))
	print('  push.w {r4-r12, lr}')
	print('  vpush.w { s16 }')
	print('  sub.w sp, sp, #%d' % (NN * 5 + NN * 14))
	print('  vmov.w s0, r0')
	print('  mov.w r0, sp')

	eval_input_coefs('c')
	the_other_input = 'd' if no_small_input == 'y' else 'f'
	eval_input_coefs(the_other_input)
	print('  vmov.w r4, s0')
	print('  mov.w r5, r0')
	print('  sub.w r6, r1, #%d' % (NN // 2))
	print('  sub.w r7, r2, #%d' % (NN // 2))

	print('  mov.w r1, r6')
	print('  mov.w r2, r7')
	print('  bl.w %s' % (smaller_mult))
	for it in range(1, 6):
		if it == 1: print('  add.w r0, r5, #%d' % (NN * 4))
		if it == 2: print('  add.w r0, r5, #%d' % (NN * 1))
		if it == 3: print('  add.w r0, r5, #%d' % (NN * 5))
		if it == 4: print('  add.w r0, r5, #%d' % (NN * 2))
		if it == 5: print('  add.w r0, r5, #%d' % (NN * 6))
		print('  sub.w r1, r5, #%d' % (NN // 2 * (11 - it)))
		print('  sub.w r2, r5, #%d' % (NN // 2 * (6 - it)))
		print('  bl.w %s' % (smaller_mult))
	print('  add.w r0, r5, #%d' % (NN * 3))
	print('  add.w r1, r6, #%d' % (NN // 2 * 3))
	print('  add.w r2, r7, #%d' % (NN // 2 * 3))
	print('  bl.w %s' % (smaller_mult))

	print('  vmov.w s0, r4')
	print('  mov.w r0, r5')
	interpol_output_coefs_t() #assert all the product arrays are trimmed.
	copy_output_coefs()

	print('  add.w sp, sp, #%d' % (NN * 5 + NN * 14))
	print('  vpop.w { s16 }')
	print('  pop.w {r4-r12, pc}')
	Toom4Table(q)


def eval_input_coefs(arr_name):
	assert((arr_name == 'c') or (arr_name == 'd') or (arr_name == 'f'))
	(source_addr, unused_addr) = ('r1', 'r2') if arr_name == 'c' else ('r2', 'r1')
	print('  vmov.w s1, %s' % (unused_addr))
	if arr_name == 'f':
		print('  mvn.w r1, #0x00010000')
		print('  mvn.w r3, #0x00030000')
		print('  mvn.w r4, #0x00070000')
	else:
		print('  movw.w %s, #%d' % (unused_addr, q))
		print('  movw.w r3, #%d' % (_2P15))
		print('  movw.w r4, #%d' % (qR2inv % (2 ** 16)))
		print('  movt.w r4, #%d' % (qR2inv // (2 ** 16)))
	print('  add.w lr, r0, #%d' % (NN // 2))
	print('%s_eval_input_%s_body:' % (ftn_name_T4, arr_name))
	print('  ldr.w r8, [%s, #%d]' % (source_addr, NN // 2 * 3))
	print('  ldr.w r7, [%s, #%d]' % (source_addr, NN // 2 * 1))
	print('  ldr.w r6, [%s, #%d]' % (source_addr, NN // 2 * 2))
	print('  ldr.w r5, [%s], #4' % (source_addr))

	# for read
	# a0 = "r5"
	# a1 = "r7"
	# a2 = "r6"
	# a3 = "r8"

	if arr_name == 'f':
		print('  and.w r9, r1, r7, lsl #1')
		print('  and.w r10, r4, r8, lsl #3')
	else:
		print('  lsl.w r9, r7, #1') # 2 a1
		print('  lsl.w r10, r8, #3') # 2^3 a3
		assert(q < 2**15)
		print('  bfc.w r9, #16, #1') 
		assert(4*q < 2**15)
		print('  bfc.w r10, #16, #3')
	
	reduction_first = not (5*q < 2**15) # r9 + r10
	if (reduction_first):
		# print("need reduction")
		barrett_16x2('r10', 'r12', 'r11', 'r4', 'r3', unused_addr)

	print('  sadd16.w r9, r9, r10') # 2 a1 + 2^3 a3
	if arr_name != 'f' and not reduction_first: barrett_16x2('r9', 'r10', 'r11', 'r4', 'r3', unused_addr)

	r9_value = q+q//2

	if arr_name == 'f': print('  and.w r10, r3, r6, lsl #2')
	else:
		print('  lsl.w r10, r6, #2') # 2^2 a2
		assert(2*q < 2**15)
		print('  bfc.w r10, #16, #2')
	assert((2*q+q//2) < 2**15)
	print('  sadd16.w r10, r10, r5') # 2^2 a2 + a0
	
	r10_value = (2*q+q//2)
	assert((r9_value + r10_value) < 2**15)
	print('  sadd16.w r11, r10, r9') # h(2) done
	print('  ssub16.w r10, r10, r9') # h(-2) done

	if arr_name != 'f':
		barrett_16x2('r11', 'r9', 'r12', 'r4', 'r3', unused_addr)
		barrett_16x2('r10', 'r9', 'r12', 'r4', 'r3', unused_addr)

	if arr_name == 'f':
		print('  and.w r9, r4, r5, lsl #3')
		print('  and.w r12, r1, r6, lsl #1')
	else:
		print('  lsl.w r9, r5, #3') # 2^3 a0
		print('  lsl.w r12, r6, #1') # 2 a2
		assert(4*q < 2**15)
		print('  bfc.w r9, #16, #3')
		assert(q < 2**15)
		print('  bfc.w r12, #16, #1')
	
		reduction_first = not (5*q < 2**15)
		if (reduction_first):
			# print("need reduction")
			print('  vmov s3, s4, r5, r6')
			barrett_16x2('r9', 'r5', 'r6', 'r4', 'r3', unused_addr)
			print('  vmov r5, r6, s3, s4')

	print('  sadd16.w r9, r9, r12') # 2^3 a0 + 2 a2
	assert(q < 2**15)
	print('  sadd16.w r5, r5, r6')
	r5_value = q
	if arr_name != 'f' and (not reduction_first): barrett_16x2('r9', 'r6', 'r12', 'r4', 'r3', unused_addr)
	r9_value = q//2
	if not reduction_first:
		r9_value = q//2 + q

	if arr_name == 'f': print('  and.w r12, r3, r7, lsl #2')
	else:
		print('  lsl.w r12, r7, #2') # 2^2 a1
		assert(2*q < 2**15)
		print('  bfc.w r12, #16, #2')

	r12_value = 2*q
	assert(r12_value+q//2 < 2**15)
	print('  sadd16.w r12, r12, r8') # 2^2 a1 + a3
	assert(q < 2**15)
	print('  sadd16.w r7, r7, r8') # a1 + a3
	r7_value = q

	assert(r9_value+r12_value < 2**15)
	print('  sadd16.w r9, r9, r12') # h(1/2) done
	if arr_name != 'f': barrett_16x2('r9', 'r6', 'r8', 'r4', 'r3', unused_addr)
	r9_value = q//2
	
	assert(r5_value+r7_value < 2**15)
	print('  ssub16.w r8, r5, r7') # h(-1) done
	print('  sadd16.w r7, r5, r7') # h(1) done
	if arr_name != 'f':
		barrett_16x2('r8', 'r5', 'r6', 'r4', 'r3', unused_addr)
		barrett_16x2('r7', 'r5', 'r6', 'r4', 'r3', unused_addr)

	print('  str.w r10, [r0, #%d]' % (NN // 2 * 4)) #eval at -2
	print('  str.w r11, [r0, #%d]' % (NN // 2 * 3)) #eval at +2
	print('  str.w r8, [r0, #%d]' % (NN // 2 * 2)) #eval at -1
	print('  str.w r7, [r0, #%d]' % (NN // 2 * 1)) #eval at +1
	print('  str.w r9, [r0], #4') #eval at +1/2

	print('  cmp.w r0, lr')
	print('  bne.w %s_eval_input_%s_body' % (ftn_name_T4, arr_name))
	print('  vmov.w %s, s1' % (unused_addr))
	print('  add.w r0, r0, #%d' % (NN // 2 * 4))


def interpol_output_coefs_t():
	print('  add.w lr, r0, #%d' % (NN))
	print('  movw.w r12, #%d' % (qR2inv % (2 ** 16)))
	print('  movt.w r12, #%d' % (qR2inv // (2 ** 16)))
	print('  movw.w r11, #%d' % (q))
	print('	 movw.w r10, :lower16:Toom4Table_%d' % q)
	print('	 movt.w r10, :upper16:Toom4Table_%d' % q)
	print('	 vldm	r10, {s1-s16} @ read table')

	print('  add.w r1, r0, #%d' % (NN * 6))
	print('%s_interpol_output_body:' % (ftn_name_T4))
	print('  ldr.w r10, [r0, #%d]' % (NN * 3))
	print('  ldr.w r9, [r1]')
	print('  ldr.w r8, [r0, #%d]' % (NN * 2))
	ldr_offset_check("r7", (NN * 5), "r4")
	# print('  ldr.w r7, [r0, #%d]' % (NN * 5))
	print('  ldr.w r6, [r0, #%d]' % (NN * 1))
	ldr_offset_check("r3", (NN * 4), "r4")
	# print('  ldr.w r3, [r0, #%d]' % (NN * 4))
	print('  ldr.w r4, [r0], #4')
	print('  pkhbt.w r1, r4, r6, lsl #16')
	print('  pkhtb.w r2, r6, r4, asr #16')
	print('  pkhbt.w r4, r7, r8, lsl #16')
	print('  pkhtb.w r5, r8, r7, asr #16')
	print('  pkhbt.w r6, r9, r10, lsl #16')
	print('  pkhtb.w r7, r10, r9, asr #16')

	print('  vmov.w r10, s1')
	print('  smuad.w r8, r10, r1')
	print('  smuad.w r9, r10, r2')
	#print('  mvn.w r10, #203')
	print('  vmov.w r10, s16 @ bot = A[1][1]')
	#
	print('  smlabb.w r8, r10, r3, r8')
	print('  smlabt.w r9, r10, r3, r9')
	print('  vmov.w r10, s2')
	print('  smladx.w r8, r10, r4, r8')
	print('  smladx.w r9, r10, r5, r9')
	print('  vmov.w r10, s3')
	print('  smladx.w r8, r10, r6, r8')
	print('  smladx.w r9, r10, r7, r9')
	barrett_32x2('r8', 'r9', 'r10', 'r12', 'r11')
	str_offset_check("r8", (NN * 4 - 4), "r10")
	# print('  str.w r8, [r0, #%d]' % (NN * 4 - 4))

	print('  vmov.w r10, s4')
	print('  smuadx.w r8, r10, r1')
	print('  smuadx.w r9, r10, r2')
	print('  vmov.w r10, s5')
	print('  smlad.w r8, r10, r4, r8')
	print('  smlad.w r9, r10, r5, r9')
	print('  vmov.w r10, s6')
	print('  smlad.w r8, r10, r6, r8')
	print('  smlad.w r9, r10, r7, r9')
	barrett_32x2('r8', 'r9', 'r10', 'r12', 'r11')
	print('  str.w r8, [r0, #%d]' % (NN * 1 - 4))

	print('  vmov.w r10, s7')
	print('  smuad.w r8, r10, r1')
	print('  smuad.w r9, r10, r2')
	#print('  mov.w r10, #255')
	#print('  smlabb.w r8, r10, r3, r8')
	#print('  smlabt.w r9, r10, r3, r9')
	print('  vmov.w r10, s16 @ top = A[3][1]')
	print('  smlatb.w r8, r10, r3, r8')
	print('  smlatt.w r9, r10, r3, r9')
	#
	print('  vmov.w r10, s8')
	print('  smlad.w r8, r10, r4, r8')
	print('  smlad.w r9, r10, r5, r9')
	#print('  movw.w r10, #0xF70B')
	#print('  smlabt.w r8, r10, r6, r8')
	#print('  smlabt.w r9, r10, r7, r9')
	print('  vmov.w r10, s9 @ top = A[3][6]')
	print('  smlatt.w r8, r10, r6, r8')
	print('  smlatt.w r9, r10, r7, r9')
	#
	barrett_32x2('r8', 'r9', 'r10', 'r12', 'r11')
	str_offset_check("r8", (NN * 5 - 4), "r10")
	# print('  str.w r8, [r0, #%d]' % (NN * 5 - 4))

	print('  vmov.w r10, s10')
	print('  smuadx.w r8, r10, r1')
	print('  smuadx.w r9, r10, r2')
	print('  vmov.w r10, s11')
	print('  smlad.w r8, r10, r4, r8')
	print('  smlad.w r9, r10, r5, r9')
	print('  vmov.w r10, s12')
	print('  smlad.w r8, r10, r6, r8')
	print('  smlad.w r9, r10, r7, r9')
	barrett_32x2('r8', 'r9', 'r10', 'r12', 'r11')
	print('  str.w r8, [r0, #%d]' % (NN * 2 - 4))

	print('  vmov.w r10, s13')
	print('  smuad.w r8, r10, r1')
	print('  smuad.w r9, r10, r2')
	#print('  mvn.w r10, #50')
	print('  vmov.w r10, s9 @ bot = A[5][1]')
	#
	print('  smlabb.w r8, r10, r3, r8')
	print('  smlabt.w r9, r10, r3, r9')
	print('  vmov.w r10, s14')
	print('  smladx.w r8, r10, r4, r8')
	print('  smladx.w r9, r10, r5, r9')
	print('  vmov.w r10, s15')
	print('  smladx.w r8, r10, r6, r8')
	print('  smladx.w r9, r10, r7, r9')
	barrett_32x2('r8', 'r9', 'r10', 'r12', 'r11')
	print('  add.w r1, r0, #%d' % (NN * 6))
	print('  str.w r8, [r1, #-4]')

	print('  cmp.w r0, lr')
	print('  bne.w %s_interpol_output_body' % (ftn_name_T4))
	print('  sub.w r1, r0, #%d' % (NN))


def copy_output_coefs():
	tmp_reg = ['r2', 'r3', 'r4', 'r5', 'r6', 'r7', 'r8', 'r9', 'r10', 'r11', 'r12']
	print('  vmov.w r0, s0')
	step_total = (NN // 2) // 4
	if step_total < 2 * (len(tmp_reg) + 1):
		tmp_reg.append('lr')
		step_tail = step_total % len(tmp_reg)
		if step_tail < step_total:
			for rid in range(1, len(tmp_reg)): print('  ldr.w %s, [r1, #%d]' % (tmp_reg[rid], 4 * rid))
			print('  ldr.w %s, [r1], #%d' % (tmp_reg[0], 4 * len(tmp_reg)))
			for rid in range(1, len(tmp_reg)): print('  str.w %s, [r0, #%d]' % (tmp_reg[rid], 4 * rid))
			print('  str.w %s, [r0], #%d' % (tmp_reg[0], 4 * len(tmp_reg)))
		tmp_reg.pop()
	else:
		step_tail = step_total % len(tmp_reg)
		print('  add.w lr, r0, #%d' % ((step_total - step_tail) * 4))
		print('%s_copy_output_A:' % (ftn_name_T4))
		for rid in range(1, len(tmp_reg)): print('  ldr.w %s, [r1, #%d]' % (tmp_reg[rid], 4 * rid))
		print('  ldr.w %s, [r1], #%d' % (tmp_reg[0], 4 * len(tmp_reg)))
		for rid in range(1, len(tmp_reg)): print('  str.w %s, [r0, #%d]' % (tmp_reg[rid], 4 * rid))
		print('  str.w %s, [r0], #%d' % (tmp_reg[0], 4 * len(tmp_reg)))
		print('  cmp.w r0, lr')
		print('  bne.w %s_copy_output_A' % (ftn_name_T4))
	if step_tail:
		for rid in range(1, step_tail): print('  ldr.w %s, [r1, #%d]' % (tmp_reg[rid], 4 * rid))
		print('  ldr.w %s, [r1], #%d' % (tmp_reg[0], 4 * step_tail))
		for rid in range(1, step_tail): print('  str.w %s, [r0, #%d]' % (tmp_reg[rid], 4 * rid))
		print('  str.w %s, [r0], #%d' % (tmp_reg[0], 4 * step_tail))

	step_total = NN // 4 * 3
	if step_total < 2 * ((len(tmp_reg) + 1) // 2):
		tmp_reg.append('lr')
		MAX_MOVE = len(tmp_reg) // 2
		step_tail = step_total % MAX_MOVE
		if step_tail < step_total:
			for rid in range(1, MAX_MOVE):
				print('  ldr.w %s, [r1, #%d]' % (tmp_reg[MAX_MOVE + rid], NN // 2 * 7 + 4 * rid))
				print('  ldr.w %s, [r1, #%d]' % (tmp_reg[rid], 4 * rid))
			print('  ldr.w %s, [r1, #%d]' % (tmp_reg[MAX_MOVE], NN // 2 * 7))
			print('  ldr.w %s, [r1], #%d' % (tmp_reg[0], 4 * MAX_MOVE))
			for rid in range(MAX_MOVE):
				print('  sadd16.w %s, %s, %s' % (tmp_reg[rid], tmp_reg[rid], tmp_reg[MAX_MOVE + rid]))
			for rid in range(1, MAX_MOVE): print('  str.w %s, [r0, #%d]' % (tmp_reg[rid], 4 * rid))
			print('  str.w %s, [r0], #%d' % (tmp_reg[0], 4 * MAX_MOVE))
		tmp_reg.pop()
	else:
		MAX_MOVE = len(tmp_reg) // 2
		step_tail = step_total % MAX_MOVE
		print('  add.w lr, r0, #%d' % ((step_total - step_tail) * 4))
		print('%s_copy_output_B:' % (ftn_name_T4))
		for rid in range(1, MAX_MOVE):
			ldr_offset_check(tmp_reg[MAX_MOVE + rid], NN // 2 * 7 + 4 * rid, tmp_reg[0], "r1")
			# print('  ldr.w %s, [r1, #%d]' % (tmp_reg[MAX_MOVE + rid], NN // 2 * 7 + 4 * rid))
			ldr_offset_check(tmp_reg[rid], 4 * rid, tmp_reg[0], "r1")
			# print('  ldr.w %s, [r1, #%d]' % (tmp_reg[rid], 4 * rid))
		ldr_offset_check(tmp_reg[MAX_MOVE], NN // 2 * 7, tmp_reg[0], "r1")
		# print('  ldr.w %s, [r1, #%d]' % (tmp_reg[MAX_MOVE], NN // 2 * 7))
		print('  ldr.w %s, [r1], #%d' % (tmp_reg[0], 4 * MAX_MOVE))
		for rid in range(MAX_MOVE):
			print('  sadd16.w %s, %s, %s' % (tmp_reg[rid], tmp_reg[rid], tmp_reg[MAX_MOVE + rid]))
		for rid in range(1, MAX_MOVE): print('  str.w %s, [r0, #%d]' % (tmp_reg[rid], 4 * rid))
		print('  str.w %s, [r0], #%d' % (tmp_reg[0], 4 * MAX_MOVE))
		print('  cmp.w r0, lr')
		print('  bne.w %s_copy_output_B' % (ftn_name_T4))
	if step_tail:
		for rid in range(1, step_tail):
			print('  ldr.w %s, [r1, #%d]' % (tmp_reg[step_tail + rid], NN // 2 * 7 + 4 * rid))
			print('  ldr.w %s, [r1, #%d]' % (tmp_reg[rid], 4 * rid))
		print('  ldr.w %s, [r1, #%d]' % (tmp_reg[step_tail], NN // 2 * 7))
		print('  ldr.w %s, [r1], #%d' % (tmp_reg[0], 4 * step_tail))
		for rid in range(step_tail):
			print('  sadd16.w %s, %s, %s' % (tmp_reg[rid], tmp_reg[rid], tmp_reg[step_tail + rid]))
		for rid in range(1, step_tail): print('  str.w %s, [r0, #%d]' % (tmp_reg[rid], 4 * rid))
		print('  str.w %s, [r0], #%d' % (tmp_reg[0], 4 * step_tail))

	step_total = (NN // 2) // 4
	if step_total < 2 * (len(tmp_reg) + 1):
		tmp_reg.append('lr')
		step_tail = step_total % len(tmp_reg)
		if step_tail < step_total:
			for rid in range(1, len(tmp_reg)): print('  ldr.w %s, [r1, #%d]' % (tmp_reg[rid], 4 * rid))
			print('  ldr.w %s, [r1], #%d' % (tmp_reg[0], 4 * len(tmp_reg)))
			for rid in range(1, len(tmp_reg)): print('  str.w %s, [r0, #%d]' % (tmp_reg[rid], 4 * rid))
			print('  str.w %s, [r0], #%d' % (tmp_reg[0], 4 * len(tmp_reg)))
		tmp_reg.pop()
	else:
		step_tail = step_total % len(tmp_reg)
		print('  add.w lr, r0, #%d' % ((step_total - step_tail) * 4))
		print('%s_copy_output_C:' % (ftn_name_T4))
		for rid in range(1, len(tmp_reg)): print('  ldr.w %s, [r1, #%d]' % (tmp_reg[rid], 4 * rid))
		print('  ldr.w %s, [r1], #%d' % (tmp_reg[0], 4 * len(tmp_reg)))
		for rid in range(1, len(tmp_reg)): print('  str.w %s, [r0, #%d]' % (tmp_reg[rid], 4 * rid))
		print('  str.w %s, [r0], #%d' % (tmp_reg[0], 4 * len(tmp_reg)))
		print('  cmp.w r0, lr')
		print('  bne.w %s_copy_output_C' % (ftn_name_T4))
	if step_tail:
		for rid in range(1, step_tail): print('  ldr.w %s, [r1, #%d]' % (tmp_reg[rid], 4 * rid))
		print('  ldr.w %s, [r1], #%d' % (tmp_reg[0], 4 * step_tail))
		for rid in range(1, step_tail): print('  str.w %s, [r0, #%d]' % (tmp_reg[rid], 4 * rid))
		print('  str.w %s, [r0], #%d' % (tmp_reg[0], 4 * step_tail))


print_prologue()
print_Toom4()
