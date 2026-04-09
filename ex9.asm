.data
f1: .asciiz "Digite a sua idade: "
f2: .asciiz "Você não pode votar"
f3: .asciiz "Pode votar se quiser"
f4: .asciiz "Para você, votar é obrigatório"

.text
main:
	li $t1,16
	li $t2,18
	li $t3,70
	
	la $a0, f1
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	
	blt $t0,$t1,menor_de_idade
	blt $t0,$t2,nao_obrigado
	blt $t0,$t3, obrigado
	
	j nao_obrigado
	
menor_de_idade:
	la $a0, f2
	li $v0,4
	syscall
	j exit
	
nao_obrigado:
	la $a0, f3
	li $v0,4
	syscall
	j exit
	
obrigado:
	la $a0, f4
	li $v0,4
	syscall
	j exit
	
exit:
	li $v0,10
	syscall





