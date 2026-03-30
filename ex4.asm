li $t0, 0xFF

li $t1, 1

# $t2 = (0xFF & 1)
and $t2, $t0, $t1

li $t3, 2

li $t4, 4

# $t5 = (2 | 4)
or $t5, $t3, $t4

# $t5 = ($t2 - $t5)
sub $t5, $t2, $t5

li $t6, 4

# $t7 = (4 >> 1)
srl $t7, $t6, 1

# $t8 = (1 << 1)
sll $t8, $t1, 1

# $t7 = ($t7 / $t8)
div $t7, $t7, $t8

li $a1, 10

# $t9 = $t7 * 10
mult $t7, $a1
mflo $t9

# $t9 = $t9 + $t5
add $t9, $t9, $t5