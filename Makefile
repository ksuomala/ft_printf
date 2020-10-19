# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ksuomala <ksuomala@student.hive.com>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/06/09 11:51:40 by ksuomala          #+#    #+#              #
#    Updated: 2020/10/16 18:39:04 by ksuomala         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# -*- Makefile -*-

SRCS = add_to_buffer.c add.c check_g.c d.c ft_e.c ft_printf.c get_double.c\
modify_g.c parse.c type.c ft_fail.c conv_to_out.c

CC = gcc -Wall -Wextra -Werror -c -g

OBJS = $(addprefix $(OBJ_DIR)/, $(SRCS:.c=.o))

SRCS_DIR = srcs/

OBJ_DIR = obj

LIB_DIR = srcs/libft/

LIB = libft.a

INCL = -I includes/

NAME = libftprintf.a

all: $(NAME)

$(NAME): $(OBJS)
	@ar rcs $(NAME) $(OBJS)
	@ranlib $(NAME)

$(OBJS): $(OBJ_DIR)/ $(addprefix $(SRCS_DIR), $(SRCS))
	@make -C $(LIB_DIR)
	@cp $(LIB_DIR)$(LIB) $(NAME)
	@cp $(LIB_DIR)libft.h includes/
	@$(CC) $(addprefix $(SRCS_DIR), $(SRCS)) $(INCL)
	@mv $(SRCS:.c=.o) $(OBJ_DIR)/

$(OBJ_DIR):
	@mkdir $(OBJ_DIR)

clean:
	@rm -f $(OBJS)
	@make clean -C srcs/libft/

fclean: clean
	@rm -rf libftprintf.a test.dSYM
	@make fclean -C srcs/libft/

re: fclean all

PHONY: all, clean, fclean, re