	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"seng440Project.c"
	.text
	.comm	fastCossinTable,8192,4
	.align	2
	.global	genMMatrix
	.arch armv7-a
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	genMMatrix, %function
genMMatrix:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r2, #0
	movt	r2, 16888
	str	r2, [r3]	@ float
	ldr	r3, [fp, #-8]
	mov	r2, #0
	movt	r2, 17050
	str	r2, [r3, #4]	@ float
	ldr	r3, [fp, #-8]
	mov	r2, #0
	movt	r2, 49456
	str	r2, [r3, #8]	@ float
	ldr	r3, [fp, #-8]
	mov	r2, #0
	movt	r2, 16848
	str	r2, [r3, #12]	@ float
	ldr	r3, [fp, #-8]
	add	r3, r3, #16
	mov	r2, #0
	movt	r2, 49704
	str	r2, [r3]	@ float
	ldr	r3, [fp, #-8]
	add	r3, r3, #16
	mov	r2, #0
	movt	r2, 16736
	str	r2, [r3, #4]	@ float
	ldr	r3, [fp, #-8]
	add	r3, r3, #16
	mov	r2, #0
	movt	r2, 17054
	str	r2, [r3, #8]	@ float
	ldr	r3, [fp, #-8]
	add	r3, r3, #16
	mov	r2, #0
	movt	r2, 49748
	str	r2, [r3, #12]	@ float
	ldr	r3, [fp, #-8]
	add	r3, r3, #32
	mov	r2, #0
	movt	r2, 49800
	str	r2, [r3]	@ float
	ldr	r3, [fp, #-8]
	add	r3, r3, #32
	mov	r2, #0
	movt	r2, 49440
	str	r2, [r3, #4]	@ float
	ldr	r3, [fp, #-8]
	add	r3, r3, #32
	mov	r2, #0
	movt	r2, 16948
	str	r2, [r3, #8]	@ float
	ldr	r3, [fp, #-8]
	add	r3, r3, #32
	mov	r2, #0
	movt	r2, 17076
	str	r2, [r3, #12]	@ float
	ldr	r3, [fp, #-8]
	add	r3, r3, #48
	mov	r2, #0
	movt	r2, 16904
	str	r2, [r3]	@ float
	ldr	r3, [fp, #-8]
	add	r3, r3, #48
	mov	r2, #0
	movt	r2, 16768
	str	r2, [r3, #4]	@ float
	ldr	r3, [fp, #-8]
	add	r3, r3, #48
	mov	r2, #0
	movt	r2, 16920
	str	r2, [r3, #8]	@ float
	ldr	r3, [fp, #-8]
	add	r3, r3, #48
	mov	r2, #0
	movt	r2, 49560
	str	r2, [r3, #12]	@ float
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	genMMatrix, .-genMMatrix
	.align	2
	.global	genIdentityMatrix
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	genIdentityMatrix, %function
genIdentityMatrix:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L3
.L8:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L4
.L7:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bne	.L5
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	ldr	r1, [fp, #-20]
	str	r1, [r3, r2, lsl #2]
	b	.L6
.L5:
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	mov	r1, #0
	str	r1, [r3, r2, lsl #2]
.L6:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L4:
	ldr	r3, [fp, #-12]
	and	r3, r3, #4
	cmp	r3, #0
	beq	.L7
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L3:
	ldr	r3, [fp, #-8]
	and	r3, r3, #4
	cmp	r3, #0
	beq	.L8
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	genIdentityMatrix, .-genIdentityMatrix
	.align	2
	.global	scaleMatrix
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	scaleMatrix, %function
scaleMatrix:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L10
.L13:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L11
.L12:
	ldr	r3, [fp, #-24]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	add	r3, r2, r3
	vldr.32	s15, [r3]
	vmul.f32	s15, s14, s15
	vcvt.f64.f32	d7, s15
	vmov.f64	d0, d7
	bl	round
	vmov.f64	d7, d0
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	vcvt.s32.f64	s15, d7
	vmov	r1, s15	@ int
	ldr	r2, [fp, #-12]
	str	r1, [r3, r2, lsl #2]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L11:
	ldr	r3, [fp, #-12]
	and	r3, r3, #4
	cmp	r3, #0
	beq	.L12
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L10:
	ldr	r3, [fp, #-8]
	and	r3, r3, #4
	cmp	r3, #0
	beq	.L13
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	scaleMatrix, .-scaleMatrix
	.align	2
	.global	unScaleMatrix
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	unScaleMatrix, %function
unScaleMatrix:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, fp}
	add	fp, sp, #8
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	mov	r2, #1
	ldr	r3, [fp, #-32]
	lsl	r3, r2, r3
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	vmov.f32	s13, #1.0e+0
	vdiv.f32	s15, s13, s14
	vstr.32	s15, [fp, #-16]
	mov	r5, #0
	b	.L15
.L18:
	mov	r4, #0
	b	.L16
.L17:
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r3, [r3, r4, lsl #2]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-24]
	add	r2, r2, r3
	vldr.32	s15, [fp, #-16]
	vmul.f32	s15, s14, s15
	lsl	r3, r4, #2
	add	r3, r2, r3
	vstr.32	s15, [r3]
	add	r4, r4, #1
.L16:
	and	r3, r4, #4
	cmp	r3, #0
	beq	.L17
	add	r5, r5, #1
.L15:
	and	r3, r5, #4
	cmp	r3, #0
	beq	.L18
	nop
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, r5, fp}
	bx	lr
	.size	unScaleMatrix, .-unScaleMatrix
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%f \000"
	.text
	.align	2
	.global	printMatrix
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	printMatrix, %function
printMatrix:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	mov	r5, #0
	b	.L20
.L24:
	mov	r4, #0
	b	.L21
.L23:
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-16]
	add	r2, r2, r3
	lsl	r3, r4, #2
	add	r3, r2, r3
	vldr.32	s15, [r3]
	vcvt.f64.f32	d7, s15
	vmov	r2, r3, d7
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	bl	printf
	cmp	r4, #3
	bne	.L22
	mov	r0, #10
	bl	putchar
.L22:
	add	r4, r4, #1
.L21:
	and	r3, r4, #4
	cmp	r3, #0
	beq	.L23
	add	r5, r5, #1
.L20:
	and	r3, r5, #4
	cmp	r3, #0
	beq	.L24
	nop
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, fp, pc}
	.size	printMatrix, .-printMatrix
	.section	.rodata
	.align	2
.LC1:
	.ascii	"%d \000"
	.text
	.align	2
	.global	printMatrixInt
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	printMatrixInt, %function
printMatrixInt:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	mov	r5, #0
	b	.L26
.L30:
	mov	r4, #0
	b	.L27
.L29:
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r3, [r3, r4, lsl #2]
	mov	r1, r3
	movw	r0, #:lower16:.LC1
	movt	r0, #:upper16:.LC1
	bl	printf
	cmp	r4, #3
	bne	.L28
	mov	r0, #10
	bl	putchar
.L28:
	add	r4, r4, #1
.L27:
	and	r3, r4, #4
	cmp	r3, #0
	beq	.L29
	add	r5, r5, #1
.L26:
	and	r3, r5, #4
	cmp	r3, #0
	beq	.L30
	mov	r0, #10
	bl	putchar
	nop
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, fp, pc}
	.size	printMatrixInt, .-printMatrixInt
	.align	2
	.global	fastSin
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	fastSin, %function
fastSin:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	asr	r3, r3, #4
	vmov	s15, r3	@ int
	vcvt.f64.s32	d6, s15
	vldr.64	d5, .L34
	vdiv.f64	d7, d6, d5
	vcvt.s32.f64	s15, d7
	vmov	r3, s15	@ int
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L32
	ldr	r3, [fp, #-8]
	rsb	r3, r3, #0
	ubfx	r3, r3, #0, #11
	rsb	r2, r3, #2048
	movw	r3, #:lower16:fastCossinTable
	movt	r3, #:upper16:fastCossinTable
	ldr	r3, [r3, r2, lsl #2]
	b	.L33
.L32:
	ldr	r3, [fp, #-8]
	ubfx	r2, r3, #0, #11
	movw	r3, #:lower16:fastCossinTable
	movt	r3, #:upper16:fastCossinTable
	ldr	r3, [r3, r2, lsl #2]
.L33:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L35:
	.align	3
.L34:
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
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	asr	r3, r3, #4
	vmov	s15, r3	@ int
	vcvt.f64.s32	d6, s15
	vldr.64	d5, .L39
	vdiv.f64	d7, d6, d5
	vcvt.s32.f64	s15, d7
	vmov	r3, s15	@ int
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L37
	ldr	r3, [fp, #-8]
	rsb	r3, r3, #512
	ubfx	r2, r3, #0, #11
	movw	r3, #:lower16:fastCossinTable
	movt	r3, #:upper16:fastCossinTable
	ldr	r3, [r3, r2, lsl #2]
	b	.L38
.L37:
	ldr	r3, [fp, #-8]
	add	r3, r3, #512
	ubfx	r2, r3, #0, #11
	movw	r3, #:lower16:fastCossinTable
	movt	r3, #:upper16:fastCossinTable
	ldr	r3, [r3, r2, lsl #2]
.L38:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L40:
	.align	3
.L39:
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
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	vstr.32	s0, [fp, #-40]
	mov	r3, #32768
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s15, [fp, #-40]
	vmul.f32	s15, s14, s15
	vcvt.s32.f32	s15, s15
	vmov	r3, s15	@ int
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vmov.f64	d6, #5.0e-1
	vmul.f64	d7, d7, d6
	vmov.f64	d0, d7
	bl	round
	vmov.f64	d7, d0
	vcvt.s32.f64	s15, d7
	vmov	r3, s15	@ int
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vcvt.s32.f64	s15, d7
	vmov	r3, s15	@ int
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d6, .L46
	vmul.f64	d7, d7, d6
	vmov.f64	d0, d7
	bl	round
	vmov.f64	d7, d0
	vcvt.s32.f64	s15, d7
	vmov	r3, s15	@ int
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d6, .L46+8
	vmul.f64	d7, d7, d6
	vmov.f64	d0, d7
	bl	round
	vmov.f64	d7, d0
	vcvt.s32.f64	s15, d7
	vmov	r3, s15	@ int
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-8]
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d6, .L46+16
	vmul.f64	d7, d7, d6
	vmov.f64	d0, d7
	bl	round
	vmov.f64	d7, d0
	vcvt.s32.f64	s15, d7
	vmov	r3, s15	@ int
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-36]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	ble	.L42
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bgt	.L42
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-12]
	mul	r3, r2, r3
	asr	r3, r3, #16
	str	r3, [fp, #-36]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	b	.L43
.L42:
	ldr	r3, [fp, #-16]
	rsb	r3, r3, #0
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	blt	.L44
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bgt	.L44
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-12]
	mul	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	asr	r3, r3, #16
	b	.L43
.L44:
	ldr	r3, [fp, #-16]
	rsb	r3, r3, #0
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	bge	.L45
	ldr	r3, [fp, #-20]
	rsb	r3, r3, #0
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	blt	.L45
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-12]
	mul	r3, r2, r3
	asr	r3, r3, #16
	str	r3, [fp, #-36]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-24]
	sub	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	b	.L43
.L45:
	mov	r3, #0
.L43:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L47:
	.align	3
.L46:
	.word	1443109011
	.word	1069690126
	.word	-481036337
	.word	1071946661
	.word	240518169
	.word	1072542253
	.size	piecewiseLinearApprox, .-piecewiseLinearApprox
	.align	2
	.global	fastArcTan
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	fastArcTan, %function
fastArcTan:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bge	.L49
	ldr	r3, [fp, #-24]
	rsb	r3, r3, #0
	str	r3, [fp, #-12]
.L49:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bge	.L50
	ldr	r3, [fp, #-28]
	rsb	r3, r3, #0
	str	r3, [fp, #-16]
.L50:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	ble	.L51
	ldr	r3, [fp, #-28]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s13, s15
	ldr	r3, [fp, #-24]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	vdiv.f32	s15, s13, s14
	vstr.32	s15, [fp, #-20]
	vldr.32	s15, [fp, #-20]
	vcmpe.f32	s15, #0
	vmrs	APSR_nzcv, FPSCR
	bpl	.L58
	vldr.32	s0, [fp, #-20]
	bl	piecewiseLinearApprox
	mov	r2, r0
	movw	r3, #39801
	movt	r3, 65535
	sub	r3, r3, r2
	str	r3, [fp, #-8]
	b	.L55
.L58:
	vldr.32	s0, [fp, #-20]
	bl	piecewiseLinearApprox
	mov	r3, r0
	rsb	r3, r3, #25600
	add	r3, r3, #135
	str	r3, [fp, #-8]
	b	.L55
.L51:
	ldr	r3, [fp, #-24]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s13, s15
	ldr	r3, [fp, #-28]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	vdiv.f32	s15, s13, s14
	vstr.32	s15, [fp, #-20]
	vldr.32	s0, [fp, #-20]
	bl	piecewiseLinearApprox
	str	r0, [fp, #-8]
.L55:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	fastArcTan, .-fastArcTan
	.align	2
	.global	getThetaR
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	getThetaR, %function
getThetaR:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	lsr	r2, r3, #31
	add	r3, r2, r3
	asr	r3, r3, #1
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	getThetaR, .-getThetaR
	.align	2
	.global	getThetaL
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	getThetaL, %function
getThetaL:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	.syntax divided
@ 302 "seng440Project.c" 1
	sub r3, r3, r2
	asr r3, r3, #1
	
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	getThetaL, .-getThetaL
	.align	2
	.global	getThetaSum
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	getThetaSum, %function
getThetaSum:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	add	r3, r3, #8
	ldr	r3, [r3]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-24]
	add	r3, r3, #8
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	sub	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	fastArcTan
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	getThetaSum, .-getThetaSum
	.align	2
	.global	getThetaDiff
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	getThetaDiff, %function
getThetaDiff:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	add	r3, r3, #8
	ldr	r2, [r3]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	sub	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-24]
	add	r3, r3, #8
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	fastArcTan
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	getThetaDiff, .-getThetaDiff
	.align	2
	.global	getLMatrix
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	getLMatrix, %function
getLMatrix:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r0, [fp, #-16]
	bl	fastCos
	mov	r2, r0
	ldr	r3, [fp, #-20]
	str	r2, [r3]
	ldr	r0, [fp, #-16]
	bl	fastSin
	mov	r3, r0
	rsb	r2, r3, #0
	ldr	r3, [fp, #-20]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	add	r4, r3, #8
	ldr	r0, [fp, #-16]
	bl	fastSin
	mov	r3, r0
	str	r3, [r4]
	ldr	r3, [fp, #-20]
	add	r4, r3, #8
	ldr	r0, [fp, #-16]
	bl	fastCos
	mov	r3, r0
	str	r3, [r4, #4]
	nop
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, pc}
	.size	getLMatrix, .-getLMatrix
	.align	2
	.global	getRMatrix
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	getRMatrix, %function
getRMatrix:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r0, [fp, #-16]
	bl	fastCos
	mov	r2, r0
	ldr	r3, [fp, #-20]
	str	r2, [r3]
	ldr	r0, [fp, #-16]
	bl	fastSin
	mov	r3, r0
	rsb	r2, r3, #0
	ldr	r3, [fp, #-20]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	add	r4, r3, #8
	ldr	r0, [fp, #-16]
	bl	fastSin
	mov	r3, r0
	str	r3, [r4]
	ldr	r3, [fp, #-20]
	add	r4, r3, #8
	ldr	r0, [fp, #-16]
	bl	fastCos
	mov	r3, r0
	str	r3, [r4, #4]
	nop
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, pc}
	.size	getRMatrix, .-getRMatrix
	.align	2
	.global	Transpose4x4
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	Transpose4x4, %function
Transpose4x4:
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #72
	str	r0, [fp, #-80]
	mov	r5, #0
	b	.L70
.L73:
	mov	r4, #0
	b	.L71
.L72:
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-80]
	add	r3, r2, r3
	ldr	r2, [r3, r4, lsl #2]
	lsl	r3, r4, #2
	add	r3, r3, r5
	lsl	r3, r3, #2
	sub	r1, fp, #12
	add	r3, r1, r3
	str	r2, [r3, #-64]
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-80]
	add	r2, r2, r3
	add	r1, r4, #1
	add	r3, r4, #1
	ldr	r2, [r2, r1, lsl #2]
	lsl	r3, r3, #2
	add	r3, r3, r5
	lsl	r3, r3, #2
	sub	r1, fp, #12
	add	r3, r1, r3
	str	r2, [r3, #-64]
	add	r4, r4, #2
.L71:
	and	r3, r4, #4
	cmp	r3, #0
	beq	.L72
	add	r5, r5, #1
.L70:
	and	r3, r5, #4
	cmp	r3, #0
	beq	.L73
	sub	r3, fp, #76
	mov	r2, #64
	mov	r1, r3
	ldr	r0, [fp, #-80]
	bl	memcpy
	nop
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, fp, pc}
	.size	Transpose4x4, .-Transpose4x4
	.align	2
	.global	Transpos2x2
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	Transpos2x2, %function
Transpos2x2:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #24
	str	r0, [fp, #-32]
	mov	r5, #0
	b	.L75
.L78:
	mov	r4, #0
	b	.L76
.L77:
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [r3, r4, lsl #2]
	lsl	r3, r4, #1
	add	r3, r3, r5
	lsl	r3, r3, #2
	sub	r1, fp, #12
	add	r3, r1, r3
	str	r2, [r3, #-16]
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-32]
	add	r2, r2, r3
	add	r1, r4, #1
	add	r3, r4, #1
	ldr	r2, [r2, r1, lsl #2]
	lsl	r3, r3, #1
	add	r3, r3, r5
	lsl	r3, r3, #2
	sub	r1, fp, #12
	add	r3, r1, r3
	str	r2, [r3, #-16]
	add	r4, r4, #2
.L76:
	and	r3, r4, #2
	cmp	r3, #0
	beq	.L77
	add	r5, r5, #1
.L75:
	and	r3, r5, #2
	cmp	r3, #0
	beq	.L78
	sub	r3, fp, #28
	mov	r2, #16
	mov	r1, r3
	ldr	r0, [fp, #-32]
	bl	memcpy
	nop
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, fp, pc}
	.size	Transpos2x2, .-Transpos2x2
	.align	2
	.global	matrixMultiply
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	matrixMultiply, %function
matrixMultiply:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, fp}
	add	fp, sp, #8
	sub	sp, sp, #44
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	str	r2, [fp, #-48]
	mov	r5, #0
	b	.L80
.L83:
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldr	r3, [r3]
	ldr	r2, [fp, #-44]
	ldr	r2, [r2]
	mul	r3, r2, r3
	asr	r3, r3, #2
	str	r3, [fp, #-20]
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-44]
	add	r2, r2, #16
	ldr	r2, [r2]
	mul	r3, r2, r3
	asr	r3, r3, #2
	str	r3, [fp, #-24]
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldr	r3, [r3, #8]
	ldr	r2, [fp, #-44]
	add	r2, r2, #32
	ldr	r2, [r2]
	mul	r3, r2, r3
	asr	r3, r3, #2
	str	r3, [fp, #-28]
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldr	r3, [r3, #12]
	ldr	r2, [fp, #-44]
	add	r2, r2, #48
	ldr	r2, [r2]
	mul	r3, r2, r3
	asr	r3, r3, #2
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	mov	r4, #0
	b	.L81
.L82:
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	asr	r2, r2, #13
	str	r2, [r3, r4, lsl #2]
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldr	r3, [r3]
	add	r1, r4, #1
	ldr	r2, [fp, #-44]
	ldr	r2, [r2, r1, lsl #2]
	mul	r3, r2, r3
	asr	r3, r3, #2
	str	r3, [fp, #-20]
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-44]
	add	r2, r2, #16
	add	r1, r4, #1
	ldr	r2, [r2, r1, lsl #2]
	mul	r3, r2, r3
	asr	r3, r3, #2
	str	r3, [fp, #-24]
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldr	r3, [r3, #8]
	ldr	r2, [fp, #-44]
	add	r2, r2, #32
	add	r1, r4, #1
	ldr	r2, [r2, r1, lsl #2]
	mul	r3, r2, r3
	asr	r3, r3, #2
	str	r3, [fp, #-28]
	mov	r3, r5
	lsl	r3, r3, #4
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldr	r3, [r3, #12]
	ldr	r2, [fp, #-44]
	add	r2, r2, #48
	add	r1, r4, #1
	ldr	r2, [r2, r1, lsl #2]
	mul	r3, r2, r3
	asr	r3, r3, #2
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	add	r4, r4, #1
.L81:
	and	r3, r4, #4
	cmp	r3, #0
	beq	.L82
	add	r5, r5, #1
.L80:
	and	r3, r5, #4
	cmp	r3, #0
	beq	.L83
	nop
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, r5, fp}
	bx	lr
	.size	matrixMultiply, .-matrixMultiply
	.align	2
	.global	iteration
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	iteration, %function
iteration:
	@ args = 4, pretend = 0, frame = 400
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #400
	str	r0, [fp, #-392]
	str	r1, [fp, #-396]
	str	r2, [fp, #-400]
	str	r3, [fp, #-404]
	ldr	r3, [fp, #-392]
	lsl	r3, r3, #4
	ldr	r2, [fp, #4]
	add	r3, r2, r3
	ldr	r2, [fp, #-392]
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-392]
	lsl	r3, r3, #4
	ldr	r2, [fp, #4]
	add	r3, r2, r3
	ldr	r2, [fp, #-396]
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-396]
	lsl	r3, r3, #4
	ldr	r2, [fp, #4]
	add	r3, r2, r3
	ldr	r2, [fp, #-392]
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-396]
	lsl	r3, r3, #4
	ldr	r2, [fp, #4]
	add	r3, r2, r3
	ldr	r2, [fp, #-396]
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [fp, #-24]
	sub	r3, fp, #36
	mov	r0, r3
	bl	getThetaDiff
	str	r0, [fp, #-8]
	sub	r3, fp, #36
	mov	r0, r3
	bl	getThetaSum
	str	r0, [fp, #-12]
	ldr	r1, [fp, #-8]
	ldr	r0, [fp, #-12]
	bl	getThetaL
	str	r0, [fp, #-16]
	ldr	r1, [fp, #-8]
	ldr	r0, [fp, #-12]
	bl	getThetaR
	str	r0, [fp, #-20]
	sub	r3, fp, #68
	mov	r1, r3
	ldr	r0, [fp, #-16]
	bl	getLMatrix
	sub	r3, fp, #52
	mov	r1, r3
	ldr	r0, [fp, #-20]
	bl	getRMatrix
	sub	r3, fp, #132
	mov	r1, #32768
	mov	r0, r3
	bl	genIdentityMatrix
	ldr	r1, [fp, #-68]
	ldr	r2, [fp, #-392]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	sub	r3, r3, #128
	str	r1, [r3]
	ldr	r2, [fp, #-64]
	ldr	r3, [fp, #-392]
	lsl	r1, r3, #2
	ldr	r3, [fp, #-396]
	add	r3, r1, r3
	lsl	r3, r3, #2
	sub	r1, fp, #4
	add	r3, r1, r3
	str	r2, [r3, #-128]
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-396]
	lsl	r1, r3, #2
	ldr	r3, [fp, #-392]
	add	r3, r1, r3
	lsl	r3, r3, #2
	sub	r1, fp, #4
	add	r3, r1, r3
	str	r2, [r3, #-128]
	ldr	r1, [fp, #-56]
	ldr	r2, [fp, #-396]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	sub	r3, r3, #128
	str	r1, [r3]
	sub	r3, fp, #196
	mov	r1, #32768
	mov	r0, r3
	bl	genIdentityMatrix
	ldr	r1, [fp, #-52]
	ldr	r2, [fp, #-392]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	sub	r3, r3, #192
	str	r1, [r3]
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-392]
	lsl	r1, r3, #2
	ldr	r3, [fp, #-396]
	add	r3, r1, r3
	lsl	r3, r3, #2
	sub	r1, fp, #4
	add	r3, r1, r3
	str	r2, [r3, #-192]
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-396]
	lsl	r1, r3, #2
	ldr	r3, [fp, #-392]
	add	r3, r1, r3
	lsl	r3, r3, #2
	sub	r1, fp, #4
	add	r3, r1, r3
	str	r2, [r3, #-192]
	ldr	r1, [fp, #-40]
	ldr	r2, [fp, #-396]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	sub	r3, r3, #192
	str	r1, [r3]
	sub	r2, fp, #260
	sub	r3, fp, #196
	ldr	r1, [fp, #-404]
	mov	r0, r3
	bl	matrixMultiply
	sub	r3, fp, #260
	mov	r2, #64
	mov	r1, r3
	ldr	r0, [fp, #-404]
	bl	memcpy
	sub	r3, fp, #196
	mov	r0, r3
	bl	Transpose4x4
	sub	r2, fp, #324
	sub	r3, fp, #132
	ldr	r1, [fp, #4]
	mov	r0, r3
	bl	matrixMultiply
	sub	r1, fp, #196
	sub	r3, fp, #324
	ldr	r2, [fp, #4]
	mov	r0, r3
	bl	matrixMultiply
	sub	r3, fp, #132
	mov	r0, r3
	bl	Transpose4x4
	sub	r2, fp, #388
	sub	r3, fp, #132
	mov	r1, r3
	ldr	r0, [fp, #-400]
	bl	matrixMultiply
	sub	r3, fp, #388
	mov	r2, #64
	mov	r1, r3
	ldr	r0, [fp, #-400]
	bl	memcpy
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	iteration, .-iteration
	.section	.rodata
	.align	2
.LC2:
	.ascii	"\012Original Matrix\000"
	.align	2
.LC3:
	.ascii	"\012\012Final M:\000"
	.align	2
.LC4:
	.ascii	"\012\012Final U:\000"
	.align	2
.LC5:
	.ascii	"\012\012Final V:\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 472
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #480
	str	r0, [fp, #-472]
	str	r1, [fp, #-476]
	sub	r3, fp, #212
	mov	r0, r3
	bl	genMMatrix
	sub	ip, fp, #276
	sub	lr, fp, #212
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
	sub	r3, fp, #276
	mov	r0, r3
	bl	printMatrix
	mov	r3, #256
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L86
.L87:
	ldr	r3, [fp, #-8]
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d6, .L105
	vmul.f64	d7, d7, d6
	vldr.64	d6, .L105+8
	vdiv.f64	d5, d7, d6
	vmov.f64	d0, d5
	bl	sin
	vmov.f64	d6, d0
	vldr.64	d7, .L105+16
	vmul.f64	d7, d6, d7
	vcvt.s32.f64	s15, d7
	vmov	r1, s15	@ int
	movw	r3, #:lower16:fastCossinTable
	movt	r3, #:upper16:fastCossinTable
	ldr	r2, [fp, #-8]
	str	r1, [r3, r2, lsl #2]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L86:
	ldr	r3, [fp, #-8]
	cmp	r3, #2048
	blt	.L87
	sub	r3, fp, #404
	mov	r1, #32768
	mov	r0, r3
	bl	genIdentityMatrix
	sub	r3, fp, #468
	mov	r1, #32768
	mov	r0, r3
	bl	genIdentityMatrix
	sub	r1, fp, #340
	sub	r3, fp, #212
	ldr	r2, [fp, #-20]
	mov	r0, r3
	bl	scaleMatrix
.L100:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L88
.L91:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	b	.L89
.L90:
	sub	r1, fp, #468
	sub	r2, fp, #404
	sub	r3, fp, #340
	str	r3, [sp]
	mov	r3, r1
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	iteration
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L89:
	ldr	r3, [fp, #-12]
	cmp	r3, #3
	ble	.L90
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L88:
	ldr	r3, [fp, #-8]
	cmp	r3, #2
	ble	.L91
	mov	r3, #1
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L92
.L97:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L93
.L96:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	beq	.L103
	ldr	r3, [fp, #-8]
	lsl	r2, r3, #2
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-336]
	cmp	r3, #0
	rsblt	r3, r3, #0
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	bgt	.L95
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L95
.L103:
	nop
.L95:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L93:
	ldr	r3, [fp, #-12]
	and	r3, r3, #4
	cmp	r3, #0
	beq	.L96
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L92:
	ldr	r3, [fp, #-8]
	and	r3, r3, #4
	cmp	r3, #0
	beq	.L97
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L104
	b	.L100
.L104:
	nop
	sub	r3, fp, #468
	mov	r0, r3
	bl	Transpose4x4
	sub	r1, fp, #340
	sub	r3, fp, #212
	mov	r2, #8
	mov	r0, r3
	bl	unScaleMatrix
	sub	r1, fp, #404
	sub	r3, fp, #84
	mov	r2, #15
	mov	r0, r3
	bl	unScaleMatrix
	sub	r1, fp, #468
	sub	r3, fp, #148
	mov	r2, #15
	mov	r0, r3
	bl	unScaleMatrix
	movw	r0, #:lower16:.LC3
	movt	r0, #:upper16:.LC3
	bl	puts
	sub	r3, fp, #212
	mov	r0, r3
	bl	printMatrix
	movw	r0, #:lower16:.LC4
	movt	r0, #:upper16:.LC4
	bl	puts
	sub	r3, fp, #84
	mov	r0, r3
	bl	printMatrix
	movw	r0, #:lower16:.LC5
	movt	r0, #:upper16:.LC5
	bl	puts
	sub	r3, fp, #148
	mov	r0, r3
	bl	printMatrix
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L106:
	.align	3
.L105:
	.word	1413754136
	.word	1074340347
	.word	0
	.word	1083179008
	.word	0
	.word	1088421888
	.size	main, .-main
	.ident	"GCC: (GNU) 8.1.1 20180626 (Red Hat Cross 8.1.1-3)"
	.section	.note.GNU-stack,"",%progbits
