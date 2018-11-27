FROM php:7.0-alpine

# extensions
RUN docker-php-ext-install pdo_mysql \
 && docker-php-ext-install mysqli

WORKDIR /app

RUN curl -LO https://phar.phpunit.de/phpunit-6.5.phar \
 && chmod +x phpunit-6.5.phar \
 && mv phpunit-6.5.phar /usr/local/bin/phpunit

# dbunit
RUN mkdir -p /extensions \
 && DBUNIT_VERSION=3.0.2 \
 && curl -LO https://phar.phpunit.de/dbunit-$DBUNIT_VERSION.phar \
 && chmod +x dbunit-$DBUNIT_VERSION.phar \
 && mv dbunit-$DBUNIT_VERSION.phar /extensions
