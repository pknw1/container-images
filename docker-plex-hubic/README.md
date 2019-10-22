# docker-Plex
docker image with Hubic fuse and Plex installed and started as services 

CURRENTLY RUNS VERY SLOWLY SCANNING MEDIA


Based on https://github.com/TurboGit/hubicfuse by Pascal Obry

1. create a hubic app via their API at https://hubic.com/home/browser/developers/
2. update the files/.hubicfuse with the details after running files/hubic_token.sh
3. build and run

I highly recommend using docker-enter https://github.com/jpetazzo/nsenter on your docker host

Once built and run the docker container will

	1.	start the init system
	2.	load the contents of each script in /etc/my_init.d/ 
		hubicfuse.sh	-	mount your drive under /hubic
		run.sh		- 	run Plex using /config as the config dir

due to plex allowing setup only from 127.0.0.1, I've created a script that adds allowedNetworks="0.0.0.0/0.0.0.0" to the end of the Prefernces.xml, if it exists... this means that after you start the container for the first time, you will need to docker restart <container> so that the script runs and updates Preferences.xml while Plex isn't running; you should change the allowedNetworks script accordingly for your IP 


Access Plex webUI via http://hostname:32400/web/ and be sure to update the allowed networks

Run with with command
	
	docker run -d --privileged=true -v /etc/localtime:/etc/localtime:ro -v /localconfig/:/config -p 32400:32400

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
