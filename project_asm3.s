	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"seng440Project.c"
	.text
	.align	2
	.global	genMMatrix
	.arch armv7-a
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	genMMatrix, %function
genMMatrix:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	ip, #0
	mov	fp, #0
	mov	r10, #0
	mov	r9, #0
	mov	r8, #0
	mov	r7, #0
	mov	r6, #0
	mov	r5, #0
	mov	r4, #0
	mov	lr, #0
	mov	r1, #0
	mov	r2, #0
	mov	r3, #0
	vmov.f32	s13, #3.1e+1
	vldr.32	s14, .L4
	vmov.f32	s15, #-1.1e+1
	movt	fp, 16848
	movt	r10, 49704
	movt	r9, 16736
	movt	r8, 17054
	movt	r7, 49748
	movt	r6, 49800
	movt	r5, 49440
	movt	r4, 16948
	movt	lr, 17076
	movt	ip, 16904
	movt	r1, 16768
	movt	r2, 16920
	movt	r3, 49560
	vstr.32	s13, [r0]
	vstr.32	s14, [r0, #4]
	vstr.32	s15, [r0, #8]
	str	fp, [r0, #12]	@ float
	str	r10, [r0, #16]	@ float
	str	r9, [r0, #20]	@ float
	str	r8, [r0, #24]	@ float
	str	r7, [r0, #28]	@ float
	str	r6, [r0, #32]	@ float
	str	r5, [r0, #36]	@ float
	str	r4, [r0, #40]	@ float
	str	lr, [r0, #44]	@ float
	str	ip, [r0, #48]	@ float
	str	r1, [r0, #52]	@ float
	str	r2, [r0, #56]	@ float
	str	r3, [r0, #60]	@ float
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L5:
	.align	2
.L4:
	.word	1117388800
	.size	genMMatrix, .-genMMatrix
	.align	2
	.global	genIdentityMatrix
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	genIdentityMatrix, %function
genIdentityMatrix:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	str	r1, [r0]
	str	r1, [r0, #20]
	str	r1, [r0, #40]
	str	r1, [r0, #60]
	str	r3, [r0, #16]
	str	r3, [r0, #32]
	str	r3, [r0, #48]
	str	r3, [r0, #4]
	str	r3, [r0, #36]
	str	r3, [r0, #52]
	str	r3, [r0, #8]
	str	r3, [r0, #24]
	str	r3, [r0, #56]
	str	r3, [r0, #12]
	str	r3, [r0, #28]
	str	r3, [r0, #44]
	bx	lr
	.size	genIdentityMatrix, .-genIdentityMatrix
	.align	2
	.global	scaleMatrix
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	scaleMatrix, %function
scaleMatrix:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	vmov	s15, r2	@ int
	push	{r4, r5, r6, lr}
	vldr.32	s0, [r0]
	vpush.64	{d8}
	vcvt.f32.s32	s16, s15
	vmul.f32	s0, s16, s0
	mov	r4, r1
	mov	r5, r0
	bl	roundf
	vldr.32	s15, [r5, #4]
	vcvt.s32.f32	s14, s0
	vmul.f32	s0, s16, s15
	vstr.32	s14, [r4]	@ int
	bl	roundf
	vldr.32	s15, [r5, #8]
	vcvt.s32.f32	s14, s0
	vmul.f32	s0, s16, s15
	vstr.32	s14, [r4, #4]	@ int
	bl	roundf
	vldr.32	s15, [r5, #12]
	vcvt.s32.f32	s14, s0
	vmul.f32	s0, s16, s15
	vstr.32	s14, [r4, #8]	@ int
	bl	roundf
	vldr.32	s15, [r5, #16]
	vcvt.s32.f32	s14, s0
	vmul.f32	s0, s16, s15
	vstr.32	s14, [r4, #12]	@ int
	bl	roundf
	vldr.32	s15, [r5, #20]
	vcvt.s32.f32	s14, s0
	vmul.f32	s0, s16, s15
	vstr.32	s14, [r4, #16]	@ int
	bl	roundf
	vldr.32	s15, [r5, #24]
	vcvt.s32.f32	s14, s0
	vmul.f32	s0, s16, s15
	vstr.32	s14, [r4, #20]	@ int
	bl	roundf
	vldr.32	s15, [r5, #28]
	vcvt.s32.f32	s14, s0
	vmul.f32	s0, s16, s15
	vstr.32	s14, [r4, #24]	@ int
	bl	roundf
	vldr.32	s15, [r5, #32]
	vcvt.s32.f32	s14, s0
	vmul.f32	s0, s16, s15
	vstr.32	s14, [r4, #28]	@ int
	bl	roundf
	vldr.32	s15, [r5, #36]
	vcvt.s32.f32	s14, s0
	vmul.f32	s0, s16, s15
	vstr.32	s14, [r4, #32]	@ int
	bl	roundf
	vldr.32	s15, [r5, #40]
	vcvt.s32.f32	s14, s0
	vmul.f32	s0, s16, s15
	vstr.32	s14, [r4, #36]	@ int
	bl	roundf
	vldr.32	s15, [r5, #44]
	vcvt.s32.f32	s14, s0
	vmul.f32	s0, s16, s15
	vstr.32	s14, [r4, #40]	@ int
	bl	roundf
	vldr.32	s15, [r5, #48]
	vcvt.s32.f32	s14, s0
	vmul.f32	s0, s16, s15
	vstr.32	s14, [r4, #44]	@ int
	bl	roundf
	vldr.32	s15, [r5, #52]
	vcvt.s32.f32	s14, s0
	vmul.f32	s0, s16, s15
	vstr.32	s14, [r4, #48]	@ int
	bl	roundf
	vldr.32	s15, [r5, #56]
	vcvt.s32.f32	s14, s0
	vmul.f32	s0, s16, s15
	vstr.32	s14, [r4, #52]	@ int
	bl	roundf
	vldr.32	s15, [r5, #60]
	vcvt.s32.f32	s14, s0
	vmul.f32	s0, s16, s15
	vstr.32	s14, [r4, #56]	@ int
	bl	roundf
	vldm	sp!, {d8}
	vcvt.s32.f32	s0, s0
	vstr.32	s0, [r4, #60]	@ int
	pop	{r4, r5, r6, pc}
	.size	scaleMatrix, .-scaleMatrix
	.align	2
	.global	unScaleMatrix
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	unScaleMatrix, %function
unScaleMatrix:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #1
	lsl	r2, r3, r2
	vmov	s15, r2	@ int
	vmov.f32	s13, #1.0e+0
	vcvt.f32.s32	s14, s15
	vdiv.f32	s15, s13, s14
	vldr.32	s14, [r1]	@ int
	vpush.64	{d8}
	vcvt.f32.s32	s16, s14
	vldr.32	s14, [r1, #4]	@ int
	vcvt.f32.s32	s0, s14
	vldr.32	s14, [r1, #8]	@ int
	vcvt.f32.s32	s1, s14
	vldr.32	s14, [r1, #12]	@ int
	vcvt.f32.s32	s2, s14
	vldr.32	s14, [r1, #16]	@ int
	vcvt.f32.s32	s3, s14
	vldr.32	s14, [r1, #20]	@ int
	vcvt.f32.s32	s4, s14
	vldr.32	s14, [r1, #24]	@ int
	vcvt.f32.s32	s5, s14
	vldr.32	s14, [r1, #28]	@ int
	vcvt.f32.s32	s6, s14
	vldr.32	s14, [r1, #32]	@ int
	vcvt.f32.s32	s7, s14
	vldr.32	s14, [r1, #36]	@ int
	vcvt.f32.s32	s8, s14
	vldr.32	s14, [r1, #40]	@ int
	vldr.32	s10, [r1, #44]	@ int
	vldr.32	s11, [r1, #48]	@ int
	vldr.32	s12, [r1, #52]	@ int
	vldr.32	s13, [r1, #56]	@ int
	vcvt.f32.s32	s9, s14
	vldr.32	s14, [r1, #60]	@ int
	vcvt.f32.s32	s10, s10
	vcvt.f32.s32	s11, s11
	vcvt.f32.s32	s12, s12
	vcvt.f32.s32	s13, s13
	vcvt.f32.s32	s14, s14
	vmul.f32	s16, s16, s15
	vmul.f32	s0, s0, s15
	vmul.f32	s1, s1, s15
	vmul.f32	s2, s2, s15
	vmul.f32	s3, s3, s15
	vmul.f32	s4, s4, s15
	vmul.f32	s5, s5, s15
	vmul.f32	s6, s6, s15
	vmul.f32	s7, s7, s15
	vmul.f32	s8, s8, s15
	vmul.f32	s9, s9, s15
	vmul.f32	s10, s10, s15
	vmul.f32	s11, s11, s15
	vmul.f32	s12, s12, s15
	vmul.f32	s13, s13, s15
	vmul.f32	s15, s14, s15
	vstr.32	s16, [r0]
	vstr.32	s0, [r0, #4]
	vstr.32	s1, [r0, #8]
	vstr.32	s2, [r0, #12]
	vstr.32	s3, [r0, #16]
	vstr.32	s4, [r0, #20]
	vstr.32	s5, [r0, #24]
	vstr.32	s6, [r0, #28]
	vstr.32	s7, [r0, #32]
	vstr.32	s8, [r0, #36]
	vstr.32	s9, [r0, #40]
	vstr.32	s10, [r0, #44]
	vstr.32	s11, [r0, #48]
	vstr.32	s12, [r0, #52]
	vstr.32	s13, [r0, #56]
	vstr.32	s15, [r0, #60]
	vldm	sp!, {d8}
	bx	lr
	.size	unScaleMatrix, .-unScaleMatrix
	.align	2
	.global	printMatrix
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	printMatrix, %function
printMatrix:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	movw	r7, #:lower16:.LC0
	add	r6, r0, #4
	add	r8, r0, #68
	movt	r7, #:upper16:.LC0
.L12:
	vldr.32	s15, [r6, #-4]
	vcvt.f64.f32	d7, s15
	mov	r0, r7
	vmov	r2, r3, d7
	bl	printf
	mov	r5, r6
	mov	r4, #0
.L15:
	vldmia.32	r5!, {s15}
	vcvt.f64.f32	d7, s15
	add	r4, r4, #1
	vmov	r2, r3, d7
	mov	r0, r7
	bl	printf
	cmp	r4, #3
	bne	.L15
	add	r6, r6, #16
	mov	r0, #10
	bl	putchar
	cmp	r6, r8
	bne	.L12
	pop	{r4, r5, r6, r7, r8, pc}
	.size	printMatrix, .-printMatrix
	.align	2
	.global	printMatrixInt
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	printMatrixInt, %function
printMatrixInt:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	movw	r5, #:lower16:.LC1
	mov	r4, r0
	add	r6, r0, #64
	movt	r5, #:upper16:.LC1
.L21:
	ldr	r1, [r4]
	mov	r0, r5
	bl	printf
	ldr	r1, [r4, #4]
	mov	r0, r5
	bl	printf
	ldr	r1, [r4, #8]
	mov	r0, r5
	bl	printf
	ldr	r1, [r4, #12]
	mov	r0, r5
	bl	printf
	add	r4, r4, #16
	mov	r0, #10
	bl	putchar
	cmp	r4, r6
	bne	.L21
	pop	{r4, r5, r6, lr}
	mov	r0, #10
	b	putchar
	.size	printMatrixInt, .-printMatrixInt
	.align	2
	.global	fastSin
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	fastSin, %function
fastSin:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	asr	r0, r0, #4
	vmov	s15, r0	@ int
	vldr.64	d5, .L27
	vcvt.f64.s32	d6, s15
	vdiv.f64	d7, d6, d5
	vcvt.s32.f64	s15, d7
	vmov	r3, s15	@ int
	movw	r2, #:lower16:fastCossinTable
	cmp	r3, #0
	rsblt	r3, r3, #0
	ubfxlt	r3, r3, #0, #11
	rsblt	r3, r3, #2048
	ubfxge	r3, r3, #0, #11
	movt	r2, #:upper16:fastCossinTable
	ldr	r0, [r2, r3, lsl #2]
	bx	lr
.L28:
	.align	3
.L27:
	.word	1413754136
	.word	1074340347
	.size	fastSin, .-fastSin
	.align	2
	.global	fastCos
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	fastCos, %function
fastCos:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	asr	r0, r0, #4
	vmov	s15, r0	@ int
	vldr.64	d5, .L32
	vcvt.f64.s32	d6, s15
	vdiv.f64	d7, d6, d5
	vcvt.s32.f64	s15, d7
	vmov	r3, s15	@ int
	movw	r2, #:lower16:fastCossinTable
	cmp	r3, #0
	rsblt	r3, r3, #512
	addge	r3, r3, #512
	ubfx	r3, r3, #0, #11
	movt	r2, #:upper16:fastCossinTable
	ldr	r0, [r2, r3, lsl #2]
	bx	lr
.L33:
	.align	3
.L32:
	.word	1413754136
	.word	1074340347
	.size	fastCos, .-fastCos
	.align	2
	.global	piecewiseLinearApprox
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	piecewiseLinearApprox, %function
piecewiseLinearApprox:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	vmov.f32	s15, s0
	vcvt.s32.f32	s15, s15, #15
	vmov	r2, s15	@ int
	sub	r3, r2, #16384
	sub	r3, r3, #1
	cmp	r3, #16384
	bcc	.L40
	cmn	r2, #16384
	blt	.L37
	cmp	r2, #16384
	ble	.L41
.L39:
	mov	r0, #0
	bx	lr
.L37:
	cmn	r2, #32768
	blt	.L39
	movw	r0, #21103
	mul	r0, r0, r2
	asr	r0, r0, #16
	sub	r0, r0, #4608
	sub	r0, r0, #45
	bx	lr
.L40:
	movw	r3, #21103
	movw	r0, #4653
	mul	r2, r3, r2
	add	r0, r0, r2, asr #16
	bx	lr
.L41:
	movw	r0, #30409
	mul	r0, r0, r2
	asr	r0, r0, #16
	bx	lr
	.size	piecewiseLinearApprox, .-piecewiseLinearApprox
	.align	2
	.global	fastArcTan
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	fastArcTan, %function
fastArcTan:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	vmov	s15, r0	@ int
	vcvt.f32.s32	s14, s15
	vmov	s15, r1	@ int
	eor	r2, r0, r0, asr #31
	eor	r3, r1, r1, asr #31
	sub	r2, r2, r0, asr #31
	sub	r3, r3, r1, asr #31
	cmp	r2, r3
	vcvt.f32.s32	s15, s15
	ble	.L43
	vdiv.f32	s13, s15, s14
	vmov.f32	s15, s13
	vcvt.s32.f32	s15, s15, #15
	vcmpe.f32	s13, #0
	vmov	r2, s15	@ int
	vmrs	APSR_nzcv, FPSCR
	sub	r3, r2, #16384
	sub	r3, r3, #1
	bmi	.L63
	cmp	r3, #16384
	bcc	.L64
	cmn	r2, #16384
	blt	.L52
	cmp	r2, #16384
	ble	.L65
.L58:
	movw	r0, #25735
	bx	lr
.L63:
	cmp	r3, #16384
	bcc	.L66
	cmn	r2, #16384
	blt	.L48
	cmp	r2, #16384
	ble	.L67
.L56:
	movw	r0, #39801
	movt	r0, 65535
	bx	lr
.L43:
	vdiv.f32	s13, s14, s15
	vmov.f32	s15, s13
	vcvt.s32.f32	s15, s15, #15
	vmov	r3, s15	@ int
	sub	r2, r3, #16384
	sub	r2, r2, #1
	cmp	r2, #16384
	bcc	.L68
	cmn	r3, #16384
	blt	.L54
	cmp	r3, #16384
	ble	.L69
.L60:
	mov	r0, #0
	bx	lr
.L54:
	cmn	r3, #32768
	blt	.L60
	movw	r0, #21103
	mul	r0, r0, r3
	asr	r0, r0, #16
	sub	r0, r0, #4608
	sub	r0, r0, #45
	bx	lr
.L64:
	movw	r0, #21103
	mul	r0, r0, r2
	asr	r0, r0, #16
	rsb	r0, r0, #20992
	add	r0, r0, #90
	bx	lr
.L66:
	movw	r3, #21103
	movw	r0, #35148
	mul	r2, r3, r2
	movt	r0, 65535
	asr	r2, r2, #16
	sub	r0, r0, r2
	bx	lr
.L68:
	movw	r2, #21103
	movw	r0, #4653
	mul	r3, r2, r3
	add	r0, r0, r3, asr #16
	bx	lr
.L52:
	cmn	r2, #32768
	blt	.L58
	movw	r0, #21103
	mul	r0, r0, r2
	asr	r0, r0, #16
	rsb	r0, r0, #30208
	add	r0, r0, #180
	bx	lr
.L48:
	cmn	r2, #32768
	blt	.L56
	movw	r3, #21103
	movw	r0, #44454
	mul	r2, r3, r2
	movt	r0, 65535
	asr	r2, r2, #16
	sub	r0, r0, r2
	bx	lr
.L69:
	movw	r0, #30409
	mul	r0, r0, r3
	asr	r0, r0, #16
	bx	lr
.L67:
	movw	r0, #30409
	movw	r3, #39801
	mul	r0, r0, r2
	movt	r3, 65535
	sub	r0, r3, r0, asr #16
	bx	lr
.L65:
	movw	r0, #30409
	movw	r3, #25735
	mul	r0, r0, r2
	sub	r0, r3, r0, asr #16
	bx	lr
	.size	fastArcTan, .-fastArcTan
	.align	2
	.global	getThetaR
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	getThetaR, %function
getThetaR:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r0, r0, r1
	add	r0, r0, r0, lsr #31
	asr	r0, r0, #1
	bx	lr
	.size	getThetaR, .-getThetaR
	.align	2
	.global	getThetaL
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	getThetaL, %function
getThetaL:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.syntax divided
@ 302 "seng440Project.c" 1
	sub r0, r0, r1
	asr r0, r0, #1
	
@ 0 "" 2
	.arm
	.syntax unified
	bx	lr
	.size	getThetaL, .-getThetaL
	.align	2
	.global	getThetaSum
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	getThetaSum, %function
getThetaSum:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0]
	ldr	r1, [r0, #8]
	ldr	ip, [r0, #12]
	ldr	r3, [r0, #4]
	add	r3, r3, r1
	subs	r1, ip, r2
	movpl	r2, r1
	vmov	s15, r3	@ int
	vmov	s14, r1	@ int
	eor	r0, r3, r3, asr #31
	sub	r0, r0, r3, asr #31
	submi	r2, r2, ip
	cmp	r2, r0
	vcvt.f32.s32	s15, s15
	vcvt.f32.s32	s14, s14
	bge	.L74
	vdiv.f32	s13, s14, s15
	vmov.f32	s15, s13
	vcvt.s32.f32	s15, s15, #15
	vcmpe.f32	s13, #0
	vmov	r2, s15	@ int
	vmrs	APSR_nzcv, FPSCR
	sub	r3, r2, #16384
	sub	r3, r3, #1
	bmi	.L95
	cmp	r3, #16384
	bcc	.L96
	cmn	r2, #16384
	blt	.L83
	cmp	r2, #16384
	ble	.L97
.L90:
	movw	r0, #25735
	bx	lr
.L95:
	cmp	r3, #16384
	bcc	.L98
	cmn	r2, #16384
	blt	.L79
	cmp	r2, #16384
	ble	.L99
.L88:
	movw	r0, #39801
	movt	r0, 65535
	bx	lr
.L74:
	vdiv.f32	s13, s15, s14
	vmov.f32	s15, s13
	vcvt.s32.f32	s15, s15, #15
	vmov	r3, s15	@ int
	sub	r2, r3, #16384
	sub	r2, r2, #1
	cmp	r2, #16384
	bcc	.L100
	cmn	r3, #16384
	blt	.L85
	cmp	r3, #16384
	ble	.L101
.L92:
	mov	r0, #0
	bx	lr
.L85:
	cmn	r3, #32768
	blt	.L92
	movw	r0, #21103
	mul	r0, r0, r3
	asr	r0, r0, #16
	sub	r0, r0, #4608
	sub	r0, r0, #45
	bx	lr
.L96:
	movw	r0, #21103
	mul	r0, r0, r2
	asr	r0, r0, #16
	rsb	r0, r0, #20992
	add	r0, r0, #90
	bx	lr
.L98:
	movw	r3, #21103
	movw	r0, #35148
	mul	r2, r3, r2
	movt	r0, 65535
	asr	r2, r2, #16
	sub	r0, r0, r2
	bx	lr
.L100:
	movw	r2, #21103
	movw	r0, #4653
	mul	r3, r2, r3
	add	r0, r0, r3, asr #16
	bx	lr
.L83:
	cmn	r2, #32768
	blt	.L90
	movw	r0, #21103
	mul	r0, r0, r2
	asr	r0, r0, #16
	rsb	r0, r0, #30208
	add	r0, r0, #180
	bx	lr
.L79:
	cmn	r2, #32768
	blt	.L88
	movw	r3, #21103
	movw	r0, #44454
	mul	r2, r3, r2
	movt	r0, 65535
	asr	r2, r2, #16
	sub	r0, r0, r2
	bx	lr
.L101:
	movw	r0, #30409
	mul	r0, r0, r3
	asr	r0, r0, #16
	bx	lr
.L99:
	movw	r0, #30409
	movw	r3, #39801
	mul	r0, r0, r2
	movt	r3, 65535
	sub	r0, r3, r0, asr #16
	bx	lr
.L97:
	movw	r0, #30409
	movw	r3, #25735
	mul	r0, r0, r2
	sub	r0, r3, r0, asr #16
	bx	lr
	.size	getThetaSum, .-getThetaSum
	.align	2
	.global	getThetaDiff
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	getThetaDiff, %function
getThetaDiff:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldmib	r0, {r2, ip}
	subs	r1, ip, r2
	vmov	s15, r1	@ int
	ldr	r3, [r0, #12]
	ldr	r0, [r0]
	movpl	r2, r1
	add	r3, r3, r0
	vcvt.f32.s32	s14, s15
	vmov	s15, r3	@ int
	eor	r0, r3, r3, asr #31
	submi	r2, r2, ip
	sub	r0, r0, r3, asr #31
	cmp	r2, r0
	vcvt.f32.s32	s15, s15
	ble	.L104
	vdiv.f32	s13, s15, s14
	vmov.f32	s15, s13
	vcvt.s32.f32	s15, s15, #15
	vcmpe.f32	s13, #0
	vmov	r2, s15	@ int
	vmrs	APSR_nzcv, FPSCR
	sub	r3, r2, #16384
	sub	r3, r3, #1
	bmi	.L125
	cmp	r3, #16384
	bcc	.L126
	cmn	r2, #16384
	blt	.L113
	cmp	r2, #16384
	ble	.L127
.L120:
	movw	r0, #25735
	bx	lr
.L125:
	cmp	r3, #16384
	bcc	.L128
	cmn	r2, #16384
	blt	.L109
	cmp	r2, #16384
	ble	.L129
.L118:
	movw	r0, #39801
	movt	r0, 65535
	bx	lr
.L104:
	vdiv.f32	s13, s14, s15
	vmov.f32	s15, s13
	vcvt.s32.f32	s15, s15, #15
	vmov	r3, s15	@ int
	sub	r2, r3, #16384
	sub	r2, r2, #1
	cmp	r2, #16384
	bcc	.L130
	cmn	r3, #16384
	blt	.L115
	cmp	r3, #16384
	ble	.L131
.L122:
	mov	r0, #0
	bx	lr
.L115:
	cmn	r3, #32768
	blt	.L122
	movw	r0, #21103
	mul	r0, r0, r3
	asr	r0, r0, #16
	sub	r0, r0, #4608
	sub	r0, r0, #45
	bx	lr
.L126:
	movw	r0, #21103
	mul	r0, r0, r2
	asr	r0, r0, #16
	rsb	r0, r0, #20992
	add	r0, r0, #90
	bx	lr
.L128:
	movw	r3, #21103
	movw	r0, #35148
	mul	r2, r3, r2
	movt	r0, 65535
	asr	r2, r2, #16
	sub	r0, r0, r2
	bx	lr
.L130:
	movw	r2, #21103
	movw	r0, #4653
	mul	r3, r2, r3
	add	r0, r0, r3, asr #16
	bx	lr
.L113:
	cmn	r2, #32768
	blt	.L120
	movw	r0, #21103
	mul	r0, r0, r2
	asr	r0, r0, #16
	rsb	r0, r0, #30208
	add	r0, r0, #180
	bx	lr
.L109:
	cmn	r2, #32768
	blt	.L118
	movw	r3, #21103
	movw	r0, #44454
	mul	r2, r3, r2
	movt	r0, 65535
	asr	r2, r2, #16
	sub	r0, r0, r2
	bx	lr
.L131:
	movw	r0, #30409
	mul	r0, r0, r3
	asr	r0, r0, #16
	bx	lr
.L129:
	movw	r0, #30409
	movw	r3, #39801
	mul	r0, r0, r2
	movt	r3, 65535
	sub	r0, r3, r0, asr #16
	bx	lr
.L127:
	movw	r0, #30409
	movw	r3, #25735
	mul	r0, r0, r2
	sub	r0, r3, r0, asr #16
	bx	lr
	.size	getThetaDiff, .-getThetaDiff
	.align	2
	.global	getLMatrix
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	getLMatrix, %function
getLMatrix:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	asr	r0, r0, #4
	vmov	s15, r0	@ int
	vldr.64	d5, .L137
	vcvt.f64.s32	d6, s15
	vdiv.f64	d7, d6, d5
	vcvt.s32.f64	s15, d7
	vmov	r3, s15	@ int
	cmp	r3, #0
	movw	r2, #:lower16:fastCossinTable
	blt	.L136
	add	r0, r3, #512
	movt	r2, #:upper16:fastCossinTable
	ubfx	r0, r0, #0, #11
	ldr	ip, [r2, r0, lsl #2]
	ubfx	r3, r3, #0, #11
.L135:
	str	ip, [r1]
	ldr	ip, [r2, r3, lsl #2]
	rsb	ip, ip, #0
	str	ip, [r1, #4]
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [r1, #8]
	ldr	r3, [r2, r0, lsl #2]
	str	r3, [r1, #12]
	bx	lr
.L136:
	rsb	r0, r3, #512
	rsb	r3, r3, #0
	movt	r2, #:upper16:fastCossinTable
	ubfx	r0, r0, #0, #11
	ubfx	r3, r3, #0, #11
	ldr	ip, [r2, r0, lsl #2]
	rsb	r3, r3, #2048
	b	.L135
.L138:
	.align	3
.L137:
	.word	1413754136
	.word	1074340347
	.size	getLMatrix, .-getLMatrix
	.align	2
	.global	getRMatrix
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	getRMatrix, %function
getRMatrix:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	asr	r0, r0, #4
	vmov	s15, r0	@ int
	vldr.64	d5, .L144
	vcvt.f64.s32	d6, s15
	vdiv.f64	d7, d6, d5
	vcvt.s32.f64	s15, d7
	vmov	r3, s15	@ int
	cmp	r3, #0
	movw	r2, #:lower16:fastCossinTable
	blt	.L143
	add	r0, r3, #512
	movt	r2, #:upper16:fastCossinTable
	ubfx	r0, r0, #0, #11
	ldr	ip, [r2, r0, lsl #2]
	ubfx	r3, r3, #0, #11
.L142:
	str	ip, [r1]
	ldr	ip, [r2, r3, lsl #2]
	rsb	ip, ip, #0
	str	ip, [r1, #4]
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [r1, #8]
	ldr	r3, [r2, r0, lsl #2]
	str	r3, [r1, #12]
	bx	lr
.L143:
	rsb	r0, r3, #512
	rsb	r3, r3, #0
	movt	r2, #:upper16:fastCossinTable
	ubfx	r0, r0, #0, #11
	ubfx	r3, r3, #0, #11
	ldr	ip, [r2, r0, lsl #2]
	rsb	r3, r3, #2048
	b	.L142
.L145:
	.align	3
.L144:
	.word	1413754136
	.word	1074340347
	.size	getRMatrix, .-getRMatrix
	.align	2
	.global	Transpose4x4
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	Transpose4x4, %function
Transpose4x4:
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldmib	r0, {r1, r2, r3}
	sub	sp, sp, #68
	mov	lr, r0
	mov	r4, sp
	str	r1, [sp, #16]
	str	r2, [sp, #32]
	ldr	r1, [r0, #16]
	ldr	r2, [r0, #20]
	str	r3, [sp, #48]
	ldr	r3, [r0, #24]
	str	r1, [sp, #4]
	str	r2, [sp, #20]
	ldr	r1, [r0, #28]
	ldr	r2, [r0, #32]
	str	r3, [sp, #36]
	ldr	r3, [r0, #36]
	str	r1, [sp, #52]
	str	r2, [sp, #8]
	ldr	r1, [r0, #40]
	ldr	r2, [r0, #44]
	str	r3, [sp, #24]
	ldr	r3, [r0, #48]
	str	r1, [sp, #40]
	ldr	ip, [r0, #52]
	str	r2, [sp, #56]
	ldr	r1, [r0, #56]
	str	r3, [sp, #12]
	ldr	r2, [r0, #60]
	ldr	r3, [r0]
	str	ip, [sp, #28]
	str	r1, [sp, #44]
	str	r2, [sp, #60]
	add	r5, sp, #64
	str	r3, [sp]
.L147:
	mov	ip, r4
	ldmia	ip!, {r0, r1, r2, r3}
	cmp	ip, r5
	str	r0, [lr]	@ unaligned
	str	r1, [lr, #4]	@ unaligned
	str	r2, [lr, #8]	@ unaligned
	str	r3, [lr, #12]	@ unaligned
	mov	r4, ip
	add	lr, lr, #16
	bne	.L147
	add	sp, sp, #68
	@ sp needed
	pop	{r4, r5, pc}
	.size	Transpose4x4, .-Transpose4x4
	.align	2
	.global	Transpos2x2
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	Transpos2x2, %function
Transpos2x2:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	ip, r0
	sub	sp, sp, #20
	mov	lr, sp
	ldr	r0, [r0, #4]
	ldr	r3, [ip]
	ldr	r1, [ip, #16]
	ldr	r2, [ip, #20]
	str	r0, [sp, #8]
	str	r1, [sp, #4]
	str	r2, [sp, #12]
	str	r3, [sp]
	ldmia	lr!, {r0, r1, r2, r3}
	str	r0, [ip]	@ unaligned
	str	r1, [ip, #4]	@ unaligned
	str	r2, [ip, #8]	@ unaligned
	str	r3, [ip, #12]	@ unaligned
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
	.size	Transpos2x2, .-Transpos2x2
	.align	2
	.global	matrixMultiply
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	matrixMultiply, %function
matrixMultiply:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	add	lr, r0, #64
.L153:
	ldr	ip, [r0, #4]
	ldr	r3, [r1, #16]
	ldr	r4, [r0]
	ldr	r6, [r1]
	ldr	r7, [r0, #8]
	ldr	r5, [r1, #32]
	mul	ip, r3, ip
	mul	r6, r6, r4
	ldr	r3, [r0, #12]
	ldr	r4, [r1, #48]
	mul	r5, r5, r7
	mul	r4, r4, r3
	asr	r3, ip, #2
	add	r3, r3, r6, asr #2
	add	r3, r3, r5, asr #2
	add	r3, r3, r4, asr #2
	asr	r3, r3, #13
	str	r3, [r2]
	ldr	r3, [r0]
	ldr	ip, [r1, #4]
	ldr	r6, [r0, #4]
	ldr	r4, [r1, #20]
	ldr	r5, [r0, #8]
	ldr	r7, [r1, #36]
	mul	ip, r3, ip
	mul	r6, r6, r4
	ldr	r3, [r1, #52]
	ldr	r4, [r0, #12]
	mul	r5, r5, r7
	mul	r4, r4, r3
	asr	r3, ip, #2
	add	r3, r3, r6, asr #2
	add	r3, r3, r5, asr #2
	add	r3, r3, r4, asr #2
	asr	r3, r3, #13
	str	r3, [r2, #4]
	ldr	r3, [r0]
	ldr	ip, [r1, #8]
	ldr	r6, [r0, #4]
	ldr	r4, [r1, #24]
	ldr	r7, [r0, #8]
	mul	ip, r3, ip
	ldr	r5, [r1, #40]
	ldr	r3, [r0, #12]
	mul	r6, r6, r4
	ldr	r4, [r1, #56]
	mul	r5, r5, r7
	mul	r4, r4, r3
	asr	r3, ip, #2
	add	r3, r3, r6, asr #2
	add	r3, r3, r5, asr #2
	add	r3, r3, r4, asr #2
	asr	r3, r3, #13
	str	r3, [r2, #8]
	ldr	ip, [r0, #4]
	ldr	r3, [r1, #28]
	ldr	r4, [r0]
	ldr	r6, [r1, #12]
	ldr	r7, [r0, #8]
	mul	ip, r3, ip
	ldr	r5, [r1, #44]
	mul	r6, r6, r4
	ldr	r3, [r0, #12]
	ldr	r4, [r1, #60]
	mul	r5, r5, r7
	mul	r4, r4, r3
	asr	r3, ip, #2
	add	r3, r3, r6, asr #2
	add	r3, r3, r5, asr #2
	add	r0, r0, #16
	add	r3, r3, r4, asr #2
	asr	r3, r3, #13
	cmp	r0, lr
	str	r3, [r2, #12]
	add	r2, r2, #16
	bne	.L153
	pop	{r4, r5, r6, r7, pc}
	.size	matrixMultiply, .-matrixMultiply
	.align	2
	.global	iteration
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	iteration, %function
iteration:
	@ args = 4, pretend = 0, frame = 360
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, r1
	sub	sp, sp, #364
	ldr	r7, [sp, #400]
	mov	r4, r2
	add	r1, r7, r1, lsl #4
	add	r2, r7, r0, lsl #4
	ldr	fp, [r2, r0, lsl #2]
	ldr	r10, [r2, r6, lsl #2]
	ldr	r9, [r1, r0, lsl #2]
	ldr	r2, [r1, r6, lsl #2]
	mov	r5, r0
	add	r1, fp, r2
	sub	r0, r9, r10
	str	r3, [sp]
	str	r2, [sp, #4]
	bl	fastArcTan
	ldr	r2, [sp, #4]
	mov	r8, r0
	sub	r1, r2, fp
	add	r0, r10, r9
	bl	fastArcTan
	mov	r9, r0
	.syntax divided
@ 302 "seng440Project.c" 1
	sub r0, r0, r8
	asr r0, r0, #1
	
@ 0 "" 2
	.arm
	.syntax unified
	add	r8, r9, r8
	add	r1, sp, #24
	add	r8, r8, r8, lsr #31
	bl	getLMatrix
	asr	r0, r8, #1
	add	r1, sp, #8
	bl	getLMatrix
	mov	r3, #0
	mov	r2, #32768
	lsl	r0, r5, #2
	lsl	lr, r6, #2
	add	r9, sp, #360
	add	r1, r0, r5
	add	r0, r0, r6
	add	r5, lr, r5
	add	r6, lr, r6
	add	r1, r9, r1, lsl #2
	add	r0, r9, r0, lsl #2
	add	r5, r9, r5, lsl #2
	add	r6, r9, r6, lsl #2
	ldr	ip, [sp, #24]
	ldr	r8, [sp, #28]
	ldr	lr, [sp, #32]
	ldr	r9, [sp, #36]
	str	r2, [sp, #40]
	str	r2, [sp, #60]
	str	r2, [sp, #80]
	str	r2, [sp, #100]
	str	r3, [sp, #56]
	str	r3, [sp, #72]
	str	r3, [sp, #88]
	str	r3, [sp, #44]
	str	r3, [sp, #76]
	str	r3, [sp, #92]
	str	r3, [sp, #48]
	str	r3, [sp, #64]
	str	r3, [sp, #96]
	str	r3, [sp, #52]
	str	r3, [sp, #68]
	str	r3, [sp, #84]
	str	r2, [sp, #104]
	str	ip, [r1, #-320]
	str	r2, [sp, #124]
	str	r8, [r0, #-320]
	str	r3, [sp, #120]
	str	lr, [r5, #-320]
	str	r3, [sp, #136]
	str	r3, [sp, #152]
	str	r3, [sp, #108]
	str	r3, [sp, #140]
	str	r3, [sp, #156]
	str	r9, [r6, #-320]
	str	r3, [sp, #112]
	ldr	r8, [sp, #8]
	str	r3, [sp, #128]
	str	r2, [sp, #144]
	str	r3, [sp, #160]
	str	r3, [sp, #116]
	str	r3, [sp, #132]
	str	r3, [sp, #148]
	str	r2, [sp, #164]
	ldr	lr, [sp, #12]
	str	r8, [r1, #-256]
	ldr	r8, [sp]
	ldr	ip, [sp, #16]
	ldr	r3, [sp, #20]
	str	lr, [r0, #-256]
	mov	r1, r8
	add	r2, sp, #168
	add	r0, sp, #104
	str	ip, [r5, #-256]
	str	r3, [r6, #-256]
	bl	matrixMultiply
	mov	lr, r8
	add	r5, sp, #168
	add	r6, sp, #232
.L158:
	mov	ip, r5
	ldmia	ip!, {r0, r1, r2, r3}
	cmp	ip, r6
	str	r0, [lr]	@ unaligned
	str	r1, [lr, #4]	@ unaligned
	str	r2, [lr, #8]	@ unaligned
	str	r3, [lr, #12]	@ unaligned
	mov	r5, ip
	add	lr, lr, #16
	bne	.L158
	ldrd	r0, [sp, #108]
	ldrd	r2, [sp, #116]
	ldr	r5, [sp, #124]
	ldr	lr, [sp, #128]
	str	r0, [sp, #312]
	str	r1, [sp, #328]
	ldr	r0, [sp, #132]
	ldr	r1, [sp, #136]
	str	r2, [sp, #344]
	str	r3, [sp, #300]
	ldr	r2, [sp, #140]
	ldr	r3, [sp, #144]
	str	r5, [sp, #316]
	str	lr, [sp, #332]
	ldr	r5, [sp, #148]
	ldr	lr, [sp, #152]
	str	r0, [sp, #348]
	str	r1, [sp, #304]
	ldr	r0, [sp, #156]
	ldr	r1, [sp, #160]
	str	r2, [sp, #320]
	str	r3, [sp, #336]
	ldr	r2, [sp, #164]
	ldr	r3, [sp, #104]
	str	r5, [sp, #352]
	str	lr, [sp, #308]
	add	ip, sp, #104
	str	r0, [sp, #324]
	str	r1, [sp, #340]
	str	r2, [sp, #356]
	str	r3, [sp, #296]
	add	lr, sp, #296
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	mov	r2, r6
	mov	r1, r7
	add	r0, sp, #40
	bl	matrixMultiply
	mov	r2, r7
	mov	r0, r6
	add	r1, sp, #104
	bl	matrixMultiply
	ldrd	r0, [sp, #60]
	ldrd	r2, [sp, #68]
	ldr	r7, [sp, #44]
	ldr	r6, [sp, #48]
	ldr	r5, [sp, #52]
	ldr	lr, [sp, #56]
	str	r7, [sp, #312]
	str	r6, [sp, #328]
	ldr	r7, [sp, #76]
	ldr	r6, [sp, #80]
	str	r5, [sp, #344]
	str	lr, [sp, #300]
	ldr	r5, [sp, #84]
	ldr	lr, [sp, #88]
	str	r0, [sp, #316]
	str	r1, [sp, #332]
	ldr	r0, [sp, #92]
	ldr	r1, [sp, #96]
	str	r2, [sp, #348]
	str	r3, [sp, #304]
	ldr	r2, [sp, #100]
	ldr	r3, [sp, #40]
	str	r5, [sp, #352]
	str	lr, [sp, #308]
	add	ip, sp, #40
	str	r7, [sp, #320]
	str	r6, [sp, #336]
	str	r0, [sp, #324]
	str	r1, [sp, #340]
	str	r2, [sp, #356]
	str	r3, [sp, #296]
	add	lr, sp, #296
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	add	r1, sp, #40
	add	r2, sp, #296
	mov	r0, r4
	bl	matrixMultiply
	add	r5, sp, #360
	add	lr, sp, #296
.L159:
	mov	ip, lr
	ldmia	ip!, {r0, r1, r2, r3}
	cmp	ip, r5
	str	r0, [r4]	@ unaligned
	str	r1, [r4, #4]	@ unaligned
	str	r2, [r4, #8]	@ unaligned
	str	r3, [r4, #12]	@ unaligned
	mov	lr, ip
	add	r4, r4, #16
	bne	.L159
	add	sp, sp, #364
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.size	iteration, .-iteration
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 448
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	vpush.64	{d8, d9, d10}
	vmov.f32	s13, #3.1e+1
	vldr.32	s14, .L193+24
	vmov.f32	s15, #-1.1e+1
	mov	fp, #0
	mov	r10, #0
	mov	r9, #0
	mov	r8, #0
	mov	r7, #0
	mov	r6, #0
	mov	r5, #0
	mov	r4, #0
	mov	ip, #0
	mov	r0, #0
	mov	r1, #0
	mov	r2, #0
	mov	r3, #0
	sub	sp, sp, #460
	vstr.32	s13, [sp, #136]
	vstr.32	s14, [sp, #140]
	vstr.32	s15, [sp, #144]
	movt	r5, 49440
	movt	r4, 16948
	movt	ip, 17076
	movt	r0, 16904
	movt	r1, 16768
	movt	r2, 16920
	movt	r3, 49560
	movt	fp, 16848
	movt	r10, 49704
	movt	r9, 16736
	movt	r8, 17054
	movt	r7, 49748
	movt	r6, 49800
	str	r5, [sp, #172]	@ float
	str	r4, [sp, #176]	@ float
	str	ip, [sp, #180]	@ float
	str	fp, [sp, #148]	@ float
	str	r10, [sp, #152]	@ float
	str	r9, [sp, #156]	@ float
	str	r8, [sp, #160]	@ float
	str	r7, [sp, #164]	@ float
	str	r6, [sp, #168]	@ float
	str	r0, [sp, #184]	@ float
	str	r1, [sp, #188]	@ float
	str	r2, [sp, #192]	@ float
	str	r3, [sp, #196]	@ float
	add	lr, sp, #136
	add	ip, sp, #200
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	puts
	add	r0, sp, #200
	bl	printMatrix
	movw	r3, #:lower16:fastCossinTable
	mov	r2, #0
	movt	r3, #:upper16:fastCossinTable
	mov	r5, r3
	mov	r4, #1
	vldr.64	d10, .L193
	vldr.64	d9, .L193+8
	vldr.64	d8, .L193+16
	str	r2, [r3]
.L164:
	vmov	s15, r4	@ int
	vcvt.f64.s32	d0, s15
	vmul.f64	d0, d0, d10
	vmul.f64	d0, d0, d9
	bl	sin
	vmul.f64	d0, d0, d8
	vcvt.s32.f64	s0, d0
	vmov	r3, s0	@ int
	add	r4, r4, #1
	cmp	r4, #2048
	str	r3, [r5, #4]!
	bne	.L164
	mov	r0, #32768
	mov	r3, #0
	add	r7, sp, #264
	str	r0, [sp, #328]
	str	r0, [sp, #348]
	str	r0, [sp, #368]
	str	r0, [sp, #388]
	str	r0, [sp, #392]
	str	r0, [sp, #412]
	str	r0, [sp, #432]
	str	r0, [sp, #452]
	mov	r1, r7
	mov	r2, #256
	add	r0, sp, #136
	str	r3, [sp, #344]
	str	r3, [sp, #360]
	str	r3, [sp, #376]
	str	r3, [sp, #332]
	str	r3, [sp, #364]
	str	r3, [sp, #380]
	str	r3, [sp, #336]
	str	r3, [sp, #352]
	str	r3, [sp, #384]
	str	r3, [sp, #340]
	str	r3, [sp, #356]
	str	r3, [sp, #372]
	str	r3, [sp, #408]
	str	r3, [sp, #424]
	str	r3, [sp, #440]
	str	r3, [sp, #396]
	str	r3, [sp, #428]
	str	r3, [sp, #444]
	str	r3, [sp, #400]
	str	r3, [sp, #416]
	str	r3, [sp, #448]
	str	r3, [sp, #404]
	str	r3, [sp, #420]
	str	r3, [sp, #436]
	bl	scaleMatrix
.L190:
	mov	r5, #0
.L166:
	add	r6, r5, #1
	mov	r4, r6
.L165:
	mov	r1, r4
	str	r7, [sp]
	add	r3, sp, #392
	add	r2, sp, #328
	mov	r0, r5
	add	r4, r4, #1
	bl	iteration
	cmp	r4, #4
	bne	.L165
	cmp	r6, #3
	mov	r5, r6
	bne	.L166
	ldr	r3, [sp, #268]
	ldr	r1, [sp, #272]
	cmp	r3, #0
	rsblt	r3, r3, #0
	cmp	r1, #0
	ldr	r2, [sp, #276]
	rsblt	r1, r1, #0
	cmp	r3, #255
	movgt	r3, #0
	movle	r3, #1
	cmp	r1, #256
	movge	r3, #0
	cmp	r2, #0
	ldr	r1, [sp, #280]
	rsblt	r2, r2, #0
	cmp	r2, #256
	movge	r3, #0
	cmp	r1, #0
	ldr	r2, [sp, #288]
	rsblt	r1, r1, #0
	cmp	r1, #256
	movge	r3, #0
	cmp	r2, #0
	ldr	r1, [sp, #292]
	rsblt	r2, r2, #0
	cmp	r2, #256
	movge	r3, #0
	cmp	r1, #0
	ldr	r2, [sp, #296]
	rsblt	r1, r1, #0
	cmp	r1, #256
	movge	r3, #0
	cmp	r2, #0
	ldr	r1, [sp, #300]
	rsblt	r2, r2, #0
	cmp	r2, #256
	movge	r3, #0
	cmp	r1, #0
	ldr	r2, [sp, #308]
	rsblt	r1, r1, #0
	cmp	r1, #256
	movge	r3, #0
	cmp	r2, #0
	ldr	r1, [sp, #312]
	rsblt	r2, r2, #0
	cmp	r2, #256
	movge	r3, #0
	cmp	r1, #0
	ldr	r2, [sp, #316]
	rsblt	r1, r1, #0
	cmp	r1, #256
	movge	r3, #0
	cmp	r2, #0
	rsblt	r2, r2, #0
	cmp	r2, #255
	bgt	.L190
	ldr	r2, [sp, #320]
	cmp	r2, #0
	rsblt	r2, r2, #0
	cmp	r2, #255
	bgt	.L190
	cmp	r3, #0
	beq	.L190
	add	r0, sp, #392
	bl	Transpose4x4
	vldr.32	s14, [sp, #268]	@ int
	vcvt.f32.s32	s0, s14
	vldr.32	s14, [sp, #272]	@ int
	vcvt.f32.s32	s1, s14
	vldr.32	s14, [sp, #276]	@ int
	vcvt.f32.s32	s2, s14
	vldr.32	s14, [sp, #280]	@ int
	vcvt.f32.s32	s3, s14
	vldr.32	s14, [sp, #284]	@ int
	vcvt.f32.s32	s4, s14
	vldr.32	s14, [sp, #288]	@ int
	vcvt.f32.s32	s5, s14
	vldr.32	s14, [sp, #292]	@ int
	vcvt.f32.s32	s6, s14
	vldr.32	s14, [sp, #296]	@ int
	vcvt.f32.s32	s7, s14
	vldr.32	s14, [sp, #300]	@ int
	vcvt.f32.s32	s8, s14
	vldr.32	s14, [sp, #304]	@ int
	vcvt.f32.s32	s9, s14
	vldr.32	s14, [sp, #308]	@ int
	vcvt.f32.s32	s10, s14
	vldr.32	s14, [sp, #312]	@ int
	vcvt.f32.s32	s11, s14
	vldr.32	s14, [sp, #316]	@ int
	vcvt.f32.s32	s12, s14
	vldr.32	s14, [sp, #320]	@ int
	vldr.32	s15, [sp, #264]	@ int
	vcvt.f32.s32	s13, s14
	vldr.32	s14, [sp, #324]	@ int
	vcvt.f32.s32	s16, s15
	vcvt.f32.s32	s14, s14
	vldr.32	s15, .L193+28
	vmul.f32	s16, s16, s15
	vmul.f32	s0, s0, s15
	vmul.f32	s1, s1, s15
	vmul.f32	s2, s2, s15
	vmul.f32	s3, s3, s15
	vmul.f32	s4, s4, s15
	vmul.f32	s5, s5, s15
	vmul.f32	s6, s6, s15
	vmul.f32	s7, s7, s15
	vmul.f32	s8, s8, s15
	vmul.f32	s9, s9, s15
	vmul.f32	s10, s10, s15
	vmul.f32	s11, s11, s15
	vmul.f32	s12, s12, s15
	b	.L194
.L195:
	.align	3
.L193:
	.word	1413754136
	.word	1074340347
	.word	0
	.word	1062207488
	.word	0
	.word	1088421888
	.word	1117388800
	.word	998244352
	.word	939524096
.L194:
	vmul.f32	s13, s13, s15
	vmul.f32	s15, s14, s15
	vstr.32	s16, [sp, #136]
	vstr.32	s0, [sp, #140]
	vstr.32	s1, [sp, #144]
	vstr.32	s2, [sp, #148]
	vstr.32	s3, [sp, #152]
	vstr.32	s4, [sp, #156]
	vstr.32	s5, [sp, #160]
	vstr.32	s6, [sp, #164]
	vstr.32	s7, [sp, #168]
	vstr.32	s8, [sp, #172]
	vstr.32	s9, [sp, #176]
	vstr.32	s10, [sp, #180]
	vstr.32	s11, [sp, #184]
	vstr.32	s12, [sp, #188]
	vstr.32	s13, [sp, #192]
	vstr.32	s15, [sp, #196]
	vldr.32	s15, [sp, #328]	@ int
	vldr.32	s14, [sp, #332]	@ int
	vcvt.f32.s32	s0, s14
	vldr.32	s14, [sp, #336]	@ int
	vcvt.f32.s32	s1, s14
	vldr.32	s14, [sp, #340]	@ int
	vcvt.f32.s32	s2, s14
	vldr.32	s14, [sp, #344]	@ int
	vcvt.f32.s32	s3, s14
	vldr.32	s14, [sp, #348]	@ int
	vcvt.f32.s32	s4, s14
	vldr.32	s14, [sp, #352]	@ int
	vcvt.f32.s32	s5, s14
	vldr.32	s14, [sp, #356]	@ int
	vcvt.f32.s32	s6, s14
	vldr.32	s14, [sp, #360]	@ int
	vcvt.f32.s32	s7, s14
	vldr.32	s14, [sp, #364]	@ int
	vcvt.f32.s32	s8, s14
	vldr.32	s14, [sp, #368]	@ int
	vcvt.f32.s32	s9, s14
	vldr.32	s14, [sp, #372]	@ int
	vcvt.f32.s32	s10, s14
	vldr.32	s14, [sp, #376]	@ int
	vcvt.f32.s32	s11, s14
	vldr.32	s14, [sp, #380]	@ int
	vcvt.f32.s32	s12, s14
	vldr.32	s14, [sp, #384]	@ int
	vcvt.f32.s32	s13, s14
	vldr.32	s14, [sp, #388]	@ int
	vcvt.f32.s32	s16, s15
	vcvt.f32.s32	s14, s14
	vldr.32	s15, .L193+32
	vmul.f32	s16, s16, s15
	vmul.f32	s0, s0, s15
	vmul.f32	s1, s1, s15
	vmul.f32	s2, s2, s15
	vmul.f32	s3, s3, s15
	vmul.f32	s4, s4, s15
	vmul.f32	s5, s5, s15
	vmul.f32	s6, s6, s15
	vmul.f32	s7, s7, s15
	vmul.f32	s8, s8, s15
	vmul.f32	s9, s9, s15
	vmul.f32	s10, s10, s15
	vmul.f32	s11, s11, s15
	vmul.f32	s12, s12, s15
	vmul.f32	s13, s13, s15
	vmul.f32	s14, s14, s15
	vstr.32	s16, [sp, #8]
	vstr.32	s0, [sp, #12]
	vstr.32	s1, [sp, #16]
	vstr.32	s2, [sp, #20]
	vstr.32	s3, [sp, #24]
	vstr.32	s4, [sp, #28]
	vstr.32	s5, [sp, #32]
	vstr.32	s6, [sp, #36]
	vstr.32	s7, [sp, #40]
	vstr.32	s8, [sp, #44]
	vstr.32	s9, [sp, #48]
	vstr.32	s10, [sp, #52]
	vstr.32	s11, [sp, #56]
	vstr.32	s12, [sp, #60]
	vstr.32	s13, [sp, #64]
	vstr.32	s14, [sp, #68]
	vldr.32	s14, [sp, #392]	@ int
	vcvt.f32.s32	s16, s14
	vldr.32	s14, [sp, #396]	@ int
	vcvt.f32.s32	s0, s14
	vldr.32	s14, [sp, #400]	@ int
	vcvt.f32.s32	s1, s14
	vldr.32	s14, [sp, #404]	@ int
	vcvt.f32.s32	s2, s14
	vldr.32	s14, [sp, #408]	@ int
	vcvt.f32.s32	s3, s14
	vldr.32	s14, [sp, #412]	@ int
	vcvt.f32.s32	s4, s14
	vldr.32	s14, [sp, #416]	@ int
	vcvt.f32.s32	s5, s14
	vldr.32	s14, [sp, #420]	@ int
	vcvt.f32.s32	s6, s14
	vldr.32	s14, [sp, #424]	@ int
	vcvt.f32.s32	s7, s14
	vldr.32	s14, [sp, #428]	@ int
	vcvt.f32.s32	s8, s14
	vldr.32	s14, [sp, #432]	@ int
	vcvt.f32.s32	s9, s14
	vldr.32	s14, [sp, #436]	@ int
	vcvt.f32.s32	s10, s14
	vldr.32	s14, [sp, #440]	@ int
	vcvt.f32.s32	s11, s14
	vldr.32	s14, [sp, #444]	@ int
	vcvt.f32.s32	s12, s14
	vldr.32	s14, [sp, #448]	@ int
	vcvt.f32.s32	s13, s14
	vldr.32	s14, [sp, #452]	@ int
	vcvt.f32.s32	s14, s14
	movw	r0, #:lower16:.LC3
	vmul.f32	s0, s0, s15
	vmul.f32	s1, s1, s15
	vmul.f32	s2, s2, s15
	vmul.f32	s3, s3, s15
	vmul.f32	s4, s4, s15
	vmul.f32	s5, s5, s15
	vmul.f32	s6, s6, s15
	vmul.f32	s7, s7, s15
	vmul.f32	s8, s8, s15
	vmul.f32	s9, s9, s15
	vmul.f32	s10, s10, s15
	vmul.f32	s11, s11, s15
	vmul.f32	s12, s12, s15
	vmul.f32	s13, s13, s15
	vmul.f32	s16, s16, s15
	vmul.f32	s15, s14, s15
	movt	r0, #:upper16:.LC3
	vstr.32	s0, [sp, #76]
	vstr.32	s1, [sp, #80]
	vstr.32	s2, [sp, #84]
	vstr.32	s3, [sp, #88]
	vstr.32	s4, [sp, #92]
	vstr.32	s5, [sp, #96]
	vstr.32	s6, [sp, #100]
	vstr.32	s7, [sp, #104]
	vstr.32	s8, [sp, #108]
	vstr.32	s9, [sp, #112]
	vstr.32	s10, [sp, #116]
	vstr.32	s11, [sp, #120]
	vstr.32	s12, [sp, #124]
	vstr.32	s13, [sp, #128]
	vstr.32	s15, [sp, #132]
	vstr.32	s16, [sp, #72]
	bl	puts
	add	r0, sp, #136
	bl	printMatrix
	movw	r0, #:lower16:.LC4
	movt	r0, #:upper16:.LC4
	bl	puts
	add	r0, sp, #8
	bl	printMatrix
	movw	r0, #:lower16:.LC5
	movt	r0, #:upper16:.LC5
	bl	puts
	add	r0, sp, #72
	bl	printMatrix
	mov	r0, #0
	add	sp, sp, #460
	@ sp needed
	vldm	sp!, {d8-d10}
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.size	main, .-main
	.comm	fastCossinTable,8192,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%f \000"
.LC1:
	.ascii	"%d \000"
.LC2:
	.ascii	"\012Original Matrix\000"
	.space	3
.LC3:
	.ascii	"\012\012Final M:\000"
	.space	1
.LC4:
	.ascii	"\012\012Final U:\000"
	.space	1
.LC5:
	.ascii	"\012\012Final V:\000"
	.ident	"GCC: (GNU) 8.1.1 20180626 (Red Hat Cross 8.1.1-3)"
	.section	.note.GNU-stack,"",%progbits
