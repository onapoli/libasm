# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcpy_main.s                                   :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: onapoli- <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/01 13:12:17 by onapoli-          #+#    #+#              #
#    Updated: 2020/10/01 13:24:45 by onapoli-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _start

extern ft_strcpy

section .data
	src db "Hola", 0x0a, 0x00
	src_len equ $-src

section .bss
	dest resb 6

section .text
_start:
	mov rdi, dest
	mov rsi, src
	call ft_strcpy

	mov rsi, rax
	mov rax, 1
	mov rdi, 1
	mov rdx, src_len
	syscall
	
	mov rax, 60
	mov rdi, 0
	syscall
	