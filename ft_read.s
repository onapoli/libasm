# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_read.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: onapoli- <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/30 16:53:03 by onapoli-          #+#    #+#              #
#    Updated: 2020/09/30 16:53:05 by onapoli-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global ft_read

section .text
ft_read:
	mov rax, 0	; set read system service
	syscall

	ret			; rax recibe el número de caracteres leídos automáticamente, o negativo en caso de error
	
