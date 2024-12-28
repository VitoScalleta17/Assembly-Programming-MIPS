.data
	Message1: .asciiz "Enter the 1st Number="
	Message2: .asciiz "Enter the 2nd Number="
	Message3: .asciiz "Enter the 3rd Number="
	Message4: .asciiz "The Smallest Number is="
	Message5: .asciiz "\nThe Greatest Number is="

.text
	# Taking 1st Input
	la $a0, Message1
	jal Printer
	jal Enter_the_Input
	move $t0, $v0

	# Taking 2nd Input
	la $a0, Message2
	jal Printer
	jal Enter_the_Input
	move $t1, $v0

	# Taking 3rd Input
	la $a0, Message3
	jal Printer
	jal Enter_the_Input
	move $t2, $v0

	#Comparing Input 1 and 2
	blt $t0, $t1, Lesser_Out_of_t0_and_t2 
	#If t0<t1 ,then call Lesser_Out_of_t0_and_t2
	blt $t1, $t0, Lesser_Out_of_t1_and_t2
	#If t1<t0 ,then call Lesser_Out_of_t1_and_t2

	bgt $t0, $t1, Greater_Out_of_t0_t2
	#If t0>t1 ,then call Greater_Out_of_t0_t2
	bgt $t1, $t0, Greater_Out_of_t1_t2
	#If t1>t0 ,then call Greater_Out_of_t1_t2
	jal End

	Enter_the_Input:
		li $v0,5
		syscall
		jr $ra

	Printer:
		li $v0,4
		syscall
		jr $ra

	End:
		li $v0, 10
		syscall
		jr $ra

	Integer_Printer:
		li $v0, 1
		syscall
		jr $ra

	Lesser_Out_of_t0_and_t2:
		blt $t0, $t2, Greater_Out_of_t1_t2
		blt $t2, $t0, Print_t2_t1

	Lesser_Out_of_t1_and_t2:
		blt $t1, $t2, Greater_Out_of_t0_t2
		blt $t2, $t1, Print_t2_t0
		
	Greater_Out_of_t0_t2:
		#jal Print_t1_Small 
		#t1 is the Smallest in this case
		la $a0,Message4
		jal Printer
		move $a0, $t1
		jal Integer_Printer
		bgt $t0, $t2, Print_t0_Biggest
		bgt $t2, $t0, Print_t2_Biggest

	Greater_Out_of_t1_t2:
		#jal Print_t0_Small
		#t0 is the Smallest in this case
		la $a0,Message4
		jal Printer
		move $a0, $t0
		jal Integer_Printer
		bgt $t1, $t2, Print_t1_Biggest
		bgt $t2, $t1, Print_t2_Biggest

	Print_t2_t1:
		la $a0,Message4
		jal Printer
		move $a0, $t2
		jal Integer_Printer
		jal Print_t1_Biggest

	Print_t2_t0:
		la $a0,Message4
		jal Printer
		move $a0, $t2
		jal Integer_Printer
		jal Print_t0_Biggest

	Print_t0_Biggest:
		la $a0,Message5
		jal Printer
		move $a0, $t0
		jal Integer_Printer
		jal End

	Print_t1_Biggest:
		la $a0,Message5
		jal Printer
		move $a0, $t1
		jal Integer_Printer
		jal End

	Print_t2_Biggest:
		la $a0,Message5
		jal Printer
		move $a0, $t2
		jal Integer_Printer
		jal End



