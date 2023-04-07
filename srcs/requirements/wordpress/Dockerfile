FROM debian:buster

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		php \
		php-json \
		php-mysqli \
		php-curl \
		php-dom \
		php-exif \
		php-fileinfo \
		php-hash \
		php-imagick \
		php-mbstring \
		php-openssl \
		php-pcre \
		php-xml \
		php-zip \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

RUN curl -o wordpress -L https://wordpress.org/wordpress-6.2.tar.gz \
	&& tar -xzf wordpress.tar.gz \
	&& rm wordpress.tar.gz

COPY conf/wp-config.php /var/www/html/wordpress

RUN chown -R www-data:www-data /var/www/html/wordpress

VOLUME /var/www/html/wordpress

# COPY tools/docker-entrypoint.sh /usr/local/bin

WORKDIR /
EXPOSE 9000

# ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["php-fpm"]
