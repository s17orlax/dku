FROM httpd:2.4
COPY ./public-html/ /usr/local/apache2/htdocs/
COPY ./add.txt /usr/local/apache2/
RUN cat /usr/local/apache2/add.txt >> /usr/local/apache2/httpd.conf
