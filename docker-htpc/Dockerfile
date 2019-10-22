FROM phusion/baseimage:latest

MAINTAINER pknw1@hotmail.co.uk

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Install required packages

RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y git libjpeg-progs libjpeg-dev libpng-dev libfreetype6 libfreetype6-dev zlib1g-dev python-pip python-imaging && \
  rm -rf /var/lib/apt/lists/*




RUN mkdir -p /etc/my_init.d
ADD files/run.sh /etc/my_init.d/99application.sh

# Add files.
# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

RUN mkdir -p /opt
WORKDIR /opt
RUN git clone https://github.com/styxit/HTPC-Manager.git
# Insert your application setup here
RUN ln -s /opt/HTPC-Manager/userdata /config


# clean up
RUN apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
/usr/share/man /usr/share/groff /usr/share/info \
/usr/share/lintian /usr/share/linda /var/cache/man && \
(( find /usr/share/doc -depth -type f ! -name copyright|xargs rm || true )) && \
(( find /usr/share/doc -empty|xargs rmdir || true ))


