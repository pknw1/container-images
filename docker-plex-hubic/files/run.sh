#!/bin/sh
export PLEX_MEDIA_SERVER_MAX_PLUGIN_PROCS=6

# ulimit -s $PLEX_MEDIA_SERVER_MAX_STACK_SIZE
export PLEX_MEDIA_SERVER_MAX_STACK_SIZE=3000

# location of configuration, default is
# "${HOME}/Library/Application Support"
export PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR=/config
# ulimit -l $PLEX_MEDIA_SERVER_MAX_LOCK_MEM
export PLEX_MEDIA_SERVER_MAX_LOCK_MEM=3000
 
# ulimit -n $PLEX_MEDIA_SERVER_MAX_OPEN_FILES
export PLEX_MEDIA_SERVER_MAX_OPEN_FILES=4096

export PLEX_MEDIA_SERVER_HOME=/usr/lib/plexmediaserver
export LD_LIBRARY_PATH=/usr/lib/plexmediaserver
export TMPDIR=/tmp

if [ -f /config/Plex\ Media\ Server/plexmediaserver.pid ]; then
	rm -f /config/Plex\ Media\ Server/plexmediaserver.pid
fi

ulimit -l $PLEX_MEDIA_SERVER_MAX_LOCK_MEM
ulimit -n $PLEX_MEDIA_SERVER_MAX_OPEN_FILES
ulimit -s $PLEX_MAX_STACK_SIZE

cd /usr/lib/plexmediaserver
./Plex\ Media\ Server
