global ft_write

section .text
ft_write:
	mov rax, 1	; set write system service
	syscall

	ret			; rax recibe el número de caracteres leídos automaticamente, o negativo en caso de error
