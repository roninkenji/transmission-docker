FROM vbatts/slackware-base:latest
MAINTAINER roninkenji

COPY *tgz settings.json myinit.sh /tmp/
RUN echo "http://ftp.osuosl.org/.2/slackware/slackware64-14.1/" >> /etc/slackpkg/mirrors
RUN slackpkg -batch=on -default_answer=yes update && slackpkg -batch=on -default_answer=yes install cyrus-sasl curl openssl-solibs libevent zlib openldap-client && slackpkg -batch=on -default_answer=yes upgrade-all

RUN mkdir -p /srv/config /srv/downloads /srv/watchdir
RUN installpkg /tmp/*tgz

VOLUME ["/srv/config", "/srv/downloads", "/srv/watchdir"]
EXPOSE 9091 51413
CMD /bin/bash -c /tmp/myinit.sh

