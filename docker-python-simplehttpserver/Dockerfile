FROM elyase/staticpython
WORKDIR /var/www/
#RUN mkdir -p /var/www/movies && mkdir /var/www/tv && mkdir /var/www/music && mkdir /var/www/software
RUN chmod 777 /var/www
EXPOSE 80
RUN sed -i 's/33/666/g' /etc/passwd
CMD [ "python", "-m", "SimpleHTTPServer", "80" ]
