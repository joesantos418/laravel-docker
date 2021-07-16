#!/usr/bin/env bash

for PHP_VERSION in "7.3" "7.4" "8.0"
do
    for LIBRDKAFKA_VERSION in "v1.7.0"
    do
        for EXT_RDKAFKA_VERSION in "3.0.5" "3.1.2" "4.0.4" "4.1.2" "5.0.0"
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
