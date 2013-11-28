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
	movq i, %rbx

	# push 15
	movq $15,%r10

	# !=
	cmp %r10, %rbx
	jl less_0.000000
	movq $0x0, %rbx
	jmp end_0.000000
	less_0.000000:
	movq $0x1, %rbx
	end_0.000000:
	cmpq $0, %rbx
	je loop_end_0_1
	jne loop_body_start_0_1
	loop_assignment_0_1:
	movq i, %rbx

	# push 1
	movq $1,%r10

	# +
	addq %r10,%rbx
	#Assign to Global var i
	movq %rbx, i
	jmp loop_start_0_1
	loop_body_start_0_1:
	movq i, %rbx

	# push 5
	movq $5,%r10

	# ==
	cmp %r10, %rbx
	jne nequal_1.000000
	movq $0x1, %rbx
	jmp end_1.000000
	nequal_1.000000:
	movq $0x0, %rbx
	end_1.000000:
	cmpq $0, %rbx
	je ifEnd_1.000000
	jmp loop_end_1_1
	jmp ifAbsEnd_1.000000
	ifEnd_1.000000:
	ifAbsEnd_1.000000:
	#top=1

	# push string "i=%d\n" top=1
	movq $string0, %r10
	movq i, %r13
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r13, %rsi
	movq %r10, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %r10
	jmp loop_assignment_0_1
loop_end_0_1:
	#top=0

	# push string "for i=%d\n" top=0
	movq $string1, %rbx
	movq i, %r10
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx

	# push 0
	movq $0,%rbx
	#Assign to Global var i
	movq %rbx, i
loop_start_1_1:
	movq i, %rbx

	# push 15
	movq $15,%r10

	# !=
	cmp %r10, %rbx
	jl less_2.000000
	movq $0x0, %rbx
	jmp end_2.000000
	less_2.000000:
	movq $0x1, %rbx
	end_2.000000:
	cmpq $0, %rbx
	je loop_end_1_1
	#top=0

	# push string "i=%d\n" top=0
	movq $string2, %rbx
	movq i, %r10
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
	movq i, %rbx

	# push 8
	movq $8,%r10

	# ==
	cmp %r10, %rbx
	jne nequal_3.000000
	movq $0x1, %rbx
	jmp end_3.000000
	nequal_3.000000:
	movq $0x0, %rbx
	end_3.000000:
	cmpq $0, %rbx
	je ifEnd_2.000000
	jmp loop_end_2_1
	jmp ifAbsEnd_2.000000
	ifEnd_2.000000:
	ifAbsEnd_2.000000:
	movq i, %r10

	# push 1
	movq $1,%r13

	# +
	addq %r13,%r10
	#Assign to Global var i
	movq %r10, i
	jmp loop_start_1_1
loop_end_1_1:
	#top=1

	# push string "while i=%d\n" top=1
	movq $string3, %r10
	movq i, %r13
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r13, %rsi
	movq %r10, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %r10

	# push 0
	movq $0,%rbx
	#Assign to Global var i
	movq %rbx, i
loop_start_2_1:
	#top=0

	# push string "i=%d\n" top=0
	movq $string4, %rbx
	movq i, %r10
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
	movq i, %rbx

	# push 10
	movq $10,%r10

	# ==
	cmp %r10, %rbx
	jne nequal_4.000000
	movq $0x1, %rbx
	jmp end_4.000000
	nequal_4.000000:
	movq $0x0, %rbx
	end_4.000000:
	cmpq $0, %rbx
	je ifEnd_3.000000
	jmp loop_end_3_1
	jmp ifAbsEnd_3.000000
	ifEnd_3.000000:
	ifAbsEnd_3.000000:
	movq i, %r10

	# push 1
	movq $1,%r13

	# +
	addq %r13,%r10
	#Assign to Global var i
	movq %r10, i
	movq i, %r10

	# push 15
	movq $15,%r13

	# !=
	cmp %r13, %r10
	jl less_5.000000
	movq $0x0, %r10
	jmp end_5.000000
	less_5.000000:
	movq $0x1, %r10
	end_5.000000:
	cmpq $0, %rbx
	jne loop_start_2_1
loop_end_2_1:
	#top=2

	# push string "do/while i=%d\n" top=2
	movq $string5, %r13
	movq i, %r14
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r14, %rsi
	movq %r13, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %r13
	#top=0

	# push string "OK\n" top=0
	movq $string6, %rbx
     # func=printf nargs=1
     # Move values from reg stack to reg args
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
	.string "i=%d\n"

string1:
	.string "for i=%d\n"

string2:
	.string "i=%d\n"

string3:
	.string "while i=%d\n"

string4:
	.string "i=%d\n"

string5:
	.string "do/while i=%d\n"

string6:
	.string "OK\n"

