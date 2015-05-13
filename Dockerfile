FROM roninkenji/slackware-base:latest
MAINTAINER roninkenji

RUN slackpkg -batch=on -default_answer=yes install cyrus-sasl curl openssl-solibs libevent zlib openldap-client

COPY *tgz /tmp/
RUN installpkg /tmp/*tgz && rm -rv /tmp/*tgz /usr/doc
RUN mkdir -p /srv/config /srv/downloads /srv/watchdir

VOLUME ["/srv/config", "/srv/downloads", "/srv/watchdir"]
EXPOSE 9091 64000 64001 64002 64003 64004 64005 64006 64007 64008 64009 64010
CMD /bin/bash -c /tmp/myinit.sh
USER nobody

COPY settings.json /tmp/
COPY myinit.sh /tmp/

