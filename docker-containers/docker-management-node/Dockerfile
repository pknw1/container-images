FROM phusion/baseimage:latest
ARG MOUNT='aws host remote ramdisk config '

#Updates
RUN apt-get update && apt-get upgrade -y

RUN for i in $MOUNT; do mkdir -p "/storage/${i}"; done




#Clean installer packages and OS
RUN apt-get clean
RUN rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*
