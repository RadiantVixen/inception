FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

ENV mariaDB_DATABASE=mariadb
ENV mariaDB_USER=mariadb_user
ENV mariaDB_PASSWORD=mariadb_u_p
ENV mariaDB_ROOT_PASSWORD =mariadb_r_p

RUN sed -i 's/bind-address            = 127.0.0.1/bind-address            =*/' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./conf/script.sh /script.sh
RUN chmod +x /script.sh

CMD ["/script.sh"]
