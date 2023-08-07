#!/bin/sh

set -e

if [ ! -f /var/www/html/index.php ]; then
  chown -R www-data:www-data /var/www/html
  wp core download --locale=ko_KR --allow-root
  wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --allow-root
  wp core install --url=https://jaeywon.42.fr --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
  wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --role=author --allow-root
fi

exec "php-fpm7.4" "-F"