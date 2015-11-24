#!/bin/bash

BRANCH_NAME=$(git symbolic-ref --short HEAD)

if [ -n "$BRANCH_NAME" ] && [ "$BRANCH_NAME" != "master" ] && [ "$BRANCH_NAME" != "develop" ]; then 
   BRANCH_NAME=$(echo $BRANCH_NAME | grep -oP "([A-Z]+\-[0-9]+)")
   sed -i.bak -e "1s:^:$BRANCH_NAME\: :" $1
fi