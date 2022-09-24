# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Nathanael <nervin@student.42adel.org.au    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/01 20:23:35 by Nathanael         #+#    #+#              #
#    Updated: 2022/09/06 17:23:39 by Nathanael        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

include conf/colors.mk
include conf/settings.mk
include conf/functs.mk

################################################################################
#						Files/Folders & Libraries							   #
################################################################################

SRCS		=	$(shell find $(SRC_DIR) -name '*.$(SRC_EXT)')
OBJS		=	$(SRCS:$(SRC_DIR)/%.$(SRC_EXT)=$(BLD_DIR)/%.o)
DEPS		=	$(OBJS:%.o=%.d)

MAKEFLAGS	+=	--no-print-directory

################################################################################
#								Utilities									   #
################################################################################

MKDIR		=	mkdir -p
CP			=	cp

################################################################################
#								Make Rules									   #
################################################################################

.PHONY: all clean fclean re
.SILENT:

ifeq ($(SILENT_SUBMAKE),0)
all: $(NAME)
	$(call printout,$(COL_FINAL_MESSAGE),$(RUN_MSG),$(COL_FINAL_VAR),$(NAME))
endif

all: $(NAME)

$(NAME): $(OBJS)
	$(AR) -rcs $@ $^
	ranlib $@

clean:
	$(RM) $(NAME)

fclean:
	$(RM) -r $(BLD_DIR)

re: clean fclean all

-include $(DEPS)

$(OBJS): $(BLD_DIR)/%.o : $(SRC_DIR)/%.$(SRC_EXT)
	$(MKDIR) $(@D)
	$(CC) $(CFLAGS) -I $(INC_DIR) -c -o $@ $<
