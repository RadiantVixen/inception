#! /bin/bash

service mariadb start

mariadb -e "CREATE DATABASE IF NOT EXISTS \`${mariaDB_DATABASE}\`;"
mariadb -e "CREATE USER IF NOT EXISTS \`${mariaDB_USER}\`@'%' IDENTIFIED BY '${mariaDB_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON \`${mariaDB_DATABASE}\`.* TO \`${mariaDB_USER}\`@'%' IDENTIFIED BY '${mariaDB_PASSWORD}';"
mariadb -e "ALTER USER 'root'@'%' IDENTIFIED BY '${mariaDB_ROOT_PASSWORD}';" \
mariadb -e "FLUSH PRIVILEGES;"

service mariadb stop;

mysqld_safe
