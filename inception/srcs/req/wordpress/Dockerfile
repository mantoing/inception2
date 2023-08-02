FROM	debian:bullseye

RUN		apt-get update -y && \
		apt-get upgrade -y && \
		apt-get -y install mariadb-client wget curl tar php7.4-fpm php-cli php-mysql vim sudo

COPY	./tools/wordpress_setup.sh /tmp/wordpress_setup.sh
COPY	./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf


WORKDIR	/var/www/html
RUN		mkdir -p /run/php

EXPOSE	9000

ENTRYPOINT ["sh", "/tmp/wordpress_setup.sh"]