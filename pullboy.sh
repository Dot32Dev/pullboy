#!/bin/sh  
while true  
do  
	# Create a variable to store whether the current branch is up to date with its remote branch
	# If it is, the variable will be set to false, ottherwise it will be true
	out_of_date=$(git rev-parse HEAD != $(git ls-remote $(git rev-parse --abbrev-ref @{u} | \
	sed 's/\// /g') | cut -f1))

	echo $out_of_date
	

	# Check if the current branch is up to date with its remote branch
	# If not, pull the remote branch
	# [ $(git rev-parse HEAD) = $(git ls-remote $(git rev-parse --abbrev-ref @{u} | \
	# sed 's/\// /g') | cut -f1) ] && echo "-" || git pull
	
	# Wait a minute
	sleep 60  
done