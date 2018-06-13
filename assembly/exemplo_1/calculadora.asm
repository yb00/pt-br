section .data
	tit		db 10, '*** Calculadora ***'
	ltit		equ $ - tit
	obVal1		db 10, 'Valor 1: ', 0
	lobVal1		equ $ - obVal1
	obVal2		db 10, 'Valor 2: ', 0
	lobVal2		equ $ - obVal2
	opc1		db 10, '1. Somar', 0
	lopc1		equ $ - opc1
	opc2		db 10, '2. Subtrair', 0
	lopc2		equ $ - opc2
	opc3		db 10, '3. Multiplicar', 0
	lopc3		equ $ - opc3
	opc4		db 10, '4. Dividir', 0
	lopc4		equ $ - opc4
	msgOpc		db 10, 'Qual operação você deseja realizar? ', 0
	lmsgOpc		equ $ - msgOpc
	msgErro		db 10, 'Valor de opção invalido.', 0
	lmsgErro 	equ $ - msgErro
	salLinha	db 10,0
	lsalLinha	equ $ - salLinha
	msgResult	db 10, 'RESULTADO: ', 0
	lmsgResult	equ $ - msgResult	

section .bss
	opc	resb 2
	num1	resb 10
	num2	resb 10
	result	resb 10

section .text
	global _start

		_start:
			mov ecx, tit
			mov edx, ltit
			call mst_saida

			mov ecx, obVal1
			mov edx, lobVal1
			call mst_saida
			mov ecx, num1
			mov edx, 10
			mov eax, 3
			mov ebx, 0
			int 80h

			mov ecx, obVal2
			mov edx, lobVal2
			call mst_saida
			mov ecx, num2
			mov edx, 10
			mov eax, 3
			mov ebx, 0
			int 80h

			mov ecx, opc1
			mov edx, lopc1
			call mst_saida

			mov ecx, opc2
			mov edx, lopc2
			call mst_saida

			mov ecx, opc3
			mov edx, lopc3
			call mst_saida

			mov ecx, opc4
			mov edx, lopc4
			call mst_saida

			mov ecx, msgOpc
			mov edx, lmsgOpc
			call mst_saida
			mov ecx, opc
			mov edx, 2
			mov eax, 3
			mov ebx, 0
			int 80h

			mov ah, [opc]
			sub ah, '0'

			cmp ah, 1
			je Somar
			cmp ah, 2
			je Subtrair
			cmp ah, 3
			je Multiplicar
			cmp ah, 4
			je Dividir

			mov ecx, msgErro
			mov edx, lmsgErro
			call mst_saida
			jmp exit

		Somar:
			mov eax, [num1]		; '[]' passa o endereço de num1 para eax (semelhante a ponteiros).
			sub eax, '0'		; Passa para inteiro - little endian - zero a esquerda.
			mov ebx, [num2]		
			sub ebx, '0'		
			add eax, ebx		; Soma e passa o resultado da soma para eax.
			add eax, '0'		; Passa o resultado para string.
			mov [result], eax	; Move eax para dentro do endereço de 'result' - endereço para endereço.
			call mst_saida
			
			; Bloco que mostra a mensagem "RESULTADO: "
			mov ecx, msgResult
			mov edx, lmsgResult
			call mst_saida
			
			; Bloco que mostra o resultado da soma.
			mov ecx, result
			mov edx, 1	; Pois estamos trabalhando apenas com um dígito.
			call mst_saida

			jmp exit 	; Encerra o programa.

		Subtrair:
			mov eax, [num1]
			sub eax, '0'
			mov ebx, [num2]
			sub ebx, '0'
			sub eax, ebx
			add eax, '0'
			mov [result], eax
			call mst_saida

			mov ecx, msgResult
			mov edx, lmsgResult
			call mst_saida

			mov ecx, result
			mov edx, 1
			call mst_saida

			jmp exit

		Multiplicar:
			jmp exit

		Dividir:
			jmp exit

		exit:
			mov ecx, salLinha
			mov edx, lsalLinha
			call mst_saida
			mov eax, 1
			mov ebx, 0
			int 80h

		mst_saida:
			mov eax, 4
			mov ebx, 1
			int 80h
			ret
