.text 0x00400000
.globl factorial

# Preconditions:	
#   1st parameter (a0) non-negative integer, n
# Postconditions:
#   result (v0) n factorial

.globl main

# Prompt for a non-negative integer
# and invoke the factorial function.

main:
	addi	$sp, $sp, -4	# Make space on stack for 0ne word
	sw	$ra, 0($sp)	# Save return address. $ra gets put on the stack

	la	$a0, prompt
	li	$v0, 4
	syscall			# Display prompt.

	li	$v0, 5
	syscall			# Get integer response.

	move	$a0, $v0	# Call factorial function.
	jal	factorial       # jumps to and links factorial

	move	$a0, $v0
	li	$v0, 1
	syscall			# Print integer result.

	la	$a0, endl
	li	$v0, 4
	syscall			# Print endl.

	li	$v0, 0		# Return zero.
	lw	$ra, 0($sp)	# Restore return address.
	addi	$sp, $sp, 4	# Restore stack pointer.

	#jr	$ra

        li      $v0, 10
        syscall


factorial:
	addi	$sp, $sp, -8	# Make space on stack for 2 words. (pushes the task)
	sw	$ra, 0($sp)	# Save return address($ra) on the stack.
					#why isnt $v0 stored into the stack???????
	li	$v0, 1		# 0! = 1	
	beqz	$a0, zero	# Special case for 0! If content in register $a0 is equal to zero then this branches the instruction to the label "zero"

	sw	$a0, 4($sp)	# Save our argument.
	addi	$a0, $a0, -1	# Calculate (n-1)!
	jal	factorial	# Result in v0.
	lw	$a0, 4($sp)     # Restore our argument.
	mul	$v0, $a0, $v0	# n! = n * (n-1)!
zero: 
	lw	$ra, 0($sp)	# Restore return address.
	addi	$sp, $sp, 8	# Restore stack pointer.
	jr	$ra		# Return.


.data

prompt: .asciiz "Enter a non-negative integer: "
endl:	.asciiz "\n"