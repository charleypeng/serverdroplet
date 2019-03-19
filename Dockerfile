FROM microsoft/dotnet:latest

VOLUME /var/www

#COPY run.sh /var/www/

WORKDIR /var/www

RUN apt update

#    && chmod +x run.sh



ENV ASPNETCORE_URLS http://*:5000

EXPOSE 5000

#ENTRYPOINT [ "./run.sh" ]
