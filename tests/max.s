	.text
.globl max
max:
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

	# push 0
	movq $0,%rbx
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %rbx
	#Push Local array var a
	movq 128(%rsp), %r10
	addq %r10, %rbx
	movq (%rbx), %rbx
	#Assign to Local var m
	movq %rbx, 104(%rsp)

	# push 0
	movq $0,%rbx
	#Assign to Local var i
	movq %rbx, 112(%rsp)

	# Begin FOR loop
loop_start_0:
	#Push Local var i
	movq 112(%rsp), %rbx
	#Push Local var n
	movq 120(%rsp), %r10

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
	movq 112(%rsp), %rbx

	# push 1
	movq $1,%r10

	# +
	addq %r10,%rbx
	#Assign to Local var i
	movq %rbx, 112(%rsp)
	jmp loop_start_0
	loop_body_start_0:
	#Push Local var m
	movq 104(%rsp), %rbx
	#Push Local var i
	movq 112(%rsp), %r10
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %r10
	#Push Local array var a
	movq 128(%rsp), %r13
	addq %r13, %r10
	movq (%r10), %r10

	# <
	cmp %r10, %rbx
	jl less_1.000000
	movq $0x0, %rbx
	jmp end_1.000000
	less_1.000000:
	movq $0x1, %rbx
	end_1.000000:

	# Begin IF statement
	cmpq $0, %rbx
	je ifEnd_1.000000
	#Push Local var i
	movq 112(%rsp), %rbx
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %rbx
	#Push Local array var a
	movq 128(%rsp), %r10
	addq %r10, %rbx
	movq (%rbx), %rbx
	#Assign to Local var m
	movq %rbx, 104(%rsp)
	jmp ifAbsEnd_1.000000
	ifEnd_1.000000:
	ifAbsEnd_1.000000:
	jmp loop_assignment_0
loop_end_0:
	#Push Local var m
	movq 104(%rsp), %rbx
	movq %rbx, %rax
	addq $128,%rsp
# Restore registers
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret
	addq $128,%rsp
# Restore registers
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret
 # Reserve space
	.data

.comm a, 8

 # Reserve space
	.data

.comm n, 8

 # Reserve space
	.data

.comm i, 8

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

	# push 10
	movq $10,%rbx
	#Assign to Global var n
	movq %rbx, n

	# push 10
	movq $10,%rbx

	# push 8
	movq $8,%r10

	# *
	imulq %r10,%rbx
     # func=malloc nargs=1
     # Move values from reg stack to reg args
	movq %rbx, %rdi
	call malloc
	movq %rax, %rbx
	#Assign to Global var a
	movq %rbx, a

	# push 0
	movq $0,%rbx
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %rbx
	#Push Global array var a
	movq a, %r10
	addq %r10, %rbx

	# push 8
	movq $8,%r10
	movq %r10, (%rbx)

	# push 1
	movq $1,%rbx
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %rbx
	#Push Global array var a
	movq a, %r10
	addq %r10, %rbx

	# push 7
	movq $7,%r10
	movq %r10, (%rbx)

	# push 2
	movq $2,%rbx
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %rbx
	#Push Global array var a
	movq a, %r10
	addq %r10, %rbx

	# push 1
	movq $1,%r10
	movq %r10, (%rbx)

	# push 3
	movq $3,%rbx
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %rbx
	#Push Global array var a
	movq a, %r10
	addq %r10, %rbx

	# push 9
	movq $9,%r10
	movq %r10, (%rbx)

	# push 4
	movq $4,%rbx
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %rbx
	#Push Global array var a
	movq a, %r10
	addq %r10, %rbx

	# push 11
	movq $11,%r10
	movq %r10, (%rbx)

	# push 5
	movq $5,%rbx
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %rbx
	#Push Global array var a
	movq a, %r10
	addq %r10, %rbx

	# push 83
	movq $83,%r10
	movq %r10, (%rbx)

	# push 6
	movq $6,%rbx
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %rbx
	#Push Global array var a
	movq a, %r10
	addq %r10, %rbx

	# push 7
	movq $7,%r10
	movq %r10, (%rbx)

	# push 7
	movq $7,%rbx
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %rbx
	#Push Global array var a
	movq a, %r10
	addq %r10, %rbx

	# push 13
	movq $13,%r10
	movq %r10, (%rbx)

	# push 8
	movq $8,%rbx
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %rbx
	#Push Global array var a
	movq a, %r10
	addq %r10, %rbx

	# push 94
	movq $94,%r10
	movq %r10, (%rbx)

	# push 9
	movq $9,%rbx
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %rbx
	#Push Global array var a
	movq a, %r10
	addq %r10, %rbx

	# push 1
	movq $1,%r10
	movq %r10, (%rbx)

	# push 0
	movq $0,%rbx
	#Assign to Global var i
	movq %rbx, i

	# Begin FOR loop
loop_start_1:
	movq i, %rbx
	movq n, %r10

	# <
	cmp %r10, %rbx
	jl less_2.000000
	movq $0x0, %rbx
	jmp end_2.000000
	less_2.000000:
	movq $0x1, %rbx
	end_2.000000:
	cmpq $0, %rbx
	je loop_end_1
	jne loop_body_start_1
	loop_assignment_1:
loop_continue_1:
	movq i, %rbx

	# push 1
	movq $1,%r10

	# +
	addq %r10,%rbx
	#Assign to Global var i
	movq %rbx, i
	jmp loop_start_1
	loop_body_start_1:
	#top=0

	# push string "%d: %d\n" top=0
	movq $string0, %rbx
	movq i, %r10
	movq i, %r13
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %r13
	#Push Global array var a
	movq a, %r14
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
	#top=0

	# push string "n=%d\n" top=0
	movq $string1, %rbx
	movq n, %r10
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
	#top=0

	# push string "max=%d\n" top=0
	movq $string2, %rbx
	movq a, %r10
	movq n, %r13
     # func=max nargs=2
     # Move values from reg stack to reg args
	movq %r13, %rsi
	movq %r10, %rdi
	call max
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
	.string "%d: %d\n"

string1:
	.string "n=%d\n"

string2:
	.string "max=%d\n"

