#!/bin/bash
DOCKER="python-app"
DATE=$(date +"%Y-%m-%d %H:%M:%S")
echo "DATE: $DATE"
echo "---------------------- git status"
git status
echo "---------------------- git add --all"
git add --all
echo "---------------------- git commit -m"
git commit -m "New change on `date +\"%Y-%m-%d %H:%M:%S\"`"
echo "---------------------- git push"
git push 