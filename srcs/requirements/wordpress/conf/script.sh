#! /bin/bash

sleep 2
cd /var/www/wordpress
wp config create --dbname=mariadb --dbuser=mariadb_user --dbpass=mariadb_u_p --allow-root --dbhost=mariadb
sleep 2
wp core install --url=aatki.42.fr --allow-root  --title=aicha_website  --admin_user=aicha  --admin_password=aatki  --admin_email=aicha@gmail.com
wp user create 
/usr/sbin/php-fpm7.4 -F
