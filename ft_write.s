global ft_write

section .text
ft_write:
	mov rax, 1	; set write system service
	syscall

	ret		; rax receives by default the number of bytes written, or negative if an error occurred
