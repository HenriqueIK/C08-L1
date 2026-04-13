# Fazer um programa que leia um vetor de tamanho 6 e retorne a soma de seus valores

.data
vet: .byte 10,20,30,3,2,4
len: .word 6
f1: .asciiz "Soma = "

.text
main:
    li $t0, 0 # i = 0
    li $t1, 0 # soma = 0

    la $t4, vet # chamando vetor
    lw $t5, len # len = 6

for:
    slt $t2, $t0, $t5  # i < 6
    beq $t2, $zero, fim

    lb $t6, 0($t4)

    add $t1, $t1, $t6 # adicionando a soma

    addi $t4, $t4, 1 # posição do vetor
    addi $t0, $t0, 1 # i++

    j for

fim:
   	li $v0,4
	la $a0,f1
	syscall
	
	add $a0,$t1,$0
	li $v0,1
	syscall
