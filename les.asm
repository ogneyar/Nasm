org 0x100

;01h 07h 08h - ожидание ввода
;0ah - ожидание ввода символа и энтера
;02h 06h - выводит на экран
mov ah, 0ah
mov dl, '-'
int 21h

mov eax, 00000900h  ; 0x0000 + ah == 0x09 al == 0x00 (4 байта, 32 бита)
mov edx, chegoto
int 21h             ; вызов прерывания

xor al, al

mov ah, 01h         ; ожидание ввода символа
int 21h             ; (реагирует на русскую раскладку)
mov ah, 0eh         ; выодит то что сохранилось в al
int 10h
int 10h

mov eax, 00004c00h  ; 0x0000 + ah == 0x4c al == 0x00
int 21h             ; выход

chegoto db 0xa,"ABRACADABRA",0xa,'$'