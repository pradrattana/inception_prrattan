FROM debian:buster

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		mariadb-server \
		mariadb-client \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /var/lib/mysql \
	&& mkdir -p /var/lib/mysql /var/run/mysqld \
	&& chown -R mysql:mysql /var/lib/mysql /var/run/mysqld \
	&& chmod 777 /var/run/mysqld

VOLUME /var/lib/mysql

# COPY conf/.cnf /etc/mysql
COPY tools/docker-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

EXPOSE 3306

CMD ["mysqld"]
