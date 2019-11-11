# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isupper.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pleroux <pleroux@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/11 16:17:32 by pleroux           #+#    #+#              #
#    Updated: 2019/11/11 17:12:17 by pleroux          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; int			ft_isupper(int c)

segment .data ; initialized data

segment .bss ; uninitialized data

segment .text
		global _ft_isupper

%define MIN				65
%define MAX				90
%define TRUE			1
%define FALSE			0

_ft_isupper:
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

