# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_puts.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pleroux <pleroux@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/11 17:40:05 by pleroux           #+#    #+#              #
#    Updated: 2019/11/11 18:00:56 by pleroux          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


; int puts(const char *s);

segment .data ; initialized data
		eol		db		10

segment .bss ; unitialized data

%define SYSCALL(rb)		0x2000000 | rb
%define STDOUT			1
%define WRITE			4

segment .text
		global _ft_puts
		extern _ft_strlen

_ft_puts:
		enter			0, 0
		mov				r8, rdi			; save s ptr

		call			_ft_strlen
		mov				r9, rax			; save strlen(s)

		mov				rdi, STDOUT
		mov				rsi, r8
		mov				rdx, r9
		mov				rax, SYSCALL(WRITE)
		syscall

		mov				rdi, STDOUT
		mov				rsi, eol
		mov				rdx, 1
		mov				rax, SYSCALL(WRITE)
		syscall

		mov				rax, 10
		leave
		ret
