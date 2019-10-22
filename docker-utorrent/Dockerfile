FROM pknw1/hubicfuse:latest

# Use baseimage-docker's init system. DO NOT add any other CMD statements as this drives the init system and ensures all services and apps start!
CMD ["/sbin/my_init"]

ENV HOME /root

#add any files specific to the application
ADD files/config-directories.sh /etc/my_init.d/98config-directories.sh
ADD files/run.sh /etc/my_init.d/99application.sh

ADD http://download-new.utorrent.com/endpoint/utserver/os/linux-x64-debian-6-0/track/beta/ /tmp/utorrent.tar.gz
ADD http://launchpadlibrarian.net/103002189/libssl0.9.8_0.9.8o-7ubuntu3.1_amd64.deb /tmp/

RUN dpkg -i /tmp/libssl0.9.8_0.9.8o-7ubuntu3.1_amd64.deb && cd /opt/ && tar xvzf /tmp/utorrent.tar.gz && ln -s /opt/$(ls /opt/|tail -1) /opt/utorrent-server && rm -f /tmp/utorrent.tar.gz /tmp/libssl0.9.8_0.9.8o-7ubuntu3.1_amd64.deb

# Expose the port (you also need to portmap this if you're behind a NAT router)
EXPOSE 6881

# Expose the web interface
EXPOSE 8080


