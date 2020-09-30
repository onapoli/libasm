global _start

extern ft_strlen

section .data
	msg db "Hola", 0x0a, 0x00

section .text
_start:
	mov rdi, msg
	call ft_strlen
	
	mov rbx, rax
	mov rax, 1
	int 0x80
