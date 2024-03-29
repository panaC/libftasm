# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_bzero.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pleroux <pleroux@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/10 15:52:42 by pleroux           #+#    #+#              #
#    Updated: 2019/11/10 21:27:19 by pleroux          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; void  ft_bzero(void *s, size_t n)

segment .data ; initialized data

segment .bss ; uninitialized data

segment .text
		global _ft_bzero

_ft_bzero:
		enter			0, 0
		cld							; clear DF
		mov				rcx, rsi	; assign n to the stosb counter
		xor				rax, rax	; set the value to 0
		rep				stosb		; store 0 while rcx > 0
		leave
		ret
	
