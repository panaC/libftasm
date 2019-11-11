# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isalnum.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pleroux <pleroux@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/11 16:15:37 by pleroux           #+#    #+#              #
#    Updated: 2019/11/11 16:45:14 by pleroux          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; int			ft_isalnum(int c)

segment .data ; initialized data

segment .bss ; uninitialized data

segment .text
		global _ft_isalnum
		extern _ft_isalpha
		extern _ft_isdigit

%define TRUE			1
%define FALSE			0

_ft_isalnum:
		enter			0, 0
		call			_ft_isalpha
		cmp				rax, TRUE
		je				return
		call			_ft_isdigit

return:										; return rax (c)
		leave
		ret
