 # Reserve space
	.data
h:
	.long 0
	.long 0

	.text
.globl compute
compute:
# Save registers
	pushq %rbx
	pushq %r10
	pushq %r13
	pushq %r14
	pushq %r15
	subq $128,%rsp
	#Save arguments
	movq %rdi,128(%rsp)
	movq %rsi,120(%rsp)
	movq %rdx,112(%rsp)

	# push 10
	movq $10,%rbx
	#Assign to Local var d
	movq %rbx, 104(%rsp)

	# push 11
	movq $11,%rbx
	#Assign to Global var h
	movq %rbx, h

	# push 2
	movq $2,%rbx
	#Push Local var a
	movq 128(%rsp), %r10

	# *
	imulq %r10,%rbx
	#Push Local var a
	movq 128(%rsp), %r10

	# *
	imulq %r10,%rbx

	# push 4
	movq $4,%r10
	#Push Local var b
	movq 120(%rsp), %r13
	#Push Local var c
	movq 112(%rsp), %r14

	# -
	subq %r14,%r13

	# *
	imulq %r13,%r10
	#Push Local var d
	movq 104(%rsp), %r13

	# *
	imulq %r13,%r10

	# -
	subq %r10,%rbx
	movq h, %r10

	# -
	subq %r10,%rbx
	movq %rbx, %rax
	addq $128,%rsp
# Restore registers
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret
	.text
.globl main
main:
# Save registers
	pushq %rbx
	pushq %r10
	pushq %r13
	pushq %r14
	pushq %r15
	subq $128,%rsp
	#Save arguments
	#top=0

	# push string "compute=%d\n" top=0
	movq $string0, %rbx

	# push 1
	movq $1,%r10

	# push 2
	movq $2,%r13

	# push 3
	movq $3,%r14
     # func=compute nargs=3
     # Move values from reg stack to reg args
	movq %r14, %rdx
	movq %r13, %rsi
	movq %r10, %rdi
	call compute
	movq %rax, %r10
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
	addq $128,%rsp
# Restore registers
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret
string0:
	.string "compute=%d\n"

