# transmission-docker
Transmission bittorrent client under Alpine Linux userspace

[Transmission project page](www.transmissionbt.com)

Transmission is a BitTorrent client which features a simple interface on top of a cross-platform back-end. Transmission is free software licensed under the terms of the GNU General Public License (GPL), with parts under the MIT License.

## Directions:

### Data Volumes:
 * /config : in this path Transmission will store it's configuration files.
 * /downloads : in this path Transmission will store the downloaded files.
 * /watchdir : in this path Transmission will wach for new torrents to download.

### Network Ports:
 * 9091 : Transmission rpc interface.
 * 64000 : Default BitTorrent communications port the Transmission uses.

### Environment (Optional):
Defaults are designed to work with unraid
 * TRANSMISSION_USER : user for running transmission process (default: user1)
 * TRANSMISSION_USERID : userid of TRANSMISSION_USER (default: 99)
 * TRANSMISSION_GROUP : group for running transmission process (default: users)
 * TRANSMISSION_GROUPID : groupid of TRANSMISSION_GROUP (default: 100)

