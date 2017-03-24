FROM resin/rpi-raspbian

MAINTAINER iomonad <iomonad@riseup.net>

RUN apt-get update && \
    apt-get --no-install-recommends install nginx && \
    apt-get --no-install-recommends install php5-fpm && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

RUN service php5-fpm start      
RUN  touch /var/run/php5-fpm.sock && \ 
     chmod 777 /var/run/php5-fpm.sock

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443
CMD ["nginx"]
