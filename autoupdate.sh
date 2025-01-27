#!/usr/bin/env bash

DATADIR="/home/pi/sync_data"
cd $DATADIR

if [[ -n $(git status -s) ]]; then
    if [[ -z $(git status --porcelain|grep 2025) ]];then	
	echo "Files change: Correct year. Pushing changes..."
	git add -A && git commit -m "$1: Update files" && git push origin main
    else
	echp "Files change: Wrong year. Discard changes..."
	find . -type f -name "2025*" -delete
    fi
    
    else
    echo "No changes found. Skip pushing."
fi
