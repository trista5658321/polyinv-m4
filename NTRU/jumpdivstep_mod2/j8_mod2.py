f0 = "r0"
g0 = "r3"
u0 = "r6"
v0 = "r8"
r0 = "r10"
s0 = "r12"
X0 = "r4"
X1 = "r5"

g_0 = "r7"

def mul_mod2_g0xX (d0, a0, g_0) : # d = a * g[0]
    print("	mul	%s, %s, %s	// d0 = a * g[0]" % (d0, a0, g_0))

def sub_from_mod3_d (a0, b0) : # a0 - b0, destroys (b0,b1), flags
    print("	eors %s, %s, %s	// (a0^b0)" % (a0, a0, b0))

print("// bitslice functions")
print(".p2align	2,,3")
print(".syntax		unified")
print(".text")
print(".global 	jump8divsteps")
print(".type		jump8divsteps, %function")
# print("//normal usage is 'vmov.f32 s0, #31.0' before calling")
print("//int jump8divsteps(int delta, int *f, int *g, int *M);")
print("jump8divsteps:")
print("	push	{r4-r11,lr}")
print("	vmov	s2, r3		// save result matrix ptr")
print("	vmov	s3, r0		// save delta")

print("	ldr	%s, [r1]" % f0)
print("	ldr	%s, [r2]" % g0)

print("	mov	%s, #1" % u0)
print("	mov	%s, #1" % s0)

for i in [v0,r0] :
    print("	mov	%s, #0" % (i))

print("	vmov.f32 s0, #7.0")
print("	vmov.f32	s1, #1.0	// float 1.0 #112")
print("	vcvt.f32.s32	s3, s3		// convert to float")
print("jump8divsteps_0:		// first half")
print("	vcmp.f32	s3, s1		// delta > 0?")
print("	vmrs	APSR_nzcv, FPSCR	// move carry")
print("	itttt	cs")
print("	tstcs	r0, %s, LSR #1	// set cs by g0[0], then if cs" % (g0))
print("	movcs	r5, %s	// f0<->g0" % (f0))
print("	movcs	%s, %s" % (f0, g0))
print("	movcs	%s, r5" % (g0))
print("	ittt	cs")
print("	movcs	r5, r6	// u0<->r0")
print("	movcs	r6, r10")
print("	movcs	r10, r5")

print("	itttt	cs")
print("	movcs	r5, r8	// v0<->s0")
print("	movcs	r8, r12")
print("	movcs	r12, r5")
print("	vnegcs.f32	s3, s3")
print("jump8divsteps_1:		// second half")
print("	vadd.f32	s3, s3, s1	// delta++")

print("	and	%s, %s, #0x1	// g[0]" % (g_0, g0))
for R in [(u0,r0),(v0,s0),(f0,g0)] :
    mul_mod2_g0xX(X0,R[0],g_0) 
    sub_from_mod3_d(R[1],X0)

print("	lsr	%s, %s, #4	// g = g/x" % (g0,g0))

print("	vsub.f32	s0, s0, s1")
print("	vcmp.f32	s0, #0.0")
print("	vmrs	APSR_nzcv, FPSCR	// move c flag")
print("	ittt	cs	// u = xu, v = xv if ct >= 0")

for i in [u0,v0] :
    print("	lslcs	%s, %s, #4" % (i,i))

print("	bcs	jump8divsteps_0")
print("jump8divsteps_2:	// clean up")

print("	vmov	r4, s2		// reload output ptr for results")

print(("	stm	%s,{"+"%s,"*5+"%s}") % (X0,f0,g0,u0,v0,r0,s0))

print("	vcvt.s32.f32	s3, s3	// back to int")
print("	vmov	r0, s3		// restore delta")
print("	pop	{r4-r11,pc}")
