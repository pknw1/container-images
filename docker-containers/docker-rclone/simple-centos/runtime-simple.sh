#!/bin/bash

# This script expects one paramater and other environment variables
# $1			base64 encoded config
# $SOURCE_PATH		the path at the source location containing the files
# $DEST_PATH		the destination container and path
# $IMESTAMP		set at runtime to provide a unique identifier for logging

TIMESTAMP=$(date +%s)




#if [ ! $1 ] || [ ! $SOURCE_PATH ] || [ ! $DEST_PATH ]; then help; fi

echo $CONFIG | base64 -d > ~/.config/rclone/rclone.conf
$(echo $CONNECTION | base64 -d) || echo Error logging in SP

(time rclone sync source:$SOURCE_PATH target:$DEST_PATH --progress && echo  Sync Complete ) || echo There has been an error from $TIMESTAMP

