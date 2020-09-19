FROM joesantos386/ext-rdkafka-docker:php7.3-v1.5.0-3.0.5

COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

RUN composer global require laravel/installer

WORKDIR /application

RUN cd /application && \
    composer create-project --prefer-dist laravel/laravel laravel-test "8.*"