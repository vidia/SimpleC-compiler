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

	# push 0
	movq $0,%rbx
	#Assign to Local var i
	movq %rbx, 120(%rsp)

	# Begin FOR loop
loop_start_0:
	#Push Local var i
	movq 120(%rsp), %rbx

	# push 20
	movq $20,%r10

	# <
	cmp %r10, %rbx
	jl less_0.000000
	movq $0x0, %rbx
	jmp end_0.000000
	less_0.000000:
	movq $0x1, %rbx
	end_0.000000:
	cmpq $0, %rbx
	je loop_end_0
	jne loop_body_start_0
	loop_assignment_0:
loop_continue_0:
	#Push Local var i
	movq 120(%rsp), %rbx

	# push 1
	movq $1,%r10

	# +
	addq %r10,%rbx
	#Assign to Local var i
	movq %rbx, 120(%rsp)
	jmp loop_start_0
	loop_body_start_0:
	#Push Local var i
	movq 120(%rsp), %rbx
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %rbx
	#Push Local array var a
	movq 128(%rsp), %r10
	addq %r10, %rbx

	# push 3
	movq $3,%r10
	#Push Local var i
	movq 120(%rsp), %r13

	# *
	imulq %r13,%r10
	movq %r10, (%rbx)
	jmp loop_assignment_0
loop_end_0:
	#top=0

	# push string "Ok so far\n" top=0
	movq $string0, %rbx
     # func=printf nargs=1
     # Move values from reg stack to reg args
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx

	# push 0
	movq $0,%rbx
	#Assign to Local var i
	movq %rbx, 120(%rsp)

	# Begin FOR loop
loop_start_1:
	#Push Local var i
	movq 120(%rsp), %rbx

	# push 20
	movq $20,%r10

	# <
	cmp %r10, %rbx
	jl less_1.000000
	movq $0x0, %rbx
	jmp end_1.000000
	less_1.000000:
	movq $0x1, %rbx
	end_1.000000:
	cmpq $0, %rbx
	je loop_end_1
	jne loop_body_start_1
	loop_assignment_1:
loop_continue_1:
	#Push Local var i
	movq 120(%rsp), %rbx

	# push 1
	movq $1,%r10

	# +
	addq %r10,%rbx
	#Assign to Local var i
	movq %rbx, 120(%rsp)
	jmp loop_start_1
	loop_body_start_1:
	#top=0

	# push string "%d: %d\n" top=0
	movq $string1, %rbx
	#Push Local var i
	movq 120(%rsp), %r10
	#Push Local var i
	movq 120(%rsp), %r13
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %r13
	#Push Local array var a
	movq 128(%rsp), %r14
	addq %r14, %r13
	movq (%r13), %r13
     # func=printf nargs=3
     # Move values from reg stack to reg args
	movq %r13, %rdx
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
	jmp loop_assignment_1
loop_end_1:
	addq $128,%rsp
# Restore registers
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret
string0:
	.string "Ok so far\n"

string1:
	.string "%d: %d\n"

