#!/bin/sh

set -e

MYSQL_SETUP_FILE=/var/lib/mysql/.setup

chown -R 777 /var/lib/mysql/
chown -R mysql:mysql /var/lib/mysql/

service mariadb start

if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

if [ ! -e $MYSQL_SETUP_FILE ]; then
	mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE";
	mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'";
	# mysql -e "GRANT ALL ON *.* TO 'root'@'localhost' identifided by '$MYSQL_ROOT_PASSWORD'";
	mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%'";
	# mysql -e "ALTER USER '$MYSQL_ROOT'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'";
	mysql -e "FLUSH PRIVILEGES";
	# mysql $MYSQL_DATABASE -u$MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD
	# mysqladmin -u$MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD shutdown
	touch $MYSQL_SETUP_FILE
fi

exec mysqld --console