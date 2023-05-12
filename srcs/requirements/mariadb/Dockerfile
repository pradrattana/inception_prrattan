FROM debian:buster

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		mariadb-server \
		mariadb-client \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir -p /var/run/mysqld \
	&& chown -R mysql:mysql /var/lib/mysql /var/run/mysqld \
	&& chmod 777 /var/run/mysqld

VOLUME /var/lib/mysql
EXPOSE 3306

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d
COPY tools/mariadb-docker-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/mariadb-docker-entrypoint.sh
ENTRYPOINT ["bash", "/usr/local/bin/mariadb-docker-entrypoint.sh"]

#CMD ["service", "mysql", "start"]
#CMD ["mysqld"]
