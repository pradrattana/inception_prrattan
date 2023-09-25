FROM debian:bookworm

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		mariadb-server \
		mariadb-client \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir -p /run/mysqld \
	&& chown -R mysql:mysql /var/lib/mysql /run/mysqld \
	&& chmod 775 /var/lib/mysql /run/mysqld

COPY conf/mariadb.cnf /etc/mysql
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d
COPY tools/mariadb-docker-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/mariadb-docker-entrypoint.sh

ENTRYPOINT ["bash", "/usr/local/bin/mariadb-docker-entrypoint.sh"]
