FROM resin/rpi-raspbian

MAINTAINER iomonad <iomonad@riseup.net>

RUN apt-get update && \
    apt-get install nginx && \
    apt-get install php5-fpm && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN /bin/echo 'done'   
