NAME		=	progname
VAL_NAME	=	ex00
ECHO		=	echo
SRC_DIR		=	src
LIB_DIR		=	lib

valgrind:
	$(info "Pulling docker container")
	docker run --name $(NAME) -dit livingsavage/42valgrind:v4
	$(info "Copying files to container")
	docker cp $(SRC_DIR) $(NAME):/code/src
	docker cp $(LIB_DIR) $(NAME):/code/lib
	docker cp Makefile $(NAME):/code/Makefile
	$(info "Executing make inside container")
	docker exec $(NAME) make
	$(info "Executing valgrind inside container")
	docker exec $(NAME) valgrind -- ./$(NAME)
	$(info "Stopping and removing container")
	docker stop $(NAME) || true && docker rm $(NAME) || true