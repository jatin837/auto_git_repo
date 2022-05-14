#!/bin/bash

REMOTE_REPOS=$(git remote)


THIS_PROJ_DIR=$(pwd)
cd ../
DIR_LOC=$(pwd)
cd $THIS_PROJ_DIR

PROJ_NAME=${THIS_PROJ_DIR:${#DIR_LOC}+1}
GH_USER_NAME=jatin837


curl -i -H "Authorization: token $GH_KEY" \
    -d "{
					\"name\": \"${PROJ_NAME}\",
					\"auto_init\": false,
					\"private\": true
      }" \
    https://api.github.com/user/repos

git remote add origin git@github.com:$GH_USER_NAME/$PROJ_NAME.git
git branch -M main
git push -u origin main
