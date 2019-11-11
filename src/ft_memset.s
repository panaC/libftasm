# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_memset.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pleroux <pleroux@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/11 18:05:31 by pleroux           #+#    #+#              #
#    Updated: 2019/11/11 18:08:32 by pleroux          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; void *memset (void *s, int c, size_t n);

segment .data ; initialized data

segment .bss ; uninitialized data

segment .text
		global _ft_memset

_ft_memset:
		enter			0, 0
		mov				r8, rdi

		cld							; clear DF
		mov				rcx, rdx	; assign n to the stosb counter
		mov				rax, rsi	; set c
		rep				stosb		; store 0 while rcx > 0

		mov				rax, r8		; return s
		leave
		ret
	
