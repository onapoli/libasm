global _start

extern ft_write

section .data
	msg db "Hello World!", 0x0a, 0x00
	cnt equ 13

section .text
_start:
	mov rdi, 1	; set ft_write 1st arg (fd)
	mov rsi, msg	; set ft_write 2nd arg (buffer)
	mov rdx, cnt	; set ft_write 3rd arg (count)
	call ft_write
	
	mov rdi, rax	; assign rax value (return of ft_write) to rdi
	mov rax, 60	; exit this way to check rdi value with 'echo $?'
	syscall
