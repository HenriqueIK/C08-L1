.data
f1: .asciiz "Entre com a quantidade de numeros: "
f2: .asciiz "Entre com um numero: "
divisor: .asciiz " : "
prox_linha: .asciiz "\n"

.text
la $a0, f1
li $v0, 4
syscall

li $v0, 5
syscall
move $s0, $v0

# Alocar array (s0 * 4 bytes)
mul $a0, $s0, 4
li $v0, 9
syscall
move $s1, $v0 # $s1 = base do array

# Lendo os números
li $t0, 0 # i = 0

lendo:
	bge $t0, $s0, fim_lendo

	la $a0, f2
	li $v0, 4
	syscall

	# lendo numero
	li $v0, 5
	syscall

	# salvar no array
	mul $t1, $t0, 4
	add $t1, $t1, $s1
	sw $v0, 0($t1)

	addi $t0, $t0, 1
	b lendo

fim_lendo:
li $t0, 0 # i = 0

outer_loop:
    bge $t0, $s0, fim_sort

    li $t1, 0 # j = 0

loop:
    addi $t5, $s0, -1
    sub  $t5, $t5, $t0 # limite = n-1-i
    bge $t1, $t5, fim_loop

    # endereço de Array[j]
    mul $t4, $t1, 4
    add $t4, $t4, $s1

    lw $t2, 0($t4)# array[j]
    lw $t3, 4($t4)# array[j+1]

    ble $t2, $t3, pular

    # swap
    sw $t3, 0($t4)
    sw $t2, 4($t4)

pular:
    addi $t1, $t1, 1
    b loop

fim_loop:
    addi $t0, $t0, 1
    b outer_loop

fim_sort:
# Printar o vetor ordenado
li $t0, 0

print:
bge $t0, $s0, fim

    # print(i)
    move $a0, $t0
    li $v0, 1
    syscall
    
    la $a0, divisor
    li $v0, 4
    syscall

    # carregando valor
    mul $t1, $t0, 4
    add $t1, $t1, $s1
    lw  $a0, 0($t1)

    # print valor
    li $v0, 1
    syscall
    
    la $a0, prox_linha
    li $v0, 4
    syscall

    addi $t0, $t0, 1
    b print

fim:
li $v0, 10
syscall
