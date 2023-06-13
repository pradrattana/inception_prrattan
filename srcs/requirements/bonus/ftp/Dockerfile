FROM debian:buster

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		vsftpd \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir -p /var/www/html

VOLUME /var/www/html

COPY conf/vsftpd.conf /etc
COPY tools/ftp-docker-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/ftp-docker-entrypoint.sh

ENTRYPOINT ["bash", "/usr/local/bin/ftp-docker-entrypoint.sh"]
