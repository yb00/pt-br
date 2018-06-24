section .data
    titulo_msg db '*** Exercício 2 ***', 0xA
    titulo_tam equ $ - titulo_msg

    newline_msg db 10, 0
    newline_tam equ $ - newline_msg

    nome_msg db 'Nome: ', 0
    nome_tam equ $ - nome_msg

    sobrenome_msg db 'Sobrenome: ', 0
    sobrenome_tam equ $ - sobrenome_msg

    nascimento_msg db 'Data de nascimento: ', 0
    nascimento_tam equ $ - nascimento_msg

    espaco_msg db ' ', 0
    espaco_tam equ $ - espaco_msg

section .bss
    nome resb 16
    sobrenome resb 16
    nascimento resb 16
    
section .text
    global _start

        _start:
            ; Mostrar título.
            mov eax, 4
            mov ebx, 1
            mov ecx, titulo_msg
            mov edx, titulo_tam ; Equivalente a: mov edx, 21
            int 80h

            ; Ler nome.
            mov eax, 4
            mov ebx, 1
            mov ecx, nome_msg
            mov edx, nome_tam
            int 80h

            mov eax, 3
            mov ebx, 1
            mov ecx, nome
            mov edx, 16 ;;;
            int 80h

            ; Ler sobrenome.
            mov eax, 4
            mov ebx, 1
            mov ecx, sobrenome_msg
            mov edx, sobrenome_tam
            int 80h

            mov eax, 3
            mov ebx, 1
            mov ecx, sobrenome
            mov edx, 16 ;;;
            int 80h

            ; Ler nascimento.
            mov eax, 4
            mov ebx, 1
            mov ecx, nascimento_msg
            mov edx, nascimento_tam
            int 80h

            mov eax, 3
            mov ebx, 1
            mov ecx, nascimento
            mov edx, 16 ;;;
            int 80h
            ;
            mov ecx, nome
            call mst_saida
            mov ecx, sobrenome
            call mst_saida
            mov ecx, nascimento
            call mst_saida

            mov eax, 1
            mov ebx, 0
            int 80h

        mst_saida:
            mov eax, 4
            mov ebx, 1
            int 80h
            ret