# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isdigit.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pleroux <pleroux@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/11 16:21:25 by pleroux           #+#    #+#              #
#    Updated: 2019/11/11 16:22:11 by pleroux          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; int			ft_isdigit(int c)

segment .data ; initialized data

segment .bss ; uninitialized data

segment .text
		global _ft_isdigit

%define MIN				48
%define MAX				57
%define TRUE			1
%define FALSE			0

_ft_isdigit:
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

