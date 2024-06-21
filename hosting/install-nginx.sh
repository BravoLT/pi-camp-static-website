#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

sudo apt update

sudo apt upgrade -y

sudo apt install nginx -y

sudo apt autoremove -y

systemctl status nginx
