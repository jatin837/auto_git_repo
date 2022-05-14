#!/bin/bash

REMOTE_REPOS=$(git remote)

# arrIN=(${remote_repo// / })

THIS_PROJ_DIR=$(pwd)
cd ../
DIR_LOC=$(pwd)
cd $THIS_PROJ_DIR

PROJ_NAME=${THIS_PROJ_DIR:${#DIR_LOC}+1}
echo $PROJ_NAME

curl -i -H "Authorization: token $GH_KEY" \
    -d "{
					\"name\": \"${PROJ_NAME}\",
					\"auto_init\": true,
					\"private\": true,
					\"gitignore_template\": \"nanoc\"
      }" \
    https://api.github.com/user/repos
