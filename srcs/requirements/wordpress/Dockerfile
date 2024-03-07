FROM debian:bullseye

RUN apt-get update && apt-get install -y wget

RUN apt-get install -y php7.4\
						php-fpm\
						php-mysql\
						mariadb-client

ENV mariaDB_DATABASE=mariadb
ENV mariaDB_USER=mariadb_user
ENV mariaDB_PASSWORD=mariadb_u_p
ENV mariaDB_ROOT_PASSWORD =mariadb_r_p

RUN service php7.4-fpm start

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

RUN sed -i 's/^listen = .*/listen = wordpress:9000/' /etc/php/7.4/fpm/pool.d/www.conf
RUN service php7.4-fpm restart

RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN		chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp
COPY ./conf/script.sh /
RUN chmod 777 /script.sh

# CMD ["/usr/sbin/php-fpm7.4", "-F"]

CMD ["/script.sh"]
