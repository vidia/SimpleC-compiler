 # Reserve space
	.data

.comm queens, 8

 # Reserve space
	.data

.comm solid, 8

	.text
.globl abs
abs:
# Save registers
	pushq %rbx
	pushq %r10
	pushq %r13
	pushq %r14
	pushq %r15
	subq $128,%rsp
	#Save arguments
	movq %rdi,128(%rsp)
	#Push Local var v
	movq 128(%rsp), %rbx

	# push 0
	movq $0,%r10

	# <
	cmp %r10, %rbx
	jl less_0.000000
	movq $0x0, %rbx
	jmp end_0.000000
	less_0.000000:
	movq $0x1, %rbx
	end_0.000000:

	# Begin IF statement
	cmpq $0, %rbx
	je ifEnd_1.000000

	# push -1
	movq $-1,%rbx
	#Push Local var v
	movq 128(%rsp), %r10

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
	jmp ifAbsEnd_1.000000
	ifEnd_1.000000:
	ifAbsEnd_1.000000:
	#Push Local var v
	movq 128(%rsp), %rbx
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
	.text
.globl check
check:
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
	#Assign to Local var i
	movq %rbx, 120(%rsp)

	# Begin FOR loop
loop_start_0:
	#Push Local var i
	movq 120(%rsp), %rbx
	#Push Local var depth
	movq 128(%rsp), %r10

	# <
	cmp %r10, %rbx
	jl less_1.000000
	movq $0x0, %rbx
	jmp end_1.000000
	less_1.000000:
	movq $0x1, %rbx
	end_1.000000:
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
	#Push Global array var queens
	movq queens, %r10
	addq %r10, %rbx
	movq (%rbx), %rbx
	#Push Local var depth
	movq 128(%rsp), %r10
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %r10
	#Push Global array var queens
	movq queens, %r13
	addq %r13, %r10
	movq (%r10), %r10

	# ==
	cmp %r10, %rbx
	jne nequal_2.000000
	movq $0x1, %rbx
	jmp end_2.000000
	nequal_2.000000:
	movq $0x0, %rbx
	end_2.000000:
	#Push Local var i
	movq 120(%rsp), %r10
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %r10
	#Push Global array var queens
	movq queens, %r13
	addq %r13, %r10
	movq (%r10), %r10
	#Push Local var depth
	movq 128(%rsp), %r13
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %r13
	#Push Global array var queens
	movq queens, %r14
	addq %r14, %r13
	movq (%r13), %r13

	# -
	subq %r13,%r10
     # func=abs nargs=1
     # Move values from reg stack to reg args
	movq %r10, %rdi
	call abs
	movq %rax, %r10
	#Push Local var depth
	movq 128(%rsp), %r13
	#Push Local var i
	movq 120(%rsp), %r14

	# -
	subq %r14,%r13

	# ==
	cmp %r13, %r10
	jne nequal_3.000000
	movq $0x1, %r10
	jmp end_3.000000
	nequal_3.000000:
	movq $0x0, %r10
	end_3.000000:

	#OROR
	orq %r10, %rbx

	# Begin IF statement
	cmpq $0, %rbx
	je ifEnd_2.000000

	# push 0
	movq $0,%rbx
	movq %rbx, %rax
	addq $128,%rsp
# Restore registers
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret
	jmp ifAbsEnd_2.000000
	ifEnd_2.000000:
	ifAbsEnd_2.000000:
	jmp loop_assignment_0
loop_end_0:

	# push 1
	movq $1,%rbx
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
	.text
.globl bruteforce
bruteforce:
# Save registers
	pushq %rbx
	pushq %r10
	pushq %r13
	pushq %r14
	pushq %r15
	subq $128,%rsp
	#Save arguments
	movq %rdi,128(%rsp)
	#Push Local var depth
	movq 128(%rsp), %rbx

	# push 8
	movq $8,%r10

	# ==
	cmp %r10, %rbx
	jne nequal_4.000000
	movq $0x1, %rbx
	jmp end_4.000000
	nequal_4.000000:
	movq $0x0, %rbx
	end_4.000000:

	# Begin IF statement
	cmpq $0, %rbx
	je ifEnd_3.000000
	#top=0

	# push string "Solution #%2ld = [ " top=0
	movq $string0, %rbx
	movq solid, %r10
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
	movq solid, %rbx

	# push 1
	movq $1,%r10

	# +
	addq %r10,%rbx
	#Assign to Global var solid
	movq %rbx, solid

	# push 0
	movq $0,%rbx
	#Assign to Local var i
	movq %rbx, 120(%rsp)

	# Begin FOR loop
