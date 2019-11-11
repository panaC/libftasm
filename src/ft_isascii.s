# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isascii.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pleroux <pleroux@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/11 16:13:52 by pleroux           #+#    #+#              #
#    Updated: 2019/11/11 16:19:56 by pleroux          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; int		ft_isascii(int c))

segment .data ; initialized data

segment .bss ; uninitialized data

segment .text
		global _ft_isascii

%define MIN				0
%define MAX				128
%define TRUE			1
%define FALSE			0

_ft_isascii:
		enter			0, 0
		mov				rax, rdi			; set c in rax return register

		cmp				rax, MIN
		jge				over
		jmp				nottrue

over:
		cmp				rax, MAX
		jle				istrue
		jmp				nottrue

istrue:
		mov				rax, TRUE
		jmp				return

nottrue:
		mov				rax, FALSE

return:										; return rax (c)
		leave
		ret

