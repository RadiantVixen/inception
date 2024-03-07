#! /bin/bash

service mariadb start

mysql -e "CREATE DATABASE IF NOT EXISTS \`${mariaDB_DATABASE}\`;"  \
&& mysql -e "CREATE USER IF NOT EXISTS \`${mariaDB_USER}\`@'%' IDENTIFIED BY '${mariaDB_PASSWORD}';" \
&& mysql -e "GRANT ALL PRIVILEGES ON \`${mariaDB_DATABASE}\`.* TO \`${mariaDB_USER}\`@'%' IDENTIFIED BY '${mariaDB_PASSWORD}';" \
&& mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${mariaDB_ROOT_PASSWORD}';" \
&& mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$mariaDB_ROOT_PASSWORD shutdown

mysqld_safe
