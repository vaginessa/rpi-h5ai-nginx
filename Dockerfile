FROM resin/rpi-raspbian

MAINTAINER iomonad <iomonad@riseup.net>

RUN apt-get update && \
    apt-get --no-install-recommends install nginx && \
    apt-get --no-install-recommends install php5-fpm && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

RUN sed -e 's/127.0.0.1:9000/9000/' 
        -e '/allowed_clients/d' 
        -e '/catch_workers_output/s/^;//' 
        -e '/error_log/d' 
        -i /etc/php-fpm.d/www.conf
        
RUN  touch /var/run/php5-fpm.sock && \ 
     chmod 777 /var/run/php5-fpm.sock

RUN service php5-fpm start
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443
CMD ["nginx"]
