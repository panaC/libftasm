# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isprint.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pleroux <pleroux@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/11 15:51:06 by pleroux           #+#    #+#              #
#    Updated: 2019/11/11 16:13:41 by pleroux          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; int			ft_isprint(int c)

segment .data ; initialized data

segment .bss ; uninitialized data

segment .text
		global _ft_isprint

%define MIN				32
%define MAX				126
%define TRUE			1
%define FALSE			0

_ft_isprint:
		enter			0, 0
		mov				rax, rdi			; set c in rax return register

		cmp				rax, MIN
		jge				over
		jmp				notprint

over:
		cmp				rax, MAX
		jle				isprint
		jmp				notprint

isprint:
		mov				rax, TRUE
		jmp				return

notprint:
		mov				rax, FALSE

return:										; return rax (c)
		leave
		ret

