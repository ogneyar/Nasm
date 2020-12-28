

Mail:    
    mov al, 4dh     ; символ M (eng)
    int 0x10        ; вызов прерывания
    mov al, 41h     ; символ A (eng)
    int 10h         ; вызов прерывания
    mov al, 49h     ; символ I (eng)
    int 10h         ; вызов прерывания
    mov al, 4ch     ; символ L (eng)
    int 0x10        ; вызов прерывания

    ret
