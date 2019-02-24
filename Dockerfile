FROM debian:9
LABEL maintainer="charleypeng" version="1.1" org.lable-schema.url="https://github.com/charleypeng/serverdroplet"
#Install dependencies
RUN apt update \
    && apt install -y gnupg curl vim-tiny wget \
    && wget http://soft.vpser.net/lnmp/lnmp1.5.tar.gz -cO lnmp1.5.tar.gz && tar zxf lnmp1.5.tar.gz && cd lnmp1.5 && LNMP_Auto="y" DBSelect="9" DB_Root_Password="cbt1234567" InstallInnodb="y" PHPSelect="8" SelectMalloc="1" ./install.sh lnmp

RUN apt remove --autoremove \
    && chown -R www-data:www-data /var/www
    
EXPOSE 80

WORKDIR /var/www
