SECTION .text

;
;  [ebp+8] is pointer to string
;  [ebp+12] is pointer to pattern
;  returns eax==0 for false, eax==1 for true
;
match:
	push ebp
	mov ebp, esp
	sub esp, 4     ; local (index) is [ebp-4]
.again:
	mov esi, [ebp+8]
	mov edi, [ebp+12]
	cmp byte [edi], 0  ; pattern end?
	jne .not_end
	cmp byte [esi], 0  ; string end?
	jne near .false    ; out of range
	jmp .true
.not_end:
	cmp byte [edi], '*'
	jne .not_star
	mov dword [ebp-4], 0
.star_loop:
	mov esi, [ebp+8]
	mov edi, [ebp+12]
	add esi, [ebp-4]
	inc edi
	push edi
	push esi
	call match
	add esp, 8
	test eax, eax
	jnz .true
	mov esi, [ebp+8]
	add esi, [ebp-4]   ; may be string ended?
	cmp byte [esi], 0
	je .false
	inc dword [ebp-4]
	jmp .star_loop
.not_star:
	mov bl, [edi]
	cmp bl, '?'
	je .quest
	cmp bl, [esi]
	jne .false
.quest:
	inc dword [ebp+8] 
	inc dword [ebp+12] 
	jmp .again
.true:
	mov eax, 1
	jmp .quit
.false:
	xor eax, eax
.quit:
	mov esp, ebp
	pop ebp
	ret


global _start

;
;  MAIN PROGRAM
;
_start:
	pop eax
	cmp eax, 3
	jne wrong_args
	pop esi  ; ignore argv[0]
	pop esi  ; get argv[1]
	pop edi  ; get argv[2]
	mov [string], esi
	mov [pattern], edi

	push edi
	push esi
	call match
	add esp, 8
	test eax, eax
	jz print_no

	mov edx, 4     ; print yes
	mov ecx, m_yes
	mov ebx, 1
	mov eax, 4
	int 80h
	jmp quit
print_no:              ; print no
	mov edx, 4
	mov ecx, m_no
	mov ebx, 1
	mov eax, 4
	int 80h
	jmp quit

wrong_args:            ; say wrong args
	mov edx, m_wrong_len
	mov ecx, m_wrong
	mov ebx, 1
	mov eax, 4
	int 80h
	jmp quit


quit:
	mov ebx, 0
	mov eax, 1
	int 80h	

section .bss

string	resd	1
pattern resd	1

section .data

m_yes	db	"YES", 10
m_no	db	"NO ", 10
m_wrong db	"wrong arguments count, must be 2", 10
m_wrong_len	equ	$-m_wrong