.data
    message1: .asciiz "Enter 1st Number="
    message2: .asciiz "Enter 2nd Number="
    message3: .asciiz "The Sum is="

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
    
    #Adding the two Numbers
    add $t2,$t0,$t1
    
    #Printing the Sum
    li $v0,4
    la $a0,message3
    syscall
    li $v0,1
    add $a0,$zero,$t2
    syscall
