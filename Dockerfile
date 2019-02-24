FROM debian:9
LABEL maintainer="charleypeng" version="1.1" org.lable-schema.url="https://github.com/charleypeng/serverdroplet"
#Install dependencies
RUN apt update \
    && apt install -y gnupg curl vim-tiny wget mysql-server mysql-client php git nginx

RUN apt remove --autoremove \
    && chown -R www-data:www-data /var/www
    
RUN service nginx start   
    
EXPOSE 80

WORKDIR /var/www
