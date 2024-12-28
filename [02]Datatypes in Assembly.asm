.data
  myMessage: .asciiz "Hello World\n"    #Declaring a String
  myCharacter1: .byte 'M'               #Declaring a Character A Point to note that Character has to be declared only within single quotes
  myCharacter2: .byte 'N'               #Declaring a Character
  myAge: .word 19                       #Declaring an Integer
                                        #Integer Takes word
  myDouble:  .double 7.202
  PI: .float 3.14 
   
.text 
  li $v0, 4                             #Preparing system to print a String
  la $a0, myMessage                     #Printing the String
  syscall
  la $a0, myCharacter1                  #Printing the Character
  syscall
  la $a0, myCharacter2                  #Printing Another Character
  syscall
  li $v0, 1                             #Preparing the System to print an Integer
  lw $a0, myAge
  syscall
  li $v0,2
  lwc1 $f12, PI
  syscall
  ldc1 $f2, myDouble
  li $v0, 3
  syscall
