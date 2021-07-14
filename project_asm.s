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
	.global	gen_test_matrix
	.arch armv7-a
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	gen_test_matrix, %function
gen_test_matrix:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r6, r0
	vpush.64	{d8, d9, d10}
	mov	r0, #0
	bl	time
	bl	srand
	vldr.32	s20, .L8+8
	vmov.f64	d9, #5.0e-1
	vldr.64	d8, .L8
	add	r5, r6, #16
	add	r6, r6, #80
.L2:
	sub	r4, r5, #16
.L3:
	bl	rand
	vmov	s15, r0	@ int
	vcvt.f32.s32	s14, s15
	vmul.f32	s14, s14, s20
	vcvt.f64.f32	d7, s14
	vsub.f64	d7, d7, d9
	vmul.f64	d7, d7, d8
	vcvt.f32.f64	s14, d7
	vstmia.32	r4!, {s14}
	cmp	r4, r5
	bne	.L3
	add	r5, r4, #16
	cmp	r5, r6
	bne	.L2
	vldm	sp!, {d8-d10}
	pop	{r4, r5, r6, pc}
.L9:
	.align	3
.L8:
	.word	0
	.word	1082081280
	.word	805306368
	.size	gen_test_matrix, .-gen_test_matrix
	.align	2
	.global	gen_M_matrix
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	gen_M_matrix, %function
gen_M_matrix:
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
	vldr.32	s14, .L12
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
.L13:
	.align	2
