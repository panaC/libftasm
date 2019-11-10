# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pleroux <pleroux@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/10 21:27:11 by pleroux           #+#    #+#              #
#    Updated: 2019/11/10 22:15:56 by pleroux          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; size_t		ft_strlen(const char *s)

segment .data ; initialized data

segment .bss ; unitialized data

segment .text
		global _ft_strlen

%define SIZE_MAX		0xFFFFFfFFF
%define SIZE_MAX_MINUS	SIZE_MAX - 1

_ft_strlen:
		enter			0, 0
		cld
		mov				rcx, SIZE_MAX
		mov				al, 0					; rax = 0
		repnz			scasb
		mov				rax, SIZE_MAX_MINUS
		sub				rax, rcx
		leave
		ret
