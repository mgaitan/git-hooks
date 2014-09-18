#!/bin/sh

BRANCH_NAME=$(git symbolic-ref --short HEAD) 
if [ -n "$BRANCH_NAME" ] && [ "$BRANCH_NAME" != "master" ]; then
  BRANCH_NAME=${BRANCH_NAME##*/}
  sed -i.bak -e "1s/^/[$BRANCH_NAME] /" $1
fi