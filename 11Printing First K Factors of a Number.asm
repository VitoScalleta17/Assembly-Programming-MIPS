.data
    Whitespace: .asciiz " "
    Newline: .asciiz "/n"
    Factors: .asciiz "The Factors are="
    Input:  .asciiz "Enter the number="
    Upto: .asciiz "\nNumbers of Factors to be printed="

.text
    la $a0, Input
    jal MessagePrinter
    jal Inputer 
    move $t0, $v0 #t0=n
    
    la $a0, Upto
    jal MessagePrinter
    jal Inputer
    move $t5, $v0 #$t5=Max count 
    
    addi $t3,$t0,1
    li $t4,0 #t4=0
    li $t1,1 #i=1
    jal While
    jal End
	
   While:
	bgt  $t1,$t3,Exit #While(i<=n+1)
	div $t0,$t1
	mfhi $t2 #$t2=Remainder
	beq $t4,$t5,Exit #If Count==MaximumCount
	beq $t2,0 FactorsPrinter #If(n%i==0) 	
	addi $t1,$t1,1 #Increment i by 1
	jal While


   Exit:
	jal End
	
 FactorsPrinter:
 	la $a0,Whitespace
 	jal MessagePrinter
 	
 	move $a0,$t1
 	jal IntegerPrinter
 	
 	addi $t1,$t1,1 #Increment i by 1
 	addi $t4,$t4,1 #Increment Count by 1
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
