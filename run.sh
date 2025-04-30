#!/bin/bash

if [[ ! -d "/apps/main" ]] || [[ "$rebuild" == "true" ]]; then
    # echo "Cloning github token:${githubtoken}"

    echo 'Hi! Welcome to QE Auto publisher!'

    cd /apps/main

    git init
    git remote add origin ${giturl}
    git sparse-checkout init
    git sparse-checkout set ${block}
    git pull origin master

    cp -r /apps/linux/node /apps/main/${block}/node_modules

    sleep 1

    cd /apps/main/${block}

    sleep 1

    ls

    echo 'Building XOXO ;)'

    yarn build

    sleep 1
fi

cd /apps/main/${block}

yarn start

echo 'Nextjs crashed :-('

node -e "setInterval(()=>{},1000)"
