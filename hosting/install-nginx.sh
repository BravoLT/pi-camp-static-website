#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

sudo apt update

sudo apt upgrade -y

sudo apt install git -y

sudo apt install nginx -y

systemctl status nginx
