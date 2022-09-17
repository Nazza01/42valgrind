NAME	=	program

SRC_DIR	=	src
OBJ_DIR	=	obj

SRC		=	$(SRC_DIR)/main.c
OBJ		=	$(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

CC			=	gcc
CFLAGS		=	-std=c99 -g

ECHO		=	echo
MKDIR		=	mkdir -p

all: $(NAME)

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
	docker cp Makefile $(NAME):/code/Makefile
	$(info Executing make inside container)
	docker exec $(NAME) make
	$(info Executing valgrind inside container)
	docker exec $(NAME) valgrind -- ./$(NAME)
