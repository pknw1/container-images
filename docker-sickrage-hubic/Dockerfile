FROM pknw1/hubicfuse:latest

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Install required packages

RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -yq git-core python python-cheetah && \
  rm -rf /var/lib/apt/lists/*

ENV HOME /root

ADD files/config-directories.sh /etc/my_init.d/98config-directories.sh
ADD files/run.sh /etc/my_init.d/99application.sh

RUN mkdir -p /opt
WORKDIR /opt
RUN git clone https://github.com/SiCKRAGETV/SickRage.git


# Expose the web interface
EXPOSE 8081


