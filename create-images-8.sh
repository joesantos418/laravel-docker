#!/usr/bin/env bash

for PHP_VERSION in "8.0" "8.1"
do
    for LIBRDKAFKA_VERSION in "v1.8.2"
    do
        for EXT_RDKAFKA_VERSION in "5.0.2"
        do
            for LARAVEL_VERSION in "6" "7" "8"
            do
                TAG=${PHP_VERSION}-${LIBRDKAFKA_VERSION}-${EXT_RDKAFKA_VERSION}-${LARAVEL_VERSION}

                docker build --tag \
                    joesantos386/laravel:${TAG} \
                    --build-arg PHP_VERSION=${PHP_VERSION} \
                    --build-arg LIBRDKAFKA_VERSION=${LIBRDKAFKA_VERSION} \
                    --build-arg EXT_RDKAFKA_VERSION=${EXT_RDKAFKA_VERSION} \
                    --build-arg LARAVEL_VERSION=${LARAVEL_VERSION} \
                    .

                docker push joesantos386/laravel:${TAG}
            done
        done
    done
done
