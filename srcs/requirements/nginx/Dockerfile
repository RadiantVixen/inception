FROM debian:bullseye

RUN apt update -y

RUN apt install -y nginx && apt install openssl -y

COPY conf/script.sh /

RUN chmod +x script.sh

CMD [ "./script.sh" ]
