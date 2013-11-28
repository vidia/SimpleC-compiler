 # Reserve space
	.data
i:
	.long 0
	.long 0

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

	# push 0
	movq $0,%rbx
	#Assign to Global var i
	movq %rbx, i
loop_start_0_1:
	#top=0

	# push string "i=%d\n" top=0
	movq $string0, %rbx
	movq i, %r10
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
	movq i, %rbx

	# push 1
	movq $1,%r10

	# +
	addq %r10,%rbx
	#Assign to Global var i
	movq %rbx, i
	movq i, %rbx

	# push 11
	movq $11,%r10

	# !=
	cmp %r10, %rbx
	jl less_0.000000
	movq $0x0, %rbx
	jmp end_0.000000
	less_0.000000:
	movq $0x1, %rbx
	end_0.000000:
	cmpq $0, %rbx
	jne loop_start_0_1
loop_end_0_1:
	#top=1

	# push string "OK\n" top=1
	movq $string1, %r10
     # func=printf nargs=1
     # Move values from reg stack to reg args
	movq %r10, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %r10
	addq $128,%rsp
# Restore registers
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret
string0:
	.string "i=%d\n"

string1:
	.string "OK\n"

