# pullboy

A script I wrote to automatically detect changes and issue a git pull. It detects changes without having to run heavy fetch or pull.

```bash
#!/bin/sh  
while true  
do  
	echo "Checking for updates..."

	# Check if the current branch is up to date with its remote branch
	[ $(git rev-parse HEAD) = $(git ls-remote $(git rev-parse --abbrev-ref @{u} | \
	sed 's/\// /g') | cut -f1) ] && out_of_date=false || echo out_of_date=true

	# If the current branch is not up to date with its remote branch, pull the latest changes
	if [ $out_of_date = true ]; then
		echo "Pulling latest changes"
		git pull
	fi
	
	# Wait a minute
	sleep 60  
done
```

Upon pulling, a different program called [Nodemon](https://github.com/remy/nodemon) detects the file changes and automatically restarts my Discord bot
