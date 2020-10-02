# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcmp_main.s                                   :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: onapoli- <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/01 17:52:22 by onapoli-          #+#    #+#              #
#    Updated: 2020/10/02 11:21:18 by onapoli-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _start

extern ft_strcmp

section .data
	s1 db "Hello", 0x00
	s2 db "Hello", 0x00

section .text
_start:
	mov rdi, s1				; set ft_strcmp 1st argument
	mov rsi, s2				; set ft_strcmp 2nd srgument
	call ft_strcmp

	mov rdi, rax			; assign ft_strcmp return value to rdi
	mov rax, 60				; set exit system service code
	cmp rdi, 0				; compare ft_strcmp return value with 0
	jge exit				; if >= 0 jump to exit tag
	mov rdi, 2				; if negative, set exit code to 2, because exit codes are >= 0  
exit:
	syscall					; call exit system service and then check return value with 'echo $?'.
