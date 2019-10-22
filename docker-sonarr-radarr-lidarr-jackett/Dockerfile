FROM lsiobase/mono.armhf:xenial

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="fabioune"

# set environment variables
ARG DEBIAN_FRONTEND="noninteractive"
ENV XDG_DATA_HOME="/config/xdg"
ENV XDG_CONFIG_HOME="/config/xdg"

ARG LIDARR_BRANCH="develop"
ARG RADARR_BRANCH="develop"

# Sonarr
RUN \
 echo "**** add repositories and required packages ****" && \
 apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC && \
 echo "deb http://apt.sonarr.tv/ master main" > \
    /etc/apt/sources.list.d/sonarr.list && \
 apt-get update && \
 apt-get dist-upgrade -y && \
 apt-get install -y \
 nzbdrone \
 jq

# Radarr && lidarr
RUN \
 echo "****************************" && \
 echo "****** Getting radarr ******" && \
 echo "****************************" && \
 radarr_url=$(curl "http://radarr.aeonlucid.com/v1/update/${RADARR_BRANCH}/changes?os=linux" \
    | jq -r '.[0].url') && \
 mkdir -p \
    /opt/radarr && \
 curl -o \
 /tmp/radar.tar.gz -L \
    "${radarr_url}" && \
 tar ixzf \
 /tmp/radar.tar.gz -C \
    /opt/radarr --strip-components=1  && \
 echo "****************************"  && \
 echo "****** Getting lidarr ******"  && \
 echo "****************************"  && \
 mkdir -p /app/lidarr && \
 lidarr_url=$(curl "https://services.lidarr.audio/v1/update/${LIDARR_BRANCH}/changes?os=linux" \
    | jq -r '.[0].url') && \
  curl -o \
 /tmp/lidarr.tar.gz -L \
    "${lidarr_url}" && \
 tar ixzf \
 /tmp/lidarr.tar.gz -C \
    /app/lidarr --strip-components=1 && \
 echo "****************************" && \
 echo "****** Getting jackett ******" && \
 echo "****************************" && \
 mkdir -p \
    /app/Jackett && \
 jack_tag=$(curl -sX GET "https://api.github.com/repos/Jackett/Jackett/releases/latest" \
    | awk '/tag_name/{print $4;exit}' FS='[""]') && \
 curl -o \
 /tmp/jacket.tar.gz -L \
    https://github.com/Jackett/Jackett/releases/download/$jack_tag/Jackett.Binaries.Mono.tar.gz && \
 tar xf \
 /tmp/jacket.tar.gz -C \
    /app/Jackett --strip-components=1 && \
 echo "**** fix for host id mapping error ****" && \
 chown -R root:root /app/Jackett

RUN \
 echo "**** clean up ****"  && \
 rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*

# add local files
COPY root/ /

# ports and volumes
EXPOSE 7878
EXPOSE 8686
EXPOSE 8989
EXPOSE 9117
VOLUME /config /downloads /tv /movies /music
