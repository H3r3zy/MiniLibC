##
## EPITECH PROJECT, 2018
## ASM_minilibc_2017
## File description:
## created by sahel.lucas-saoudi@epitech.eu
##

NAME	=	libasm.so

SRC	=	src/base/strlen.S	\
		src/search/strchr.S	\
		src/base/memset.S	\
		src/base/memcpy.S	\
		src/cmp/strcmp.S	\
		src/base/memmove.S	\
		src/cmp/strncmp.S	\
		src/cmp/strcasecmp.S	\
		src/base/rindex.S	\
		src/search/strstr.S	\
		src/search/strpbrk.S	\
		src/base/strcspn.S

OBJ	=	$(SRC:.S=.o)

all:	$(NAME)

%.o: %.S
	nasm -o $@ $< -f elf64

$(NAME): $(OBJ)
	gcc -shared -static-libgcc -nostdlib -fno-builtin -o $(NAME) $(OBJ)

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re:	fclean all

.PHONY:	all clean fclean re
