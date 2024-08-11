.data
    Whitespace: .asciiz " "
    Newline: .asciiz "/n"
    Factors: .asciiz "The Factors are="
    Input:  .asciiz "Enter the number="

.text
    la $a0, Input
    jal MessagePrinter
    jal Inputer 
    move $t0, $v0 #t0=n(Input given by User)
    addi $t3,$t0,1
    li $t1,1 #i=1
    jal While
    jal End
	
   While:
	bgt  $t1,$t3,Exit #While i is less than or equal to n+1
	div $t0,$t1
	mfhi $t2 #$t2=Remainder
	beq $t2,0 FactorsPrinter #If n is divisible by i that is n%i==0 
	addi $t1,$t1,1 #i++
	jal While


   Exit:
	jal End
	
 FactorsPrinter:
 	la $a0,Whitespace
 	jal MessagePrinter
 	
 	move $a0,$t1
 	jal IntegerPrinter
 	
 	addi $t1,$t1,1 #i++
 	jal While
 	
 Inputer:
	li $v0,5
	syscall
	jr $ra
	
 MessagePrinter:
  	li $v0,4
  	syscall
  	jr $ra
  	
 End:
  	li $v0, 10
 	syscall
 	jr $ra
 	
 IntegerPrinter:
	li $v0, 1
	syscall
	jr $ra
