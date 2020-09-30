global _start

extern ft_strlen

section .data
	msg db "Hola", 0x0a, 0x00

section .text
_start:
	mov rdi, msg
	call ft_strlen
	
	mov rdi, rax	; Assign rax value (return of ft_strlen) to rdi
	mov rax, 60	; Exit this way to check rdi value with 'echo$?'
	syscall
