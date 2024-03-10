#!/bin/bash

mkdir -p /var/www/html

cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

chmod +x wp-cli.phar 

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

wp config create --allow-root \
                 --dbname=$mariaDB_DATABASE \
                 --dbuser=$mariaDB_USER \
                 --dbpass=$mariaDB_PASSWORD \
                 --dbhost=mariadb

wp core install --url=$WP_URL/ \
                --title=$WP_TITLE \
                --admin_user=$WP_ADMIN \
                --admin_password=$WP_PWD \
                --admin_email=$EMAIL \
                --skip-email \
                --allow-root

wp user create $WP_USER $WP_USER_EMAIL \
               --role=author \
               --user_pass=$WP_USER_PASSWORD \
               --allow-root

wp theme install astra --activate --allow-root

mkdir /run/php

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

/usr/sbin/php-fpm7.4 -F
