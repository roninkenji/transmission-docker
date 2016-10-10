#/bin/sh
CONF=/config

export LANG=en_US.UTF-8
export LC_COLLATE=C

TRANSMISSION_USER=${TRANSMISSION_USER:-user1}
TRANSMISSION_USERID=${TRANSMISSION_USERID:-99}
TRANSMISSION_GROUP=${TRANSMISSION_GROUP:-users}
TRANSMISSION_GROUPID=${TRANSMISSION_GROUPID:-100}

getent passwd ${TRANSMISSION_USER} || adduser -g "Transmission User" -D -G ${TRANSMISSION_GROUP} -u ${TRANSMISSION_USERID} -H -h /config -s /bin/sh ${TRANSMISSION_USER}

chown -v ${TRANSMISSION_USER}:${TRANSMISSION_GROUP} /config /downloads /watchdir
chown -Rv ${TRANSMISSION_USER}:${TRANSMISSION_GROUP} /config /watchdir

exec su ${TRANSMISSION_USER} -c "/usr/bin/transmission-daemon -f -g /config -w /downloads -c /watchdir ${EXTRAOPTS}"

