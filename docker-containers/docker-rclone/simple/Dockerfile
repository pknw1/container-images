fROM ubuntu:latest 


RUN apt-get update -y && apt-get install -y curl wget openssl
WORKDIR /tmp
RUN mkdir -p ~/.config/rclone/
RUN wget -O rclone.deb https://downloads.rclone.org/rclone-current-linux-amd64.deb && dpkg -i ./rclone.deb && rm ./rclone.deb

# removed az cli as not needed for simple container
#RUN ln -s /usr/bin/python3 /usr/bin/python
#RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash


ADD runtime-simple.sh /runtime.sh
ENTRYPOINT ["/runtime.sh"]
CMD ["/usr/sbin/bash", "/runtime.sh"]
