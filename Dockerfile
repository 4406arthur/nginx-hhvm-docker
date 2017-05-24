FROM arthurma/nginx:jessie

MAINTAINER ArthurMA <arthurma@loftechs.com>

# Add HHVM repo and Install
RUN \
    apt-get update \
    && apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449 \
    && echo deb http://dl.hhvm.com/debian jessie main | tee /etc/apt/sources.list.d/hhvm.list \
    && apt-get update && apt-get install -my libboost-filesystem1.55.0 \
    hhvm \
    # Install supervisor, HHVM & tools
    supervisor \
    vim \
    curl \
    && apt-get clean
# Configuration
COPY ./config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY ./config/php.ini /etc/hhvm/php.ini
COPY ./config/nginx.conf /etc/nginx/nginx.conf
COPY ./config/conf.d/config-1.conf /etc/nginx/conf.d/config-1.conf
COPY ./config/sites-enabled/default /etc/nginx/sites-enabled/default
COPY ./config/.bashrc /root/.bashrc


#How to use
EXPOSE 80 443
VOLUME ["/var/www/public"]

ENTRYPOINT ["/usr/bin/supervisord"]
