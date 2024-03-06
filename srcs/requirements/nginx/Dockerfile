FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes \
-out /etc/nginx/ssl/inception.crt \
-keyout /etc/nginx/ssl/inception.key \
-subj "/C=FR/ST=IDF/L=BG/O=42/OU=42/CN=aatki.42.fr/UID=aatki"

RUN touch /etc/nginx/conf.d/aatki.conf

COPY  ./conf/nginx.conf /etc/nginx/conf.d/aatki.conf

CMD ["nginx", "-g", "daemon off;"]
