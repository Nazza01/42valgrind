# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    settings.mk                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/10 16:57:59 by Nathanael         #+#    #+#              #
#    Updated: 2022/09/06 17:17:44 by Nathanael        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

-include colors.mk

NAME 				=	libft.a

SRC_EXT				=	c
INC_EXT				=	h

SRC_DIR				=	sources
INC_DIR				=	includes
BLD_DIR				=	build

CC					=	gcc
CSTD				=	c99
CFLAGS				=	-Wall -Wextra -Werror -std=$(CSTD)

RUN_MSG				=	"READY"

COL_FINAL_MESSAGE	=	$(BACK_GREEN)$(TEXT_BLACK)
COL_FINAL_VAR		=	$(TEXT_GREEN)
