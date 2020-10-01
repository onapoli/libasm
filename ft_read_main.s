# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_read_main.s                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: onapoli- <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/30 16:53:11 by onapoli-          #+#    #+#              #
#    Updated: 2020/09/30 18:25:48 by onapoli-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _start

extern ft_read

section .data
	fd dq 0
	file_name db "hello.txt", 0x00
	cnt equ 4
	bytes_read dq 0

section .bss
	buff resb 4

section .text
_start:
	mov rax, 2						; set open file system service code
	mov rdi, file_name				; set file name
	mov rsi, 000000q				; set allow read only
	syscall

	mov [fd], rax					; save fd (file descriptor)
	mov rdi, [fd]					; set ft_read 1st arg (fd)
	mov rsi, buff					; set ft_read 2nd arg (buffer)
	mov rdx, cnt					; set ft_read 3rd arg (count)
	call ft_read
	
	mov [bytes_read], rax			; save ft_read result (bytes read)
	mov rax, 3						; set close file system service code
	mov rdi, [fd]					; set fd (file descriptor) of file to close
	syscall

	mov rax, 1						; set write system service call
	mov rdi, 1						; set fd
	mov rsi, buff					; set buffer
	mov rdx, [bytes_read]			; set byte count
	mov byte [rsi+rdx], 0x00		; add '\0' (NULL) to buffer end			
	syscall

	mov rax, 60
	mov rdi, [bytes_read]			; set bytes_read as exit code to check with 'echo $?'
	syscall
