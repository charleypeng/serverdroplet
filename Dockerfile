FROM debian:9
LABEL maintainer="charleypeng" version="1.1" org.lable-schema.url="https://github.com/charleypeng/serverdroplet"
#Install dependencies
RUN apt update \
    && apt install -y gnupg curl vim-tiny wget mysql-server mysql-client php git nginx

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs \
    && apt remove --autoremove \
    && mkdir /var/www \
    && chown -R www-data:www-data /var/www
    
    
EXPOSE 80

WORKDIR /var/www
