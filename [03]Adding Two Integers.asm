.data
   prompt1:  .asciiz "Enter the 1st Number=\n"
   prompt2:  .asciiz "Enter the 2nd Number=\n"
   message:  .asciiz "The Sum is="

.text
   #Asking the user to enter input
   li $v0, 4
   la $a0, prompt1
   syscall

   #Getting the Number from the User
   li $v0,5
   syscall
   
   #Storing the Result given by User in one of our Register
   move $t0, $v0

   #Asking the user to enter input
   li $v0, 4
   la $a0, prompt2
   syscall

   #Getting the Number from the User
   li $v0,5
   syscall
   
   #Storing the Result given by User in one of our Register
   move $t1, $v0

   #Adding the Numbers
   add $t2 , $t0 , $t1      #t2=t0+t1
   
   li $v0, 4
   la $a0, message
   syscall
   
   #Printing the Result
   li $v0,1
   add $a0, $zero, $t2
   syscall
