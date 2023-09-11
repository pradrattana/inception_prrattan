#!/bin/bash

if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then

service mariadb start
#systemctl start mariadb
#systemctl enable mariadb

printf '\nn\nY\n$MYSQL_ROOT_PASSWORD\n$MYSQL_ROOT_PASSWORD\nY\nn\nY\nY' | mariadb-secure-installation

echo "RENAME USER 'root'@'localhost' TO 'root'@'%';" >> init.sql
echo "FLUSH PRIVILEGES;" >> init.sql
echo "ALTER USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> init.sql
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;" >> init.sql
echo "FLUSH PRIVILEGES;" >> init.sql

mariadb < init.sql
rm init.sql

#echo "show grants for root@%; select user from mysql.user;" | mariadb -uroot -p$MYSQL_ROOT_PASSWORD

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" > init.sql
echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> init.sql
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" >> init.sql
echo "FLUSH PRIVILEGES;" >> init.sql

mariadb -uroot -p$MYSQL_ROOT_PASSWORD < init.sql
rm init.sql

#service mariadb stop
#systemctl stop mariadb

else

mysqld

fi
