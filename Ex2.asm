.text 0x00400000
.align 2
.globl main
main:
lw $a0, Size # Load the size of array into $a0, using lw
li $a1, 0 # index i
li $a2, 0 # a2 contains the sum, initialize a2
li $t2, 4# t2 contains constant 4, initialize t2
loop:
mul $t1, $a1, $t2 # t1 gets i*4
lw $a3, Array($t1) # a3 = N[i]
add $a2, $a2, $a3 # sum = sum + N[i]
add $a1, $a1, 1 # i = i + 1
beq $a1, $a0, STOR # go to STOR if finished
j loop
STOR:
sw $a2, Result # store sum at Result, using sw
.data 0x10000000
.align 2
Array: .word 2 4 6 8 10 12 14 16 18 20
Size: .word 10
Result: .word 0