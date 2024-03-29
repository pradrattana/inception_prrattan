#!/bin/bash

if [ ! -f "/var/www/html/wp-config.php" ]
then

curl -LOk https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

cd /var/www/html

wp core download --allow-root --force
wp config create --allow-root --dbname=$WP_DB_NAME --dbuser=$WP_DB_USER --dbpass=$WP_DB_PASSWORD --dbhost=$WP_DB_HOST

# redis
wp config set WP_CACHE true --allow-root --raw
wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root
wp config set WP_REDIS_HOST $REDIS_HOST --allow-root
wp config set WP_REDIS_PORT $REDIS_PORT --allow-root --raw
# end redis

wp core install --allow-root --url=$DOMAIN_NAME --title=inception --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --skip-email
wp theme install twentytwentytwo --allow-root --activate
wp user create $ANOTHER_USER $ANOTHER_EMAIL --allow-root --user_pass=$ANOTHER_PASSWORD

# redis
wp plugin install redis-cache --allow-root --activate
wp redis enable --allow-root
# end redis

chmod -R 775 /var/www/html
chown -R www-data:www-data /var/www/html

fi

php-fpm8.2 -F
