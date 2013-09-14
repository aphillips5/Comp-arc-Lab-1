 #Jonathan Liang, jl1310, 138008727
 #Comp Arch Lab 1
 #Section 2A
.text

.globl main
main:
	li $v0, 4
	la $a0, str1
	syscall

	li $v0, 5
	syscall
	move $t0, $v0

	li $v0, 4
	la $a0, return
	syscall
	
	li $t1, 0
	li $t2, 1
	li $t3, 1
	
	li $t4, 0
		
loop:      
	move $a0, $t3
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, null
	syscall
		
	add $t3, $t1, $t2
		
	addi $t4, $t4, 1
	beq $t4, $t0, exit
		
	move $t1, $t2
	move $t2, $t3
j loop
	
exit:
	li $v0, 4
	la $a0, return
	syscall
	
	li $v0, 10
	syscall

.data
str1: .asciiz "Enter integer for index of Fibonacci sequence: "
null: .asciiz " "
return: .asciiz "\n"