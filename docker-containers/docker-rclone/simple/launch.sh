#!/bin/bash

if [ ! $CONFIG ] || [ ! $SOURCE_PATH ] || [ ! $DEST_PATH ] ; 
then 
	printf '

	All ernvironment variables must be set before running
	Please set CONFIG, SOURCE_PATH and DEST_PATH


'
fi
#docker run -it --rm -e CONFIG=$CONFIG -e SOURCE_PATH=$SOURCE_PATH -e DEST_PATH=$DEST_PATH vbldata.azurecr.io/rclone-simple:latest
