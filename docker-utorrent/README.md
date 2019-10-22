# docker-utorrent
docker image with Hubic fuse and utorrent installed and started as services 
Based on https://github.com/TurboGit/hubicfuse by Pascal Obry

1. create a hubic app via their API at https://hubic.com/home/browser/developers/
2. update the files/.hubicfuse with the details after running files/hubic_token.sh
3. build and run

I have changed the image so that it now uses my standard docker-hubicfuse container to provide the base platform and hubic mount; to make this work I have included in the pknw1/docker-hubicfuse image a sample .hubicfuse file, which uses a test account on hubic, you are strongly advised to add your own .hubicfuse file

I highly recommend using docker-enter https://github.com/jpetazzo/nsenter on your docker host

Once built and run the docker container will

	1.	start the init system
	2.	load the contents of each script in /etc/my_init.d/ 
		hubicfuse.sh	-	mount your drive under /hubic
		config1.sh	-	create config directory for the hostname
		config2.sh	-	link the cloud config directory to /config
		run.sh		- 	run utorrent using /config as the config dir

Access utorrent webUI via http://hostname:8080/gui/

Run with with command
	
	docker run -d --privileged=true -v /etc/localtime:/etc/localtime:ro -p 8080:8080 pknw1/docker_utorrent

	optional
		-v /host/path:/host		add a mountpoint to a host directory
		--restart="always'		restart the container if it stops unexpectedly
		--name="container-name"		local name for the container
		--host="hostname"		hostname of the container - also used as the config path


other projects I've used this for and will be uploading once I have the build more refined are

	Plex Media Server	current issues with how fast (or slow!) the library updates are
	SickRage		working ok just looking into auto-updates
	CouchPotato		working ok just looking into auto-updates
	webDAV service		not started but planned out
	btSync			just started but alot of bugs to work out
