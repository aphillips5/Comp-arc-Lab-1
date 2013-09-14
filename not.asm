.text
main:
li $t0, -106 # place -106 into register t0
not $t1, $t0 # place NOT of -106 into register t1
li $v0,10 # place 10 into register V0
syscall # run syscall function for exit