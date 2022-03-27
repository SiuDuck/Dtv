FROM php:apache

RUN a2enmod rewrite

COPY index.php /var/www/html
#COPY php.ini /usr/local/etc/php/php.ini

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod uga+x /usr/local/bin/install-php-extensions \
    && sync \
    && install-php-extensions \
    apcu \
    bcmath \
    calendar \
    exif \
    gd \
    gettext \
    imagick \
    opcache \
    pcntl \
    mysqli \
    pdo_mysql \
    redis \
    mbstring \
    mcrypt \
    memcache \
    memcached \
    xdebug \
    zip

EXPOSE 9001

