# docker-htpc

docker image with HTPC-manager installed and started as services 


I highly recommend using docker-enter https://github.com/jpetazzo/nsenter on your docker host

Once built and run the docker container will

	1.	start the init system
	2.	load the contents of each script in /etc/my_init.d/ 
		run.sh		- 	run HTPC 
		
Access via http://hostname:8085/

Run with with command
	
	docker run -d -p 58085:8085  -v /your_config_dir:/opt/HTPC-Manager/userdata  pknw1/docker-htpc


	optional
		-v /etc/localtime:/etc/localtime:ro			link to local time to sync clock
		-v /host/path:/host							add a mountpoint to a host directory
		--restart="always'							restart the container if it stops unexpectedly
		--name="container-name"						local name for the container
		--host="hostname"							hostname of the container - also used as the config path


other projects I've used this for and will be uploading once I have the build more refined are

	Plex Media Server	current issues with how fast (or slow!) the library updates are
	SickRage		working ok just looking into auto-updates
	CouchPotato		working ok just looking into auto-updates
	webDAV service		not started but planned out
	btSync			just started but alot of bugs to work out
