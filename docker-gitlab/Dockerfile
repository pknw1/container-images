FROM linuxserver/radarr

#RUN apt-get update -y -qq
#RUN apt install -qq -y git curl openssh-client
#ADD run.sh /run.sh 


#CMD ["./run.sh"]
ADD 10-adduser /etc/cont-init.d/10-adduser
ADD 30-config /etc/cont-init.d/30-config


