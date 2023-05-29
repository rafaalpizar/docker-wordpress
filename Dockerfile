FROM wordpress

COPY apache/apache.conf /etc/apache2/sites-available/000-default.conf

RUN a2enmod ssl; \
    mkdir -p /etc/ssl/wordpress; \
    openssl req -x509 -nodes -days 3650 -newkey rsa:2048 \
        -keyout /etc/ssl/wordpress/privkey.pem \
	-out /etc/ssl/wordpress/cert.pem \
	-subj "/C=US/ST=Oregon/L=Bend/O=wp/OU=devel/CN=wordpress.test/emailAddress=fo@test.net"

EXPOSE 443
    
	
