FROM debian:bullseye

RUN apt-get update

RUN apt-get install -y php7.4\
						php-fpm\
						php-mysql\
						mariadb-client

RUN apt install curl -y

COPY ./conf/script.sh /
RUN chmod 777 /script.sh

CMD ["/script.sh"]
