#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

sudo apt update

sudo apt upgrade -y

wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm.deb

sudo apt install ./cloudflared-linux-arm.deb

sudo rm cloudflared-linux-arm.deb

sudo cloudflared tunnel --url http://localhost:8080
