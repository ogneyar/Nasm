org 0x100

mov eax, 00000900h  ; 0x0000 + ah == 0x09 al == 0x00 (4 байта, 32 бита)
mov edx, chegoto
int 21h             ; вызов прерывания

mov eax, 00004c00h  ; 0x0000 + ah == 0x4c al == 0x00
int 21h             ; выход

chegoto db 0xa,"ABRACADABRA",0xa,'$'