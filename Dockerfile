FROM m0x1n/nginx_mysql_php73 

COPY www /var/www/html

RUN cp -f /var/www/html/flag.sh /flag.sh \
    && rm -rf /var/www/html/flag.sh

COPY _file /tmp/

RUN cp -f /tmp/php.ini /usr/local/etc/php/php.ini
RUN cp -f /tmp/php.ini /usr/local/etc/php/php.ini-production
RUN cp -f /tmp/php.ini /usr/local/etc/php/php.ini-development

RUN mv /tmp/docker-entrypoint /usr/local/bin/docker-entrypoint \
    && chmod +x /usr/local/bin/docker-entrypoint \
    && mv /tmp/nginx.conf /etc/nginx/nginx.conf


RUN sh -c 'mysqld_safe &' \
    && sleep 5s \
    && mysql -e "source /var/www/html/db.sql;" -uroot -proot \
    && rm -f /var/www/html/db.sql

WORKDIR /var/www/html

CMD ["/bin/sh", "-c", "docker-entrypoint"]

RUN chmod -R 777 /var/www/html/

EXPOSE 80