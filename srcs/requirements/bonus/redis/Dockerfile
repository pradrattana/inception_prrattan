FROM debian:buster

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		redis-server \
	&& rm -rf /var/lib/apt/lists/*

COPY conf/redis.conf /etc/redis

EXPOSE 6379

ENTRYPOINT ["redis-server", "--protected-mode", "no"]

