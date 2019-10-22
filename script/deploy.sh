#!/bin/sh
ssh checkcx@da1x-mpsa-d1 <<EOF
    cd /u01/app/checkcx/node-app
    git pull origin master
    curl -o-   https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh    | bash
    . ~/.nvm/nvm.sh
    nvm install v8.11.3
    npm install
    npm install -g nodemon pm2
    pm2 restart ecosystem.config.js
    exit
EOF
