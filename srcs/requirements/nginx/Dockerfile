FROM debian:buster

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		nginx \
		openssl \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir -p /etc/nginx/ssl \
	&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/nginx/ssl/prrattan.42.fr.key \
		-subj "/C=TH/ST=Bangkok/L=Bangkok/O=42Bangkok/OU=IT/CN=prrattan.42.fr" \
		-out /etc/nginx/ssl/prrattan.42.fr.crt

#EXPOSE 443

COPY conf/prrattan.42.fr.conf /etc/nginx/conf.d

ENTRYPOINT ["nginx", "-g", "daemon off;"]
