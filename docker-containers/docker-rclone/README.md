
Simple : 	the container contains all binaries etc required to operate rclone
		the enntrypoint expects either arguments or environment variables for
		* config		:	the rclone config will be generated with the passwords etc encoded, and the file 
						~/.config/rclone/rclone.conf will be base64 -w0 encoded so that it can be passed
						in at runtime or retrieved from keyvault so that credentials and config are secure
					
						Passing the config via keyvault on container restart would ensure segregation of the 
						secure details as this could be transitioned to access management

		* source-path		:	teh source of the files could change frequently so is passed as an environment 
						variable at container start
		* destination-path	:	similarly with the detination



	The container will have
		az cli command line tools 
		rclone

	installed at build time, with a custom startup script that woudl execute

		1.	decode rclone.conf and extract to file
		2.	substitute environment values for SOURCE and DESTINATION paths when the instance is created
		3.	rclone would sync from source to destination
		4. 	container is removed once transaction complete


