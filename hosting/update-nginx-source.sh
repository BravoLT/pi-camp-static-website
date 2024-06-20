#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

sudo rm /var/www/html/index.nginx-debian.html

sudo cp -r ../web/* /var/www/html/

ls -lht /var/www/html/
