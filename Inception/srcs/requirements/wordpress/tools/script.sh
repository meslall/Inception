#!/bin/bash

#mkdir -p /var/www/html

#mv /www.conf /etc/php/7.3/fpm/pool.d/www.conf

cd /var/www/html

#rm -rf *

wp core download --allow-root


wp core config --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb --allow-root

wp core install --url=${DOMAIN_NAME} --title=inception --admin_user=${WP_USER} --admin_password=${WP_PASSWORD} --admin_email=${WP_EMAIL} --allow-root

wp user create oussama meslalla90@gmail.com --role=author --user_pass=1234 --allow-root --path=wordpress
# mv /wp-config.php /var/www/html/wp-config.php
sed -i 's#/run/php/php7.3-fpm.sock#wordpress:9000#g' /etc/php/7.3/fpm/pool.d/www.conf

chown -R www-data:www-data /var/www/html

php-fpm7.3 -R -F
