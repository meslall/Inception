#!/bin/bash

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE ;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' ;" >> db1.sql
# echo "ALTER USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql
# mysql -u root -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
# mysql -u root -e "CREATE DATABASE ${MYSQL_DATABASE};"
# mysql -u root -e "USE ${MYSQL_DATABASE}; GRANT ALL PRIVILEGES ON * TO '${MYSQL_USER}'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;"
# mysql -u root ${MYSQL_DATABASE} < /db.sql
# mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'; FLUSH PRIVILEGES;"
# service mysql stop
mysql < db1.sql

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld --bind-address=0.0.0.0 #--defaults-file=./db1.sql
# mysql_install_db 
