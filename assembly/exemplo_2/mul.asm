section .data
    num1:       dw 2
    num2:       dw 2
    newline:    db 10,0
    lnewline:   equ $ - newline

section .bss
    result: resb 10

section .text
    global _start

        _start:
            mov eax, [num1]
            mov ebx, [num2]
            imul eax, ebx
            add eax, '0'
            mov [result], eax

            mov ecx, result
            mov edx, 1
            mov eax, 4
            mov ebx, 1
            int 80h
            
            mov ecx, newline
            mov edx, lnewline
            mov edx, 1
            mov eax, 4
            mov ebx, 1
            int 80h

            mov eax, 1
            mov ebx, 0
            int 80h