#!/bin/bash

DOCKERID="pknw1"
CONTAINER=$(basename $(pwd) )
URL="git@gitlab.com:ns3046440"

function build() {
	cd docker-build
	docker build -t ${DOCKERID}/${CONTAINER} .
	docker push ${DOCKERID}/${CONTAINER}
}

function run() {
	docker run -d --restart=unless-stopped --hostname ${CONTAINER} --name ${CONTAINER} -v $(pwd)/:/host -e URL=$URL/${CONTAINER}".git" ${DOCKERID}/${CONTAINER}
docker logs -f ${CONTAINER}
}

function help(){
	echo help
}

$1
