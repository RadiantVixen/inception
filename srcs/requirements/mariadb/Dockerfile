FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

COPY ./conf/script.sh /script.sh

RUN chmod +x /script.sh

CMD ["./script.sh"]
