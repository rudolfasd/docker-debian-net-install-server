# docker-debian-net-install-server
Container designed for network installation of Debian.
Was used to install Buster hosts.


## Pre run
`cd /<somedir>`

`git clone https://github.com/rudolfasd/docker-debian-net-install-server.git`

`cd ./docker-debian-net-install-server`

`wget http://http.us.debian.org/debian/dists/buster/main/installer-amd64/current/images/netboot/netboot.tar.gz -O /tmp/netboot.tar.gz`<br>

`tar zxvf /tmp/netboot.tar.gz -C $(pwd)/tftp`

`for f in tftp/debian-installer/amd64/boot-screens/\*.modified; do cp "$f" "${f%%.modified}";done`

`cd ./tftp && ln -s debian-installer/amd64/bootnetx64.efi bootnetx64.efi && cd ..`

## Run
1. `docker build -t debian/netinstsrv .`

2. `docker run -d \`<br>
`-v $(pwd)/html:/var/www/html \`<br>
`-v $(pwd)/tftp:/srv/tftp \`<br>
`-v $(pwd)/leases:/var/lib/dhcp \`<br>
`-v $(pwd)/etc/default/tftpd-hpa:/etc/default/tftpd-hpa \`<br>
`-v $(pwd)/etc/default/isc-dhcp-server:/etc/default/isc-dhcp-server \`<br>
`-v $(pwd)/etc/dhcp/dhcpd.conf:/etc/dhcp/dhcpd.conf \`<br>
`--net=host debian/netinstsrv`<br>

    or just `docker-compose up --build`

