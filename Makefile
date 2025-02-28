# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dbekic <dbekic@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/05 13:42:29 by irifarac          #+#    #+#              #
#    Updated: 2024/05/15 11:13:05 by irifarac         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#Colores
RED = \033[0;31m
GREEN = \033[0;32m
RESET = \033[0m

NAME = philo
CFLAGS = -Wall -Werror -Wextra -MMD -fsanitize=thread

# Folders
OBJDIR = obj
SRCDIR = ./

# Files
SRC = src/ft_error.c \
	  src/ft_utils.c \
	  src/ft_set_param.c \
	  src/ft_start.c \
	  src/ft_routine.c \
	  src/ft_print.c \
	  src/ft_one.c \
	  src/main.c

OBJ = $(SRC:%.c=$(OBJDIR)/%.o)

DEPENDS = $(patsubst %.c, %.d, $(SRC))

all: $(NAME)

#incluir dependencias
-include $(DEPENDS)
$(NAME): $(OBJ) include/philo.h
	@echo "$(GREEN)Creando ejecutable 🛠 $@ $(RESET)"
	gcc $(CFLAGS) $(OBJ) -lpthread -o $@
	@rm -f minishell.d
	@echo "$(GREEN)Compilado ✅ $@ $(RESET)"

$(OBJDIR)/%.o: $(SRCDIR)/%.c include/philo.h Makefile
	@echo "$(GREEN)Compilando $< de $@ $(RESET)"
	@mkdir -p $(@D)
	gcc $(CFLAGS) -o $@ -c $<

clean:
ifneq ("$(wildcard $(OBJ) $(DEPENDS) $(OBJDIR))", "")
	rm -f $(OBJ) $(DEPENDS)
	rm -rf $(OBJDIR)
	@echo "$(GREEN)Objetos borrados$(RESET)"
else
	@echo "$(RED)Los objetos no existen, no se borra$(RESET)"
endif

fclean:	clean
ifneq ("$(wildcard $(NAME))", "")
	rm -f $(NAME)
	@echo "$(GREEN)Ejecutables borrados$(RESET)"
else
	@echo "$(RED)Los ejecutables no existen, no se borra$(RESET)"
endif

re: fclean all

.PHONY: all clean fclean re
