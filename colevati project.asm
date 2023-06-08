# Ola! este é um trabalho feito por Miguel Amorim da Costa
# Ele foi entregue ao professor de arquitetura e organização de computadores, Leandro Colevati
# Faculdade FATEC Zona Leste; São Paulo

.data


	#TEXTO---------------------------------------------------------
	introducao: .asciiz "você irá inserir um número, que seja maior que zero, de termos de uma série (n)."
	introducao2: .asciiz "\nA formula é: 1 + 2*2 + 1*3 + 2*4 + 1*5 + 2*6 +..."
	introducao3: .asciiz "\nSerá exibida a soma total de todos estes termos."
	introducao4: .asciiz "\nA fórmula resultará em erro caso você use números negativos, não inteiros,"
	introducao5: .asciiz "\nou que quebrem o limite de números inteiros do MIPS, por tamanho excessivo."
	introducao6: .asciiz "\nEnfim... Insira o seu número!\n"
	
	exibição: "\n \nO total dos termos é "
	
	#PRINT PARA TESTES---------------------------------------------------------
	
	
	#exibi o valor de termos para testes
	valorteste: .asciiz "\nO valor é "
		
	
	#li $v0, 4
	#la $a0, valorteste
	#syscall
	
	#li $v0, 1
	#move $a0, $s0
	#syscall
		
	
	
.text


main:
	#vai para  seção de introduçao; ajuda na organização do código
	jal intro
	
	
	#receber o numero de termos do usuário
	li $v0, 5
	syscall	
	
	#move a entrada do usuário para s0
	move $s0, $v0
	
	
	#t0 e t1 servem como multiplicadores que se alternam durante a série. 1 e 2
	addi $t0, $zero, 1
	
	addi $t1, $zero, 2

	j while_main1
	

while_main1:
	
	#leva ao end quando a serie chegar ao numero colocado pelo usuario
	beq $s0, $s1 end
	
	
	#s1 serve como contador. ele tambem multiplica cada item da série. ele aumenta com cada iteração da série
	addi $s1, $s1, 1
	
	#t2 quarda a multiplicação
	mul $t2, $t0, $s1
	
	#s2 guarda o resultado final das soma dos items
	addu $s2, $s2, $t2
	
	
	#vai à multiplicação por 2	
	j while_main2
	
	
	
while_main2:


	#leva ao end quando a serie chegar ao numero colocado pelo usuario
	beq $s0, $s1 end
	
	
	
	#adiciona 1 ao contador
	addi $s1, $s1, 1
	
	
	#t2 quarda a multiplicação
	mul $t2, $t1, $s1
	
	#s2 guarda o resultado final das soma dos items
	addu $s2, $s2, $t2
	
	
	#volta para a multiplicação por 1
	j while_main1
	
intro:
	#Mensagens de introdução--------------------------------------------------
	
	li $v0, 4
	la $a0, introducao
	syscall
	
	li $v0, 4
	la $a0, introducao2
	syscall
	
	li $v0, 4
	la $a0, introducao3
	syscall
	
	li $v0, 4
	la $a0, introducao4
	syscall
	
	li $v0, 4
	la $a0, introducao5
	syscall
	
	li $v0, 4
	la $a0, introducao6
	syscall
	
	
	#retorna ao main
	jr $ra

end:

	#exibi a mensagem final e Termina o processo
	
	#mesagem de valor final
	li $v0, 4
	la $a0, exibição
	syscall
	
	#valor final
	li $v0, 1
	move $a0, $s2
	syscall
	
	#fim da função
	li $v0, 10
	syscall
