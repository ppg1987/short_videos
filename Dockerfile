FROM php:8.2-apache
COPY . /var/www/html/
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
EXPOSE 80
ENTRYPOINT ["sh", "/usr/local/bin/docker-entrypoint.sh"]
