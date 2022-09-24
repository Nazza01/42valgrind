NAME		=	valtest

IS_DOKR_RUN	=	$(shell ps aux | grep -v grep | grep -ci "Docker.app")
IS_CONT_RUN	=	$(shell docker container inspect -f '{{.State.Running}}' $(NAME) 2>/dev/null)
CONT_STATUS	=	$(shell docker container inspect -f '{{.State.Status}}' $(NAME) 2>/dev/null)


SRCDIR		=	sources
OBJDIR		=	objects
LIBDIR		=	libraries

CFLAGS		=	-Wall -Wextra -Werror -std=c99

# libft
CFLAGS		+=	-I $(LIBDIR)/libft/includes
LDFLAGS		+=	-L $(LIBDIR)/libft
LLFLAGS		+=	-lft

# another library - example
CFLAGS		+=	-I $(LIBDIR)/another/includes
LDFLAGS		+=	-L $(LIBDIR)/another
LLFLAGS		+=	-ltest

SRC			=	$(SRCDIR)/main.c
OBJ			=	$(SRC:$(SRCDIR)/%.c=$(OBJDIR)/%.o)

.SILENT:

all: $(NAME) | lib

lib:
	$(MAKE) -C $(LIBDIR)/libft all
	$(MAKE) -C $(LIBDIR)/another all

$(OBJDIR):
	mkdir -p $(OBJDIR)

$(OBJ): $(OBJDIR)/%.o : $(SRCDIR)/%.c | $(OBJDIR)
	$(CC) $(CFLAGS) $(IFLAGS) -c $(SRC) -o $(OBJ)

$(NAME): $(OBJ)
	$(CC) $(OBJ) $(LDFLAGS) $(LLFLAGS) -o $(NAME)

clean:
	rm -rf $(OBJDIR) valtest

attach:
	docker attach valtest

# printf "$(NAME) is not running\n"; \
# 			printf "Starting up container...\n"; \
# 		printf "$(NAME) has exited\n"; \
# 		docker start $(NAME); \
# 	fi \
# elif [ "$(IS_CONT_RUN)" == "No such container: $(NAME)" ]; then \
# 	printf "$(NAME) container not found, starting a new container\n"; \
# fi \

dockercheck:
	if [ $(IS_DOKR_RUN) -gt 0 ]; then \
		printf "Docker is running\n"; \
		if [ "$(IS_CONT_RUN)" = "true" ]; then \
			printf "$(NAME) container is running, proceeding\n"; \
		else \
			printf "$(NAME) container is not running\n"; \
			docker run --name $(NAME) --entrypoint=/bin/bash -dit livingsavage/42valgrind:v5 2>/dev/null; \
			if [ "$(CONT_STATUS)" == "exited" ]; then \
				printf "Container has exited, re-starting container\n"; \
				docker start $(NAME); \
			fi \
		fi \
	else \
		printf "Docker is not running, Opening Docker"; \
		open -a "Docker.app"; \
		sleep 8; \
	fi

copytodocker: dockercheck
	$(info Copying files to container)
	docker cp $(LIBDIR) valtest:/code/$(LIBDIR)
	docker cp $(SRCDIR) valtest:/code/$(SRCDIR)
	docker cp Makefile valtest:/code/Makefile
	$(info Executing make inside container)
	docker exec valtest make

container: copytodocker
	$(info attaching)
	docker attach valtest

valgrind: copytodocker
	$(info checking valgrind)
	docker exec valtest valgrind -- ./valtest
