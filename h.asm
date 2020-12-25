section .data

    msg db 'I did it! Yeah...', 0xa, 0xd
    len equ $ - msg

section .text

    global _start

_start:

    mov eax, 4      ; номер системного вызова sys_write
    mov ebx, 1      ; файловый дескриптор
    mov ecx, msg    ; наша строка
    mov edx, len    ; длина строки

    int 0x80

    mov eax, 1      ; системный вызов sys_exit
    mov ebx, 0      ; код ошибки

    int 0x80
    