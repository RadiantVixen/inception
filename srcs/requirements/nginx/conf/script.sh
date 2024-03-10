#!/bin/bash

openssl req -x509 -nodes -out $CERTS_ -keyout  /etc/ssl/private/nginx-selfsigned.key -subj "/"

echo "server 
    {
        listen 443 ssl;
        listen [::]:443 ssl;
        
        ssl_protocols TLSv1.2 TLSv1.3;

        ssl_certificate $CERTS_;
        ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key ;

        server_name $WP_URL;
        ">/etc/nginx/sites-available/default
echo '  index index.php;
        root /var/www/html;

        location / {
                    try_files $uri $uri/ =404;
        }
        location ~ \.php$ {                             
            include snippets/fastcgi-php.conf;
            fastcgi_pass wordpress:9000;   
        }
    }
'>>/etc/nginx/sites-available/default

nginx -g "daemon off;"
