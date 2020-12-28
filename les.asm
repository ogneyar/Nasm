[BITS 16]
[ORG 0]
mov ah, 0eh     ; режим вывода

mov al, 41h     ; символ A (eng)
int 10h         ; вызов прерывания
;---------------------
mov al, 'b'
int 0x10        ; вызов прерывания
;---------------------
mov al, 43h     ; символ C (eng)
int 0x10        ; вызов прерывания

; mov ax, 0x4c00
; int 0x21        ; выход
mov ah, 4ch     ; режим выхода
mov al, 00h
int 0x21













; global Start
; section .text
; Start:
;     mov eax, 4
;     mov ebx, 1
;     mov ecx, msg
;     mov edx, msglen
;     int 0x80
;     mov eax, 1
;     mov ebx, 0
;     int 0x80
; ; Exit:
; ;     mov eax, 1
; ;     mov ebx, 0
; ;     int 0x80
; section .data
;     msg: db "Linux rulez 4ever",0x0A,0
;     msglen equ $-msg
