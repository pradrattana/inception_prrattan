FROM debian:bookworm

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		curl \
		default-mysql-client \
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
		ca-certificates \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

RUN mkdir -p /run/php \
	&& chown -R www-data:www-data /var/www/html /run/php \
	&& chmod 755 /run/php

VOLUME /var/www/html

#EXPOSE 9000

COPY conf/www.conf /etc/php/8.2/fpm/pool.d
COPY tools/wordpress-docker-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/wordpress-docker-entrypoint.sh

ENTRYPOINT ["bash", "/usr/local/bin/wordpress-docker-entrypoint.sh"]
