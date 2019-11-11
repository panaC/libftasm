# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_tolower.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pleroux <pleroux@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/11 15:44:47 by pleroux           #+#    #+#              #
#    Updated: 2019/11/11 15:54:14 by pleroux          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; int			ft_tolower(int c)

segment .data ; initialized data

segment .bss ; uninitialized data

segment .text
		global _ft_tolower

%define MIN				65
%define MAX				90
%define ADD				32

_ft_tolower:
		enter			0, 0
		mov				rax, rdi			; set c in rax return register

		cmp				rax, MIN
		jge				over
		jmp				return

over:
		cmp				rax, MAX
		jle				tolower
		jmp				return

tolower:
		add				rax, ADD

return:										; return rax (c)
		leave
		ret


