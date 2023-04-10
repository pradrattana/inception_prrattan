FROM debian:buster

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		curl \
		php \
		php-json \
		php-mysqli \
		php-curl \
		php-dom \
		php-exif \
		php-fileinfo \
		php-imagick \
		php-mbstring \
		php-xml \
		php-zip \
		php-fpm \
	&& rm -rf /var/lib/apt/lists/* \
	&& curl -o wordpress.tar.gz -kL https://wordpress.org/wordpress-6.2.tar.gz \
	&& tar -xzf wordpress.tar.gz -C /usr/src/ \
	&& rm wordpress.tar.gz

COPY conf/wp-config.php /usr/src/wordpress

RUN mkdir -p /var/run/php \
	&& chown -R www-data:www-data /usr/src/wordpress /var/run/php \
	&& chmod 777 /var/run/php

VOLUME /var/www/html

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3"]
