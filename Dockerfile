FROM joesantos386/ext-rdkafka-docker:php7.2-v1.5.0-4.0.3

COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

RUN composer global require laravel/installer

WORKDIR /application

RUN cd /application && \
    composer create-project --prefer-dist laravel/laravel laravel-test "6.*"