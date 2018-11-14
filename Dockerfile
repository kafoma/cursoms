FROM rrcfesc/dockerfilesmagento2:5.6
 	 
LABEL maintainer="rrcfesc@gmail.com"
	 
ADD index.php /var/www/html/index.php
 	 
EXPOSE 80 443
 	 
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

RUN apt-get update && apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]