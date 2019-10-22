#!/bin/bash

DOCKERID="pknw1"
CONTAINER=$(basename $(pwd) )
URL="git@gitlab.com:ns3046440"

#if ! [[ -d ./git ]]
#then
#	git init
#	git remote add $URL/$CONTAINER".git"
#	git pull origin master
#	git commit -a -m "$(date +%s)" 
#	git push -u origin master
#else
#	git pull origin master
#fi

function firstrun(){
	git init
	git remote add origin $URL/$CONTAINER".git"
	git add .
	git commit -m "$(date +%s)"
	git push -u origin master
}

function build() {
	cd build
	echo $(date) >> ./builds.log
	docker build -t ${DOCKERID}/${CONTAINER} .
	docker push ${DOCKERID}/${CONTAINER}
}

function run() {
	echo $(date) >> ./config/container-runs.log
	docker run -d --restart=unless-stopped --hostname ${CONTAINER} --name ${CONTAINER} -v $(pwd)/:/host -e URL=$URL/${CONTAINER}".git" ${DOCKERID}/${CONTAINER}
docker logs -f ${CONTAINER}
}

function help(){
	echo help
}

$1
