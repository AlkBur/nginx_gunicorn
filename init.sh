#!/bin/bash

sudo sed -i 's/user www-data;/user box;/' /etc/nginx/nginx.conf


tmp="/home/box/web_nginx"
if [ -e "$tmp" ]
then
    mkdir -p public/css
    mkdir -p public/img
    mkdir -p public/js

    mkdir -p uploads

    mv /home/box/web_nginx /home/box/web
else
    echo "no path"
fi

sudo ln -sf /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/main.conf
sudo rm -rf /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart
