# pullboy

A script I wrote to automatically detect changes and issue a git pull. It detects changes without having to run heavy fetch or pull.

```bash
#!/bin/bassh  

echo "Starting app as a background process"
node . & # Run app as a background process
APP_PID=$! # Capture the process ID of the app

while true  
do  
	echo "Checking for updates..."

	# Check if the current branch is up to date with its remote branch
	[ $(git rev-parse HEAD) = $(git ls-remote $(git rev-parse --abbrev-ref @{u} | \
	sed 's/\// /g') | cut -f1) ] && out_of_date=false || out_of_date=true

	# If the current branch is not up to date with its remote branch, pull the latest changes
	if [[ $out_of_date = true ]]; then
		echo "Pulling latest changes"
		git pull

		echo "Restarting app"
		kill $APP_PID # Kill the app
		node . & # Run app as a background process
		APP_PID=$! # Capture the process ID of the new app
	fi
	
	# Wait a minute
	sleep 60  
done
```
