
global Start

section .text

Start:
   
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msglen
    int 0x10
    mov eax, 1
    mov ebx, 0
    int 0x21

section .data
    msg: db "Linux rulez 4ever",0x0A,0
    msglen equ $-msg
