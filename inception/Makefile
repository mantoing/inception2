NAME = inception

VOLUME_PATH		:= /home/jaeywon/data
# HOST_LINK	:= "127.0.0.1	jaeywon.42.fr" > /etc/hosts

all		:	$(NAME)

$(NAME)	:
	@sudo mkdir -p $(VOLUME_PATH)/mariadb/
	@sudo mkdir -p $(VOLUME_PATH)/wordpress/
	@sudo docker-compose -f ./srcs/docker-compose.yml up --build -d

up		:
	@sudo docker-compose -f ./srcs/docker-compose.yml up -d

down	:
	@sudo docker-compose -f ./srcs/docker-compose.yml down

clean	:
	@sudo docker-compose -f ./srcs/docker-compose.yml down --rmi all --volumes

fclean	: clean
	@sudo docker system prune -a
	@sudo rm -rf $(VOLUME_PATH)

re	: fclean all

.PHONY	: all down clean fclean re