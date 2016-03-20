#/bin/sh
CONF=/config

export LANG=en_US.UTF-8
export LC_COLLATE=C

TRANSMISSION_USER=${TRANSMISSION_USER:-nobody}
TRANSMISSION_USERID=${TRANSMISSION_USERID:-1000}
TRANSMISSION_GROUP=${TRANSMISSION_GROUP:-users}
TRANSMISSION_GROUPID=${TRANSMISSION_GROUPID:-100}

if [ ! -f ${CONF}/settings.json ]; then
  echo << EOF > ${CONF}/settings.json
{
    "alt-speed-down": 50
    "alt-speed-enabled": false
    "alt-speed-time-begin": 540
    "alt-speed-time-day": 127
    "alt-speed-time-enabled": false
    "alt-speed-time-end": 1020
    "alt-speed-up": 50
    "bind-address-ipv4": "0.0.0.0"
    "bind-address-ipv6": "::"
    "blocklist-enabled": false
    "blocklist-url": "http://www.example.com/blocklist"
    "cache-size-mb": 4
    "dht-enabled": true
    "download-dir": "/downloads"
    "download-queue-enabled": true
    "download-queue-size": 5
    "encryption": 1
    "idle-seeding-limit": 30
    "idle-seeding-limit-enabled": false
    "incomplete-dir": "/downloads"
    "incomplete-dir-enabled": false
    "lpd-enabled": false
    "message-level": 2
    "peer-congestion-algorithm": ""
    "peer-id-ttl-hours": 6
    "peer-limit-global": 200
    "peer-limit-per-torrent": 50
    "peer-port": 64005
    "peer-port-random-high": 64010
    "peer-port-random-low": 64000
    "peer-port-random-on-start": false
    "peer-socket-tos": "default"
    "pex-enabled": true
    "port-forwarding-enabled": true
    "preallocation": 1
    "prefetch-enabled": 1
    "queue-stalled-enabled": true
    "queue-stalled-minutes": 30
    "ratio-limit": 2
    "ratio-limit-enabled": false
    "rename-partial-files": true
    "rpc-authentication-required": false
    "rpc-bind-address": "0.0.0.0"
    "rpc-enabled": true
    "rpc-password": ""
    "rpc-port": 9091
    "rpc-url": "/transmission/"
    "rpc-username": ""
    "rpc-whitelist": "0.0.0.0"
    "rpc-whitelist-enabled": false
    "scrape-paused-torrents-enabled": true
    "script-torrent-done-enabled": false
    "script-torrent-done-filename": ""
    "seed-queue-enabled": false
    "seed-queue-size": 10
    "speed-limit-down": 100
    "speed-limit-down-enabled": false
    "speed-limit-up": 100
    "speed-limit-up-enabled": false
    "start-added-torrents": true
    "trash-original-torrent-files": false
    "umask": 18
    "upload-slots-per-torrent": 14
    "utp-enabled": true
    "watch-dir": "/watchdir"
    "watch-dir-enabled": true
}
EOF
  chown -Rv ${TRANSMISSION_USER}:${TRANSMISSION_GROUP} /config /downloads /watchdir
fi

exec su -l ${TRANSMISSION_USER} -c "/usr/bin/transmission-daemon -f -g /config ${EXTRAOPTS}"

