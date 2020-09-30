global ft_strlen

section .text
ft_strlen:
	mov rax, 0			; init counter
len_loop:
	cmp byte [rdi + rax], 0x00	; compare each byte with '\0'
	je end				; if equal jump to end tag
	inc rax				; if not equal increment rax
	jmp len_loop			; continue len_loop
end:
	ret
