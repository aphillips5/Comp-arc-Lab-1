#registers used:
#$t0 - used to hold the first number.
.text 
main:
#printing a string
li $v0, 4 # load syscall code for print_string in $v0 -tells cpu know we wanna print a string
la $a0,str1 #load argument(str1) into register $a0-in syscall "$a0" is where we store contents
syscall # make the syscall -the cpu acts on the code prior to this line
# Reading a string
li $v0,8# loads syscall code for read_string in $v0 -tells cpu u wanna read a string input from the user 
li $a1,16 # initializing maxium length of characters that the user can input
syscall # make the syscall  -the cpu acts on the code prior to this line

move $t1, $a0#????? moves content in register $a0 to register $t1
li $v0, 4 #?????? loads syscall code for print_string in $v0 - Will tell cpu to pring content in $t1
la $a0, str2 #???load argument(str2) into register $a0- now there is a new content in $a0
syscall #make the syscall -the cpu acts on the code prior to this line

move $a0, $t1 # ????moves str1 back into $a0
li $v0, 4
syscall

li $v0, 10 #
syscall #code 10 is for exit
#Print input
.data
str1: .asciiz "Please type a string with limited length 15\n"
str2: .asciiz "This is you just input : \n"