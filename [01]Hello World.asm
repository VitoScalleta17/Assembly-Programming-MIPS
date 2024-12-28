.data
  myString:  .asciiz  "Hello World\n"  #Creating a String
  
.text
  li $v0, 4                           #Preparing system to print 
  la $a0, myString                    #Loading the value
  syscall
