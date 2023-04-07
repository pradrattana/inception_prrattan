NAME = inception

all: $(NAME)

$(NAME): prepare up

prepare:
	mkdir -p /home/prrattan/data/wordpress
	mkdir -p /home/prrattan/data/mariadb
	cd srcs

up: prepare
	docker-compose up

build: prepare
	docker-compose build

clean:
	rm -rf /home/prrattan/data/wordpress
	rm -rf /home/prrattan/data/mariadb

fclean: clean

re: fclean all

.PHONY: all clean fclean re prepare
