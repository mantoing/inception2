NAME = inception

VOLUME_PATH		:= /Users/jaeywon/inception2/inception/srcs/req/volume
HOST_LINK	:= "127.0.0.1	jaeywon.42.fr" > /etc/hosts

all		:	$(NAME)

$(NAME)	:
	@mkdir -p $(VOLUME_PATH)/mariadb/
	@mkdir -p $(VOLUME_PATH)/wordpress/
	@docker-compose -f ./srcs/docker-compose.yml up --build -d

up		:
	@docker-compose -f ./srcs/docker-compose.yml up -d

down	:
	@docker-compose -f ./srcs/docker-compose.yml down

clean	:
	@docker-compose -f ./srcs/docker-compose.yml down --rmi all --volumes

fclean	: clean
	@docker system prune -a
	@rm -rf $(VOLUME_PATH)

re	: fclean all

.PHONY	: all down clean fclean re