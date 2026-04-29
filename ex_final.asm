# Considere a função de segundo grau: x2 - 5x + 6 = 0
# Resolva ela e armazene o(s) valor(es) de x encontrado(s) no endereço

.data
f1: .asciiz "Função de Segundo grau: f(x) = x2 - 5x + 6 = 0 \n"
f2: .asciiz "x1 = "
f3: .asciiz "\nx2 = "

# Delta = b2 - 4ac
# x = -b +-raiz(Delta) / 2a

.text
la $a0, f1
li $v0, 4
syscall

li $t0, 5 # b
li $t1, 1 # a
li $t2, 6 # c

mul $s0, $t0, $t0 # b2

mul $s1, $t2, $t1

mul $s1, $s1, 4

sub $s2, $s0, $s1 # Delta

li $t6, 1 # raiz(Delta)

# Teste para ver se delta está retornando o valor certo
# add $a0,$s2,$0
# li $v0,1
# syscall

mul $t3, $t0, 1 # -b

mul $t5, $t1, 2 # 2a

x_positivo:
	add $s3, $t3, $t6 # (-b + raiz)
	
	div $s3, $t5 # ($s3 / 2a)
	mflo $s4
	
	la $a0, f2
	li $v0, 4
	syscall
	
	add $a0,$s4,$0
	li $v0,1
	syscall

x_negativo:
	sub $s5, $t3, $t6 # (-b - raiz)
	
	div $s5, $t5 # ($s5 / 2a)
	mflo $s6
	
	la $a0, f3
	li $v0, 4
	syscall
	
	add $a0,$s6,$0
	li $v0,1
	syscall
	
fim:
	li $v0, 10
	syscall
