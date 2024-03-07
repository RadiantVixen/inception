FROM debian:bullseye

RUN apt-get update && apt-get install -y wget

RUN apt-get install -y php7.3\
						php-fpm\
						php-mysql\
						mariadb-client


RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

