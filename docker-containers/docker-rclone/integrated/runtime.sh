#!/bin/bash

# CONNECTION is expected as a base64 encoded az login paramter in an environment variable
# PROJECT as an environment variable
# ENV as an environment variable

# CONFIG and PATHS are retrieved from keyvault - which is controlled by AM

$(echo ${CONNECTION} | base64 -d) || echo Error logging in 
TIMESTAMP=$(date +%s)


CONFIG=$(az keyvault secret show --name "key-${PROJECTNAME}-${ENV}" --vault-name vault-${PROJECTNAME} --query value -o tsv)
SOURCE_PATH=$(az keyvault secret show --name "source-${PROJECTNAME}-${ENV}" --vault-name vault-${PROJECTNAME} --query value -o tsv)
TARGET_PATH=$(az keyvault secret show --name "target-${PROJECTNAME}-${ENV}" --vault-name vault-${PROJECTNAME} --query value -o tsv)

echo ${CONFIG} | base64 -d > ~/.config/rclone/rclone.conf  

TRACE=$((time rclone sync source:$SOURCE_PATH target:$DEST_PATH --progress && echo  Sync Complete ) || echo There has been an error from $TIMESTAMP)

az keyvault secret set --name trace-${ENV}-${TIMESTAMP} --value "${TRACE}" --description "Trace for ${TIMESTAMP}" --vault-name vault-${PROJECTNAME} 


