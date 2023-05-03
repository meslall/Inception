FROM debian:buster


RUN apt-get update && apt-get install -y curl php7.3-fpm php7.3-mysqli php7.3-mbstring php7.3-xml php7.3-curl wget \
        mariadb-client php-curl php-gd php-json php-mbstring php-xml php-zip sendmail


RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php

COPY tools/script.sh /

COPY tools/www.conf /

# COPY tools/wp-config.php /

RUN chmod +x script.sh


CMD ./script.sh