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

	# push 8
	movq $8,%rbx

	# push 20
	movq $20,%r10

	# *
	imulq %r10,%rbx
     # func=malloc nargs=1
     # Move values from reg stack to reg args
	movq %rbx, %rdi
	call malloc
	movq %rax, %rbx
	#Assign to Local var a
	movq %rbx, 128(%rsp)

	# push 8
	movq $8,%rbx

	# push 9
	movq $9,%r10
	#top=2

	# push string "a[8]=%d\n" top=2
	movq $string0, %r13

	# push 8
	movq $8,%r14
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r14, %rsi
	movq %r13, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %r13
	addq $128,%rsp
# Restore registers
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret
string0:
	.string "a[8]=%d\n"

