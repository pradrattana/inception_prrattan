#!/bin/bash

#mysqld -umysql --initialize-insecure

service mysql start

if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then

#service mysql start

#echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" > init.sql
echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> init.sql
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" >> init.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> init.sql
echo "FLUSH PRIVILEGES;" >> init.sql

mysql -uroot < init.sql
#mysql -uroot -p$MYSQL_ROOT_PASSWORD < init.sql

rm init.sql

echo "wow"

#service mysql stop

else

#service nysql start
echo "else"
#service mysql stop

fi

service mysql stop
echo "ToT"

mysqld
