﻿#!/bin/bash

# mysql -u root -e "CREATE USER 'root'@'${MARIADB_ROOT_HOST}' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
# mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'${MARIADB_ROOT_HOST}' WITH GRANT OPTION;"
# mysql -u root -e "FLUSH PRIVILEGES;"

mysql -u root -p ${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE ${MYSQL_DATABASE};"
mysql -u root -p ${MYSQL_ROOT_PASSWORD} -e "CREATE USER '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -u root -p ${MYSQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'localhost';"
mysql -u root -p ${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"
