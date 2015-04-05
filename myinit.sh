#/bin/bash
CONF=/srv/transmission/config

if [ ! -f ${CONF}/settings.json ]; then
  cp /tmp/settings.json ${CONF}
  chown -Rv nobody /srv/config /srv/downloads /srv/watchdir
fi

exec /usr/bin/transmission-daemon -f -g /srv/config

