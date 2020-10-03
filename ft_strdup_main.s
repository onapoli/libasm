global main

extern ft_strdup
extern free

section .data
	s db "Hola", 0x00
	s_len equ $-s

section .text
main:
	mov rdi, s			; set ft_strdup 1st argument (*s)
	call ft_strdup

	mov rsi, rax		; set ft_strdup return value as 3rd argument of write system service
	mov rax, 1			; set write system service call
	mov rdi, 1			; set output location for write system service
	mov rdx, s_len		; set byte count for write system service
	syscall
	
	mov rdi, rsi		; free only argument (reference to memory to deallocate)
	call free
	
	mov rax, 60			; set exit system service call code
	mov rdi, 0			; set exit code
	syscall
