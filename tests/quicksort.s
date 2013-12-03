	.text
.globl printArray
printArray:
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
	#Push Local var left
	movq 120(%rsp), %rbx
	#Assign to Local var i
	movq %rbx, 104(%rsp)

	# Begin FOR loop
loop_start_0:
	#Push Local var i
	movq 104(%rsp), %rbx
	#Push Local var right
	movq 112(%rsp), %r10

	# <=
	cmp %r10, %rbx
	jle lessequal_0.000000
	movq $0x0, %rbx
	jmp end_0.000000
	lessequal_0.000000:
	movq $0x1, %rbx
	end_0.000000:
	cmpq $0, %rbx
	je loop_end_0
	jne loop_body_start_0
	loop_assignment_0:
loop_continue_0:
	#Push Local var i
	movq 104(%rsp), %rbx

	# push 1
	movq $1,%r10

	# +
	addq %r10,%rbx
	#Assign to Local var i
	movq %rbx, 104(%rsp)
	jmp loop_start_0
	loop_body_start_0:
	#top=0

	# push string "%d\n" top=0
	movq $string0, %rbx
	#Push Local var i
	movq 104(%rsp), %r10
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %r10
	#Push Local array var a
	movq 128(%rsp), %r13
	addq %r13, %r10
	movq (%r10), %r10
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
	jmp loop_assignment_0
loop_end_0:
	addq $128,%rsp
# Restore registers
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret
	.text
.globl print
print:
# Save registers
	pushq %rbx
	pushq %r10
	pushq %r13
	pushq %r14
	pushq %r15
	subq $128,%rsp
	#Save arguments
	movq %rdi,128(%rsp)
	#top=0

	# push string "==%s==\n" top=0
	movq $string1, %rbx
	#Push Local var s
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
	.text
.globl quicksortsubrange
quicksortsubrange:
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
	#Push Local var left
	movq 120(%rsp), %rbx
	#Push Local var right
	movq 112(%rsp), %r10

	# >=
	cmp %r10, %rbx
	jge greatequal_1.000000
	movq $0x0, %rbx
	jmp end_1.000000
	greatequal_1.000000:
	movq $0x1, %rbx
	end_1.000000:

	# Begin IF statement
	cmpq $0, %rbx
	je ifEnd_1.000000

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
	jmp ifAbsEnd_1.000000
	ifEnd_1.000000:
	ifAbsEnd_1.000000:
	#Push Local var right
	movq 112(%rsp), %rbx
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %rbx
	#Push Local array var a
	movq 128(%rsp), %r10
	addq %r10, %rbx
	movq (%rbx), %rbx
	#Assign to Local var x
	movq %rbx, 104(%rsp)
	#Push Local var left
	movq 120(%rsp), %rbx
	#Assign to Local var l
	movq %rbx, 96(%rsp)
	#Push Local var right
	movq 112(%rsp), %rbx

	# push 1
	movq $1,%r10

	# -
	subq %r10,%rbx
	#Assign to Local var g
	movq %rbx, 88(%rsp)

	# Begin WHILE loop
loop_start_1:
loop_continue_1:
	#Push Local var l
	movq 96(%rsp), %rbx
	#Push Local var g
	movq 88(%rsp), %r10

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

	# Begin WHILE loop
loop_start_2:
loop_continue_2:
	#Push Local var l
	movq 96(%rsp), %rbx
	#Push Local var g
	movq 88(%rsp), %r10

	# <
	cmp %r10, %rbx
	jl less_3.000000
	movq $0x0, %rbx
	jmp end_3.000000
	less_3.000000:
	movq $0x1, %rbx
	end_3.000000:
	#Push Local var l
	movq 96(%rsp), %r10
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %r10
	#Push Local array var a
	movq 128(%rsp), %r13
	addq %r13, %r10
	movq (%r10), %r10
	#Push Local var x
	movq 104(%rsp), %r13

	# <
	cmp %r13, %r10
	jl less_4.000000
	movq $0x0, %r10
	jmp end_4.000000
	less_4.000000:
	movq $0x1, %r10
	end_4.000000:

	#ANDAND
	andq %r10, %rbx
	cmpq $0, %rbx
	je loop_end_2
	#Push Local var l
	movq 96(%rsp), %rbx

	# push 1
	movq $1,%r10

	# +
	addq %r10,%rbx
	#Assign to Local var l
	movq %rbx, 96(%rsp)
	jmp loop_start_2
