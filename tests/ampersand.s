	.text
.globl inc
inc:
# Save registers
	pushq %rbx
	pushq %r10
	pushq %r13
	pushq %r14
	pushq %r15
	subq $128,%rsp
	#Save arguments
	movq %rdi,128(%rsp)

	# push 0
	movq $0,%rbx

	# push 0
	movq $0,%r10

	# push 1
	movq $1,%r13

	# +
	addq %r13,%r10
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

	# push 8
	movq $8,%r13
	#Assign to Local var a
	movq %r13, 128(%rsp)
	#top=2

	# push string "a=%d\n" top=2
	movq $string0, %r13
	#Push Local var a
	movq 128(%rsp), %r14
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r14, %rsi
	movq %r13, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %r13
     # func=inc nargs=1
     # Move values from reg stack to reg args
	movq %(null), %rdi
	call inc
	movq %rax, %(null)
	#top=0

	# push string "a=%d\n" top=0
	movq $string1, %rbx
	#Push Local var a
	movq 128(%rsp), %r10
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
	.string "a=%d\n"

string1:
	.string "a=%d\n"

