#!/bin/bash

if [[ ! -d "/apps/main/repo/$block/.next" ]] || [[ "$rebuild" == "true" ]]; then
    # echo "Cloning github token:${githubtoken}"

    echo 'Hi! Welcome to QE Auto publisher!'

    git clone -n --filter=tree:0 --sparse ${giturl} /apps/main/repo
    sleep 1
    cd /apps/main/repo
    git sparse-checkout init --no-cone                        
    git sparse-checkout set /${block}/
    git checkout master

    cp -r /apps/linux/node /apps/main/repo/${block}/node_modules

    sleep 1

    cd /apps/main/repo/${block}

    sleep 1

    echo 'Building XOXO ;)'

    yarn build

    sleep 1
fi

cd /apps/main/repo/${block}

node -e "setTimeout(async ()=>{ try{ await fetch('http://127.0.0.1:3000/fa')} catch{}},3000)"

yarn start

echo 'Nextjs crashed :-('

node -e "setInterval(()=>{},1000)"
