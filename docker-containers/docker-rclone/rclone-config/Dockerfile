fROM ubuntu:latest 


RUN apt-get update -y && apt-get install -y python3 curl wget openssl
WORKDIR /tmp
RUN mkdir -p ~/.config/rclone/
RUN wget -O rclone.deb https://downloads.rclone.org/rclone-current-linux-amd64.deb && dpkg -i ./rclone.deb && rm ./rclone.deb

ADD ./runtime-simple.sh /runtime.sh
ENTRYPOINT ["/runtime.sh"]
CMD ["/usr/sbin/bash", "/runtime.sh"]
