# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_memcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pleroux <pleroux@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/11 18:09:10 by pleroux           #+#    #+#              #
#    Updated: 2019/11/11 19:32:46 by pleroux          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; void *memcpy(void *dest, const void *src, size_t n);

segment .data ; initialized data

segment .bss ; unitialized data

segment .text
		global _ft_memcpy
		extern _ft_strlen

_ft_memcpy:
		enter			0, 0
		mov				r8, rdi			; save dest ptr

		mov				rcx, rdx		; set rcx = n
		cld

		rep				movsb			; load and store while rcx > 0
										; dest = src

		mov				rax, r8			; return dest
		leave
		ret
