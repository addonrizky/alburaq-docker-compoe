FROM php:7.3-apache
RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql
RUN a2enmod rewrite

RUN apt-get update \
 && apt-get install --assume-yes --no-install-recommends --quiet \
    build-essential \
    libmagickwand-dev \
 && apt-get clean all

RUN pecl install imagick \
 && docker-php-ext-enable imagick