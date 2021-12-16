FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Minsk
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl \
    && apt-get install -y --no-install-recommends apache2 \
    && apt-get install -y --no-install-recommends libapache2-mod-php \
    && apt-get install -y --no-install-recommends ghostscript \
    && apt-get install -y --no-install-recommends mariadb-server \
    && apt-get install -y --no-install-recommends php7.4 \
    && apt-get install -y --no-install-recommends php-bcmath \
    && apt-get install -y --no-install-recommends php-curl \
    && apt-get install -y --no-install-recommends php-imagick \
    && apt-get install -y --no-install-recommends php-intl \
    && apt-get install -y --no-install-recommends php-json \
    && apt-get install -y --no-install-recommends php-mbstring \
    && apt-get install -y --no-install-recommends phpmyadmin \
    && apt-get install -y --no-install-recommends php-gd \
    && apt-get install -y --no-install-recommends php-mysql \
    && apt-get install -y --no-install-recommends php-xml \
    && apt-get install -y --no-install-recommends php-zip \
    && apt-get install -y --no-install-recommends ca-certificates \
    && apt-get install -y --no-install-recommends systemd \
    && apt-get install -y --no-install-recommends sudo \
    && apt-get clean

ADD start.sh /start.sh
CMD ["/start.sh"]