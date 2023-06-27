FROM debian:bookworm

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		redis-server \
	&& rm -rf /var/lib/apt/lists/*

COPY conf/redis.conf /etc/redis

ENTRYPOINT ["redis-server", "--protected-mode", "no"]

