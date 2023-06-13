#!/bin/bash

if [ ! -f /etc/vsftpd.userlist ]
then

service vsftpd start

useradd $FTP_USER -d/var/www/html
echo -e "$FTP_PASSWORD\n$FTP_PASSWORD" | passwd $FTP_USER
echo $FTP_USER | tee -a /etc/vsftpd.userlist
chown -R $FTP_USER:$FTP_USER /var/www/html

service vsftpd stop

fi

vsftpd
