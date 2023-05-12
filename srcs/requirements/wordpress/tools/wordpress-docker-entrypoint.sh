#!/bin/bash

curl -LOk https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root --force
#mv ../wp-config.php .
wp config create --allow-root --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST
wp config set WP_DEBUG true --allow-root --raw
wp config set WP_DEBUG_LOG true --allow-root --raw

#wp db create --allow-root
#wp user create $WORDPRESS_DB_USER $WORDPRESS_EMAIL --allow-root --user_pass=$WORDPRESS_DB_PASSWORD

wp core install --allow-root --url=$DOMAIN_NAME --title=inception --admin_user=$WORDPRESS_DB_USER --admin_password=$WORDPRESS_DB_PASSWORD --admin_email=$WORDPRESS_EMAIL --skip-email

wp theme install twentytwentytwo --allow-root --activate
#wp plugin deactivate --allow-root --all

/usr/sbin/php-fpm7.3 -F
