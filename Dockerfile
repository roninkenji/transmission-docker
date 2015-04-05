FROM vbatts/slackware-base:latest
MAINTAINER roninkenji

RUN echo "http://ftp.osuosl.org/.2/slackware/slackware64-14.1/" >> /etc/slackpkg/mirrors
RUN slackpkg -batch=on -default_answer=yes update && slackpkg -batch=on -default_answer=yes upgrade-all && rm -rv /usr/doc
RUN slackpkg -batch=on -default_answer=yes install cyrus-sasl curl openssl-solibs libevent zlib openldap-client && rm -rv /usr/doc

COPY *tgz /tmp/
RUN installpkg /tmp/*tgz && rm -rv /tmp/*tgz /usr/doc

RUN mkdir -p /srv/config /srv/downloads /srv/watchdir
VOLUME ["/srv/config", "/srv/downloads", "/srv/watchdir"]
EXPOSE 9091 51413
CMD /bin/bash -c /tmp/myinit.sh
USER nobody

COPY settings.json /tmp/
COPY myinit.sh /tmp/

