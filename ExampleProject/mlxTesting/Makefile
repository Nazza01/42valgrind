NAME		=	mlxTesting

SRC_DIR		=	sources
OBJ_DIR		=	objects
LIB_DIR		=	libraries

CFLAGS		=	-Wall -Wextra -Werror -std=c99 -g

# libft

# mlx


SRC			=	$(SRC_DIR)/main.c
OBJ			=	$(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)


UNAME_S		=	$(shell uname -s)

ifeq ($(UNAME_S),Linux)

MLX_SUBMAKE	=	$(LIB_DIR)/mlx_linux
MLX_LIB		:=	-lXext -lX11 $(shell find $(MLX_SUBMAKE) -name 'lib*.a' -not -name 'libmlx_Linux.a')
ALL_LIB		:=	$(shell find lib -name 'lib*.a' -not -path '*mlx*')
endif
ifeq ($(UNAME_S),Darwin)
MLX_SUBMAKE	=	$(LIB_DIR)/mlx_opengl
MLX_LIB		:=	-framework OpenGL -framework AppKit $(shell find $(MLX_SUBMAKE) -name 'lib*.a')
ALL_LIB		:=	$(shell find lib -name 'lib*.a' -not -path '*mlx*')
endif

CFLAGS		+=	-I lib/libft/includes
CFLAGS		+=	-I $(MLX_SUBMAKE)

ECHO		=	echo
VAL_NAME	=	testing
MKDIR		=	mkdir -p

all: makelib $(NAME)

makelib:
	$(MAKE) -C lib/libft
	$(MAKE) -C $(MLX_SUBMAKE)

$(OBJ): $(OBJ_DIR)/%.o : $(SRC_DIR)/%.c
	$(MKDIR) $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

$(NAME): $(OBJ)
	$(CC) -I lib/lbift/includes $(ALL_LIB) -o $@ $(OBJ) $(MLX_LIB)

clean:
	$(RM) -r $(OBJ_DIR) $(NAME)

re: clean all

attach:
	docker attach $(NAME)


dockerchk:
	docker stop $(NAME) || true && docker rm $(NAME) || true
	docker run --name $(NAME) --entrypoint=/bin/bash -dit livingsavage/42valgrind:v5
	open -a "XQuartz.app"
	xhost + 127.0.0.1
	docker cp $(SRC_DIR) $(NAME):/code/$(SRC_DIR)
	docker cp $(LIB_DIR) $(NAME):/code/$(LIB_DIR)
	docker cp Makefile $(NAME):/code/Makefile
	docker exec $(NAME) make

run: dockerchk
	docker exec $(NAME) ./$(NAME)

valgrind: dockerchk
	docker exec $(NAME) valgrind -- ./$(NAME)
