#!/bin/bash

if [ ! -f "/var/www/html/wp-config.php" ]
then

curl -LOk https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root --force

wp config create --allow-root --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST
wp config set WP_DEBUG true --allow-root --raw
wp config set WP_DEBUG_LOG true --allow-root --raw

# redis
wp config set WP_CACHE true --allow-root --raw
wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root
wp config set WP_REDIS_HOST redis --allow-root
wp config set WP_REDIS_PORT 6379 --allow-root --raw
# end redis

#wp config set FTP_HOST $DOMAIN_NAME --allow-root
#wp config set FTP_USER $FTP_USER --allow-root
#wp config set FTP_PASS $FTP_PASSWORD --allow-root

wp core install --allow-root --url=$DOMAIN_NAME --title=inception --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --skip-email

wp user create $ANOTHER_USER $ANOTHER_EMAIL --allow-root --user_pass=$ANOTHER_PASSWORD

wp theme install twentytwentytwo --allow-root --activate

wp plugin install redis-cache --allow-root --activate
wp redis enable --allow-root

# adminer
curl -LOk http://www.adminer.org/latest.php
mv latest.php adminer.php
# end adminer

fi

/usr/sbin/php-fpm7.3 -F
