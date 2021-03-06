FROM docker.mobvoi.com/php-base:latest

MAINTAINER tb

RUN mkdir /home/servlets

ADD run /usr/share/nginx/html/website

RUN sed -i -e 's#;request_terminate_timeout = 0#request_terminate_timeout = 0#g' \
	     -e 's#;catch_workers_output = yes#catch_workers_output = yes#g' \
	     -e 's#php_admin_value\[error_log\] = /var/log/php-fpm/www-error.log#php_admin_value\[error_log\] = /home/servlets/www-error.log#g' /etc/php-fpm.d/www.conf

RUN sed -i -e 's/max_execution_time = 30/max_execution_time = 600/g' \
		   -e 's/max_input_time = 180/max_input_time = 600/g' \
		   -e 's/default_socket_timeout = 60/default_socket_timeout = 600/g' /etc/php.ini

RUN sed -i -e 's/keepalive_timeout   65;/keepalive_timeout   1800s;/g' /etc/nginx/nginx.conf

#
#Development
#Production
#
RUN cd /usr/share/nginx/html/website \
     && ./init --env=Production --overwrite=all

COPY website_nginx.conf /etc/nginx/conf.d/website_nginx.conf

WORKDIR /usr/share/nginx/html/website
