##
## EPITECH PROJECT, 2023
## 02-PDG-300
## File description:
## Makefile
##

CC	=	ghc

SRC_MAIN	=	src/Main.hs	\

SRC	=	src/Parser/ErrorHandling.hs	\
	src/Operations.hs	\
	src/Compiler.hs	\
	src/Sort.hs

SRC_TEST	=	test/TestErrorHandling.hs	\
	test/TestMain.hs	\
	test/TestCompiler.hs	\
	test/TestOperations.hs	\

NAME	=	pushswap_checker

NAME_TESTS	=	unit_test

all: $(NAME)
.PHONY:	all

$(NAME):
	$(CC) -o $(NAME) $(SRC_MAIN) $(SRC)

clean:
	@find -name *.hi -delete
	@find -name *.o -delete
.PHONY:	clean

fclean:	clean
	@rm -f $(NAME)
	@rm -f $(NAME_TESTS)
	@find -name $(NAME_TESTS).tix -delete
.PHONY:	fclean

tests_run: fclean
	$(CC) -o $(NAME_TESTS) -fhpc $(SRC_TEST) $(SRC)
	@./$(NAME_TESTS)
	@mv $(NAME_TESTS).tix test/coverage
.PHONY:	tests_run

re:	fclean all
.PHONY: re
