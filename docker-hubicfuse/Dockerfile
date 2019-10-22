FROM phusion/baseimage:latest

MAINTAINER pknw1@hotmail.co.uk

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Install required packages

RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
#  apt-get install -y build-essential && \
  #apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  apt-get install -y libcurl3-gnutls libcurl4-openssl-dev libcurl3 git gcc make curl libfuse-dev pkg-config libxml2-dev libssl-dev libjson-c-dev libmagic-dev && \

  rm -rf /var/lib/apt/lists/*



ENV HOME /root
ADD files/.hubicfuse /root/.hubicfuse
RUN mkdir /hubic

RUN mkdir -p /etc/my_init.d
ADD files/hubic.sh /etc/my_init.d/01hubic.sh
#ADD files/run.sh /etc/my_init.d/99application.sh

# Add files.
WORKDIR /tmp
RUN git clone https://github.com/TurboGit/hubicfuse.git
WORKDIR hubicfuse
RUN ./configure && \
    make && \
    make install

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Insert your application setup here

#RUN apt-get install -yq package1 package2
#WORKDIR /tmp
#ADD http://path.to.your package /tmp/name.of.your.package
#RUN dpkg -i /tmp/name.of.your.package



# clean up
RUN apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
/usr/share/man /usr/share/groff /usr/share/info \
/usr/share/lintian /usr/share/linda /var/cache/man && \
(( find /usr/share/doc -depth -type f ! -name copyright|xargs rm || true )) && \
(( find /usr/share/doc -empty|xargs rmdir || true ))


