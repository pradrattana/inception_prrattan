#!/bin/bash

mysqld --initialize-insecure

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" > init.sql
echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> init.sql
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" >> init.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> init.sql
echo "FLUSH PRIVILEGES;" >> init.sql

mysql < init.sql

rm init.sql

service mysql stop