loop_start_1:
	#Push Local var i
	movq 120(%rsp), %rbx

	# push 8
	movq $8,%r10

	# <
	cmp %r10, %rbx
	jl less_5.000000
	movq $0x0, %rbx
	jmp end_5.000000
	less_5.000000:
	movq $0x1, %rbx
	end_5.000000:
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

	# push string "%ld " top=0
	movq $string1, %rbx
	#Push Local var i
	movq 120(%rsp), %r10
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %r10
	#Push Global array var queens
	movq queens, %r13
	addq %r13, %r10
	movq (%r10), %r10

	# push 1
	movq $1,%r13

	# +
	addq %r13,%r10
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
	jmp loop_assignment_1
loop_end_1:
	#top=0

	# push string "]\n" top=0
	movq $string2, %rbx
     # func=printf nargs=1
     # Move values from reg stack to reg args
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx

	# push 0
	movq $0,%rbx
	movq %rbx, %rax
	addq $128,%rsp
# Restore registers
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret
	jmp ifAbsEnd_3.000000
	ifEnd_3.000000:
	ifAbsEnd_3.000000:

	# push 0
	movq $0,%rbx
	#Assign to Local var i
	movq %rbx, 120(%rsp)

	# Begin FOR loop
loop_start_2:
	#Push Local var i
	movq 120(%rsp), %rbx

	# push 8
	movq $8,%r10

	# <
	cmp %r10, %rbx
	jl less_6.000000
	movq $0x0, %rbx
	jmp end_6.000000
	less_6.000000:
	movq $0x1, %rbx
	end_6.000000:
	cmpq $0, %rbx
	je loop_end_2
	jne loop_body_start_2
	loop_assignment_2:
loop_continue_2:
	#Push Local var i
	movq 120(%rsp), %rbx

	# push 1
	movq $1,%r10

	# +
	addq %r10,%rbx
	#Assign to Local var i
	movq %rbx, 120(%rsp)
	jmp loop_start_2
	loop_body_start_2:
	#Push Local var depth
	movq 128(%rsp), %rbx
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %rbx
	#Push Global array var queens
	movq queens, %r10
	addq %r10, %rbx
	#Push Local var i
	movq 120(%rsp), %r10
	movq %r10, (%rbx)
	#Push Local var depth
	movq 128(%rsp), %rbx
     # func=check nargs=1
     # Move values from reg stack to reg args
	movq %rbx, %rdi
	call check
	movq %rax, %rbx

	# push 0
	movq $0,%r10

	# !=
	cmp %r10, %rbx
	jne nequal_7.000000
	movq $0x0, %rbx
	jmp end_7.000000
	nequal_7.000000:
	movq $0x1, %rbx
	end_7.000000:

	# Begin IF statement
	cmpq $0, %rbx
	je ifEnd_4.000000
	#Push Local var depth
	movq 128(%rsp), %rbx

	# push 1
	movq $1,%r10

	# +
	addq %r10,%rbx
     # func=bruteforce nargs=1
     # Move values from reg stack to reg args
	movq %rbx, %rdi
	call bruteforce
	movq %rax, %rbx
	jmp ifAbsEnd_4.000000
	ifEnd_4.000000:
	ifAbsEnd_4.000000:
	jmp loop_assignment_2
loop_end_2:

	# push 0
	movq $0,%rbx
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

	# push 8
	movq $8,%r10

	# *
	imulq %r10,%rbx
     # func=malloc nargs=1
     # Move values from reg stack to reg args
	movq %rbx, %rdi
	call malloc
	movq %rax, %rbx
	#Assign to Global var queens
	movq %rbx, queens

	# push 1
	movq $1,%rbx
	#Assign to Global var solid
	movq %rbx, solid

	# push 0
	movq $0,%rbx
     # func=bruteforce nargs=1
     # Move values from reg stack to reg args
	movq %rbx, %rdi
	call bruteforce
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
	.string "Solution #%2ld = [ "

string1:
	.string "%ld "

string2:
	.string "]\n"

