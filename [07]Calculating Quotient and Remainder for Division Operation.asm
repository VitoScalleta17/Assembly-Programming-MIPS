.data
    message1: .asciiz "Enter the 1st Number="
    message2: .asciiz "Enter the 2nd Number="
    message3: .asciiz "The value of the Quotient is="
    message4: .asciiz "The value of the Remainder is="
    message5: .asciiz "\n"

.text
    #Asking the User to Enter the 1st Number
    li $v0,4
    la $a0,message1
    syscall
    
    #Getting the 1st Number
    li $v0,5
    syscall
    
    #Storing the value in t0 Register
    move $t0,$v0
    
    #Asking the User to Enter the 2nd Number
    li $v0,4
    la $a0,message2
    syscall
    
    #Getting the 2nd Number
    li $v0,5
    syscall
    
    #Storing the value in t1 Register
    move $t1,$v0
    
    #Dividing the Two Numbers
    #div $t1,$t0-->Will give t1/t0
    div $t0,$t1
    mflo $t3 #Now t2=Quotient
    mfhi $t4 #Now t3=Remainder
    
    #Printing the Result
    li $v0,4
    la $a0,message3
    syscall
    li $v0,1
    move $a0,$t3
    syscall
    
    li $v0,4
    la $a0,message5
    syscall
    
    li $v0,4
    la $a0,message4
    syscall
    li $v0,1
    move $a0,$t4
    syscall
