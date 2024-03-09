FROM debian:bullseye

RUN apt update -y

RUN apt install -y nginx && apt install openssl -y

ENV CERTS_=/etc/ssl/private/nginx-selfsigned.crt

ENV wp_url=aatki.42.fr

COPY conf/script.sh /

RUN chmod +x script.sh

CMD [ "./script.sh" ]
