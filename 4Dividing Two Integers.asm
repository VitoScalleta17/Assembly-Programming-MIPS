.data
  	message1:  .asciiz "Enter 1st number= "
  	message2:  .asciiz "Enter 2nd number="
	Quotient:  .asciiz "The value of the Quotient is="
	Remainder: .asciiz "The value of the Remainder is="
	Newline:   .asciiz "\n"
.text
 	#Printing message1
 	li $v0, 4
 	la $a0, message1
	syscall
 	
        #Taking 1st Number from the User
        li $v0, 5
 	syscall
 	
 	#Storing the 1st Number in T0
	move $t0, $v0
 	
 	#Printing message2
	li $v0, 4
	la $a0, message2
 	syscall
 
 	#Taking 2nd Number from the User	
	li $v0, 5
 	syscall
 	
 	#Storing the 2nd Number in T1
	move $t1, $v0
 	
 	#Dividing the Numbers
	div $t0, $t1
 	mfhi $t3 #Storing the Remainder in T3
 	mflo $t4 #Storing the Quotient in T4
 	
 	#Printing a message
 	li $v0, 4
	la $a0,Quotient
 	syscall
 	
 	#Printing the Quotient
	li $v0,1
	move $a0, $t4
 	syscall
 	
 	#Going to newline
 	li $v0,4
 	la $a0,Newline
 	syscall
 	
	#Printing a message
	li $v0, 4
	la $a0,Remainder
 	syscall
 	
 	#Printing the Remainder
 	li $v0,1
	move $a0, $t3
 	syscall
 	
 	#Ending the Program
	li $v0, 10
 	syscall	
