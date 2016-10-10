FROM alpine:3.4
MAINTAINER roninkenji

RUN mkdir -p /config /downloads /watchdir
EXPOSE 9091 64005

RUN apk update && apk upgrade && apk add transmission-daemon transmission-cli

COPY docker_init.sh /usr/local/bin/

ENTRYPOINT ["/bin/sh", "-c", "/usr/local/bin/docker_init.sh"]

