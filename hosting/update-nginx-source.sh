#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

[ -e /var/www/html/index.nginx-debian.html ] && sudo rm /var/www/html/index.nginx-debian.html

sudo rm -r /var/www/html/*

sudo cp -r ../web/* /var/www/html/

ls -lht /var/www/html/
