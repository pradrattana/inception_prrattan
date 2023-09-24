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

RUN mkdir -p /var/www/html /run/php \
	&& chmod 775 /var/www/html /run/php

COPY conf/www.conf /etc/php/8.2/fpm/pool.d
COPY tools/wordpress-docker-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/wordpress-docker-entrypoint.sh

ENTRYPOINT ["bash", "/usr/local/bin/wordpress-docker-entrypoint.sh"]
