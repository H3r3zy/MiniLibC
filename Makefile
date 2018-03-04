##
## EPITECH PROJECT, 2018
## ASM_minilibc_2017
## File description:
## created by sahel.lucas-saoudi@epitech.eu
##

NAME	=	libasm.so

SRC	=	src/strlen.S	\
		src/strchr.S	\
		src/memset.S	\
		src/memcpy.S	\
		src/strcmp.S	\
		src/memmove.S	\
		src/strncmp.S	\
		src/strcasecmp.S	\
		src/rindex.S	\
		src/strstr.S	\
		src/strpbrk.S	\
		src/strcspn.S

OBJ	=	$(SRC:.S=.o)

all:	$(NAME)

%.o: %.S
	nasm -o $@ $< -f elf64

$(NAME): $(OBJ)
	gcc -shared -o $(NAME) $(OBJ)

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re:	fclean all

.PHONY:	all clean fclean re
