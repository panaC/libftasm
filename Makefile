# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pleroux <pleroux@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/10 16:01:44 by pleroux           #+#    #+#              #
#    Updated: 2019/11/10 22:09:10 by pleroux          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


SRC_DIR=./src
OBJ_DIR=./obj

CC=gcc
ASM=nasm
NAME=libfts.a
TEST=test

CFLAGS		= -Wall -Wextra -Werror -g -fsanitize=address

SRC_FILE	= ft_bzero.s \
			  ft_strcpy.s \
			  ft_strlen.s \
			  ft_strcat.s \

SRC			= $(addprefix $(SRC_DIR), $(SRC_FILE))
OBJ			= $(addprefix $(OBJ_DIR)/,$(SRC_FILE:.s=.o))

all: $(OBJ_DIR) $(NAME)

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(OBJ_DIR)/%.o:$(SRC_DIR)/%.s
	$(ASM) -f macho64 $< -o $@

$(NAME): $(OBJ)
	ar rc $(NAME) $(OBJ)
	ranlib $(NAME)

clean	:
	rm -rf $(OBJ) $(TEST) $(NAME)
	rm -rf $(OBJ_DIR)

fclean	: clean
	rm -f $(NAME) $(TEST)

re		: clean all

test: $(OBJ_DIR) $(NAME)
	$(CC) -c main.c -o main.o
	$(CC) $(CFLAGS) -o $(TEST) $(OBJ) main.o
	./test

.PHONY	: all clean re fclean test