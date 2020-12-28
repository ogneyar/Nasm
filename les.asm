org 0x100

mov ah, 09h     ; режим вывода
mov edx, chegoto
int 21h         ; вызов прерывания

mov ax, 4c00h   ; ah == 0x4c al == 0x00
int 21h         ; выход

chegoto db 0xa,"ABRACADABRA",0xa,'$'