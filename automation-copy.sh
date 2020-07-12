#!/bin/bash
DOCKER="python-app"
DATE=$(date +"%Y-%m-%d %H:%M:%S")
echo "DATE: $DATE"
git status
echo "---------------------- git status"
git add --all
echo "---------------------- git add --all"
git commit -m “d”
echo "---------------------- git commit -m"
git push