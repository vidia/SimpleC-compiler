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

	# push 1
	movq $1,%rbx

	# Begin IF statement
	cmpq $0, %rbx
	je ifEnd_1.000000
	#top=0

	# push string "OK1\n" top=0
	movq $string0, %rbx
     # func=printf nargs=1
     # Move values from reg stack to reg args
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
	jmp ifAbsEnd_1.000000
	ifEnd_1.000000:
	ifAbsEnd_1.000000:

	# push 0
	movq $0,%rbx

	# Begin IF statement
	cmpq $0, %rbx
	je ifEnd_2.000000
	#top=0

	# push string "OK2\n" top=0
	movq $string1, %rbx
     # func=printf nargs=1
     # Move values from reg stack to reg args
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
	jmp ifAbsEnd_2.000000
	ifEnd_2.000000:
	ifAbsEnd_2.000000:

	# push 1
	movq $1,%rbx

	# Begin IF statement
	cmpq $0, %rbx
	je ifEnd_3.000000
	#top=0

	# push string "OK3\n" top=0
	movq $string2, %rbx
     # func=printf nargs=1
     # Move values from reg stack to reg args
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
	jmp ifAbsEnd_3.000000
	ifEnd_3.000000:
	#top=0

	# push string "OK4\n" top=0
	movq $string3, %rbx
     # func=printf nargs=1
     # Move values from reg stack to reg args
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
	ifAbsEnd_3.000000:

	# push 0
	movq $0,%rbx

	# Begin IF statement
	cmpq $0, %rbx
	je ifEnd_4.000000
	#top=0

	# push string "OK5\n" top=0
	movq $string4, %rbx
     # func=printf nargs=1
     # Move values from reg stack to reg args
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
	jmp ifAbsEnd_4.000000
	ifEnd_4.000000:
	#top=0

	# push string "OK6\n" top=0
	movq $string5, %rbx
     # func=printf nargs=1
     # Move values from reg stack to reg args
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
	ifAbsEnd_4.000000:
	#top=0

	# push string "OK7\n" top=0
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
	.string "OK1\n"

string1:
	.string "OK2\n"

string2:
	.string "OK3\n"

string3:
	.string "OK4\n"

string4:
	.string "OK5\n"

string5:
	.string "OK6\n"

string6:
	.string "OK7\n"

