.data 0x10000000
.text 0x00400000
.globl main
main:
addi $8,$0,6 #Place number 6 into register 8.
addi $9,$0,12 #Place number 12 into register 9.
# multiplication of $8 * $9 -> $10
add $11,$0,$8 #Place content of register 8 into register 11.
add $10,$0,$0 #Place content of register 0 into register 10.
mulloop:
beq $11,$0,mulexit #begins a loop that does not end till the content in register 11 equals that in register 0.
addi $11,$11,-1 #subtracts 1 from the content in register 11 for every loop.
add $10,$10,$9 #adds the content in register 9 too the content in register 10.		
j mulloop
mulexit:
# multiplication loop is over,
# Is the result in $10 correct? The result in $10 is hexadecimal
li $2, 10
syscall