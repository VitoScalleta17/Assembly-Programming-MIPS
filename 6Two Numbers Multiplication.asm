.data
     message1: .asciiz "Enter the 1st Number="
     message2: .asciiz "Enter the 2nd Number="
     message3: .asciiz "The Product is="

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
    
    #Multiplying the two Numbers
    mul $t2,$t1,$t0
    
    #Printing the Product
    li $v0,4
    la $a0,message3
    syscall
    li $v0,1
    add $a0,$zero,$t2
    syscall
