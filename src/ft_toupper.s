# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_toupper.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pleroux <pleroux@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/11 15:11:41 by pleroux           #+#    #+#              #
#    Updated: 2019/11/11 15:42:54 by pleroux          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; int			ft_toupper(int c)

segment .data ; initialized data

segment .bss ; uninitialized data

segment .text
		global _ft_toupper

%define MIN				97
%define MAX				122
%define SUB				32

_ft_toupper:
		enter			0, 0
		mov				rax, rdi			; set c in rax return register

		cmp				rax, MIN
		jge				over
		jmp				return

over:
		cmp				rax, MAX
		jle				toupper
		jmp				return

toupper:
		sub				rax, SUB

return:										; return rax (c)
		leave
		ret


