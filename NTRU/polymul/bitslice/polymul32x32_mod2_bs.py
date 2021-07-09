def mul32_mod3 (f0,g0,L0,H0,X0,CT,name) :
    # CT:0=unroll else cnt reg, name = name of routine
    # L = g[31] * f
    print("	and	%s, %s, %s, ASR #31" % (L0,f0,g0))
    # g <<= 1
    print("	rors	%s, %s, #31" % (g0,g0))
    # initialize H
    print("	ubfx	%s, %s, #31, #1" % (H0, L0))
    # X = g[31] * f
    print("	and	%s, %s, %s, ASR #31" % (X0,f0,g0))

    # L = (L << 1) + X
    print("	eor	%s, %s, %s, LSL #1" % (L0, X0, L0))

    if (CT != 0) :
        print("	mov	%s, #30" % (CT))
        print("%s_0:" % (name))
        count = 1
    else :
        count = 30
    for i in range(count) :
        # g <<= 1
        print("	rors	%s, %s, #31" % (g0,g0))

        # X = g[31] * f
        print("	ands	%s, %s, %s, ASR #31" % (X0,f0,g0))
        
        # (H,L) = ((H,L) << 1) + X
        print("	eors	%s, %s, %s, LSL #1" % (L0, X0, L0))
        print("	adc	%s, %s, %s	// RLX" % (H0, H0, H0))

    if (CT != 0) :
        print("	subs	%s, #1" % (CT))
        print("	bne	%s_0" % (name))

print("// bitslice functions")
print(".p2align	2,,3")
print(".syntax		unified")
print(".text")
print(".global 	polymul_32x32_mod2_bs")
print(".type		polymul_32x32_mod2_bs, %function")
print("// void polymul_32x32_mod2_bs(int *h, int *f, int *g);")
print("polymul_32x32_mod2_bs:")
print("	push	{r4-r11,lr}")

print("	ldr	r4, [r1]") # f0
print("	ldr	r5, [r2]") # g0

mul32_mod3 ("r4","r5","r6","r7","r8",0,"")
print("	stm	r0!, {r6-r7}")
print("	pop	{r4-r11,pc}")
