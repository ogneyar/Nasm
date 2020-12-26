EXTERN _MessageBoxA@16
EXTERN _ExitProcess@4
SECTION .TEXT
Start:
	push 0
	push title
	push banner
	push 0
	call  _MessageBoxA@16
	push 0
	call _ExitProcess@4
SECTION .DATA
	banner db 'Hello, world!',0xD,0xA,0
	title db 'Hello',0