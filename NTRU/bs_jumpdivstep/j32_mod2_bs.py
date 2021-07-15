input_M = "r1"
input_f = "r2"
input_g = "r3"

f0 = "r0"
g0 = "r1"
u0 = "r6"
v0 = "r7"
r0 = "r8"
s0 = "r9"
X0 = "r4"
X1 = "r5"

tmp = ["r4", "r5", "r6", "r7"]
tmp2 = ["r8", "r9", "r10", "r11"]

tmp3 = ["r2", "r3", "r4", "r5"]
tmp4 = ["r10", "r11", "r12", "lr"]

def to_bit(rd, rs):
    for i in range(4):
        print("	ubfx.w %s, %s, #%d, #1" % (tmp2[i], rs, 4*i))
    
    for i in range(4):
        print("	eor.w %s, %s, %s, LSL #1" % (rd, tmp2[i], rd))

    for i in range(4):
        print("	ubfx.w %s, %s, #%d, #1" % (tmp2[i], rs, 4*(i+4)))
    
    for i in range(4):
        print("	eor.w %s, %s, %s, LSL #1" % (rd, tmp2[i], rd))

def convert_input(rd, rs, comment):
    print("	ldr	%s, [%s]" % (tmp[0], rs))
    for i in range(1,4):
        print("	ldr	%s, [%s, #%d]" % (tmp[i], rs, 4*i))
    print("	mov.w %s, #0 // %s" % (rd, comment))

    for i in range(4):
        to_bit(rd, tmp[i])

def to_4bit(rs):
    for j in range(4):
        if j == 0:
            print("	and.w %s, %s, #0x1" % (tmp4[j], rs))
        else:
            print("	ubfx.w %s, %s, #%d, #1" % (tmp3[0], rs, 8*j))
            print("	mov.w %s, %s" % (tmp4[j], tmp3[0]))
        for i in range(1, 4):
            print("	ubfx.w %s, %s, #%d, #1" % (tmp3[i], rs, i+8*j))
            print("	eor.w %s, %s, %s, LSL #4" % (tmp4[j], tmp3[i], tmp4[j]))
        for i in range(4):
            print("	ubfx.w %s, %s, #%d, #1" % (tmp3[i], rs, (i+4+8*j)))
            print("	eor.w %s, %s, %s, LSL #4" % (tmp4[j], tmp3[i], tmp4[j]))

def convert_output(rd, rs, comment="", init=False):
    to_4bit(rs)
    if init:
        print("	vmov %s, s2	// reload output ptr for results" % (rs))

    for i in range(1, len(tmp4)):
        print("	str %s, [%s, #%d]" % (tmp4[len(tmp4)-1-i], rd, 4*i))
    print("	str %s, [%s], #%d" % (tmp4[len(tmp4)-1], rd, 4*len(tmp4)))



def mul_mod2_g0xX (d0, a0, b0) : # d = a * b
    print("	and	%s, %s, %s	// d0 = a0 & b0" % (d0, a0, b0))

def sub_from_mod3_d (a0, b0) : # a0 - b0, destroys (b0,b1), flags
    print("	eors %s, %s, %s	// (a0^b0)" % (a0, a0, b0))

print("// bitslice functions")
print(".p2align	2,,3")
print(".syntax		unified")
print(".text")
print(".global 	jump32divsteps_mod2")
print(".type		jump32divsteps_mod2, %function")
# print("//normal usage is 'vmov.f32 s0, #31.0' before calling")
print("//int jump32divsteps_mod2(int delta, int *M, int *f, int *g);")
print("jump32divsteps_mod2:")
print("	push	{r4-r11,lr}")
print("	vmov	s2, %s		// save result matrix ptr" % (input_M))
print("	vmov	s3, r0		// save delta")

# convert input
convert_input(f0, input_f, "f")
convert_input(g0, input_g, "g")

print("	mov	%s, #(1<<31)" % u0)
print("	mov	%s, #(1<<31)" % s0)

for i in [v0,r0] :
    print("	mov	%s, #0" % (i))

print("	vmov.f32 s0, #31.0")
print("	vmov.f32	s1, #1.0	// float 1.0 #112")
print("	vcvt.f32.s32	s3, s3		// convert to float")
print("bs2_jump32divsteps_0:		// first half")
print("	vcmp.f32	s3, s1		// delta > 0?")
print("	vmrs	APSR_nzcv, FPSCR	// move carry")
print("	itttt	cs")
print("	tstcs	r0, %s, LSL #1	// set cs by g0[0], then if cs" % (g0))
print("	movcs	r5, %s	// f0<->g0" % (f0))
print("	movcs	%s, %s" % (f0, g0))
print("	movcs	%s, r5" % (g0))
print("	ittt	cs")
print("	movcs	r5, %s	// u0<->r0" % (u0))
print("	movcs	%s, %s" % (u0, r0))
print("	movcs	%s, r5" % (r0))

print("	itttt	cs")
print("	movcs	r5, %s	// v0<->s0" % (v0))
print("	movcs	%s, %s" % (v0, s0))
print("	movcs	%s, r5" % (s0))
print("	vnegcs.f32	s3, s3")
print("bs2_jump32divsteps_1:		// second half")
print("	vadd.f32	s3, s3, s1	// delta++")

for R in [(u0,r0),(v0,s0),(f0,g0)] :
    mul_mod2_g0xX(X0,R[0],g0+", ASR #31") 
    sub_from_mod3_d(R[1],X0)

print("	lsl	%s, %s, #1	// g = g/x" % (g0,g0))

print("	vsub.f32	s0, s0, s1")
print("	vcmp.f32	s0, #0.0")
print("	vmrs	APSR_nzcv, FPSCR	// move c flag")
print("	ittt	cs	// u = xu, v = xv if ct >= 0")

for i in [u0,v0] :
    print("	lsrcs	%s, %s, #1" % (i,i))

print("	bcs	bs2_jump32divsteps_0")
print("bs2_jump32divsteps_2:	// clean up")

# for i in [f0,g0,u0,v0,r0,s0] :
#     print("	rbit	%s, %s" % (i,i))

# print("	vmov	r4, s2		// reload output ptr for results")

str_rd = f0
convert_output(str_rd, f0, "f0", True)
convert_output(str_rd, g0, "g0")
convert_output(str_rd, u0, "u0")
convert_output(str_rd, v0, "v0")
convert_output(str_rd, r0, "r0")
convert_output(str_rd, s0, "s0")

# print(("	stm	%s,{"+"%s,"*5+"%s}") % (X0,f0,g0,u0,v0,r0,s0))

print("	vcvt.s32.f32	s3, s3	// back to int")
print("	vmov	r0, s3		// restore delta")
print("	pop	{r4-r11,pc}")
