#!/bin/bash

mkdir -p /var/www/html

cd /var/www/html

rm -rf *

# Download the WP-CLI tool from the specified URL and save it as wp-cli.phar in the current directory
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

#Make the downloaded wp-cli.phar executable
chmod +x wp-cli.phar 

#Move wp-cli.phar to /usr/local/bin/wp so it can be executed from anywhere on the system
mv wp-cli.phar /usr/local/bin/wp

#Download the WordPress core files to the current directory
wp core download --allow-root

#Create the WordPress configuration file with the specified database details and path
wp config create --allow-root \
                 --dbname=$mariaDB_DATABASE \
                 --dbuser=$mariaDB_USER \
                 --dbpass=$mariaDB_PASSWORD \
                 --dbhost=mariadb

#Install WordPress with the specified URL, site title, admin username, password, email, and skipping email notifications
wp core install --url=$WP_URL/ \
                --title=$WP_TITLE \
                --admin_user=$WP_ADMIN \
                --admin_password=$WP_PWD \
                --admin_email=$EMAIL \
                --skip-email \
                --allow-root

# Create a new user with the specified username, email, role, and password
wp user create $WP_USER $WP_USER_EMAIL \
               --role=author \
               --user_pass=$WP_USER_PASSWORD \
               --allow-root

# Install and activate the WordPress theme named "astra"
wp theme install astra --activate --allow-root

# Modify the PHP-FPM configuration to change the listening address/port
sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

# Create the directory /run/php if it doesn't already exist
mkdir /run/php

# Start the PHP-FPM service
/usr/sbin/php-fpm7.4 -F
