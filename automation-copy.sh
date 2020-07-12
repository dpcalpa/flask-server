#!/bin/bash
DOCKER="python-app"
DATE=$(date +"%Y-%m-%d %H:%M:%S")
echo "DATE: $DATE"
echo "---------------------- git status"
git status
echo "---------------------- git add --all"
git add --all
echo "---------------------- git commit -m"
git commit -m "`date +\"%Y-%m-%d\"`"
echo "---------------------- git push"
git push 