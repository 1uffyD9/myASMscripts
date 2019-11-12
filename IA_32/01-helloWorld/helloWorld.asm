; helloWorld.asm
; Author : 1uffyD9
; Compile with	: nasm -f elf32 helloWorld.asm or nasm -f elf helloWorld.asm 
; Link with	: ld -o helloWorld helloWorld.o ( 32bit OS ) or ld -m elf_i386 helloWorld.o -o helloWorld ( 64bit OS )

section .data
	message: db "Hello World!", 0xA	; message db "Hello World!"
	mlen equ $ - message		; len1 equ $-message

section .text
	global _start	; must be declared for using gcc. Telling code starting from here

_start:
	; write(int fd, const void *buf, size_t count)
	mov eax, 0x4	; invoke SYS_WRITE system call
	mov ebx, 0x1	; fd : STDOUT
	mov ecx, message; *buf
	mov edx, mlen	; count
	int 0x80	; inturrupt call to kernal

	; exit the program gracefully
	mov eax, 0x1	; invoke SYS_EXIT system call
	mov ebx, 0x0	; return 0
	int 0x80

