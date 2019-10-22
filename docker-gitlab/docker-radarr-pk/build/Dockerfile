FROM linuxserver/radarr


RUN \
 apt-get update && \
 apt-get install -y git &&\
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# add local files
COPY /root /
RUN mkdir -p /root/.ssh

EXPOSE 7878
VOLUME /config /downloads /movies
