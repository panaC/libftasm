# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pleroux <pleroux@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/11 19:54:12 by pleroux           #+#    #+#              #
#    Updated: 2019/11/11 21:24:21 by pleroux          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; char		*ft_strdup(const char *src)

segment .data ; initialized data

segment .bss ; unitialized data

segment .text
		global _ft_strdup
		extern _malloc
		extern _ft_strlen
		extern _ft_memcpy

_ft_strdup:
		enter			16, 0
		push			rdi			; save dest ptr

		call			_ft_strlen
		mov				r11, rax		; save in r11 the length of src
		inc				r11				; add '\0'
		push			r11

		mov				rdi, r11		; call malloc with length r11
		call			_malloc
		test			rax, rax
		je				error
		
		pop				rdx
		pop				rsi
		mov				rdi, rax		; copy data from src to new malloc
		;mov				rsi, r8,
		;mov				rdx, r11
		call			_ft_memcpy

return:
		leave
		ret

error:
		mov				rax, 0
		jmp				return