loop_end_2:

	# Begin WHILE loop
loop_start_3:
loop_continue_3:
	#Push Local var l
	movq 96(%rsp), %rbx
	#Push Local var g
	movq 88(%rsp), %r10

	# <
	cmp %r10, %rbx
	jl less_5.000000
	movq $0x0, %rbx
	jmp end_5.000000
	less_5.000000:
	movq $0x1, %rbx
	end_5.000000:
	#Push Local var g
	movq 88(%rsp), %r10
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %r10
	#Push Local array var a
	movq 128(%rsp), %r13
	addq %r13, %r10
	movq (%r10), %r10
	#Push Local var x
	movq 104(%rsp), %r13

	# >
	cmp %r13, %r10
	jg great_6.000000
	movq $0x0, %r10
	jmp end_6.000000
	great_6.000000:
	movq $0x1, %r10
	end_6.000000:

	#ANDAND
	andq %r10, %rbx
	cmpq $0, %rbx
	je loop_end_3
	#Push Local var g
	movq 88(%rsp), %rbx

	# push 1
	movq $1,%r10

	# -
	subq %r10,%rbx
	#Assign to Local var g
	movq %rbx, 88(%rsp)
	jmp loop_start_3
loop_end_3:
	#Push Local var l
	movq 96(%rsp), %rbx
	#Push Local var g
	movq 88(%rsp), %r10

	# <
	cmp %r10, %rbx
	jl less_7.000000
	movq $0x0, %rbx
	jmp end_7.000000
	less_7.000000:
	movq $0x1, %rbx
	end_7.000000:

	# Begin IF statement
	cmpq $0, %rbx
	je ifEnd_2.000000
	#Push Local var l
	movq 96(%rsp), %rbx
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %rbx
	#Push Local array var a
	movq 128(%rsp), %r10
	addq %r10, %rbx
	movq (%rbx), %rbx
	#Assign to Local var tmp
	movq %rbx, 80(%rsp)
	#Push Local var l
	movq 96(%rsp), %rbx
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %rbx
	#Push Local array var a
	movq 128(%rsp), %r10
	addq %r10, %rbx
	#Push Local var g
	movq 88(%rsp), %r10
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %r10
	#Push Local array var a
	movq 128(%rsp), %r13
	addq %r13, %r10
	movq (%r10), %r10
	movq %r10, (%rbx)
	#Push Local var g
	movq 88(%rsp), %rbx
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %rbx
	#Push Local array var a
	movq 128(%rsp), %r10
	addq %r10, %rbx
	#Push Local var tmp
	movq 80(%rsp), %r10
	movq %r10, (%rbx)
	jmp ifAbsEnd_2.000000
	ifEnd_2.000000:
	ifAbsEnd_2.000000:
	jmp loop_start_1
loop_end_1:
	#Push Local var right
	movq 112(%rsp), %rbx
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %rbx
	#Push Local array var a
	movq 128(%rsp), %r10
	addq %r10, %rbx
	#Push Local var l
	movq 96(%rsp), %r10
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %r10
	#Push Local array var a
	movq 128(%rsp), %r13
	addq %r13, %r10
	movq (%r10), %r10
	movq %r10, (%rbx)
	#Push Local var l
	movq 96(%rsp), %rbx
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %rbx
	#Push Local array var a
	movq 128(%rsp), %r10
	addq %r10, %rbx
	#Push Local var x
	movq 104(%rsp), %r10
	movq %r10, (%rbx)
	#Push Local var a
	movq 128(%rsp), %rbx
	#Push Local var left
	movq 120(%rsp), %r10
	#Push Local var l
	movq 96(%rsp), %r13

	# push 1
	movq $1,%r14

	# -
	subq %r14,%r13
     # func=quicksortsubrange nargs=3
     # Move values from reg stack to reg args
	movq %r13, %rdx
	movq %r10, %rsi
	movq %rbx, %rdi
	call quicksortsubrange
	movq %rax, %rbx
	#Push Local var a
	movq 128(%rsp), %rbx
	#Push Local var g
	movq 88(%rsp), %r10

	# push 1
	movq $1,%r13

	# +
	addq %r13,%r10
	#Push Local var right
	movq 112(%rsp), %r13
     # func=quicksortsubrange nargs=3
     # Move values from reg stack to reg args
	movq %r13, %rdx
	movq %r10, %rsi
	movq %rbx, %rdi
	call quicksortsubrange
	movq %rax, %rbx
	addq $128,%rsp
