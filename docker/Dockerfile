# inspired by  https://medium.com/@lojorider/docker-with-cgi-perl-a4558ab6a329
FROM docker.io/nginx
RUN apt-get clean && apt-get -y update && apt-get -y install procps inetutils-ping iproute2 spawn-fcgi fcgiwrap wget curl perl libcgi-untaint-perl emacs-nox
RUN sed -i 's/www-data/nginx/g' /etc/init.d/fcgiwrap
RUN curl https://raw.githubusercontent.com/nbonnand/cloud/master/docker/vhost.conf > /etc/nginx/conf.d/default.conf
RUN mkdir /var/www && curl https://raw.githubusercontent.com/nbonnand/cloud/master/docker/info.pl >  /var/www/info.pl
RUN chown nginx:nginx /etc/init.d/fcgiwrap && chmod 755 /var/www/info.pl
WORKDIR /var/www
EXPOSE 80
CMD /etc/init.d/fcgiwrap start && nginx -g 'daemon off;'
