NAME = inception

all: $(NAME)

$(NAME): up

prepare:
	sudo mkdir -p /home/prrattan/data/wordpress
	sudo mkdir -p /home/prrattan/data/mariadb
	sudo -- sh -c 'grep -qxF "127.0.0.1 prrattan.42.fr" /etc/hosts || \
		echo "127.0.0.1 prrattan.42.fr" >> /etc/hosts'

up: prepare
	docker compose -f srcs/docker-compose.yml up -d --build

down:
	docker compose -f srcs/docker-compose.yml down -v

logs:
	docker compose -f srcs/docker-compose.yml logs

prune:
	docker system prune -a

clean: down
	@ if [ -n "$$(docker ps -qa)" ]; then \
		docker rm -f $$(docker ps -qa); \
	fi
	@ if [ -n "$$(docker images -qa)" ]; then \
		docker rmi -f $$(docker images -qa); \
	fi
	sudo rm -rf /home/prrattan/data/wordpress
	sudo rm -rf /home/prrattan/data/mariadb

fclean: clean prune

re: fclean all

.PHONY: all clean fclean re prepare up down logs prune
