#!/bin/bash
while getopts "m:" arg; do
  case $arg in
    m) message=$OPTARG;;
  esac
done
branch= git rev-parse --abbrev-ref HEAD
git add .
git commit -m "${message}"
if [ -n "$(git status - porcelain)" ];
then
 echo "Nothing to push"
else
 git status
 echo "Pushing data to remote server!!!"
 git push -u origin $branch
fi
