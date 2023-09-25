#!/bin/bash

if [ ! -f /etc/vsftpd.userlist ]
then

service vsftpd start

useradd $FTP_USER -d/var/www/html
echo -e "$FTP_PASSWORD\n$FTP_PASSWORD" | passwd $FTP_USER
echo $FTP_USER | tee -a /etc/vsftpd.userlist
usermod -aG www-data $FTP_USER

service vsftpd stop

fi

vsftpd
