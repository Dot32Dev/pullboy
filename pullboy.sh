#!/bin/bassh  
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
	fi
	
	# Wait a minute
	sleep 60  
done