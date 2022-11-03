FROM php:7.4-fpm

WORKDIR /var/www

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN apt-get update && apt-get install -y \
    unzip \
    git \
    curl

RUN chmod +x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions mbstring pdo_mysql zip exif memcached mcrypt

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/example-app

# RUN git clone https://github.com/laravel/laravel.git

RUN composer create-project laravel/laravel "/var/www/example-app" --prefer-dist

# COPY ./ ./

# RUN rm ./vendor/compiled.php

# RUN composer update

# RUN php artisan sail:install --with=mysql,redis,meilisearch,mailhog,selenium

# RUN ./vendor/bin/sail pull mysql redis meilisearch mailhog selenium && ./vendor/bin/sail build

EXPOSE 80
