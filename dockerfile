FROM debian:10.1-slim
MAINTAINER Rudolf M. <rudolfasd@mail.ru>

RUN apt-get update && apt-get -y install \
    isc-dhcp-server \
    tftpd-hpa \
    nginx \
    && rm -rf /tmp/* \
    && rm -rf /var/lib/apt/lists/*


CMD echo "Start services" \
    && /etc/init.d/tftpd-hpa start \
    && /etc/init.d/nginx start \
    && (/etc/init.d/isc-dhcp-server start || $TRUE) \
    && tail -f /dev/null 
    