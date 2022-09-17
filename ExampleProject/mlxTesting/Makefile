NAME	=	program

SRC_DIR	=	src
OBJ_DIR	=	obj
LIB_DIR	=	lib

SRC		=	$(SRC_DIR)/main.c
OBJ		=	$(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

CC			=	gcc
CFLAGS		=	-std=c99 -g

UNAME_S		=	$(shell uname -s)

ifeq ($(UNAME_S),Linux)
CFLAGS		+=	-I $(LIB_DIR)/mlx_linux
LDFLAGS		=	-L $(LIB_DIR)/mlx_linux -L /usr/lib
LLFLAGS		=	-lXext -lX11 -lmlx
MLX_SUBMAKE	=	$(LIB_DIR)/mlx_linux
endif
ifeq ($(UNAME_S),Darwin)
CFLAGS		+=	-I $(LIB_DIR)/mlx_opengl
LDFLAGS		=	-L $(LIB_DIR)/mlx_opengl
LLFLAGS		=	-l mlx -framework OpenGL -framework AppKit
MLX_SUBMAKE	=	$(LIB_DIR)/mlx_opengl
endif

ECHO		=	echo
VAL_NAME	=	testing
MKDIR		=	mkdir -p

all: mlx $(NAME)

ifeq ($(UNAME_S),Linux)
mlx:
	$(MAKE) -C $(MLX_SUBMAKE) -f Makefile.mk
	$(info $@ library linked and compiled)
endif
ifeq ($(UNAME_S),Darwin)
mlx:
	$(MAKE) -C $(MLX_SUBMAKE)
	$(info $@ library linked and compiled)
endif

$(OBJ): $(OBJ_DIR)/%.o : $(SRC_DIR)/%.c
	$(MKDIR) $(@D)
	$(CC) $(CFLAGS) -c $< -o $@
	$(info $< compiled to $@)

$(NAME): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $(OBJ) $(LDFLAGS) $(LLFLAGS)

clean:
	$(RM) -r $(OBJ_DIR) $(NAME)

re: clean all

attach:
	docker attach $(NAME)

dockerchk:
	docker stop $(NAME) || true && docker rm $(NAME) || true
	
container: dockerchk
	$(info Pulling docker container)
	docker run --name $(NAME) --entrypoint=/bin/bash -dit livingsavage/42valgrind:v4
	$(info Copying files to container)
	docker cp $(SRC_DIR) $(NAME):/code/$(SRC_DIR)
	docker cp $(LIB_DIR) $(NAME):/code/$(LIB_DIR)
	docker cp Makefile $(NAME):/code/Makefile
	$(info Executing make inside container)
	docker exec $(NAME) make
	$(info Ready to run, type ./$(NAME) to run)
	docker attach $(NAME)

valgrind: dockerchk
	$(info Pulling docker container)
	docker run --name $(NAME) --entrypoint=/bin/bash -dit livingsavage/42valgrind:v4
	$(info Copying files to container)
	docker cp $(SRC_DIR) $(NAME):/code/$(SRC_DIR)
	docker cp $(LIB_DIR) $(NAME):/code/$(LIB_DIR)
	docker cp Makefile $(NAME):/code/Makefile
	$(info Executing make inside container)
	docker exec $(NAME) make
	$(info Executing valgrind inside container)
	docker exec $(NAME) valgrind -- ./$(NAME)