.L12:
	.word	1117388800
	.size	gen_M_matrix, .-gen_M_matrix
	.align	2
	.global	gen_identity_matrix
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	gen_identity_matrix, %function
gen_identity_matrix:
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
	.size	gen_identity_matrix, .-gen_identity_matrix
	.align	2
	.global	scale_matrix
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	scale_matrix, %function
scale_matrix:
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
	.size	scale_matrix, .-scale_matrix
	.align	2
	.global	un_scale_matrix
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	un_scale_matrix, %function
un_scale_matrix:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
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
	mov	r3, #1
	vldr.32	s15, [r1]	@ int
	vcvt.f32.s32	s8, s14
	vldr.32	s14, [r1, #40]	@ int
	lsl	r2, r3, r2
	vldr.32	s10, [r1, #44]	@ int
	vldr.32	s11, [r1, #48]	@ int
	vldr.32	s12, [r1, #52]	@ int
	vldr.32	s13, [r1, #56]	@ int
	vpush.64	{d8}
	vcvt.f32.s32	s9, s14
	vcvt.f32.s32	s16, s15
	vldr.32	s14, [r1, #60]	@ int
	vmov	s15, r2	@ int
	vcvt.f32.s32	s10, s10
	vcvt.f32.s32	s15, s15
	vcvt.f32.s32	s11, s11
	vcvt.f32.s32	s12, s12
	vcvt.f32.s32	s13, s13
	vcvt.f32.s32	s14, s14
	vdiv.f32	s17, s16, s15
	vdiv.f32	s16, s0, s15
	vdiv.f32	s0, s1, s15
	vdiv.f32	s1, s2, s15
	vdiv.f32	s2, s3, s15
	vdiv.f32	s3, s4, s15
	vdiv.f32	s4, s5, s15
	vdiv.f32	s5, s6, s15
	vdiv.f32	s6, s7, s15
	vdiv.f32	s7, s8, s15
	vdiv.f32	s8, s9, s15
	vdiv.f32	s9, s10, s15
	vdiv.f32	s10, s11, s15
	vdiv.f32	s11, s12, s15
	vdiv.f32	s12, s13, s15
	vdiv.f32	s13, s14, s15
	vstr.32	s17, [r0]
	vstr.32	s16, [r0, #4]
	vstr.32	s0, [r0, #8]
	vstr.32	s1, [r0, #12]
	vstr.32	s2, [r0, #16]
	vstr.32	s3, [r0, #20]
	vstr.32	s4, [r0, #24]
	vstr.32	s5, [r0, #28]
	vstr.32	s6, [r0, #32]
	vstr.32	s7, [r0, #36]
	vstr.32	s8, [r0, #40]
	vstr.32	s9, [r0, #44]
	vstr.32	s10, [r0, #48]
	vstr.32	s11, [r0, #52]
	vstr.32	s12, [r0, #56]
	vstr.32	s13, [r0, #60]
	vldm	sp!, {d8}
	bx	lr
	.size	un_scale_matrix, .-un_scale_matrix
	.align	2
	.global	get_max
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	get_max, %function
get_max:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	vldr.32	s13, [r0, #4]
	vldr.32	s15, [r0]
	vcmp.f32	s15, s13
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s14, [r0, #8]
	vmovmi.f32	s15, s13
	vcmp.f32	s14, s15
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s13, [r0, #12]
	vmovgt.f32	s15, s14
	vcmp.f32	s13, s15
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s14, [r0, #16]
	vmovgt.f32	s15, s13
	vcmp.f32	s14, s15
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s13, [r0, #20]
	vmovgt.f32	s15, s14
	vcmp.f32	s15, s13
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s14, [r0, #24]
	vmovmi.f32	s15, s13
	vcmp.f32	s14, s15
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s13, [r0, #28]
	vmovgt.f32	s15, s14
	vcmp.f32	s15, s13
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s14, [r0, #32]
	vmovmi.f32	s15, s13
	vcmp.f32	s15, s14
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s13, [r0, #36]
	vmovmi.f32	s15, s14
	vcmp.f32	s15, s13
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s14, [r0, #40]
	vmovmi.f32	s15, s13
	vcmp.f32	s15, s14
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s13, [r0, #44]
	vmovmi.f32	s15, s14
	vcmp.f32	s15, s13
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s14, [r0, #48]
	vmovmi.f32	s15, s13
	vcmp.f32	s15, s14
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s13, [r0, #52]
	vmovmi.f32	s15, s14
	vcmp.f32	s13, s15
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s14, [r0, #56]
	vmovgt.f32	s15, s13
	vcmp.f32	s15, s14
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s0, [r0, #60]
	vmovmi.f32	s15, s14
	vcmp.f32	s15, s0
	vmrs	APSR_nzcv, FPSCR
	vmovpl.f32	s0, s15
	bx	lr
	.size	get_max, .-get_max
	.align	2
	.global	get_min
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	get_min, %function
get_min:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	vldr.32	s13, [r0, #4]
	vldr.32	s15, [r0]
	vcmp.f32	s15, s13
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s14, [r0, #8]
	vmovgt.f32	s15, s13
	vcmp.f32	s14, s15
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s13, [r0, #12]
	vmovmi.f32	s15, s14
	vcmp.f32	s13, s15
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s14, [r0, #16]
	vmovmi.f32	s15, s13
	vcmp.f32	s14, s15
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s13, [r0, #20]
	vmovmi.f32	s15, s14
	vcmp.f32	s15, s13
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s14, [r0, #24]
	vmovgt.f32	s15, s13
	vcmp.f32	s14, s15
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s13, [r0, #28]
	vmovmi.f32	s15, s14
	vcmp.f32	s15, s13
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s14, [r0, #32]
	vmovgt.f32	s15, s13
	vcmp.f32	s15, s14
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s13, [r0, #36]
	vmovgt.f32	s15, s14
	vcmp.f32	s15, s13
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s14, [r0, #40]
	vmovgt.f32	s15, s13
	vcmp.f32	s15, s14
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s13, [r0, #44]
	vmovgt.f32	s15, s14
	vcmp.f32	s15, s13
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s14, [r0, #48]
	vmovgt.f32	s15, s13
	vcmp.f32	s15, s14
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s13, [r0, #52]
	vmovgt.f32	s15, s14
	vcmp.f32	s13, s15
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s14, [r0, #56]
	vmovmi.f32	s15, s13
	vcmp.f32	s15, s14
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s0, [r0, #60]
	vmovgt.f32	s15, s14
	vcmp.f32	s15, s0
	vmrs	APSR_nzcv, FPSCR
	vmovle.f32	s0, s15
	bx	lr
	.size	get_min, .-get_min
	.align	2
	.global	get_max_int
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	get_max_int, %function
get_max_int:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0]
	ldmib	r0, {r1, r2}
	cmp	r3, r1
	movlt	r3, r1
	cmp	r3, r2
	movlt	r3, r2
	ldr	r1, [r0, #12]
	ldr	r2, [r0, #16]
	cmp	r3, r1
	movlt	r3, r1
	cmp	r3, r2
	movlt	r3, r2
	ldr	r1, [r0, #20]
	ldr	r2, [r0, #24]
	cmp	r3, r1
	movlt	r3, r1
	cmp	r3, r2
	movlt	r3, r2
	ldr	r1, [r0, #28]
	ldr	r2, [r0, #32]
	cmp	r3, r1
	movlt	r3, r1
	cmp	r3, r2
	movlt	r3, r2
	ldr	r1, [r0, #36]
	ldr	r2, [r0, #40]
	cmp	r3, r1
	movlt	r3, r1
	cmp	r3, r2
	movlt	r3, r2
	ldr	r1, [r0, #44]
	ldr	r2, [r0, #48]
	cmp	r3, r1
	movlt	r3, r1
	cmp	r3, r2
	movlt	r3, r2
	ldr	r1, [r0, #52]
	ldr	r2, [r0, #56]
	cmp	r3, r1
	movlt	r3, r1
	cmp	r3, r2
	movlt	r3, r2
	ldr	r0, [r0, #60]
	cmp	r3, r0
	movge	r0, r3
	bx	lr
	.size	get_max_int, .-get_max_int
	.align	2
	.global	get_min_int
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	get_min_int, %function
get_min_int:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0]
	ldmib	r0, {r1, r2}
	cmp	r3, r1
	movge	r3, r1
	cmp	r3, r2
	movge	r3, r2
	ldr	r1, [r0, #12]
	ldr	r2, [r0, #16]
	cmp	r3, r1
	movge	r3, r1
	cmp	r3, r2
	movge	r3, r2
	ldr	r1, [r0, #20]
	ldr	r2, [r0, #24]
	cmp	r3, r1
	movge	r3, r1
	cmp	r3, r2
	movge	r3, r2
	ldr	r1, [r0, #28]
	ldr	r2, [r0, #32]
	cmp	r3, r1
	movge	r3, r1
	cmp	r3, r2
	movge	r3, r2
	ldr	r1, [r0, #36]
	ldr	r2, [r0, #40]
	cmp	r3, r1
	movge	r3, r1
	cmp	r3, r2
	movge	r3, r2
	ldr	r1, [r0, #44]
	ldr	r2, [r0, #48]
	cmp	r3, r1
	movge	r3, r1
	cmp	r3, r2
	movge	r3, r2
	ldr	r1, [r0, #52]
	ldr	r2, [r0, #56]
	cmp	r3, r1
	movge	r3, r1
	cmp	r3, r2
	movge	r3, r2
	ldr	r0, [r0, #60]
	cmp	r3, r0
	movlt	r0, r3
	bx	lr
	.size	get_min_int, .-get_min_int
	.align	2
	.global	print_matrix
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	print_matrix, %function
print_matrix:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	movw	r6, #:lower16:.LC0
	add	r5, r0, #16
	add	r7, r0, #80
	movt	r6, #:upper16:.LC0
.L114:
	vldr.32	s15, [r5, #-16]
	vcvt.f64.f32	d7, s15
	mov	r0, r6
	vmov	r2, r3, d7
	bl	printf
	sub	r4, r5, #12
.L117:
	vldmia.32	r4!, {s15}
	vcvt.f64.f32	d7, s15
	mov	r0, r6
	vmov	r2, r3, d7
	bl	printf
	cmp	r5, r4
	bne	.L117
	add	r5, r5, #16
	mov	r0, #10
	bl	putchar
	cmp	r5, r7
	bne	.L114
	pop	{r4, r5, r6, r7, r8, pc}
	.size	print_matrix, .-print_matrix
	.align	2
	.global	print_matrix_int
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	print_matrix_int, %function
print_matrix_int:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	movw	r5, #:lower16:.LC1
	mov	r4, r0
	add	r6, r0, #64
	movt	r5, #:upper16:.LC1
.L123:
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
	bne	.L123
	pop	{r4, r5, r6, lr}
	mov	r0, #10
	b	putchar
	.size	print_matrix_int, .-print_matrix_int
	.align	2
	.global	fastsin
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	fastsin, %function
fastsin:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	asr	r0, r0, #4
	vmov	s15, r0	@ int
	vldr.64	d5, .L129
	vcvt.f64.s32	d6, s15
	vdiv.f64	d7, d6, d5
	vcvt.s32.f64	s15, d7
	vmov	r3, s15	@ int
	movw	r2, #:lower16:fast_cossin_table
	cmp	r3, #0
	rsblt	r3, r3, #0
	ubfxlt	r3, r3, #0, #11
	rsblt	r3, r3, #2048
	ubfxge	r3, r3, #0, #11
	movt	r2, #:upper16:fast_cossin_table
	ldr	r0, [r2, r3, lsl #2]
	bx	lr
.L130:
	.align	3
.L129:
	.word	1413754136
	.word	1074340347
	.size	fastsin, .-fastsin
	.align	2
	.global	fastcos
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	fastcos, %function
fastcos:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	asr	r0, r0, #4
	vmov	s15, r0	@ int
	vldr.64	d5, .L134
	vcvt.f64.s32	d6, s15
	vdiv.f64	d7, d6, d5
	vcvt.s32.f64	s15, d7
	vmov	r3, s15	@ int
	movw	r2, #:lower16:fast_cossin_table
	cmp	r3, #0
	rsblt	r3, r3, #512
	addge	r3, r3, #512
	ubfx	r3, r3, #0, #11
	movt	r2, #:upper16:fast_cossin_table
	ldr	r0, [r2, r3, lsl #2]
	bx	lr
.L135:
	.align	3
.L134:
	.word	1413754136
	.word	1074340347
	.size	fastcos, .-fastcos
	.global	__aeabi_uidiv
	.global	__aeabi_idiv
	.align	2
	.global	calculateScaleFactor
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	calculateScaleFactor, %function
calculateScaleFactor:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #0
	rsblt	r0, r0, #0
	vmov	s15, r0	@ int
	push	{r4, lr}
	vcvt.f64.s32	d0, s15
	vpush.64	{d8, d9}
	mov	r4, r1
	vldr.64	d9, .L138
	bl	log
	vdiv.f64	d0, d0, d9
	bl	ceil
	vmov.f64	d1, d0
	vmov.f64	d0, #2.0e+0
	bl	pow
	cmp	r4, #0
	rsblt	r4, r4, #0
	vmov.f64	d8, d0
	vmov	s0, r4	@ int
	vcvt.f64.s32	d0, s0
	bl	log
	vdiv.f64	d0, d0, d9
	bl	ceil
	vmov.f64	d1, d0
	vmov.f64	d0, #2.0e+0
	bl	pow
	vcvt.s32.f64	s15, d8
	vmov	r3, s15	@ int
	vcvt.s32.f64	s15, d0
	vmov	r1, s15	@ int
	cmp	r3, r1
	movge	r1, r3
	mov	r0, #32768
	bl	__aeabi_idiv
	vldm	sp!, {d8-d9}
	pop	{r4, pc}
.L139:
	.align	3
.L138:
	.word	-17155601
	.word	1072049730
	.size	calculateScaleFactor, .-calculateScaleFactor
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
	vmov.f32	s15, s0
	vcvt.s32.f32	s15, s15, #15
	vmov	r2, s15	@ int
	sub	r3, r2, #16384
	sub	r3, r3, #1
	cmp	r3, #16384
	bcc	.L146
	cmn	r2, #16384
	blt	.L143
	cmp	r2, #16384
	ble	.L147
.L145:
	mov	r0, #0
	bx	lr
.L143:
	cmn	r2, #32768
	blt	.L145
	movw	r0, #21103
	mul	r0, r0, r2
	asr	r0, r0, #16
	sub	r0, r0, #4608
	sub	r0, r0, #45
	bx	lr
.L146:
	movw	r3, #21103
	movw	r0, #4653
	mul	r2, r3, r2
	add	r0, r0, r2, asr #16
	bx	lr
.L147:
	movw	r0, #30409
	mul	r0, r0, r2
	asr	r0, r0, #16
	bx	lr
	.size	fastArcTan, .-fastArcTan
	.align	2
	.global	newArctan
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	newArctan, %function
newArctan:
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
	ble	.L149
	vdiv.f32	s13, s15, s14
	vmov.f32	s15, s13
	vcvt.s32.f32	s15, s15, #15
	vcmpe.f32	s13, #0
	vmov	r2, s15	@ int
	vmrs	APSR_nzcv, FPSCR
	sub	r3, r2, #16384
	sub	r3, r3, #1
	bmi	.L169
	cmp	r3, #16384
	bcc	.L170
	cmn	r2, #16384
	blt	.L158
	cmp	r2, #16384
	ble	.L171
.L164:
	movw	r0, #25735
	bx	lr
.L169:
	cmp	r3, #16384
	bcc	.L172
	cmn	r2, #16384
	blt	.L154
	cmp	r2, #16384
	ble	.L173
.L162:
	movw	r0, #39801
	movt	r0, 65535
	bx	lr
.L149:
	vdiv.f32	s13, s14, s15
	vmov.f32	s15, s13
	vcvt.s32.f32	s15, s15, #15
	vmov	r3, s15	@ int
	sub	r2, r3, #16384
	sub	r2, r2, #1
	cmp	r2, #16384
	bcc	.L174
	cmn	r3, #16384
	blt	.L160
	cmp	r3, #16384
	ble	.L175
.L166:
	mov	r0, #0
	bx	lr
.L160:
	cmn	r3, #32768
	blt	.L166
	movw	r0, #21103
	mul	r0, r0, r3
	asr	r0, r0, #16
	sub	r0, r0, #4608
	sub	r0, r0, #45
	bx	lr
.L170:
	movw	r0, #21103
	mul	r0, r0, r2
	asr	r0, r0, #16
	rsb	r0, r0, #20992
	add	r0, r0, #90
	bx	lr
.L172:
	movw	r3, #21103
	movw	r0, #35148
	mul	r2, r3, r2
	movt	r0, 65535
	asr	r2, r2, #16
	sub	r0, r0, r2
	bx	lr
.L174:
	movw	r2, #21103
	movw	r0, #4653
	mul	r3, r2, r3
	add	r0, r0, r3, asr #16
	bx	lr
.L158:
	cmn	r2, #32768
	blt	.L164
	movw	r0, #21103
	mul	r0, r0, r2
	asr	r0, r0, #16
	rsb	r0, r0, #30208
	add	r0, r0, #180
	bx	lr
.L154:
	cmn	r2, #32768
	blt	.L162
	movw	r3, #21103
	movw	r0, #44454
	mul	r2, r3, r2
	movt	r0, 65535
	asr	r2, r2, #16
	sub	r0, r0, r2
	bx	lr
.L175:
	movw	r0, #30409
	mul	r0, r0, r3
	asr	r0, r0, #16
	bx	lr
.L173:
	movw	r0, #30409
	movw	r3, #39801
	mul	r0, r0, r2
	movt	r3, 65535
	sub	r0, r3, r0, asr #16
	bx	lr
.L171:
	movw	r0, #30409
	movw	r3, #25735
	mul	r0, r0, r2
	sub	r0, r3, r0, asr #16
	bx	lr
	.size	newArctan, .-newArctan
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
	sub	r0, r0, r1
	asr	r0, r0, #1
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
	bge	.L180
	vdiv.f32	s13, s14, s15
	vmov.f32	s15, s13
	vcvt.s32.f32	s15, s15, #15
	vcmpe.f32	s13, #0
	vmov	r2, s15	@ int
	vmrs	APSR_nzcv, FPSCR
	sub	r3, r2, #16384
	sub	r3, r3, #1
	bmi	.L201
	cmp	r3, #16384
	bcc	.L202
	cmn	r2, #16384
	blt	.L189
	cmp	r2, #16384
	ble	.L203
.L196:
	movw	r0, #25735
	bx	lr
.L201:
	cmp	r3, #16384
	bcc	.L204
	cmn	r2, #16384
	blt	.L185
	cmp	r2, #16384
	ble	.L205
.L194:
	movw	r0, #39801
	movt	r0, 65535
	bx	lr
.L180:
	vdiv.f32	s13, s15, s14
	vmov.f32	s15, s13
	vcvt.s32.f32	s15, s15, #15
	vmov	r3, s15	@ int
	sub	r2, r3, #16384
	sub	r2, r2, #1
	cmp	r2, #16384
	bcc	.L206
	cmn	r3, #16384
	blt	.L191
	cmp	r3, #16384
	ble	.L207
.L198:
	mov	r0, #0
	bx	lr
.L191:
	cmn	r3, #32768
	blt	.L198
	movw	r0, #21103
	mul	r0, r0, r3
	asr	r0, r0, #16
	sub	r0, r0, #4608
	sub	r0, r0, #45
	bx	lr
.L202:
	movw	r0, #21103
	mul	r0, r0, r2
	asr	r0, r0, #16
	rsb	r0, r0, #20992
	add	r0, r0, #90
	bx	lr
.L204:
	movw	r3, #21103
	movw	r0, #35148
	mul	r2, r3, r2
	movt	r0, 65535
	asr	r2, r2, #16
	sub	r0, r0, r2
	bx	lr
.L206:
	movw	r2, #21103
	movw	r0, #4653
	mul	r3, r2, r3
	add	r0, r0, r3, asr #16
	bx	lr
.L189:
	cmn	r2, #32768
	blt	.L196
	movw	r0, #21103
	mul	r0, r0, r2
	asr	r0, r0, #16
	rsb	r0, r0, #30208
	add	r0, r0, #180
	bx	lr
.L185:
	cmn	r2, #32768
	blt	.L194
	movw	r3, #21103
	movw	r0, #44454
	mul	r2, r3, r2
	movt	r0, 65535
	asr	r2, r2, #16
	sub	r0, r0, r2
	bx	lr
.L207:
	movw	r0, #30409
	mul	r0, r0, r3
	asr	r0, r0, #16
	bx	lr
.L205:
	movw	r0, #30409
	movw	r3, #39801
	mul	r0, r0, r2
	movt	r3, 65535
	sub	r0, r3, r0, asr #16
	bx	lr
.L203:
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
	ble	.L210
	vdiv.f32	s13, s15, s14
	vmov.f32	s15, s13
	vcvt.s32.f32	s15, s15, #15
	vcmpe.f32	s13, #0
	vmov	r2, s15	@ int
	vmrs	APSR_nzcv, FPSCR
	sub	r3, r2, #16384
	sub	r3, r3, #1
	bmi	.L231
	cmp	r3, #16384
	bcc	.L232
	cmn	r2, #16384
	blt	.L219
	cmp	r2, #16384
	ble	.L233
.L226:
	movw	r0, #25735
	bx	lr
.L231:
	cmp	r3, #16384
	bcc	.L234
	cmn	r2, #16384
	blt	.L215
	cmp	r2, #16384
	ble	.L235
.L224:
	movw	r0, #39801
	movt	r0, 65535
	bx	lr
.L210:
	vdiv.f32	s13, s14, s15
	vmov.f32	s15, s13
	vcvt.s32.f32	s15, s15, #15
	vmov	r3, s15	@ int
	sub	r2, r3, #16384
	sub	r2, r2, #1
	cmp	r2, #16384
	bcc	.L236
	cmn	r3, #16384
	blt	.L221
	cmp	r3, #16384
	ble	.L237
.L228:
	mov	r0, #0
	bx	lr
.L221:
	cmn	r3, #32768
	blt	.L228
	movw	r0, #21103
	mul	r0, r0, r3
	asr	r0, r0, #16
	sub	r0, r0, #4608
	sub	r0, r0, #45
	bx	lr
.L232:
	movw	r0, #21103
	mul	r0, r0, r2
	asr	r0, r0, #16
	rsb	r0, r0, #20992
	add	r0, r0, #90
	bx	lr
.L234:
	movw	r3, #21103
	movw	r0, #35148
	mul	r2, r3, r2
	movt	r0, 65535
	asr	r2, r2, #16
	sub	r0, r0, r2
	bx	lr
.L236:
	movw	r2, #21103
	movw	r0, #4653
	mul	r3, r2, r3
	add	r0, r0, r3, asr #16
	bx	lr
.L219:
	cmn	r2, #32768
	blt	.L226
	movw	r0, #21103
	mul	r0, r0, r2
	asr	r0, r0, #16
	rsb	r0, r0, #30208
	add	r0, r0, #180
	bx	lr
.L215:
	cmn	r2, #32768
	blt	.L224
	movw	r3, #21103
	movw	r0, #44454
	mul	r2, r3, r2
	movt	r0, 65535
	asr	r2, r2, #16
	sub	r0, r0, r2
	bx	lr
.L237:
	movw	r0, #30409
	mul	r0, r0, r3
	asr	r0, r0, #16
	bx	lr
.L235:
	movw	r0, #30409
	movw	r3, #39801
	mul	r0, r0, r2
	movt	r3, 65535
	sub	r0, r3, r0, asr #16
	bx	lr
.L233:
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
	vldr.64	d5, .L243
	vcvt.f64.s32	d6, s15
	vdiv.f64	d7, d6, d5
	vcvt.s32.f64	s15, d7
	vmov	r3, s15	@ int
	cmp	r3, #0
	movw	r2, #:lower16:fast_cossin_table
	blt	.L242
	add	r0, r3, #512
	movt	r2, #:upper16:fast_cossin_table
	ubfx	r0, r0, #0, #11
	ldr	ip, [r2, r0, lsl #2]
	ubfx	r3, r3, #0, #11
.L241:
	str	ip, [r1]
	ldr	ip, [r2, r3, lsl #2]
	rsb	ip, ip, #0
	str	ip, [r1, #4]
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [r1, #8]
	ldr	r3, [r2, r0, lsl #2]
	str	r3, [r1, #12]
	bx	lr
.L242:
	rsb	r0, r3, #512
	rsb	r3, r3, #0
	movt	r2, #:upper16:fast_cossin_table
	ubfx	r0, r0, #0, #11
	ubfx	r3, r3, #0, #11
	ldr	ip, [r2, r0, lsl #2]
	rsb	r3, r3, #2048
	b	.L241
.L244:
	.align	3
.L243:
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
	vldr.64	d5, .L250
	vcvt.f64.s32	d6, s15
	vdiv.f64	d7, d6, d5
	vcvt.s32.f64	s15, d7
	vmov	r3, s15	@ int
	cmp	r3, #0
	movw	r2, #:lower16:fast_cossin_table
	blt	.L249
	add	r0, r3, #512
	movt	r2, #:upper16:fast_cossin_table
	ubfx	r0, r0, #0, #11
	ldr	ip, [r2, r0, lsl #2]
	ubfx	r3, r3, #0, #11
.L248:
	str	ip, [r1]
	ldr	ip, [r2, r3, lsl #2]
	rsb	ip, ip, #0
	str	ip, [r1, #4]
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [r1, #8]
	ldr	r3, [r2, r0, lsl #2]
	str	r3, [r1, #12]
	bx	lr
.L249:
	rsb	r0, r3, #512
	rsb	r3, r3, #0
	movt	r2, #:upper16:fast_cossin_table
	ubfx	r0, r0, #0, #11
	ubfx	r3, r3, #0, #11
	ldr	ip, [r2, r0, lsl #2]
	rsb	r3, r3, #2048
	b	.L248
.L251:
	.align	3
.L250:
	.word	1413754136
	.word	1074340347
	.size	getRMatrix, .-getRMatrix
	.align	2
	.global	Transpose_4x4
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	Transpose_4x4, %function
Transpose_4x4:
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
.L253:
	mov	ip, r4
	ldmia	ip!, {r0, r1, r2, r3}
	cmp	ip, r5
	str	r0, [lr]	@ unaligned
	str	r1, [lr, #4]	@ unaligned
	str	r2, [lr, #8]	@ unaligned
	str	r3, [lr, #12]	@ unaligned
	mov	r4, ip
	add	lr, lr, #16
	bne	.L253
	add	sp, sp, #68
	@ sp needed
	pop	{r4, r5, pc}
	.size	Transpose_4x4, .-Transpose_4x4
	.align	2
	.global	Transpos_2x2
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	Transpos_2x2, %function
Transpos_2x2:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	ip, r0
	ldrd	r0, [r0, #4]
	sub	sp, sp, #20
	mov	lr, sp
	ldr	r2, [ip, #12]
	ldr	r3, [ip]
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
	.size	Transpos_2x2, .-Transpos_2x2
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
.L259:
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
	ldr	ip, [r0, #4]
	ldr	r3, [r1, #20]
	ldr	r4, [r0]
	ldr	r6, [r1, #4]
	ldr	r7, [r0, #8]
	ldr	r5, [r1, #36]
	mul	ip, r3, ip
	mul	r6, r6, r4
	ldr	r3, [r0, #12]
	ldr	r4, [r1, #52]
	mul	r5, r5, r7
	mul	r4, r4, r3
	asr	r3, ip, #2
	add	r3, r3, r6, asr #2
	add	r3, r3, r5, asr #2
	add	r3, r3, r4, asr #2
	asr	r3, r3, #13
	str	r3, [r2, #4]
	ldr	ip, [r0, #4]
	ldr	r3, [r1, #24]
	ldr	r4, [r0]
	ldr	r6, [r1, #8]
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
	cmp	lr, r0
	str	r3, [r2, #12]
	add	r2, r2, #16
	bne	.L259
	pop	{r4, r5, r6, r7, pc}
	.size	matrixMultiply, .-matrixMultiply
	.align	2
	.global	sweep
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	sweep, %function
sweep:
	@ args = 4, pretend = 0, frame = 488
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r1
	sub	sp, sp, #492
	ldr	fp, [sp, #528]
	str	r2, [sp, #136]
	add	r1, fp, r0, lsl #4
	add	r2, fp, r5, lsl #4
	ldr	r8, [r2, r0, lsl #2]
	ldr	r10, [r1, r0, lsl #2]
	ldr	r9, [r1, r5, lsl #2]
	ldr	r1, [r2, r5, lsl #2]
	mov	r4, r0
	str	r1, [sp, #4]
	sub	r0, r8, r9
	add	r1, r10, r1
	mov	r6, r3
	bl	newArctan
	ldr	r1, [sp, #4]
	mov	r7, r0
	sub	r1, r1, r10
	add	r0, r9, r8
	bl	newArctan
	mov	r8, r0
	sub	r0, r0, r7
	asr	r0, r0, #1
	add	r1, sp, #216
	bl	getLMatrix
	add	r0, r8, r7
	asr	r0, r0, #1
	add	r1, sp, #200
	bl	getLMatrix
	mov	r0, #32768
	mov	r1, #0
	mov	r2, #0
	mov	r3, #0
	lsl	lr, r4, #2
	lsl	ip, r5, #2
	add	r9, sp, #488
	add	r7, lr, r4
	add	lr, lr, r5
	add	r4, ip, r4
	add	r5, ip, r5
	add	r7, r9, r7, lsl #2
	add	lr, r9, lr, lsl #2
	add	r4, r9, r4, lsl #2
	add	r5, r9, r5, lsl #2
	add	r9, sp, #296
	strd	r0, [r9]
	add	r9, sp, #336
	strd	r0, [r9]
	add	r9, sp, #272
	strd	r0, [r9]
	strd	r0, [sp, #232]
	add	r1, sp, #256
	strd	r2, [r1]
	add	r1, sp, #264
	strd	r2, [r1]
	add	r1, sp, #280
	strd	r2, [r1]
	add	r1, sp, #304
	strd	r2, [r1]
	add	r1, sp, #320
	strd	r2, [r1]
	add	r1, sp, #328
	strd	r2, [r1]
	add	r1, sp, #344
	strd	r2, [r1]
	strd	r2, [sp, #240]
	mov	r2, #0
	mov	r3, #32768
	add	r1, sp, #288
	strd	r2, [r1]
	add	r1, sp, #312
	strd	r2, [r1]
	add	r1, sp, #352
	strd	r2, [sp, #248]
	strd	r2, [r1]
	ldr	r10, [sp, #216]
	ldr	r3, [sp, #220]
	str	r10, [r7, #-256]
	ldr	r8, [sp, #200]
	str	r3, [lr, #-256]
	ldr	r3, [sp, #204]
	str	r8, [r7, #-192]
	str	r3, [lr, #-192]
	ldr	r3, [sp, #208]
	ldr	ip, [sp, #224]
	str	r3, [r4, #-192]
	ldr	r3, [sp, #228]
	str	ip, [r4, #-256]
	str	r3, [r5, #-256]
	ldr	r3, [sp, #212]
	str	r6, [sp, #64]
	str	r3, [r5, #-192]
	ldr	r5, [r6, #20]
	ldr	r7, [r6, #24]
	ldr	r3, [r6, #16]
	ldr	lr, [r6, #4]
	ldr	r8, [r6, #28]
	str	r7, [sp, #28]
	mov	r7, r5
	mov	r10, r8
	str	lr, [sp, #12]
	mov	lr, r3
	ldr	ip, [sp, #300]
	ldr	r1, [sp, #296]
	ldr	r2, [r6]
	ldr	r9, [r6, #32]
	mul	r3, ip, r3
	str	r9, [sp, #36]
	str	r2, [sp, #48]
	ldr	r9, [r6, #48]
	mul	r2, r1, r2
	ldr	r0, [sp, #316]
	ldr	r8, [r6, #36]
	str	r9, [sp, #8]
	ldr	r9, [r6, #12]
	ldr	r4, [r6, #8]
	mul	r5, ip, r5
	str	r8, [sp, #16]
	str	r7, [sp, #60]
	mul	r8, r0, r7
	asr	r3, r3, #2
	ldr	r7, [sp, #28]
	str	r9, [sp, #40]
	add	r3, r3, r2, asr #2
	ldr	r9, [sp, #36]
	ldr	r2, [sp, #304]
	str	r10, [sp, #52]
	str	r4, [sp, #24]
	str	lr, [sp, #56]
	mul	r4, r0, lr
	mul	lr, ip, r7
	mul	ip, ip, r10
	ldr	r10, [r6, #40]
	mul	r2, r2, r9
	str	r10, [sp, #32]
	asr	r10, r5, #2
	ldr	r9, [sp, #52]
	str	r10, [sp, #20]
	ldr	r10, [sp, #308]
	ldr	r5, [sp, #8]
	add	r3, r3, r2, asr #2
	mul	r2, r10, r5
	add	r3, r3, r2, asr #2
	ldr	r5, [sp, #312]
	ldr	r2, [sp, #48]
	asr	r3, r3, #13
	mul	r7, r0, r7
	str	r3, [sp, #360]
	mul	r0, r0, r9
	ldr	r3, [sp, #320]
	ldr	r9, [sp, #36]
	mul	r2, r5, r2
	mul	r3, r3, r9
	ldr	r5, [sp, #12]
	asr	r4, r4, #2
	add	r4, r4, r2, asr #2
	ldr	r10, [r6, #44]
	ldr	r2, [sp, #324]
	mul	r5, r1, r5
	add	r4, r4, r3, asr #2
	ldr	r3, [sp, #8]
	str	r10, [sp, #4]
	mul	r3, r2, r3
	ldr	r10, [sp, #20]
	add	r4, r4, r3, asr #2
	add	r5, r10, r5, asr #2
	ldr	r10, [r6, #52]
	ldr	r3, [sp, #12]
	str	r10, [sp, #20]
	ldr	r10, [sp, #312]
	asr	r8, r8, #2
	mul	r3, r10, r3
	ldr	r10, [sp, #40]
	add	r8, r8, r3, asr #2
	ldr	r3, [sp, #24]
	asr	ip, ip, #2
	mul	r3, r1, r3
	mul	r1, r1, r10
	add	r1, ip, r1, asr #2
	ldr	ip, [r6, #56]
	ldr	r6, [r6, #60]
	asr	lr, lr, #2
	add	lr, lr, r3, asr #2
	str	ip, [sp, #36]
	str	r6, [sp, #44]
	ldr	ip, [sp, #312]
	ldr	r6, [sp, #24]
	ldr	r3, [sp, #312]
	mul	r10, ip, r10
	mul	r3, r3, r6
	asr	r0, r0, #2
	asr	r7, r7, #2
	add	r7, r7, r3, asr #2
	add	r10, r0, r10, asr #2
	ldr	r3, [sp, #304]
	ldr	r0, [sp, #16]
	ldr	r6, [sp, #32]
	mul	r3, r3, r0
	add	r5, r5, r3, asr #2
	ldr	r3, [sp, #320]
	ldr	ip, [sp, #304]
	mul	r3, r3, r0
	add	r8, r8, r3, asr #2
	ldr	r3, [sp, #304]
	ldr	r0, [sp, #4]
	mul	r3, r3, r6
	add	lr, lr, r3, asr #2
	ldr	r3, [sp, #320]
	mul	ip, ip, r0
	mul	r3, r3, r6
	add	ip, r1, ip, asr #2
	add	r7, r7, r3, asr #2
	ldr	r1, [sp, #20]
	ldr	r3, [sp, #308]
	ldr	r6, [sp, #320]
	mul	r3, r3, r1
	mul	r0, r6, r0
	add	r5, r5, r3, asr #2
	mul	r3, r2, r1
	add	r10, r10, r0, asr #2
	ldr	r1, [sp, #308]
	ldr	r0, [sp, #36]
	add	r8, r8, r3, asr #2
	mul	r3, r1, r0
	ldr	r6, [sp, #44]
	add	lr, lr, r3, asr #2
	mul	r3, r2, r0
	mul	r2, r2, r6
	mul	r1, r1, r6
	asr	r4, r4, #13
	add	r10, r10, r2, asr #2
	str	r4, [sp, #376]
	ldr	r2, [sp, #48]
	ldr	r4, [sp, #328]
	add	r1, ip, r1, asr #2
	mul	r4, r4, r2
	asr	r5, r5, #13
	asr	lr, lr, #13
	asr	r1, r1, #13
	ldr	ip, [sp, #348]
	add	r7, r7, r3, asr #2
	str	r5, [sp, #364]
	ldr	r3, [sp, #344]
	ldr	r5, [sp, #60]
	str	lr, [sp, #368]
	str	r1, [sp, #372]
	ldr	lr, [sp, #56]
	ldr	r1, [sp, #332]
	asr	r8, r8, #13
	asr	r7, r7, #13
	asr	r10, r10, #13
	str	r4, [sp, #48]
	str	r8, [sp, #380]
	mul	r4, r5, ip
	mul	r8, r2, r3
	str	r7, [sp, #384]
	ldr	r2, [sp, #28]
	mul	r7, r1, lr
	str	r10, [sp, #388]
	mul	r10, lr, ip
	mul	lr, r1, r5
	ldr	r5, [sp, #52]
	mul	r0, r1, r2
	mul	r2, r2, ip
	mul	ip, r5, ip
	mul	r1, r1, r5
	asr	r5, r10, #2
	asr	r10, ip, #2
	ldr	ip, [sp, #48]
	asr	r7, r7, #2
	add	r7, r7, ip, asr #2
	ldr	ip, [sp, #336]
	add	r8, r5, r8, asr #2
	mul	ip, ip, r9
	ldr	r5, [sp, #328]
	str	ip, [sp, #28]
	ldr	ip, [sp, #12]
	ldr	r6, [sp, #352]
	mul	r5, r5, ip
	mul	r9, r9, r6
	mul	ip, ip, r3
	asr	lr, lr, #2
	add	r5, lr, r5, asr #2
	asr	r4, r4, #2
	add	r4, r4, ip, asr #2
	str	r9, [sp, #48]
	str	r5, [sp, #12]
	ldr	lr, [sp, #328]
	ldr	ip, [sp, #24]
	str	r4, [sp, #52]
	mov	r5, lr
	mul	r4, lr, ip
	mul	ip, ip, r3
	mov	r9, ip
	asr	r0, r0, #2
	ldr	lr, [sp, #40]
	add	r4, r0, r4, asr #2
	ldr	ip, [sp, #336]
	ldr	r0, [sp, #16]
	mul	r5, r5, lr
	mul	ip, ip, r0
	mul	r0, r0, r6
	asr	r1, r1, #2
	asr	r2, r2, #2
	add	r5, r1, r5, asr #2
	str	ip, [sp, #16]
	ldr	r1, [sp, #4]
	ldr	ip, [sp, #336]
	add	r2, r2, r9, asr #2
	ldr	r9, [sp, #32]
	mul	r3, lr, r3
	str	r0, [sp, #40]
	mul	r1, ip, r1
	ldr	r0, [sp, #336]
	mul	ip, r9, r6
	mul	r0, r0, r9
	ldr	r9, [sp, #4]
	str	ip, [sp, #56]
	add	r3, r10, r3, asr #2
	mul	ip, r9, r6
	ldr	r10, [sp, #340]
	ldr	r6, [sp, #8]
	ldr	lr, [sp, #356]
	mul	r10, r10, r6
	str	r10, [sp, #4]
	mul	r10, r6, lr
	str	ip, [sp, #60]
	ldr	r6, [sp, #20]
	ldr	ip, [sp, #340]
	str	r10, [sp, #24]
	mul	r10, ip, r6
	mul	r6, r6, lr
	str	r6, [sp, #32]
	ldr	r6, [sp, #28]
	ldr	r9, [sp, #44]
	add	r6, r7, r6, asr #2
	ldr	r7, [sp, #36]
	add	r0, r4, r0, asr #2
	mul	ip, ip, r7
	str	ip, [sp, #8]
	ldr	ip, [sp, #340]
	mul	r7, r7, lr
	mul	ip, ip, r9
	mul	lr, r9, lr
	str	ip, [sp, #20]
	ldr	r9, [sp, #12]
	ldr	ip, [sp, #16]
	add	r1, r5, r1, asr #2
	add	ip, r9, ip, asr #2
	ldr	r9, [sp, #48]
	ldr	r4, [sp, #52]
	add	r5, r8, r9, asr #2
	ldr	r8, [sp, #40]
	ldr	r9, [sp, #8]
	add	r4, r4, r8, asr #2
	ldr	r8, [sp, #56]
	add	ip, ip, r10, asr #2
	add	r2, r2, r8, asr #2
	ldr	r8, [sp, #60]
	add	r0, r0, r9, asr #2
	add	r3, r3, r8, asr #2
	ldr	r8, [sp, #4]
	ldr	r9, [sp, #20]
	add	r6, r6, r8, asr #2
	ldr	r10, [sp, #24]
	ldr	r8, [sp, #32]
	add	r1, r1, r9, asr #2
	add	r5, r5, r10, asr #2
	add	r4, r4, r8, asr #2
	add	r2, r2, r7, asr #2
	add	r3, r3, lr, asr #2
	asr	ip, ip, #13
	asr	r4, r4, #13
	asr	r6, r6, #13
	asr	r0, r0, #13
	asr	r1, r1, #13
	asr	r5, r5, #13
	asr	r2, r2, #13
	asr	r3, r3, #13
	ldr	r9, [sp, #64]
	str	ip, [sp, #396]
	str	r4, [sp, #412]
	str	r6, [sp, #392]
	str	r0, [sp, #400]
	str	r1, [sp, #404]
	str	r5, [sp, #408]
	str	r2, [sp, #416]
	str	r3, [sp, #420]
	add	r4, sp, #360
	add	ip, sp, #424
.L264:
	mov	lr, r4
	ldmia	lr!, {r0, r1, r2, r3}
	cmp	lr, ip
	str	r0, [r9]	@ unaligned
	str	r1, [r9, #4]	@ unaligned
	str	r2, [r9, #8]	@ unaligned
	str	r3, [r9, #12]	@ unaligned
	mov	r4, lr
	add	r9, r9, #16
	bne	.L264
	ldr	r4, [sp, #316]
	add	r0, sp, #324
	str	r4, [sp, #444]
	ldm	r0, {r0, r1, r2, r3}
	mov	r4, ip
	str	r3, [sp, #464]
	ldr	r3, [sp, #348]
	ldr	r8, [sp, #300]
	str	r3, [sp, #452]
	ldr	r3, [sp, #352]
	ldr	r7, [sp, #304]
	str	r3, [sp, #468]
	ldr	r3, [sp, #356]
	ldr	r6, [sp, #308]
	ldr	r5, [sp, #312]
	ldr	lr, [sp, #320]
	ldr	r9, [sp, #340]
	ldr	r10, [sp, #344]
	str	r3, [sp, #484]
	ldr	r3, [sp, #296]
	str	r8, [sp, #440]
	str	r7, [sp, #456]
	str	r6, [sp, #472]
	str	r5, [sp, #428]
	str	lr, [sp, #460]
	str	r9, [sp, #480]
	str	r10, [sp, #436]
	str	r0, [sp, #476]
	str	r1, [sp, #432]
	str	r2, [sp, #448]
	str	r3, [sp, #424]
	add	lr, sp, #296
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldm	r4, {r0, r1, r2, r3}
	add	r6, sp, #232
	str	r6, [sp, #128]
	str	ip, [sp, #132]
	stm	lr, {r0, r1, r2, r3}
	ldr	r3, [fp]
	ldr	r1, [sp, #232]
	ldr	r10, [fp, #16]
	mul	r7, r3, r1
	ldr	r1, [sp, #248]
	ldr	lr, [fp, #4]
	mul	r6, r3, r1
	ldr	r1, [sp, #236]
	ldr	r8, [fp, #32]
	mul	r5, r10, r1
	ldr	r1, [sp, #232]
	ldr	r9, [sp, #264]
	mul	r0, lr, r1
	ldr	r1, [sp, #252]
	mul	ip, r3, r9
	mul	r4, r10, r1
	ldr	r1, [sp, #248]
	ldr	r9, [sp, #240]
	mul	r1, lr, r1
	str	r1, [sp, #60]
	mov	r1, r8
	mul	r9, r8, r9
	ldr	r2, [fp, #20]
	str	r9, [sp, #8]
	ldr	r9, [sp, #236]
	ldr	r8, [sp, #232]
	mul	r9, r2, r9
	str	r9, [sp, #16]
	ldr	r9, [fp, #8]
	str	r1, [sp, #4]
	mul	r9, r9, r8
	ldr	r8, [sp, #256]
	str	r9, [sp, #32]
	ldr	r9, [sp, #280]
	mul	r8, r1, r8
	mul	r3, r3, r9
	ldr	r1, [sp, #244]
	ldr	r9, [fp, #48]
	str	r3, [sp, #68]
	mul	r9, r9, r1
	ldr	r1, [fp, #36]
	str	r9, [sp, #12]
	ldr	r9, [sp, #240]
	ldr	r3, [sp, #284]
	mul	r1, r1, r9
	str	r1, [sp, #20]
	ldr	r1, [fp, #24]
	ldr	r9, [sp, #236]
	asr	r7, r7, #2
	mul	r1, r1, r9
	ldr	r9, [sp, #232]
	str	r1, [sp, #28]
	ldr	r1, [fp, #12]
	add	r7, r7, r5, asr #2
	mul	r1, r1, r9
	ldr	r9, [sp, #244]
	str	r1, [sp, #52]
	ldr	r1, [fp, #52]
	ldr	r5, [fp, #56]
	mul	r1, r1, r9
	ldr	r9, [sp, #240]
	str	r1, [sp, #24]
	ldr	r1, [fp, #40]
	asr	r6, r6, #2
	mul	r1, r1, r9
	ldr	r9, [sp, #236]
	str	r1, [sp, #40]
	ldr	r1, [fp, #28]
	add	r6, r6, r4, asr #2
	mul	r1, r1, r9
	ldr	r9, [sp, #268]
	str	r1, [sp, #48]
	ldr	r1, [sp, #284]
	mul	r9, r10, r9
	mul	r10, r10, r1
	ldr	r1, [sp, #244]
	ldr	r4, [sp, #252]
	mul	r5, r5, r1
	ldr	r1, [fp, #44]
	str	r5, [sp, #44]
	ldr	r5, [sp, #240]
	mul	r3, r2, r3
	mul	r1, r1, r5
	mul	r5, r2, r4
	ldr	r4, [sp, #268]
	asr	ip, ip, #2
	mul	r2, r2, r4
	ldr	r4, [sp, #60]
	add	ip, ip, r9, asr #2
	str	r1, [sp, #56]
	ldr	r9, [sp, #280]
	asr	r1, r4, #2
	ldr	r4, [sp, #264]
	asr	r3, r3, #2
	mul	r4, lr, r4
	mul	lr, lr, r9
	ldr	r9, [sp, #248]
	add	r3, r3, lr, asr #2
	ldr	lr, [fp, #8]
	str	r2, [sp, #64]
	mul	lr, lr, r9
	ldr	r9, [sp, #8]
	asr	r0, r0, #2
	add	r7, r7, r9, asr #2
	ldr	r9, [sp, #16]
	ldr	r2, [sp, #244]
	add	r0, r0, r9, asr #2
	ldr	r9, [sp, #32]
	add	r6, r6, r8, asr #2
	asr	r9, r9, #2
	str	r9, [sp, #8]
	ldr	r9, [fp, #60]
	ldr	r8, [sp, #4]
	mul	r9, r9, r2
	ldr	r2, [sp, #272]
	str	r9, [sp, #32]
	mul	r9, r8, r2
	ldr	r2, [sp, #288]
	add	r9, ip, r9, asr #2
	mul	r2, r8, r2
	ldr	r8, [sp, #260]
	str	r2, [sp, #72]
	ldr	r2, [fp, #48]
	ldr	ip, [fp, #24]
	mul	r2, r2, r8
	ldr	r8, [sp, #288]
	str	r2, [sp, #16]
	ldr	r2, [fp, #36]
	asr	r4, r4, #2
	mul	r8, r2, r8
	ldr	r2, [sp, #268]
	add	r1, r1, r5, asr #2
	mul	ip, ip, r2
	ldr	r2, [sp, #64]
	ldr	r5, [sp, #68]
	add	r2, r4, r2, asr #2
	str	r2, [sp, #60]
	ldr	r4, [fp, #24]
	ldr	r2, [sp, #284]
	asr	ip, ip, #2
	asr	r10, r10, #2
	add	r10, r10, r5, asr #2
	mul	r4, r4, r2
	ldr	r5, [sp, #252]
	ldr	r2, [fp, #24]
	add	r3, r3, r8, asr #2
	str	ip, [sp, #68]
	ldr	r8, [sp, #256]
	ldr	ip, [fp, #36]
	mul	r2, r2, r5
	mul	ip, ip, r8
	ldr	r5, [sp, #272]
	ldr	r8, [fp, #36]
	add	ip, r1, ip, asr #2
	mul	r8, r8, r5
	ldr	r5, [sp, #12]
	str	r8, [sp, #64]
	add	r7, r7, r5, asr #2
	ldr	r5, [sp, #20]
	ldr	r8, [sp, #8]
	add	r0, r0, r5, asr #2
	ldr	r5, [sp, #28]
	str	ip, [sp, #8]
	add	r5, r8, r5, asr #2
	ldr	r8, [sp, #16]
	ldr	ip, [sp, #248]
	add	r6, r6, r8, asr #2
	asr	lr, lr, #2
	ldr	r8, [fp, #12]
	add	lr, lr, r2, asr #2
	mul	r1, r8, ip
	str	lr, [sp, #16]
	ldr	r8, [sp, #276]
	ldr	lr, [fp, #48]
	ldr	ip, [sp, #292]
	mul	lr, lr, r8
	ldr	r8, [fp, #48]
	ldr	r2, [sp, #72]
	mul	r8, r8, ip
	asr	ip, r1, #2
	str	r5, [sp, #4]
	ldr	r1, [fp, #52]
	ldr	r5, [sp, #52]
	str	ip, [sp, #52]
	ldr	ip, [sp, #292]
	str	r8, [sp, #76]
	add	r8, r10, r2, asr #2
	str	r8, [sp, #72]
	add	lr, r9, lr, asr #2
	mul	r8, r1, ip
	ldr	r9, [fp, #8]
	ldr	r1, [sp, #264]
	ldr	r10, [sp, #64]
	mul	ip, r9, r1
	ldr	r1, [sp, #280]
	add	r3, r3, r8, asr #2
	mul	r2, r9, r1
	ldr	r9, [sp, #60]
	ldr	r8, [fp, #28]
	add	r9, r9, r10, asr #2
	str	r9, [sp, #60]
	ldr	r10, [sp, #268]
	ldr	r9, [fp, #28]
	ldr	r1, [sp, #252]
	mul	r9, r9, r10
	ldr	r10, [sp, #284]
	str	r3, [sp, #12]
	mul	r8, r8, r10
	ldr	r10, [fp, #28]
	asr	r4, r4, #2
	mul	r10, r10, r1
	str	r10, [sp, #20]
	ldr	r10, [sp, #68]
	ldr	r1, [sp, #260]
	add	ip, r10, ip, asr #2
	ldr	r10, [fp, #52]
	asr	r5, r5, #2
	mov	r3, r10
	mul	r1, r10, r1
	ldr	r10, [sp, #276]
	asr	r9, r9, #2
	mul	r10, r3, r10
	add	r3, r4, r2, asr #2
	str	r10, [sp, #64]
	str	r3, [sp, #80]
	ldr	r10, [sp, #256]
	ldr	r3, [fp, #40]
	ldr	r2, [sp, #4]
	mul	r4, r3, r10
	ldr	r10, [sp, #24]
	asr	r8, r8, #2
	add	r10, r0, r10, asr #2
	ldr	r0, [sp, #272]
	asr	r7, r7, #13
	mul	r3, r3, r0
	ldr	r0, [sp, #288]
	str	r3, [sp, #68]
	ldr	r3, [fp, #40]
	asr	lr, lr, #13
	mul	r3, r3, r0
	ldr	r0, [sp, #40]
	str	r3, [sp, #84]
	add	r0, r2, r0, asr #2
	ldr	r2, [sp, #8]
	str	r0, [sp, #24]
	ldr	r0, [sp, #48]
	asr	r3, r6, #13
	add	r1, r2, r1, asr #2
	add	r5, r5, r0, asr #2
	ldr	r2, [sp, #16]
	ldr	r0, [fp, #12]
	str	r3, [sp, #4]
	str	r1, [sp, #8]
	ldr	r3, [sp, #280]
	ldr	r1, [sp, #264]
	mul	r6, r0, r1
	mul	r1, r0, r3
	add	r3, r2, r4, asr #2
	ldr	r2, [sp, #52]
	ldr	r4, [sp, #20]
	str	r3, [sp, #28]
	add	r3, r2, r4, asr #2
	ldr	r2, [fp, #56]
	ldr	r4, [sp, #260]
	str	r3, [sp, #48]
	mul	r2, r2, r4
	str	r2, [sp, #40]
	ldr	r4, [sp, #72]
	ldr	r2, [sp, #76]
	ldr	r0, [sp, #272]
	add	r4, r4, r2, asr #2
	str	r4, [sp, #16]
	ldr	r2, [fp, #44]
	ldr	r4, [sp, #256]
	add	r1, r8, r1, asr #2
	mul	r4, r2, r4
	ldrd	r2, [sp, #60]
	add	r2, r2, r3, asr #2
	str	r2, [sp, #20]
	ldr	r3, [fp, #56]
	ldr	r2, [sp, #276]
	ldr	r8, [sp, #276]
	mul	r3, r3, r2
	ldr	r2, [fp, #56]
	str	r3, [sp, #64]
	ldr	r3, [sp, #292]
	mul	r2, r2, r3
	str	r2, [sp, #76]
	ldr	r2, [sp, #12]
	asr	r3, r2, #13
	ldr	r2, [sp, #68]
	add	r2, ip, r2, asr #2
	str	r2, [sp, #60]
	ldr	r2, [fp, #44]
	ldr	ip, [sp, #260]
	mul	r2, r2, r0
	ldr	r0, [fp, #44]
	str	r2, [sp, #68]
	ldr	r2, [sp, #288]
	mul	r0, r0, r2
	ldr	r2, [sp, #84]
	str	r0, [sp, #88]
	ldr	r0, [sp, #80]
	add	r2, r0, r2, asr #2
	add	r0, r9, r6, asr #2
	ldr	r9, [fp, #60]
	asr	r6, r10, #13
	mul	r9, r9, ip
	ldr	ip, [fp, #60]
	str	r9, [sp, #52]
	mul	ip, ip, r8
	ldr	r8, [fp, #60]
	str	ip, [sp, #72]
	ldr	ip, [sp, #292]
	mul	r8, r8, ip
	str	r8, [sp, #80]
	ldr	ip, [sp, #296]
	ldr	r9, [sp, #56]
	mul	ip, ip, r7
	add	r5, r5, r9, asr #2
	str	ip, [sp, #84]
	ldr	r9, [sp, #8]
	ldr	ip, [sp, #300]
	ldr	r10, [sp, #24]
	ldr	r8, [sp, #44]
	mul	ip, ip, r7
	asr	r9, r9, #13
	add	r8, r10, r8, asr #2
	str	r9, [sp, #12]
	ldr	r10, [sp, #28]
	ldr	r9, [sp, #40]
	str	ip, [sp, #56]
	add	r9, r10, r9, asr #2
	ldr	ip, [sp, #304]
	str	r9, [sp, #8]
	ldr	r9, [sp, #308]
	mul	ip, ip, r7
	ldr	r10, [sp, #48]
	mul	r7, r9, r7
	add	r4, r10, r4, asr #2
	ldr	r10, [sp, #16]
	str	r7, [sp, #96]
	asr	r7, r10, #13
	ldr	r10, [sp, #20]
	str	ip, [sp, #92]
	asr	r10, r10, #13
	ldr	ip, [sp, #60]
	str	r10, [sp, #24]
	ldr	r10, [sp, #64]
	asr	r8, r8, #13
	add	ip, ip, r10, asr #2
	ldr	r10, [sp, #76]
	asr	ip, ip, #13
	add	r2, r2, r10, asr #2
	ldr	r10, [sp, #68]
	str	r2, [sp, #28]
	add	r0, r0, r10, asr #2
	ldr	r10, [sp, #88]
	ldr	r2, [sp, #4]
	add	r1, r1, r10, asr #2
	ldr	r10, [sp, #296]
	mul	r10, r10, r2
	str	r10, [sp, #60]
	ldr	r10, [sp, #300]
	mul	r10, r10, r2
	str	r10, [sp, #64]
	ldr	r10, [sp, #312]
	str	r6, [sp, #20]
	mul	r10, r10, r6
	str	r10, [sp, #40]
	ldr	r10, [sp, #32]
	mul	r6, r9, r2
	add	r5, r5, r10, asr #2
	ldr	r10, [sp, #8]
	str	r6, [sp, #76]
	asr	r10, r10, #13
	str	r10, [sp, #8]
	ldr	r10, [sp, #52]
	str	ip, [sp, #16]
	add	r4, r4, r10, asr #2
	ldr	r10, [sp, #304]
	ldr	ip, [sp, #296]
	mul	r10, r10, r2
	ldr	r2, [sp, #28]
	mul	ip, r7, ip
	asr	r6, r2, #13
	ldr	r2, [sp, #72]
	str	ip, [sp, #88]
	add	r0, r0, r2, asr #2
	ldr	r2, [sp, #296]
	asr	r0, r0, #13
	mul	r2, r2, lr
	str	r2, [sp, #72]
	ldr	r2, [sp, #80]
	str	r0, [sp, #32]
	add	r1, r1, r2, asr #2
	ldr	r2, [sp, #312]
	ldr	r0, [sp, #304]
	mul	ip, r3, r2
	ldr	r2, [sp, #300]
	asr	r1, r1, #13
	mul	r2, r2, lr
	str	r2, [sp, #80]
	ldr	r2, [sp, #300]
	str	r1, [sp, #28]
	mul	r2, r7, r2
	str	r2, [sp, #100]
	asr	r2, r4, #13
	str	r2, [sp, #4]
	mul	r4, r0, lr
	ldr	r2, [sp, #324]
	ldr	r1, [sp, #316]
	mul	lr, r9, lr
	mul	r0, r7, r0
	mul	r7, r7, r9
	ldr	r9, [sp, #320]
	mul	r1, r3, r1
	mul	r9, r3, r9
	mul	r3, r3, r2
	ldr	r2, [sp, #84]
	str	r10, [sp, #68]
	asr	r2, r2, #2
	str	r2, [sp, #44]
	ldr	r2, [sp, #56]
	asr	lr, lr, #2
	asr	r2, r2, #2
	str	r2, [sp, #48]
	ldr	r2, [sp, #92]
	ldr	r10, [sp, #96]
	str	lr, [sp, #84]
	asr	r10, r10, #2
	str	r10, [sp, #52]
	ldr	r10, [sp, #60]
	ldr	lr, [sp, #40]
	asr	r10, r10, #2
	str	r10, [sp, #56]
	ldr	r10, [sp, #64]
	asr	ip, ip, #2
	asr	r10, r10, #2
	str	r10, [sp, #60]
	ldr	r10, [sp, #68]
	asr	r1, r1, #2
	asr	r10, r10, #2
	str	r10, [sp, #64]
	ldr	r10, [sp, #76]
	asr	r9, r9, #2
	asr	r10, r10, #2
	str	r10, [sp, #68]
	ldr	r10, [sp, #72]
	add	r0, r9, r0, asr #2
	asr	r10, r10, #2
	str	r10, [sp, #72]
	ldr	r10, [sp, #80]
	str	r0, [sp, #120]
	asr	r10, r10, #2
	str	r10, [sp, #76]
	ldr	r10, [sp, #44]
	asr	r2, r2, #2
	add	lr, r10, lr, asr #2
	str	lr, [sp, #40]
	ldr	lr, [sp, #328]
	ldr	r10, [sp, #20]
	mul	lr, lr, r8
	str	lr, [sp, #44]
	ldr	lr, [sp, #88]
	asr	r3, r3, #2
	add	ip, ip, lr, asr #2
	ldr	lr, [sp, #100]
	str	ip, [sp, #96]
	add	r1, r1, lr, asr #2
	str	r1, [sp, #108]
	ldr	r1, [sp, #316]
	ldr	lr, [sp, #48]
	mul	r1, r1, r10
	ldr	ip, [sp, #320]
	add	r1, lr, r1, asr #2
	str	r1, [sp, #20]
	mul	r1, ip, r10
	ldr	ip, [sp, #324]
	add	r2, r2, r1, asr #2
	mul	r0, ip, r10
	str	r2, [sp, #48]
	ldr	r1, [sp, #52]
	add	r3, r3, r7, asr #2
	add	ip, r1, r0, asr #2
	str	r3, [sp, #124]
	ldr	r0, [sp, #12]
	ldr	r3, [sp, #312]
	ldr	r9, [sp, #56]
	mul	r3, r3, r0
	ldr	r7, [sp, #24]
	add	r3, r9, r3, asr #2
	ldr	r9, [sp, #316]
	ldr	lr, [sp, #324]
	mul	r1, r9, r0
	mul	r9, r7, r9
	str	r9, [sp, #12]
	ldr	r9, [sp, #60]
	ldr	r2, [sp, #312]
	add	r1, r9, r1, asr #2
	ldr	r9, [sp, #320]
	mul	r2, r7, r2
	mul	r10, r9, r0
	ldr	r9, [sp, #324]
	str	r3, [sp, #56]
	mul	r0, r9, r0
	ldr	r9, [sp, #320]
	asr	r4, r4, #2
	mul	r9, r7, r9
	mul	r7, r7, lr
	ldr	lr, [sp, #68]
	mov	r3, r7
	add	r0, lr, r0, asr #2
	ldr	r7, [sp, #64]
	str	r0, [sp, #64]
	ldr	r0, [sp, #336]
	add	r10, r7, r10, asr #2
	mul	r0, r0, r8
	ldr	r7, [sp, #332]
	str	r0, [sp, #24]
	ldr	r0, [sp, #340]
	mul	r7, r7, r8
	mul	r8, r0, r8
	ldr	lr, [sp, #72]
	str	r8, [sp, #52]
	add	r2, lr, r2, asr #2
	ldr	r8, [sp, #328]
	str	r2, [sp, #72]
	ldr	r2, [sp, #8]
	ldr	lr, [sp, #76]
	mul	r0, r8, r2
	ldr	r8, [sp, #12]
	add	r9, r4, r9, asr #2
	add	r8, lr, r8, asr #2
	str	r8, [sp, #80]
	ldr	r8, [sp, #332]
	asr	r5, r5, #13
	mul	r8, r8, r2
	str	r8, [sp, #60]
	mov	r8, r2
	ldr	r4, [sp, #336]
	ldr	lr, [sp, #84]
	mul	r2, r4, r2
	ldr	r4, [sp, #340]
	add	r2, r10, r2, asr #2
	mul	r8, r4, r8
	str	r8, [sp, #68]
	add	r8, lr, r3, asr #2
	ldr	r3, [sp, #16]
	ldr	lr, [sp, #328]
	mul	lr, lr, r3
	str	lr, [sp, #76]
	ldr	lr, [sp, #328]
	mul	lr, r6, lr
	str	lr, [sp, #100]
	ldr	lr, [sp, #332]
	mul	r4, lr, r3
	str	r4, [sp, #84]
	mul	r4, r6, lr
	ldr	lr, [sp, #40]
	str	r4, [sp, #112]
	ldr	r4, [sp, #44]
	add	r4, lr, r4, asr #2
	str	r4, [sp, #8]
	ldr	r4, [sp, #344]
	ldr	lr, [sp, #20]
	mul	r4, r4, r5
	str	r4, [sp, #12]
	add	r4, lr, r7, asr #2
	ldr	lr, [sp, #336]
	mul	lr, lr, r3
	str	lr, [sp, #88]
	ldr	lr, [sp, #340]
	mul	r7, lr, r3
	str	r7, [sp, #92]
	ldr	r7, [sp, #336]
	ldr	r3, [sp, #48]
	mul	r7, r6, r7
	mul	r6, r6, lr
	ldr	lr, [sp, #24]
	add	lr, r3, lr, asr #2
	str	lr, [sp, #20]
	ldr	lr, [sp, #348]
	mul	lr, lr, r5
	str	lr, [sp, #16]
	ldr	lr, [sp, #52]
	add	ip, ip, lr, asr #2
	ldr	lr, [sp, #352]
	mul	lr, lr, r5
	str	lr, [sp, #24]
	ldr	lr, [sp, #356]
	mul	r5, lr, r5
	str	r5, [sp, #40]
	ldr	r3, [sp, #56]
	ldr	r5, [sp, #344]
	add	r0, r3, r0, asr #2
	ldr	r3, [sp, #4]
	ldr	r10, [sp, #352]
	mul	r5, r5, r3
	str	r5, [sp, #4]
	ldr	r5, [sp, #60]
	mul	r10, r10, r3
	add	r1, r1, r5, asr #2
	ldr	r5, [sp, #348]
	str	r10, [sp, #48]
	mul	r5, r5, r3
	ldr	r10, [sp, #68]
	str	r5, [sp, #44]
	ldr	r5, [sp, #64]
	mul	r3, lr, r3
	add	r10, r5, r10, asr #2
	str	r10, [sp, #52]
	ldr	r5, [sp, #32]
	ldr	r10, [sp, #344]
	str	r3, [sp, #56]
	mul	r10, r5, r10
	ldr	r3, [sp, #344]
	str	r10, [sp, #32]
	ldr	r10, [sp, #28]
	ldr	lr, [sp, #72]
	mul	r3, r10, r3
	str	r3, [sp, #104]
	ldr	r3, [sp, #76]
	add	r3, lr, r3, asr #2
	ldr	lr, [sp, #348]
	str	r3, [sp, #28]
	mul	lr, r5, lr
	str	lr, [sp, #64]
	ldr	lr, [sp, #348]
	ldr	r3, [sp, #100]
	mul	lr, r10, lr
	str	lr, [sp, #116]
	ldr	lr, [sp, #96]
	add	lr, lr, r3, asr #2
	str	lr, [sp, #76]
	ldr	lr, [sp, #352]
	mul	lr, r5, lr
	str	lr, [sp, #68]
	ldr	lr, [sp, #356]
	mul	r5, r5, lr
	str	r5, [sp, #72]
	ldr	r5, [sp, #352]
	ldr	r3, [sp, #8]
	mul	r5, r10, r5
	mul	r10, r10, lr
	str	r5, [sp, #96]
	str	r10, [sp, #100]
	ldr	r5, [sp, #80]
	ldr	r10, [sp, #84]
	ldr	lr, [sp, #108]
	add	r10, r5, r10, asr #2
	ldr	r5, [sp, #112]
	str	r10, [sp, #60]
	add	r10, lr, r5, asr #2
	ldr	lr, [sp, #120]
	ldr	r5, [sp, #88]
	add	r7, lr, r7, asr #2
	ldr	lr, [sp, #124]
	add	r9, r9, r5, asr #2
	add	r6, lr, r6, asr #2
	ldr	r5, [sp, #92]
	ldr	lr, [sp, #12]
	add	r8, r8, r5, asr #2
	add	r5, r3, lr, asr #2
	ldr	lr, [sp, #16]
	ldr	r3, [sp, #20]
	add	r4, r4, lr, asr #2
	ldr	lr, [sp, #24]
	asr	r5, r5, #13
	add	lr, r3, lr, asr #2
	ldr	r3, [sp, #40]
	asr	r4, r4, #13
	add	ip, ip, r3, asr #2
	ldr	r3, [sp, #4]
	asr	lr, lr, #13
	add	r0, r0, r3, asr #2
	ldr	r3, [sp, #44]
	asr	ip, ip, #13
	add	r1, r1, r3, asr #2
	ldr	r3, [sp, #48]
	asr	r0, r0, #13
	add	r2, r2, r3, asr #2
	str	r2, [sp, #20]
	ldr	r3, [sp, #52]
	ldr	r2, [sp, #56]
	asr	r1, r1, #13
	add	r3, r3, r2, asr #2
	str	r3, [sp, #16]
	ldrd	r2, [sp, #28]
	add	r2, r2, r3, asr #2
	str	r2, [sp, #8]
	ldr	r3, [sp, #104]
	ldr	r2, [sp, #76]
	add	r2, r2, r3, asr #2
	str	r2, [sp, #12]
	ldrd	r2, [sp, #60]
	add	r2, r2, r3, asr #2
	str	r2, [sp, #4]
	ldr	r3, [sp, #116]
	ldr	r2, [sp, #20]
	add	r10, r10, r3, asr #2
	asr	r2, r2, #13
	ldr	r3, [sp, #68]
	str	r2, [sp, #20]
	ldr	r2, [sp, #8]
	add	r9, r9, r3, asr #2
	asr	r2, r2, #13
	ldr	r3, [sp, #72]
	str	r2, [fp, #32]
	ldr	r2, [sp, #12]
	add	r8, r8, r3, asr #2
	ldr	r3, [sp, #96]
	asr	r2, r2, #13
	str	r2, [fp, #48]
	add	r7, r7, r3, asr #2
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #100]
	asr	r2, r2, #13
	add	r6, r6, r3, asr #2
	ldr	r3, [sp, #16]
	str	r2, [fp, #36]
	ldr	r2, [sp, #20]
	asr	r3, r3, #13
	strd	r2, [fp, #24]
	ldr	r3, [sp, #232]
	asr	r10, r10, #13
	str	r3, [sp, #424]
	ldr	r3, [sp, #236]
	asr	r9, r9, #13
	str	r3, [sp, #440]
	ldr	r3, [sp, #240]
	asr	r8, r8, #13
	asr	r7, r7, #13
	asr	r6, r6, #13
	stmib	fp, {r4, lr}
	str	r5, [fp]
	str	ip, [fp, #12]
	strd	r0, [fp, #16]
	str	r10, [fp, #52]
	str	r9, [fp, #40]
	str	r8, [fp, #44]
	str	r7, [fp, #56]
	str	r6, [fp, #60]
	str	r3, [sp, #456]
	ldr	r3, [sp, #244]
	ldr	r7, [sp, #132]
	str	r3, [sp, #472]
	ldr	r3, [sp, #248]
	str	r7, [sp, #192]
	str	r3, [sp, #428]
	ldr	r3, [sp, #252]
	str	r3, [sp, #444]
	ldr	r3, [sp, #256]
	str	r3, [sp, #460]
	ldr	r3, [sp, #260]
	str	r3, [sp, #476]
	ldr	r3, [sp, #264]
	str	r3, [sp, #432]
	ldr	r3, [sp, #268]
	str	r3, [sp, #448]
	ldr	r3, [sp, #272]
	str	r3, [sp, #464]
	ldr	r3, [sp, #276]
	str	r3, [sp, #480]
	ldr	r3, [sp, #280]
	str	r3, [sp, #436]
	ldr	r3, [sp, #284]
	str	r3, [sp, #452]
	ldr	r3, [sp, #288]
	str	r3, [sp, #468]
	ldr	r3, [sp, #292]
	str	r3, [sp, #484]
	ldmia	r7!, {r0, r1, r2, r3}
	ldr	ip, [sp, #136]
	ldr	r6, [sp, #128]
	str	ip, [sp, #196]
	stmia	r6!, {r0, r1, r2, r3}
	ldmia	r7!, {r0, r1, r2, r3}
	mov	r8, r7
	stmia	r6!, {r0, r1, r2, r3}
	ldmia	r8!, {r0, r1, r2, r3}
	stmia	r6!, {r0, r1, r2, r3}
	ldm	r8, {r0, r1, r2, r3}
	stm	r6, {r0, r1, r2, r3}
	mov	r0, ip
	ldr	r1, [ip]
	ldr	fp, [sp, #248]
	ldr	r5, [sp, #236]
	ldr	lr, [sp, #232]
	mul	r5, r1, r5
	str	r5, [sp, #24]
	ldr	r5, [sp, #240]
	mul	lr, r1, lr
	mul	r5, r1, r5
	str	r5, [sp, #36]
	ldr	r5, [sp, #244]
	ldr	r2, [r0, #16]
	mul	r1, r1, r5
	str	r1, [sp, #48]
	ldr	r1, [sp, #232]
	ldr	r5, [sp, #236]
	mul	r1, r2, r1
	str	r1, [sp, #60]
	mov	r1, r0
	mul	r5, r2, r5
	str	r5, [sp, #72]
	ldr	r5, [sp, #240]
	ldr	r8, [r0, #32]
	mul	r5, r2, r5
	str	r5, [sp, #84]
	ldr	r5, [sp, #244]
	ldr	r3, [r0, #52]
	mul	r2, r2, r5
	ldr	r5, [sp, #236]
	str	r2, [sp, #96]
	ldr	r2, [sp, #232]
	mul	r5, r8, r5
	mul	r2, r8, r2
	ldr	r7, [r0, #20]
	ldr	r6, [r0, #36]
	ldr	r4, [r0, #48]
	ldr	r10, [sp, #252]
	ldr	r9, [sp, #256]
	ldr	ip, [ip, #4]
	str	lr, [sp, #8]
	str	r2, [sp, #104]
	ldr	lr, [r0, #8]
	ldr	r2, [r1, #40]
	ldr	r0, [r0, #24]
	str	r5, [sp, #112]
	ldr	r5, [sp, #240]
	mul	r5, r8, r5
	str	r5, [sp, #124]
	ldr	r5, [sp, #244]
	mul	r8, r8, r5
	str	r8, [sp, #136]
	mul	r8, fp, r3
	str	r8, [sp, #148]
	mul	r8, r10, r3
	str	r8, [sp, #160]
	mul	r8, r9, r3
	str	r8, [sp, #172]
	ldr	r8, [sp, #260]
	mul	r5, ip, r10
	mul	r3, r8, r3
	mov	r8, r1
	str	r5, [sp, #20]
	mul	r5, ip, r9
	str	r5, [sp, #32]
	ldr	r5, [sp, #260]
	str	r3, [sp, #184]
	ldr	r3, [r1, #56]
	mul	r1, ip, fp
	mul	ip, ip, r5
	mul	r5, r7, r10
	str	r5, [sp, #68]
	mul	r5, r7, r9
	str	r5, [sp, #80]
	ldr	r5, [sp, #260]
	str	ip, [sp, #44]
	mul	ip, r7, fp
	mul	r7, r7, r5
	str	r7, [sp, #92]
	mov	r7, r8
	mul	r9, r6, r9
	mul	fp, r6, fp
	mul	r10, r6, r10
	mul	r6, r6, r5
	str	r6, [sp, #132]
	ldr	r6, [sp, #232]
	str	r1, [sp, #4]
	mul	r6, r6, r4
	str	r6, [sp, #144]
	ldr	r6, [sp, #236]
	ldr	r1, [r8, #12]
	mul	r6, r6, r4
	str	r6, [sp, #156]
	ldr	r6, [sp, #240]
	str	ip, [sp, #56]
	mul	r6, r6, r4
	str	r6, [sp, #168]
	ldr	r6, [sp, #244]
	ldr	ip, [r8, #28]
	mul	r4, r6, r4
	ldr	r8, [r8, #44]
	str	r9, [sp, #120]
	str	r4, [sp, #180]
	ldr	r4, [r7, #60]
	ldr	r7, [sp, #264]
	ldr	r6, [sp, #272]
	mul	r7, lr, r7
	str	r7, [sp, #12]
	ldr	r7, [sp, #268]
	mul	r6, lr, r6
	mul	r7, lr, r7
	str	r7, [sp, #28]
	ldr	r7, [sp, #276]
	str	r6, [sp, #40]
	mul	lr, lr, r7
	str	lr, [sp, #52]
	ldr	lr, [sp, #264]
	ldr	r7, [sp, #272]
	mul	lr, r0, lr
	str	lr, [sp, #64]
	ldr	lr, [sp, #268]
	mul	r7, r0, r7
	mul	lr, r0, lr
	str	lr, [sp, #76]
	ldr	lr, [sp, #276]
	str	r7, [sp, #88]
	mul	r0, r0, lr
	str	r0, [sp, #100]
	ldr	r0, [sp, #264]
	mul	r0, r2, r0
	str	r0, [sp, #108]
	ldr	r0, [sp, #268]
	mul	r0, r2, r0
	str	r0, [sp, #116]
	ldr	r0, [sp, #264]
	mul	r0, r0, r3
	str	r0, [sp, #152]
	ldr	r0, [sp, #268]
	mul	r0, r0, r3
	str	r0, [sp, #164]
	ldr	r0, [sp, #272]
	mul	r0, r2, r0
	mul	r2, r2, lr
	str	r2, [sp, #140]
	ldr	r2, [sp, #272]
	str	r0, [sp, #128]
	mul	r2, r2, r3
	str	r2, [sp, #176]
	ldr	r2, [sp, #280]
	mul	r3, lr, r3
	mul	r2, r1, r2
	str	r3, [sp, #188]
	str	r2, [sp, #16]
	ldr	r3, [sp, #8]
	ldr	r5, [sp, #24]
	asr	lr, r3, #2
	asr	r9, r5, #2
	ldr	r3, [sp, #48]
	ldr	r5, [sp, #36]
	str	r9, [sp, #8]
	asr	r0, r5, #2
	asr	r9, r3, #2
	ldr	r5, [sp, #72]
	ldr	r3, [sp, #60]
	str	r9, [sp, #36]
	asr	r2, r3, #2
	asr	r3, r5, #2
	ldr	r5, [sp, #84]
	asr	r9, r5, #2
	ldr	r5, [sp, #96]
	str	r9, [sp, #48]
	asr	r6, r5, #2
	ldr	r5, [sp, #104]
	str	r6, [sp, #60]
	asr	r7, r5, #2
	ldr	r5, [sp, #112]
	str	r7, [sp, #84]
	asr	r6, r5, #2
	ldr	r5, [sp, #124]
	str	r6, [sp, #96]
	asr	r7, r5, #2
	ldr	r5, [sp, #136]
	str	r7, [sp, #104]
	asr	r6, r5, #2
	ldr	r5, [sp, #148]
	str	r6, [sp, #112]
	asr	r7, r5, #2
	ldr	r5, [sp, #160]
	asr	r6, r5, #2
	ldr	r5, [sp, #172]
	asr	r9, r5, #2
	ldr	r5, [sp, #184]
	str	r9, [sp, #148]
	asr	r9, r5, #2
	str	r9, [sp, #172]
	ldr	r9, [sp, #284]
	ldr	r5, [sp, #4]
	mul	r9, r1, r9
	add	lr, lr, r5, asr #2
	str	r9, [sp, #24]
	ldr	r5, [sp, #20]
	ldr	r9, [sp, #8]
	add	r9, r9, r5, asr #2
	str	r9, [sp, #4]
	ldr	r9, [sp, #288]
	ldr	r5, [sp, #32]
	mul	r9, r1, r9
	str	r9, [sp, #8]
	ldr	r9, [sp, #292]
	add	r0, r0, r5, asr #2
	mul	r1, r1, r9
	str	r1, [sp, #20]
	ldr	r1, [sp, #280]
	ldr	r9, [sp, #36]
	mul	r1, ip, r1
	str	r1, [sp, #32]
	ldr	r1, [sp, #44]
	ldr	r5, [sp, #56]
	add	r1, r9, r1, asr #2
	ldr	r9, [sp, #284]
	add	r2, r2, r5, asr #2
	mul	r9, ip, r9
	str	r9, [sp, #36]
	ldr	r9, [sp, #288]
	ldr	r5, [sp, #68]
	mul	r9, ip, r9
	str	r9, [sp, #56]
	ldr	r9, [sp, #292]
	add	r3, r3, r5, asr #2
	mul	ip, ip, r9
	ldr	r5, [sp, #80]
	ldr	r9, [sp, #48]
	str	ip, [sp, #72]
	add	r9, r9, r5, asr #2
	ldr	ip, [sp, #280]
	str	r9, [sp, #44]
	ldr	r9, [sp, #284]
	mul	ip, r8, ip
	mul	r9, r8, r9
	str	ip, [sp, #68]
	str	r9, [sp, #80]
	ldr	ip, [sp, #280]
	ldr	r9, [sp, #284]
	mul	ip, ip, r4
	mul	r9, r9, r4
	str	ip, [sp, #124]
	str	r9, [sp, #136]
	ldr	ip, [sp, #92]
	ldr	r9, [sp, #60]
	add	ip, r9, ip, asr #2
	ldr	r9, [sp, #288]
	str	ip, [sp, #48]
	mul	r9, r8, r9
	str	r9, [sp, #60]
	ldr	ip, [sp, #292]
	ldr	r5, [sp, #4]
	mul	r8, r8, ip
	str	r8, [sp, #92]
	ldr	r8, [sp, #288]
	mul	r8, r8, r4
	str	r8, [sp, #160]
	ldr	r8, [sp, #84]
	mul	r4, ip, r4
	add	fp, r8, fp, asr #2
	ldr	r8, [sp, #96]
	ldr	ip, [sp, #120]
	add	r10, r8, r10, asr #2
	ldr	r8, [sp, #104]
	str	r4, [sp, #184]
	add	r9, r8, ip, asr #2
	ldr	ip, [sp, #132]
	ldr	r8, [sp, #112]
	ldr	r4, [sp, #148]
	add	r8, r8, ip, asr #2
	ldr	ip, [sp, #144]
	add	r7, r7, ip, asr #2
	ldr	ip, [sp, #156]
	add	r6, r6, ip, asr #2
	ldr	ip, [sp, #168]
	add	r4, r4, ip, asr #2
	str	r4, [sp, #84]
	ldr	ip, [sp, #172]
	ldr	r4, [sp, #180]
	add	r4, ip, r4, asr #2
	ldr	ip, [sp, #12]
	str	r4, [sp, #96]
	add	lr, lr, ip, asr #2
	ldr	ip, [sp, #28]
	ldr	r4, [sp, #44]
	add	ip, r5, ip, asr #2
	ldr	r5, [sp, #40]
	add	r0, r0, r5, asr #2
	ldr	r5, [sp, #52]
	add	r1, r1, r5, asr #2
	ldr	r5, [sp, #64]
	add	r2, r2, r5, asr #2
	ldr	r5, [sp, #76]
	add	r3, r3, r5, asr #2
	ldr	r5, [sp, #88]
	add	r4, r4, r5, asr #2
	str	r4, [sp, #4]
	ldr	r5, [sp, #100]
	ldr	r4, [sp, #48]
	add	r4, r4, r5, asr #2
	str	r4, [sp, #28]
	ldr	r5, [sp, #108]
	ldr	r4, [sp, #84]
	add	fp, fp, r5, asr #2
	ldr	r5, [sp, #116]
	add	r10, r10, r5, asr #2
	ldr	r5, [sp, #128]
	add	r9, r9, r5, asr #2
	ldr	r5, [sp, #140]
	add	r8, r8, r5, asr #2
	ldr	r5, [sp, #152]
	add	r7, r7, r5, asr #2
	ldr	r5, [sp, #164]
	add	r6, r6, r5, asr #2
	ldr	r5, [sp, #176]
	add	r4, r4, r5, asr #2
	str	r4, [sp, #40]
	ldr	r5, [sp, #188]
	ldr	r4, [sp, #96]
	add	r4, r4, r5, asr #2
	ldr	r5, [sp, #16]
	add	lr, lr, r5, asr #2
	ldr	r5, [sp, #24]
	asr	lr, lr, #13
	add	ip, ip, r5, asr #2
	ldr	r5, [sp, #8]
	asr	ip, ip, #13
	add	r0, r0, r5, asr #2
	ldr	r5, [sp, #20]
	asr	r0, r0, #13
	add	r1, r1, r5, asr #2
	ldr	r5, [sp, #32]
	asr	r1, r1, #13
	add	r2, r2, r5, asr #2
	ldr	r5, [sp, #36]
	asr	r2, r2, #13
	add	r3, r3, r5, asr #2
	str	r3, [sp, #16]
	ldr	r5, [sp, #56]
	ldr	r3, [sp, #4]
	add	r3, r3, r5, asr #2
	str	r3, [sp, #12]
	ldr	r5, [sp, #72]
	ldr	r3, [sp, #28]
	add	r3, r3, r5, asr #2
	ldr	r5, [sp, #68]
	str	r3, [sp, #8]
	add	fp, fp, r5, asr #2
	ldr	r5, [sp, #80]
	ldr	r3, [sp, #40]
	add	r10, r10, r5, asr #2
	ldr	r5, [sp, #60]
	asr	fp, fp, #13
	add	r9, r9, r5, asr #2
	ldr	r5, [sp, #92]
	asr	r10, r10, #13
	add	r8, r8, r5, asr #2
	ldr	r5, [sp, #124]
	asr	r9, r9, #13
	add	r7, r7, r5, asr #2
	ldr	r5, [sp, #136]
	asr	r8, r8, #13
	add	r6, r6, r5, asr #2
	ldr	r5, [sp, #160]
	asr	r7, r7, #13
	add	r3, r3, r5, asr #2
	str	r3, [sp, #4]
	ldr	r5, [sp, #184]
	ldr	r3, [sp, #16]
	add	r4, r4, r5, asr #2
	ldr	r5, [sp, #12]
	asr	r3, r3, #13
	asr	r5, r5, #13
	str	r5, [sp, #448]
	ldr	r5, [sp, #8]
	asr	r6, r6, #13
	asr	r5, r5, #13
	str	r5, [sp, #452]
	ldr	r5, [sp, #4]
	asr	r4, r4, #13
	asr	r5, r5, #13
	str	r5, [sp, #480]
	str	lr, [sp, #424]
	ldr	r5, [sp, #196]
	ldr	lr, [sp, #192]
	str	ip, [sp, #428]
	str	r0, [sp, #432]
	str	r1, [sp, #436]
	str	r2, [sp, #440]
	str	r3, [sp, #444]
	str	fp, [sp, #456]
	str	r10, [sp, #460]
	str	r9, [sp, #464]
	str	r8, [sp, #468]
	str	r7, [sp, #472]
	str	r6, [sp, #476]
	str	r4, [sp, #484]
.L265:
	mov	ip, lr
	add	r4, sp, #488
	ldmia	ip!, {r0, r1, r2, r3}
	cmp	ip, r4
	str	r0, [r5]	@ unaligned
	str	r1, [r5, #4]	@ unaligned
	str	r2, [r5, #8]	@ unaligned
	str	r3, [r5, #12]	@ unaligned
	mov	lr, ip
	add	r5, r5, #16
	bne	.L265
	add	sp, sp, #492
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.size	sweep, .-sweep
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
	vldr.32	s14, .L370+24
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
	vstr.32	s13, [sp, #264]
	vstr.32	s14, [sp, #268]
	vstr.32	s15, [sp, #272]
	movt	r6, 49800
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
	str	r6, [sp, #296]	@ float
	str	r5, [sp, #300]	@ float
	str	r4, [sp, #304]	@ float
	str	ip, [sp, #308]	@ float
	str	fp, [sp, #276]	@ float
	str	r10, [sp, #280]	@ float
	str	r9, [sp, #284]	@ float
	str	r8, [sp, #288]	@ float
	str	r7, [sp, #292]	@ float
	str	r0, [sp, #312]	@ float
	str	r1, [sp, #316]	@ float
	str	r2, [sp, #320]	@ float
	str	r3, [sp, #324]	@ float
	add	lr, sp, #264
	add	ip, sp, #328
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
	add	r0, sp, #328
	bl	print_matrix
	vldr.32	s16, [sp, #268]
	vldr.32	s15, [sp, #264]
	vcmpe.f32	s15, s16
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s0, [sp, #272]
	vmovle.f32	s14, s15
	vmovgt.f32	s14, s16
	vcmp.f32	s0, s14
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s1, [sp, #276]
	vmovmi.f32	s14, s0
	vcmp.f32	s14, s1
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s2, [sp, #280]
	vmovgt.f32	s14, s1
	vcmp.f32	s14, s2
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s3, [sp, #284]
	vmovgt.f32	s14, s2
	vcmp.f32	s3, s14
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s4, [sp, #288]
	vmovmi.f32	s14, s3
	vcmp.f32	s4, s14
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s5, [sp, #292]
	vmovmi.f32	s14, s4
	vcmp.f32	s5, s14
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s6, [sp, #296]
	vmovmi.f32	s14, s5
	vcmp.f32	s6, s14
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s7, [sp, #300]
	vmovmi.f32	s14, s6
	vcmp.f32	s14, s7
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s8, [sp, #304]
	vmovgt.f32	s14, s7
	vcmp.f32	s14, s8
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s9, [sp, #308]
	vmovgt.f32	s14, s8
	vcmp.f32	s14, s9
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s10, [sp, #312]
	vmovgt.f32	s14, s9
	vcmp.f32	s10, s14
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s11, [sp, #316]
	vmovmi.f32	s14, s10
	vcmp.f32	s14, s11
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s12, [sp, #320]
	vmovgt.f32	s14, s11
	vcmp.f32	s14, s12
	vmrs	APSR_nzcv, FPSCR
	vldr.32	s13, [sp, #324]
	vmovgt.f32	s14, s12
	vcmp.f32	s14, s13
	vmrs	APSR_nzcv, FPSCR
	vcmp.f32	s15, s16
	vmovgt.f32	s14, s13
	vmrs	APSR_nzcv, FPSCR
	vmovmi.f32	s15, s16
	vcmp.f32	s0, s15
	vmrs	APSR_nzcv, FPSCR
	vmovgt.f32	s15, s0
	vcmp.f32	s1, s15
	vmrs	APSR_nzcv, FPSCR
	vmovgt.f32	s15, s1
	vcmp.f32	s2, s15
	vmrs	APSR_nzcv, FPSCR
	vmovgt.f32	s15, s2
	vcmp.f32	s3, s15
	vmrs	APSR_nzcv, FPSCR
	vmovgt.f32	s15, s3
	vcmp.f32	s4, s15
	vmrs	APSR_nzcv, FPSCR
	vmovgt.f32	s15, s4
	vcmp.f32	s5, s15
	vmrs	APSR_nzcv, FPSCR
	vmovgt.f32	s15, s5
	vcmp.f32	s6, s15
	vmrs	APSR_nzcv, FPSCR
	vmovgt.f32	s15, s6
	vcmp.f32	s7, s15
	vmrs	APSR_nzcv, FPSCR
	vmovgt.f32	s15, s7
	vcmp.f32	s8, s15
	vmrs	APSR_nzcv, FPSCR
	vmovgt.f32	s15, s8
	vcmp.f32	s9, s15
	vmrs	APSR_nzcv, FPSCR
	vmovgt.f32	s15, s9
	vcmp.f32	s10, s15
	vmrs	APSR_nzcv, FPSCR
	vmovgt.f32	s15, s10
	vcmp.f32	s11, s15
	vmrs	APSR_nzcv, FPSCR
	vmovgt.f32	s15, s11
	vcmp.f32	s15, s12
	vmrs	APSR_nzcv, FPSCR
	vmovmi.f32	s15, s12
	vcmp.f32	s15, s13
	vmrs	APSR_nzcv, FPSCR
	vmovmi.f32	s15, s13
	vcvt.s32.f32	s14, s14
	vcvt.s32.f32	s15, s15
	vmov	r0, s14	@ int
	vmov	r1, s15	@ int
	bl	calculateScaleFactor
	movw	r3, #:lower16:fast_cossin_table
	movw	r2, #:lower16:scaleFactor
	movt	r3, #:upper16:fast_cossin_table
	mov	r1, #0
	mov	r4, #1
	mov	r6, r0
	mov	r5, r3
	vldr.64	d10, .L370
	vldr.64	d9, .L370+8
	vldr.64	d8, .L370+16
	movt	r2, #:upper16:scaleFactor
	str	r0, [r2]
	str	r1, [r3]
.L330:
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
	bne	.L330
	add	r7, sp, #392
	mov	r2, r6
	mov	r1, r7
	add	r0, sp, #264
	bl	scale_matrix
	mov	r4, #32768
	mov	r2, #0
	mov	r3, #0
	mov	r5, #0
	mov	r0, #0
	mov	r1, #32768
	mov	r8, #5
	strd	r4, [sp, #8]
	strd	r4, [sp, #48]
	strd	r2, [sp, #16]
	strd	r2, [sp, #32]
	strd	r2, [sp, #40]
	strd	r2, [sp, #56]
	strd	r0, [sp, #24]
	strd	r0, [sp, #64]
	strd	r4, [sp, #72]
	strd	r2, [sp, #80]
	strd	r0, [sp, #88]
	strd	r2, [sp, #96]
	strd	r2, [sp, #104]
	strd	r4, [sp, #112]
	strd	r2, [sp, #120]
	strd	r0, [sp, #128]
.L331:
	mov	r5, #0
.L333:
	add	r6, r5, #1
	mov	r4, r6
	b	.L371
.L372:
	.align	3
.L370:
	.word	1413754136
	.word	1074340347
	.word	0
	.word	1062207488
	.word	0
	.word	1088421888
	.word	1117388800
	.word	998244352
	.word	939524096
.L371:
.L332:
	mov	r1, r4
	str	r7, [sp]
	add	r3, sp, #72
	add	r2, sp, #8
	mov	r0, r5
	add	r4, r4, #1
	bl	sweep
	cmp	r4, #4
	bne	.L332
	cmp	r6, #3
	mov	r5, r6
	bne	.L333
	subs	r8, r8, #1
	bne	.L331
	add	r0, sp, #72
	bl	Transpose_4x4
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
	vldr.32	s15, [sp, #392]	@ int
	vcvt.f32.s32	s13, s14
	vldr.32	s14, [sp, #452]	@ int
	vcvt.f32.s32	s16, s15
	vcvt.f32.s32	s14, s14
	vldr.32	s15, .L370+28
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
	vstr.32	s16, [sp, #264]
	vstr.32	s0, [sp, #268]
	vstr.32	s1, [sp, #272]
	vstr.32	s2, [sp, #276]
	vstr.32	s3, [sp, #280]
	vstr.32	s4, [sp, #284]
	vstr.32	s5, [sp, #288]
	vstr.32	s6, [sp, #292]
	vstr.32	s7, [sp, #296]
	vstr.32	s8, [sp, #300]
	vstr.32	s9, [sp, #304]
	vstr.32	s10, [sp, #308]
	vstr.32	s11, [sp, #312]
	vstr.32	s12, [sp, #316]
	vstr.32	s13, [sp, #320]
	vstr.32	s15, [sp, #324]
	vldr.32	s15, [sp, #8]	@ int
	vldr.32	s14, [sp, #12]	@ int
	vcvt.f32.s32	s0, s14
	vldr.32	s14, [sp, #16]	@ int
	vcvt.f32.s32	s1, s14
	vldr.32	s14, [sp, #20]	@ int
	vcvt.f32.s32	s2, s14
	vldr.32	s14, [sp, #24]	@ int
	vcvt.f32.s32	s3, s14
	vldr.32	s14, [sp, #28]	@ int
	vcvt.f32.s32	s4, s14
	vldr.32	s14, [sp, #32]	@ int
	vcvt.f32.s32	s5, s14
	vldr.32	s14, [sp, #36]	@ int
	vcvt.f32.s32	s6, s14
	vldr.32	s14, [sp, #40]	@ int
	vcvt.f32.s32	s7, s14
	vldr.32	s14, [sp, #44]	@ int
	vcvt.f32.s32	s8, s14
	vldr.32	s14, [sp, #48]	@ int
	vcvt.f32.s32	s9, s14
	vldr.32	s14, [sp, #52]	@ int
	vcvt.f32.s32	s10, s14
	vldr.32	s14, [sp, #56]	@ int
	vcvt.f32.s32	s11, s14
	vldr.32	s14, [sp, #60]	@ int
	vcvt.f32.s32	s12, s14
	vldr.32	s14, [sp, #64]	@ int
	vcvt.f32.s32	s13, s14
	vldr.32	s14, [sp, #68]	@ int
	vcvt.f32.s32	s16, s15
	vcvt.f32.s32	s14, s14
	vldr.32	s15, .L370+32
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
	vstr.32	s14, [sp, #196]
	vldr.32	s14, [sp, #72]	@ int
	vcvt.f32.s32	s16, s14
	vldr.32	s14, [sp, #76]	@ int
	vcvt.f32.s32	s0, s14
	vldr.32	s14, [sp, #80]	@ int
	vcvt.f32.s32	s1, s14
	vldr.32	s14, [sp, #84]	@ int
	vcvt.f32.s32	s2, s14
	vldr.32	s14, [sp, #88]	@ int
	vcvt.f32.s32	s3, s14
	vldr.32	s14, [sp, #92]	@ int
	vcvt.f32.s32	s4, s14
	vldr.32	s14, [sp, #96]	@ int
	vcvt.f32.s32	s5, s14
	vldr.32	s14, [sp, #100]	@ int
	vcvt.f32.s32	s6, s14
	vldr.32	s14, [sp, #104]	@ int
	vcvt.f32.s32	s7, s14
	vldr.32	s14, [sp, #108]	@ int
	vcvt.f32.s32	s8, s14
	vldr.32	s14, [sp, #112]	@ int
	vcvt.f32.s32	s9, s14
	vldr.32	s14, [sp, #116]	@ int
	vcvt.f32.s32	s10, s14
	vldr.32	s14, [sp, #120]	@ int
	vcvt.f32.s32	s11, s14
	vldr.32	s14, [sp, #124]	@ int
	vcvt.f32.s32	s12, s14
	vldr.32	s14, [sp, #128]	@ int
	vcvt.f32.s32	s13, s14
	vldr.32	s14, [sp, #132]	@ int
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
	vstr.32	s0, [sp, #204]
	vstr.32	s1, [sp, #208]
	vstr.32	s2, [sp, #212]
	vstr.32	s3, [sp, #216]
	vstr.32	s4, [sp, #220]
	vstr.32	s5, [sp, #224]
	vstr.32	s6, [sp, #228]
	vstr.32	s7, [sp, #232]
	vstr.32	s8, [sp, #236]
	vstr.32	s9, [sp, #240]
	vstr.32	s10, [sp, #244]
	vstr.32	s11, [sp, #248]
	vstr.32	s12, [sp, #252]
	vstr.32	s13, [sp, #256]
	vstr.32	s15, [sp, #260]
	vstr.32	s16, [sp, #200]
	bl	puts
	add	r0, sp, #264
	bl	print_matrix
	movw	r0, #:lower16:.LC4
	movt	r0, #:upper16:.LC4
	bl	puts
	add	r0, sp, #136
	bl	print_matrix
	movw	r0, #:lower16:.LC5
	movt	r0, #:upper16:.LC5
	bl	puts
	add	r0, sp, #200
	bl	print_matrix
	mov	r0, r8
	add	sp, sp, #460
	@ sp needed
	vldm	sp!, {d8-d10}
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.size	main, .-main
	.comm	max_range,4,4
	.comm	min_range,4,4
	.comm	scaleFactor,4,4
	.comm	fast_cossin_table,8192,4
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
