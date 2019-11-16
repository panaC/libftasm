# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_cat.s                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pleroux <pleroux@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/11 21:52:25 by pleroux           #+#    #+#              #
#    Updated: 2019/11/16 15:10:22 by pleroux          ###   ########.fr        #
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

segment .text
		global _ft_cat
		extern _malloc

_ft_cat:
		enter			8, 0			; save rsp to pick up 2 bytes
		push			rdi				; save in stack fd

		mov				rdi, SIZE		; malloc 1000 bytes
		call			_malloc
		test			rax, rax
		je				return

		pop				r8				; save data before loop, r8 = fd
		mov				r9, rax			; save malloc ptr in r9

read:
		mov				rdi, r8			; read SIZE bytes to r9
		mov				rsi, r9
		mov				rdx, SIZE
		mov				rax, SYSCALL(READ)
		syscall
		cmp				rax, -1
		je				return			; jump to return if read return == -1
		mov				r10, rax		; save the number of byte read

write:
		mov				rdi, STDOUT		; write r10 byte read by 'read'
		mov				rsi, r9
		mov				rdx, r10
		mov				rax, SYSCALL(WRITE)
		syscall
		cmp				rax, -1
		je				return

eof:
		cmp				r10, SIZE		; if number of byte read == SIZE
		je				read			;    jump to read

return:
		leave
		ret

