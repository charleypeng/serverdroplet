FROM debian:9
LABEL maintainer="Charley Peng" version="1.0" org.lable-schema.url="https://github.com/charleypeng/serverdroplet"

VOLUME /var/www/sitepages
#Install dependencies
RUN apt update \
    && apt install -y gnupg curl vim wget git apt-transport-https apt-utils

RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg \
    && mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/ \
    && wget -q https://packages.microsoft.com/config/debian/9/prod.list \
    && mv prod.list /etc/apt/sources.list.d/microsoft-prod.list \
    && chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg \
    && chown root:root /etc/apt/sources.list.d/microsoft-prod.list \
    && apt-get update \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4 \
    && echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/4.0 main" | tee /etc/apt/sources.list.d/mongodb-org-4.0.list \
    && apt-get update \
    && apt-get install -y dotnet-sdk-2.2 mongodb-org \
    && mkdir /var/www/sitepages \
    && chown -R www-data:www-data /var/www/sitepages

EXPOSE 8200

WORKDIR /var/www
