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

	# push string "9==8%d\n" top=0
	movq $string0, %rbx

	# push 9
	movq $9,%r10

	# push 8
	movq $8,%r13

	# ==
	cmp %r13, %r10
	jne nequal_0.000000
	movq $0x1, %r10
	jmp end_0.000000
	nequal_0.000000:
	movq $0x0, %r10
	end_0.000000:
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
	#top=0

	# push string "9==9=%d\n" top=0
	movq $string1, %rbx

	# push 9
	movq $9,%r10

	# push 9
	movq $9,%r13

	# ==
	cmp %r13, %r10
	jne nequal_1.000000
	movq $0x1, %r10
	jmp end_1.000000
	nequal_1.000000:
	movq $0x0, %r10
	end_1.000000:
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
	#top=0

	# push string "9!=8%d\n" top=0
	movq $string2, %rbx

	# push 9
	movq $9,%r10

	# push 8
	movq $8,%r13

	# !=
	cmp %r13, %r10
	jne nequal_2.000000
	movq $0x0, %r10
	jmp end_2.000000
	nequal_2.000000:
	movq $0x1, %r10
	end_2.000000:
     # func=printf nargs=2
     # Move values from reg stack to reg args
	movq %r10, %rsi
	movq %rbx, %rdi
	movl    $0, %eax
	call printf
	movq %rax, %rbx
	#top=0

	# push string "9!=9=%d\n" top=0
	movq $string3, %rbx

	# push 9
	movq $9,%r10

	# push 9
	movq $9,%r13

	# !=
	cmp %r13, %r10
	jne nequal_3.000000
	movq $0x0, %r10
	jmp end_3.000000
	nequal_3.000000:
	movq $0x1, %r10
	end_3.000000:
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
	.string "9==8%d\n"

string1:
	.string "9==9=%d\n"

string2:
	.string "9!=8%d\n"

string3:
	.string "9!=9=%d\n"

