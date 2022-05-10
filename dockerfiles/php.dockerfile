FROM php:8.1-fpm

RUN apt-get clean && apt-get update
RUN apt-get install -y --no-install-recommends \
        locales \
        apt-utils \
        libicu-dev \
        g++ \
        libpng-dev \
        libxml2-dev \
        libzip-dev \
        libonig-dev \
        libxslt-dev \
        unzip \
        libpq-dev \
        ca-certificates

RUN docker-php-ext-configure intl
RUN docker-php-ext-install pdo pdo_mysql pdo_pgsql opcache intl zip calendar dom mbstring gd xsl
RUN pecl install redis && docker-php-ext-enable redis


# Install Composer
RUN curl --silent --show-error https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

# Set working directory
WORKDIR /var/www/app

# Add user for laravel/symfony application
RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www

# Copy existing application directory permissions
COPY --chown=www:www . /var/www/app

# Change current user to www
USER www

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]