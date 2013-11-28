	.text
.globl fact
fact:
# Save registers
	pushq %rbx
	pushq %r10
	pushq %r13
	pushq %r14
	pushq %r15
	subq $128,%rsp
	#Save arguments
	movq %rdi,128(%rsp)
	#Push Local var n
	movq 128(%rsp), %rbx

	# push 0
	movq $0,%r10

	# ==
	cmp %r10, %rbx
	jne nequal_0.000000
	movq $0x1, %rbx
	jmp end_0.000000
	nequal_0.000000:
	movq $0x0, %rbx
	end_0.000000:
	cmpq $0, %rbx
	je ifEnd_1.000000

	# push 1
	movq $1,%r10
	movq %rbx, %rax
	jmp ifAbsEnd_1.000000
	ifEnd_1.000000:
	ifAbsEnd_1.000000:
	#Push Local var n
	movq 128(%rsp), %rbx
	#Push Local var n
	movq 128(%rsp), %r10

	# push 1
	movq $1,%r13

	# -
	subq %r13,%r10
     # func=fact nargs=1
     # Move values from reg stack to reg args
	movq %r10, %rdi
	call fact
	movq %rax, %r10

	# *
	imulq %r10,%rbx
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

	# push string " Factorial of 5 = %d\n" top=0
	movq $string0, %rbx

	# push 5
	movq $5,%r10
     # func=fact nargs=1
     # Move values from reg stack to reg args
	movq %r10, %rdi
	call fact
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
	.string " Factorial of 5 = %d\n"

