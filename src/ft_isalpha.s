# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isalpha.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pleroux <pleroux@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/11 16:38:08 by pleroux           #+#    #+#              #
#    Updated: 2019/11/11 17:08:32 by pleroux          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; int				ft_isalpha(int c)

segment .data ; initialized data

segment .bss ; uninitialized data

segment .text
		global _ft_isalpha
		extern _ft_isupper
		extern _ft_islower

%define TRUE			1
%define FALSE			0

_ft_isalpha:
		enter			0, 0
		call			_ft_isupper
		cmp				rax, TRUE
		je				return
		call			_ft_islower

return:										; return rax (c)
		leave
		ret

