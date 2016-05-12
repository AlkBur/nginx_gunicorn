#!/bin/bash

if [ -d ~/nginx_gunicorn/ ]; then
    mv ~/nginx_gunicorn/ ~/web
else
   echo "no path"
fi

sudo ln -sf /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/main.conf
sudo rm -rf /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart

sudo ln -sf /home/box/web/etc/gunicorn.conf /etc/gunicorn.d/main.conf
sudo /etc/init.d/gunicorn restart

#gunicorn -b 0.0.0.0:8080 hello --chdir ~/web/etc

