# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcmp.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: onapoli- <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/01 17:12:42 by onapoli-          #+#    #+#              #
#    Updated: 2020/10/02 11:38:03 by onapoli-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global ft_strcmp

section .text
ft_strcmp:
	push r12						; prologue
	mov rax, 0						; set i = 0
cmp_loop:
	mov r12b, [rdi + rax]			; assign s1[i] to r12b (r12 byte value) 
	cmp r12b, [rsi + rax]			; compare s1[i] and s2[i] 
	jl less							; jump to less tag if s1[i] < s2[i]
	cmp r12b, [rsi + rax]			; compare s1[i] and s2[i]
	jg greater						; jump to greater tag if s1[i] > s2[i]
	cmp byte [rdi + rax], 0x00		; compare s1[i] and '\0' (NULL)
	je equal						; jump to equal tag if s1[i] == '\0'
	inc rax							; increment i
	jmp cmp_loop					; continue cmp_loop
less:
	mov rax, -1						; set -1 as return value
	jmp end
greater:
	mov rax, 1						; set 1 as return value
	jmp end
equal:
	mov rax, 0						; set 0 as return value
	jmp end
end:
	pop r12							; epilogue
	ret
