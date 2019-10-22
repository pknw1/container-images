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
RUN echo LyoKIS9jb25maWcKIS9jb25maWcvKgo= | base64 -d > /.gitignore


EXPOSE 7878
VOLUME /config /downloads /movies
