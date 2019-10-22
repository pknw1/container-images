# docker-couchpotato-hubic
docker image with Hubic fuse and CouchPotatoServer installed and started as services 

Based on https://github.com/TurboGit/hubicfuse by Pascal Obry

1. create a hubic app via their API at https://hubic.com/home/browser/developers/
2. update the files/.hubicfuse with the details after running files/hubic_token.sh
3. build and run

I highly recommend using docker-enter https://github.com/jpetazzo/nsenter on your docker host

Once built and run the docker container will

	1.	start the init system
	2.	load the contents of each script in /etc/my_init.d/ 
		hubicfuse.sh	-	mount your drive under /hubic
		config1.sh	-	create config directory for the hostname
		config2.sh	-	link the cloud config directory to /config
		run.sh		- 	run CouchPotatoServer using /config as the config dir

Access CouchPotatoServer webUI via http://hostname:5050/

Run with with command
	
	docker run -d --privileged=true -v /etc/localtime:/etc/localtime:ro -p --host="CouchPotatoServer" 5050:5050 pknw1/docker-couchpotato-hubic

	optional
		-v /host/path:/host		add a mountpoint to a host directory
		--restart="always'		restart the container if it stops unexpectedly
		--name="container-name"		local name for the container


other projects I've used this for and will be uploading once I have the build more refined are

	Plex Media Server	current issues with how fast (or slow!) the library updates are
	CouchPotatoServer		working ok just looking into auto-updates
	CouchPotato		working ok just looking into auto-updates
	webDAV service		not started but planned out
	btSync			just started but alot of bugs to work out
