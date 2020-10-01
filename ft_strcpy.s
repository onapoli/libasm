# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: onapoli- <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/01 12:21:46 by onapoli-          #+#    #+#              #
#    Updated: 2020/10/01 13:42:58 by onapoli-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global ft_strcpy

section .text
ft_strcpy:
	push r12								; prologue. Creation of local variable
	mov rax, 0								; set i = 0
copy_loop:
	cmp byte [rsi + rax], 0x00				; if src[i] == '\0'
	je end									; jump to end tag
	mov r12, [rsi + rax]					; Assign src[i] value to local variable
	mov [rdi + rax], r12					; Copy local variable value to dest[i]
	inc rax									; i++;
	jmp copy_loop							; continue copy_loop
end:
	mov byte [rdi+rax], 0x00				; dest[i] = '\0'
	mov rax, rdi							; return *dest
	pop r12									; epilogue. Removal of local variable
	ret
