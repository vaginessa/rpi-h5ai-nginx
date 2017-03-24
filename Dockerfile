FROM resin/rpi-raspbian

MAINTAINER iomonad <iomonad@riseup.net>

RUN apt-get update && \
    apt-get --no-install-recommends install nginx && \
    apt-get --no-install-recommends install php5-fpm && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

EXPOSE 80
EXPOSE 443

CMD ["nginx -t"]
