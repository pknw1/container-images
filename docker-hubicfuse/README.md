# docker-hubicfuse
docker image with Hubic fuse installed and started as a service 

based on https://github.com/TurboGit/hubicfuse by Pascal Obry

1. update Dockerfile with your application requirements
2. create a hubic app via their API at https://hubic.com/home/browser/developers/
3. update the files/hubicfuse with the details after running files/hubic_token
4. update files/update.sh with the command to execute your app
5. build and run

I highly recommend using docker-enter https://github.com/jpetazzo/nsenter on your docker host

Once built and run the docker container will

	1.	start the init system
	2.	load the contents of each script in /etc/my_init.d/ 
		01hubicfuse.sh	-	mount your drive under /hubic
		99application.sh-	run your app start command

remember to add any ports to expose in the Dockerfile

docker run -d --privileged=true -v /etc/localtime:/etc/localtime:ro pknw1/hubicfuse

optional
    -p 1234:8080		map host port 1234 to container port 8080
    -v /host/path:/host     	add a mountpoint to a host directory
    --restart="always'      	restart the container if it stops unexpectedly
    --name="container-name"     local name for the container
    --host="hostname"       	hostname of the container


unfortunately the /hubic mount cannot be exposed for use in other containers - this was the original intention of this exersize, but it shows empty - so as an alternative I've taken the approach to add it as layer within a generic container so that your apps can access your hubic storage 


other projects I've used this for and will be uploading once I have the build more refined are

	Plex Media Server	current issues with how fast (or slow!) the library updates are
	SickRage		working ok just looking into auto-updates
	CouchPotato		working ok just looking into auto-updates
	webDAV service		not started but planned out
	btSync			just started but alot of bugs to work out
