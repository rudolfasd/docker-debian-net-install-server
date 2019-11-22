#!/bin/bash


ln -sf /dev/stdout /var/log/nginx/access.log
ln -sf /dev/stderr /var/log/nginx/error.log
/usr/sbin/nginx -g 'daemon off;' &

/usr/sbin/in.tftpd -l --user tftp -a 0.0.0.0:69 -s -v /srv/tftp 
/usr/sbin/dhcpd -cf /etc/dhcp/dhcpd.conf -lf /var/lib/dhcp/dhcpd.leases -d
