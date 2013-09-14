.data 0x10000000
Array:
	.word 5,10,15,20,25
Result:
	.word 0,0,0,0,0
Resultadd:
	.word 0 #creating a space
.text
	.globl main
main:
	li $a0, 5 #(load integer) loads 5(the size of the arry in terms of words) into the register $a0
	li $a1, 0 #(load integer) loads 0 into register $a1 (so it can start at0)(initializes index i at 0)
	li $a2, 0
	li $t2, 4
loop:
	mul $t1, $a1,$t2# multiplies content in two registers and puts it in register $t1 
	lw $a3, Array($t1)# loads the element Array[i]
	add $a2, $a2,$a3 # adds content in twwo register and puts it in register $a2
	addi $a1, $a1,1 # adds 1 to register $a1 and saves the new value in register $a1
	beq $a1, $a0, loop2 # if content in register $a1 = content in register $a0 next command goes to loop2
	j loop # makes command jump to the beginning of the loop 
	
loop2:
	sw $a2,Resultadd #stores the current content in register $a2 inside Resultadd (data transfer from register to memory)
	li $a1, 0 #loads 0 into register $a1 (basically this resets register $a1)

loop3:
	mul $t1, $a1,$t2  #this is done
	lw $a3, Array($t1)#loads the ARray element in register $a3
	lw $t3, Resultadd # loads content in Resultadd into register (data transfer from memory to register) 
	div $t3, $a3 #divides content in $t3 by content in $a3. The whole part of the operation is automatically stores in 'lo' and the reminder is stored in 'hi'
	mflo $t4 #moves the content in 'lo' to register '$t4'. mflo=move from lo
	sw $t4, Result($t1)# store data from $t4 to Result($t1) (data tranfers, register to memory)
	addi $a1, $a1, 1 #(adds 1 to the content in register $a1 and makes that value the new content in $a1
	beq $a1, $a0, finish # if content in register $a1 = content in register $a0 next command goes to finish
	j loop3 # makes command jump to the beginning of the loop3
finish:
		li $v0, 10 #call syscall code for exit to end the program
syscall		