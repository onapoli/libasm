# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: onapoli- <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/02 11:41:07 by onapoli-          #+#    #+#              #
#    Updated: 2020/10/03 11:27:20 by onapoli-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global ft_strdup

extern malloc

section .text
ft_strdup:
	push r10					; prologue
	push r11					; prologue
	mov rax, 0					; init counter
len_loop:
	cmp byte [rdi + rax], 0x00	; compare each byte with '\0' (NULL)
	je next						; if equal, jump to next tag
	inc rax						; if not equal, increment rax
	jmp len_loop				; continue len_loop
next:
	inc	rax						; add 1 to rax value (byte count) in order to add space for '\0' 
	push rdi					; save current rdi value (reference to array of bytes to be duplicated) in the stack
	mov rdi, rax				; assign byte count value to rdi
	call malloc					; call malloc with number of bytes to allocate as argument (rdi)

	cmp rax, 0x00				; compare malloc return value with '\0' (NULL)
	je end						; if equal, jump to end tag and return ft_strdup with '\0' (NULL) value
	mov r11, 0					; init counter
	pop rdi						; recover rdi previous value (reference to array of bytes to be duplicated) saved in the stack
dup_loop:
	mov r10b, byte [rdi + r11]	; assign 1st array element to be duplicated to byte space of r10 (r10b)
	mov byte [rax + r11], r10b	; assign 1st array element to be duplicated to 1st empty allocated array element
	cmp byte [rdi + r11], 0x00	; compare array element to be duplicated with '\0' (NULL)
	je end						; jump to end tag if == '\0'
	inc r11						; increment counter
	jmp dup_loop				; continue dup_loop
end:
	pop r11						; epilogue in reverse order of prologue
	pop r10						; epilogue in reverse order of prologue
	ret							; rax contains ft_strdup return value, which is a reference to the duplicate array

