.data
f1: .asciiz "Escolha a Figura: \n"
f2: .asciiz "1  - Trapézio \n"
f3: .asciiz "2 - Retângulo \n"
f4: .asciiz "3 - Triângulo \n"
f5: .asciiz "Digite a opção: "
f6: .asciiz "Base maior: "
f7: .asciiz "Base menor: "
f8: .asciiz "Base: "
f9: .asciiz "Altura: "
f10: .asciiz "Área do Trapézio = "
f11: .asciiz "Área do Retângulo = "
f12: .asciiz "Área do Triângulo = "
f13: .asciiz "Opção inválida"

.text
main:
	li $v0,4
	la $a0,f1
	syscall
	
	li $v0,4
	la $a0,f2
	syscall
	
	li $v0,4
	la $a0,f3
	syscall
	
	li $v0,4
	la $a0,f4
	syscall
	
	li $v0,4
	la $a0,f5
	syscall

	li $v0,5
	syscall

	add $t0,$0,$v0
	
	beq $t0, 1, trapezio
	
	beq $t0, 2, retangulo
	
	beq $t0, 3, triangulo
	
	bge $t0, 4, invalido
	
	ble $t0, 0, invalido
	
trapezio:
	li $v0,4
	la $a0,f6
	syscall
	
	li $v0,5
	syscall
	
	add $s1, $0, $v0 # Base maior trapezio
	
	li $v0,4
	la $a0,f7
	syscall
	
	li $v0,5
	syscall
	
	add $s2, $0, $v0 # Base menor trapezio
	
	li $v0,4
	la $a0,f9
	syscall
	
	li $v0,5
	syscall
	
	add $s3, $0, $v0 # Altura trapezio
	
	add $s2, $s2, $s1 # (B + b)
	
	mult $s3, $s2 # (B + b) * h
	mflo $s5
	
	div $s6, $s5, 2
	
	li $v0,4
	la $a0,f10
	syscall
	
	add $a0,$s6,$0
	li $v0,1
	syscall
	
	j exit

retangulo:
	li $v0,4
	la $a0,f8
	syscall
	
	li $v0,5
	syscall
	
	add $s1, $0, $v0 # Base retangulo
	
	li $v0,4
	la $a0,f9
	syscall
	
	li $v0,5
	syscall
	
	add $s2, $0, $v0 # Altura retangulo
	
	mult $s1, $s2
	mflo $s3
	
	li $v0,4
	la $a0,f11
	syscall
	
	add $a0,$s3,$0
	li $v0,1
	syscall
	
	j exit

triangulo:
	li $v0,4
	la $a0,f8
	syscall
	
	li $v0,5
	syscall
	
	add $s1, $0, $v0 # Base triangulo
	
	li $v0,4
	la $a0,f9
	syscall
	
	li $v0,5
	syscall
	
	add $s2, $0, $v0 # Altura triangulo
	
	mult $s1, $s2
	mflo $s3
	
	div $s3, $t2
	mflo $s4
	
	li $v0,4
	la $a0,f12
	syscall
	
	add $a0,$s4,$0
	li $v0,1
	syscall
	
	j exit
	
invalido:
	li $v0,4
	la $a0,f13
	syscall
	
	j exit
	
exit:
	li $v0,10
	syscall