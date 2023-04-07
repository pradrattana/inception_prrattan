FROM debian:buster

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		nginx \
		openssl \
	&& rm -rf /var/lib/apt/lists/* \
	&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/nginx/ssl/prrattan.42.fr.key \
		-out /etc/nginx/ssl/prrattan.42.fr.crt

COPY conf/prrattan.42.fr.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
