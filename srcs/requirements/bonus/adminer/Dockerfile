FROM debian:bookworm

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		curl \
		php \
		php-mysqli \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

RUN chown -R www-data:www-data /var/www/html \
        && chmod 755 /var/www/html \
	&& curl -LOk http://www.adminer.org/latest.php \
	&& mv latest.php index.php

#EXPOSE 8080

ENTRYPOINT ["php", "-S", "0.0.0.0:8080"]
