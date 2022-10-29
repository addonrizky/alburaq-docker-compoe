FROM php:7.2-apache
RUN echo 'SetEnv CI_ENV ${CI_ENV}' > /etc/apache2/conf-enabled/environment.conf
RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql

RUN a2enmod rewrite && a2enmod ssl && a2enmod socache_shmcb

RUN apt-get update \
 && apt-get install --assume-yes --no-install-recommends --quiet \
    build-essential \
    libmagickwand-dev \
 && apt-get clean all

RUN apt-get install -y \
        libzip-dev \
        zip \
   && docker-php-ext-install zip

RUN pecl install imagick \
 && docker-php-ext-enable imagick && install redis && docker-php-ext-enable redis

RUN sed -i '/SSLCertificateFile.*snakeoil\.pem/c\SSLCertificateFile \/etc\/ssl\/certs\/mycert.crt' /etc/apache2/sites-available/default-ssl.conf && sed -i '/SSLCertificateKeyFile.*snakeoil\.key/cSSLCertificateKeyFile /etc/ssl/private/mycert.key' /etc/apache2/sites-available/default-ssl.conf
RUN a2ensite default-ssl