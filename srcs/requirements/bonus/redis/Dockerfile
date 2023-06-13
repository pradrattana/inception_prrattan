FROM debian:buster

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		redis-server \
	&& rm -rf /var/lib/apt/lists/*
#	&& mkdir -p /run/redis
#	&& chmod 755 /run/nginx \

COPY conf/redis.conf /etc/redis

EXPOSE 6379

ENTRYPOINT ["redis-server", "--protected-mode", "no"]

#COPY tools/redis-docker-entrypoint.sh /usr/local/bin/

#RUN chmod +x /usr/local/bin/redis-docker-entrypoint.sh

#ENTRYPOINT ["bash", "/usr/local/bin/redis-docker-entrypoint.sh"]

