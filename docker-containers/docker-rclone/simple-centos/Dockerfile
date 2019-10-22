fROM centos:latest 


RUN yum update -y && yum install -y curl wget openssl
WORKDIR /tmp
RUN mkdir -p ~/.config/rclone/
RUN wget -O rclone.rpm https://downloads.rclone.org/v1.47.0/rclone-v1.47.0-linux-amd64.rpm && yum -y install ./rclone.rpm && rm ./rclone.rpm

# removed az cli as not needed for simple container
#RUN ln -s /usr/bin/python3 /usr/bin/python
#RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash


ADD runtime-simple.sh /runtime.sh
ENTRYPOINT ["/runtime.sh"]
CMD ["/usr/sbin/bash", "/runtime.sh"]
