FROM php:5.6-fpm

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions \
        bcmath \
        bz2 \
        calendar \
        dba \
        gd \
        gettext \
        gmp \
        mcrypt \
        mysqlnd \
        mysqli \
        pcntl \
        mysql \
        pdo \
        pdo_mysql \
        pdo_sqlite \
        pspell \
        imap \
        shmop \
        soap \
        sockets \
        exif \
        sysvmsg \
        sysvsem \
        sysvshm \
        wddx \
        xmlrpc \
        xsl \
        zip \
        intl

WORKDIR /usr/local/etc/php/

RUN rm php.ini-production

RUN touch php.ini

RUN echo "file_uploads = On" >> php.ini

RUN echo "memory_limit = 4G" >> php.ini

RUN echo "upload_max_filesize = 4G" >> php.ini

RUN echo "post_max_size = 4G" >> php.ini

RUN echo "max_execution_time = 600" >> php.ini

CMD [ "php-fpm" ]
