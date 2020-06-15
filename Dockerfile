FROM php:7.4-fpm-alpine

WORKDIR /var/www/html

RUN apk update apk add --no-cache curl vim wget bash

RUN docker-php-ext-install pdo pdo_mysql \
  && apk --no-cache add pcre-dev ${PHPIZE_DEPS} \ 
  && pecl install xdebug \
  && docker-php-ext-enable xdebug \
  && apk del pcre-dev ${PHPIZE_DEPS}
