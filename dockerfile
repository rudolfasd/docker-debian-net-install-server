FROM debian:10.1-slim
MAINTAINER Rudolf M. <rudolfasd@mail.ru>

RUN apt-get update && apt-get -y install \
    isc-dhcp-server \
    tftpd-hpa \
    nginx \
    && rm -rf /tmp/* \
    && rm -rf /var/lib/apt/lists/*

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]