FROM alpine:latest
LABEL Author=roninkenji

RUN cd /tmp && \
    apk update && \
    apk add libevent curl && \
    apk add --virtual build-dependencies xz build-base gcc autoconf automake bsd-compat-headers curl-dev dbus-glib-dev intltool libevent-dev libnotify-dev openssl-dev tar && \
    wget https://github.com/transmission/transmission-releases/raw/master/transmission-2.94.tar.xz && \
    tar xvf transmission-2.94.tar.xz && \
    cd /tmp/transmission-2.94/ && \
    ./configure \
        --prefix=/usr \
		--sysconfdir=/etc \
		--mandir=/usr/share/man \
		--infodir=/usr/share/info \
		--localstatedir=/var \
		--enable-utp \
		--with-inotify \
		--enable-cli \
    && \
    make && \
    make install && \
    apk del build-dependencies

RUN mkdir -p /config /downloads /watchdir

COPY docker_init.sh /usr/local/bin/

ENTRYPOINT ["/bin/sh", "-c", "/usr/local/bin/docker_init.sh"]
EXPOSE 9091 64000
