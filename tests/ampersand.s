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
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %rbx
	#Push Local array var a
	movq 128(%rsp), %r10
	addq %r10, %rbx

	# push 0
	movq $0,%r10
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %r10
	#Push Local array var a
	movq 128(%rsp), %r13
	addq %r13, %r10
	movq (%r10), %r10

	# push 1
	movq $1,%r13

	# +
	addq %r13,%r10
	movq %r10, (%rbx)
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
	movq $8,%rbx
	#Assign to Local var a
	movq %rbx, 128(%rsp)
	#top=0

	# push string "a=%d\n" top=0
	movq $string0, %rbx
	#Push Local var a
	movq 128(%rsp), %r10
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
	#Push Local array var a
	leaq 128(%rsp), %rbx
     # func=inc nargs=1
     # Move values from reg stack to reg args
	movq %rbx, %rdi
	call inc
	movq %rax, %rbx
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