# Restore registers
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret
	.text
.globl quicksort
quicksort:
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
	#Push Local var a
	movq 128(%rsp), %rbx

	# push 0
	movq $0,%r10
	#Push Local var n
	movq 120(%rsp), %r13

	# push 1
	movq $1,%r14

	# -
	subq %r14,%r13
     # func=quicksortsubrange nargs=3
     # Move values from reg stack to reg args
	movq %r13, %rdx
	movq %r10, %rsi
	movq %rbx, %rdi
	call quicksortsubrange
	movq %rax, %rbx
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

	# push string "Hello" top=0
	movq $string2, %rbx
     # func=print nargs=1
     # Move values from reg stack to reg args
	movq %rbx, %rdi
	call print
	movq %rax, %rbx

	# push 10
	movq $10,%rbx
	#Assign to Local var n
	movq %rbx, 128(%rsp)
	#Push Local var n
	movq 128(%rsp), %rbx

	# push 8
	movq $8,%r10

	# *
	imulq %r10,%rbx
     # func=malloc nargs=1
     # Move values from reg stack to reg args
	movq %rbx, %rdi
	call malloc
	movq %rax, %rbx
	#Assign to Local var a
	movq %rbx, 120(%rsp)

	# push 0
	movq $0,%rbx
	
#Calculating array offset...
	#Multiply the index by 8
	movq $8, %rbp
	imulq %rbp, %rbx
	#Push Local array var a
	movq 120(%rsp), %r10
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
	#Push Local array var a
	movq 120(%rsp), %r10
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
	#Push Local array var a
	movq 120(%rsp), %r10
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
	#Push Local array var a
	movq 120(%rsp), %r10
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
	#Push Local array var a
	movq 120(%rsp), %r10
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
	#Push Local array var a
	movq 120(%rsp), %r10
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
	#Push Local array var a
	movq 120(%rsp), %r10
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
	#Push Local array var a
	movq 120(%rsp), %r10
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
	#Push Local array var a
	movq 120(%rsp), %r10
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
	#Push Local array var a
	movq 120(%rsp), %r10
	addq %r10, %rbx

	# push 1
	movq $1,%r10
	movq %r10, (%rbx)
	#top=0

	# push string "-------- Before -------\n" top=0
	movq $string3, %rbx
     # func=printf nargs=1
     # Move values from reg stack to reg args
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
	#Push Local var a
	movq 120(%rsp), %rbx

	# push 0
	movq $0,%r10
	#Push Local var n
	movq 128(%rsp), %r13

	# push 1
	movq $1,%r14

	# -
	subq %r14,%r13
     # func=printArray nargs=3
     # Move values from reg stack to reg args
	movq %r13, %rdx
	movq %r10, %rsi
	movq %rbx, %rdi
	call printArray
	movq %rax, %rbx
	#Push Local var a
	movq 120(%rsp), %rbx
	#Push Local var n
	movq 128(%rsp), %r10
     # func=quicksort nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	call quicksort
	movq %rax, %rbx
	#top=0

	# push string "-------- After -------\n" top=0
	movq $string4, %rbx
     # func=printf nargs=1
     # Move values from reg stack to reg args
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
	#Push Local var a
	movq 120(%rsp), %rbx

	# push 0
	movq $0,%r10
	#Push Local var n
	movq 128(%rsp), %r13

	# push 1
	movq $1,%r14

	# -
	subq %r14,%r13
     # func=printArray nargs=3
     # Move values from reg stack to reg args
	movq %r13, %rdx
	movq %r10, %rsi
	movq %rbx, %rdi
	call printArray
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
	.string "%d\n"

string1:
	.string "==%s==\n"

string2:
	.string "Hello"

string3:
	.string "-------- Before -------\n"

string4:
	.string "-------- After -------\n"

