#!/bin/bash

sed -i "s/bind-address            = 127.0.0.1/bind_address = 0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb start

sleep 5;

mariadb -e "CREATE DATABASE IF NOT EXISTS $mariaDB_DATABASE;"
mariadb -e "CREATE USER IF NOT EXISTS $mariaDB_USER IDENTIFIED BY '$mariaDB_PASSWORD';"
mariadb -e "GRANT ALL PRIVILEGES ON $mariaDB_DATABASE.* TO $mariaDB_USER;"
mariadb -e "FLUSH PRIVILEGES;"

service mariadb stop;

mysqld_safe
