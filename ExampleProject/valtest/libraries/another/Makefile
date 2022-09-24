SRC		=	sources/test.c

SRCDIR	=	sources
OBJDIR	=	objects

OBJ		=	$(SRC:$(SRCDIR)/%.c=$(OBJDIR)/%.o)

all:
	mkdir -p objects
	cc -I includes -Wall -Wextra -Werror -c $(SRC) -o $(OBJ)
	ar -rcs libtest.a $(OBJ)
