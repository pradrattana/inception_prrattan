#!/bin/bash

if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then

service mariadb start

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" > init.sql
echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> init.sql
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" >> init.sql
echo "ALTER USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> init.sql
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;" >> init.sql
echo "FLUSH PRIVILEGES;" >> init.sql

mariadb -uroot < init.sql

rm init.sql

service mariadb stop

fi

mysqld
