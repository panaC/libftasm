# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcat.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pleroux <pleroux@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/11 14:50:06 by pleroux           #+#    #+#              #
#    Updated: 2019/11/11 15:03:28 by pleroux          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


; char			*ft_strcat(char *dest, const char *src)

segment .data ; initialized data

segment .bss ; unitialized data

segment .text
		global _ft_strcat
		extern _ft_strlen

_ft_strcat:
		enter			0, 0
		mov				r8, rdi			; save dest ptr

		mov				rdi, rsi		; prepare call strlen(src)
		call			_ft_strlen
		mov				r10, rax		; save in r10 the length of src
		inc				r10				; add '\0' char

		mov				rdi, r8			; prepare call strlen(dest)
		call			_ft_strlen
		mov				r11, rax		; save in r11 the length of dest

		mov				rdi, r8			; rdi = r8 because updated by strlen
		add				rdi, r11		; set dest ptr at the end of string
		mov				rcx, r10		; set rcx counter to strlen(src)
		cld

		rep				movsb			; load and store while rcx > 0
										; dest + strlen(dest) = src
										; in one line copy and save on
										; each string char

		mov				rax, r8			; return dest
		leave
		ret
