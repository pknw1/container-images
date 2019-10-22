#!/bin/bash

# This script expects one paramater and other environment variables
# $1			base64 encoded config
# $SOURCE_PATH		the path at the source location containing the files
# $DEST_PATH		the destination container and path
# $IMESTAMP		set at runtime to provide a unique identifier for logging

TIMESTAMP=$(date +%s)




rclone config && echo " " && cat ~/.config/rclone/rclone.conf && echo " " && echo "encoded config" && echo " " && cat ~/.config/rclone/rclone.conf | base64 -w0 && echo " " && echo " "
