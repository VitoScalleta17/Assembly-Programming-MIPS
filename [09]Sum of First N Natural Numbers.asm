.data
	Input: .asciiz "Enter the Number="
	Message1: .asciiz "The sum from 1 till the Number entered by the User is="

.text
	main:
		la $a0,Input
		jal Printer
		jal Enter_the_Input
		move $t2,$v0 #n=Input
		addi $t1,$zero,0 #Sum=0
		addi $t0,$zero,0 #i=0-->i is a Counter
		jal While

	#print(f"The Sum till {n} is {Sum}")
	la $a0,Message1
	jal Printer
	move $a0,$t1
	jal Integer_Printer
	jal End

	While:
		bgt  $t0,$t2,Exit #While(i<=n)
		add $t1,$t1,$t0 #Sum+=i
		addi $t0,$t0,1  #Incrementing i by 1
		j While 

	Exit:
		jr $ra

	Enter_the_Input:
		li $v0,5
		syscall
		jr $ra

	Printer:
		li $v0,4
		syscall
		jr $ra

	Integer_Printer:
		li $v0, 1
		syscall
		jr $ra

	End:
		li $v0, 10
		syscall
