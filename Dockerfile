FROM php:7.4-apache

#ENV http_proxy http://10.15.3.20:80/
#ENV https_proxy http://10.15.3.20:80/
#ENV no_proxy 172.31.1.251

#RUN pear config-set http_proxy http://10.15.3.20:80/

RUN echo 'SetEnv CI_ENV ${CI_ENV}' > /etc/apache2/conf-enabled/environment.conf
RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql

RUN apt-get install vim
RUN apt-get install telnetd

RUN a2enmod rewrite
RUN a2enmod ssl

RUN apt-get update \
 && apt-get install --assume-yes --no-install-recommends --quiet \
    build-essential \
    libmagickwand-dev \
 && apt-get clean all

RUN apt-get install -y \
        libzip-dev \
        zip \
   && docker-php-ext-install zip

RUN apt-get install -y \
   libpng-dev \
   && docker-php-ext-install gd

RUN pecl install imagick \
 && docker-php-ext-enable imagick