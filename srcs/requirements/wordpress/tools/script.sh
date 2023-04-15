#!/bin/bash

# # create directory to use in nginx container later and also to setup the wordpress conf
# mkdir -p /var/www/html

# cd /var/www/html

# # remove all the wordpress files if there is something from the volumes to install it again
# rm -rf *

# # The commands are for installing and using the WP-CLI tool.

# # downloads the WP-CLI PHAR (PHP Archive) file from the GitHub repository. The -O flag tells curl to save the file with the same name as it has on the server.
# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

# # makes the WP-CLI PHAR file executable.
# chmod +x wp-cli.phar 

# # moves the WP-CLI PHAR file to the /usr/local/bin directory, which is in the system's PATH, and renames it to wp. This allows you to run the wp command from any directory
# mv wp-cli.phar /usr/local/bin/wp

# # downloads the latest version of WordPress to the current directory. The --allow-root flag allows the command to be run as the root user, which is necessary if you are logged in as the root user or if you are using WP-CLI with a system-level installation of WordPress.
# wp core download --allow-root

# mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

# # change the those lines in wp-config.php file to connect with database

# # #line 23
# sed -i -r "s/database/$db_name/1"   wp-config.php
# # #line 26
# sed -i -r "s/database_user/$db_user/1"  wp-config.php
# # #line 29
# sed -i -r "s/passwod/$db_pwd/1"    wp-config.php

# # #line 32
# sed -i -r "s/localhost/mariadb/1"    wp-config.php # (to connect with mariadb database)
# # installs WordPress and sets up the basic configuration for the site. The --url option specifies the URL of the site, --title sets the site's title, --admin_user and --admin_password set the username and password for the site's administrator account, and --admin_email sets the email address for the administrator. The --skip-email flag prevents WP-CLI from sending an email to the administrator with the login details.
# creates a new user account with the specified username, email address, and password. The --role option sets the user's role to author, which gives the user the ability to publish and manage their own posts.
# wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_USER --admin_password=$WP_PASSWORD --admin_email=$WP_EMAIL --skip-email --allow-root
# wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASSWORD --allow-root

# mv /wp-config.php /var/www/html/wp-config.php 
# wp core install --url=localhost --title=simple_title --admin_user=omeslall --admin_password=1234 --admin_email=houssamhamdy223@gmail.com --skip-email --allow-root
# wp user create user houssamhamdy223@gmail.com --role=author --user_pass=1234 --allow-root

# installs the Astra theme and activates it for the site. The --activate flag tells WP-CLI to make the theme the active theme for the site.
# wp theme install astra --activate --allow-root


# wp plugin install redis-cache --activate --allow-root


# uses the sed command to modify the www.conf file in the /etc/php/7.3/fpm/pool.d directory. The s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g command substitutes the value 9000 for /run/php/php7.3-fpm.sock throughout the file. This changes the socket that PHP-FPM listens on from a Unix domain socket to a TCP port.
# sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

# creates the /run/php directory, which is used by PHP-FPM to store Unix domain sockets.
# mkdir -p /run/php


# wp redis enable --allow-root


# starts the PHP-FPM service in the foreground. The -F flag tells PHP-FPM to run in the foreground, rather than as a daemon in the background.
# /usr/sbin/php-fpm7.3 -F
# echo "PHP-FPM started"
# CMD php-fpm7.3 -F
# php7.3-fpm -R -F
# tail -f /dev/null

# mkdir -p /run/php
# mkdir -p /var/www/html

# chown www-data:www-data /var/www/html

# mv /wp-config.php /var/www/html/wp-config.php 

# su www-data -s /bin/bash -c "wp core download --path=/var/www/html"
# wp core download --path=/var/www/html --allow-root

##sed -i 's/\/run\/php\/php7\.3-fpm\.sock/wordpress:9000/g' /etc/php/7.3/fpm/pool.d/www.conf

# su www-data -s /bin/bash -c "wp core config --path=/var/www/html --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb"
# wp core config --path=/var/www/html --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --allow-root

# su www-data -s /bin/bash -c "wp core install --path=/var/www/html --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_USER --admin_password=$WP_PASSWORD --admin_email=$WP_EMAIL"
# wp core install --path=/var/www/html --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_USER --admin_password=$WP_PASSWORD --admin_email=$WP_EMAIL --allow-root
# su www-data -s /bin/bash -c "wp plugin install redis-cache --activate --path=/var/www/html"

# su www-data -s /bin/bash -c "wp config set FS_METHOD direct --type=constant --path=/var/www/html"
# wp config set FS_METHOD direct --type=constant --path=/var/www/html --allow-root
# su www-data -s /bin/bash -c "wp config set WP_REDIS_HOST redis --type=constant --path=/var/www/html"
# su www-data -s /bin/bash -c "wp config set WP_REDIS_PORT 6379 --type=constant --path=/var/www/html"
# su www-data -s /bin/bash -c "wp config set WP_CACHE true --type=constant --path=/var/www/html"
# wp config set WP_CACHE true --type=constant --path=/var/www/html --allow-root

# su www-data -s /bin/bash -c "wp plugin install redis-cache --activate --path=/var/www/html"
# wp plugin install redis-cache --activate --path=/var/www/html --allow-root
# su www-data -s /bin/bash -c "wp redis enable --path=/var/www/html"
#wp redis enable --path=/var/www/html --allow-root

#================================================================================================
# #!/bin/bash

# # create directory to use in nginx container later and also to setup the wordpress conf
# mkdir -p /var/www/html

# cd /var/www/html

# # # remove all the wordpress files if there is something from the volumes to install it again
# rm -rf *

# # # The commands are for installing and using the WP-CLI tool.
# # mv /wp-config.php /var/www/html/wp-config.php 

# # # downloads the WP-CLI PHAR (PHP Archive) file from the GitHub repository. The -O flag tells curl to save the file with the same name as it has on the server.
# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

# # # makes the WP-CLI PHAR file executable.
# chmod +x wp-cli.phar 

# # # moves the WP-CLI PHAR file to the /usr/local/bin directory, which is in the system's PATH, and renames it to wp. This allows you to run the wp command from any directory
# mv wp-cli.phar /usr/local/bin/wp

# # # downloads the latest version of WordPress to the current directory. The --allow-root flag allows the command to be run as the root user, which is necessary if you are logged in as the root user or if you are using WP-CLI with a system-level installation of WordPress.
# wp core download --allow-root
# wp core config --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=localhost --allow-root
# wp core install --url=localhost --title=simple_title --admin_user=omeslall --admin_password=1234 --admin_email=omeslall@gmail.com --skip-email --allow-root
# wp user create user omeslall@gmail.com --role=author --user_pass=1234 --allow-root


# sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
# mkdir -p /run/php
# php-fpm7.3 -R -F

mkdir -p /var/www/html

mv www.conf /etc/php/7.3/fpm/pool.d/www.conf

cd /var/www/html

rm -rf *

wp core download --allow-root

# mv wp-config-sample.php wp-config.php


wp core config --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb --allow-root

wp core install --url=${DOMAIN_NAME} --title=inception --admin_user=${WP_USER} --admin_password=${WP_PASSWORD} --admin_email=${WP_EMAIL} --allow-root

sed -i 's#/run/php/php7.3-fpm.sock#wordpress:9000#g' /etc/php/7.3/fpm/pool.d/www.conf

php-fpm7.3 -R -F