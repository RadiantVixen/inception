#! /bin/bash

wp config create --dbname=$mariaDB_DATABASE --dbuser=$mariaDB_USER --dbpass=$mariaDB_PASSWORD --allow-root --dbhost=mariadb
wp core install --url=aatki.42.fr --allow-root  --title=aicha_website  --admin_user=aicha  --admin_password=aatki  --admin_email=aicha@gmail.com

/usr/sbin/php-fpm7.4 -F

