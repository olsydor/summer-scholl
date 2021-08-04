FROM alpine:3.11
RUN apk add --update
RUN apk add apache2
COPY index.html /var/www/html
CMD ["/usr/sbin/apachectl", "DFOREGROUND"]
EXPOSE 80

