# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_cat.s                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pleroux <pleroux@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/11 21:52:25 by pleroux           #+#    #+#              #
;    Updated: 2019/11/29 18:26:44 by pleroux          ###   ########.fr        ;
#                                                                              #
# **************************************************************************** #

; void cat(int fd);

segment .data ; initialized data

segment .bss ; unitialized data

%define SYSCALL(rb)		0x2000000 | rb
%define STDOUT			1
%define WRITE			4
%define READ			3
%define SIZE			1000
%define STACK			SIZE

segment .text
		global _ft_cat

_ft_cat:
		enter			STACK, 0		; save rsp to pick up STACK bytes
		mov				r8, rdi			; save in stack fd
		cmp				r8d, 0
		jl				return

read:
		mov				rdi, r8			; read SIZE bytes to r9
		mov				rsi, rsp
		mov				rdx, SIZE
		mov				rax, SYSCALL(READ)
		syscall
		cmp				rax, 0
		jle				return			; jump to return if read return == -1
		mov				r10, rax		; save the number of byte read

write:
		mov				rdi, STDOUT		; write r10 byte read by 'read'
		mov				rsi, rsp
		mov				rdx, r10
		mov				rax, SYSCALL(WRITE)
		syscall
		cmp				rax, 0
		jg				read

return:
		leave
		ret

