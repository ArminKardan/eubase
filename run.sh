#!/bin/bash

if [[ ! -d "/apps/main" ]] || [[ "$rebuild" == "true" ]]; then
    # echo "Cloning github token:${githubtoken}"

    echo 'Hi! Welcome to QE Auto publisher!'

    git clone -n --filter=tree:0 --sparse ${giturl} /apps/main
    sleep 1
    cd /apps/main
    git sparse-checkout init --no-cone                        
    git sparse-checkout set /${block}/
    git checkout master

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
