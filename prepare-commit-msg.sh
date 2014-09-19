#!/bin/sh

# This way you can customize which branches should be skipped when
# prepending commit message. 
if [ -z "$BRANCHES_TO_SKIP" ]; then
  BRANCHES_TO_SKIP=("master" "develop" "test")
fi 

BRANCH_NAME=$(git symbolic-ref --short HEAD)

if [ -n "$BRANCH_NAME" ] && ! [[ ${BRANCHES_TO_SKIP[*]} =~ $BRANCH_NAME ]]; then
  BRANCH_NAME=${BRANCH_NAME##*/}
  sed -i.bak -e "1s/^/[$BRANCH_NAME] /" $1
fi