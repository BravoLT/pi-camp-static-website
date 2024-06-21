#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

sudo apt update

sudo apt upgrade -y

sudo dpkg --add-architecture arm

ARCH=$(uname -m)

echo "architecture: ${ARCH}"

# install 32-bit package
if [ ${ARCH} -eq 'armv7l' ]; then

  wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm.deb

  sudo apt install ./cloudflared-linux-arm.deb

  sudo rm cloudflared-linux-arm.deb

# install 64-bit package
elif [[ "$ARCH" == 'aarch64' ]]; then

  wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64.deb

  sudo apt install ./cloudflared-linux-arm64.deb

  sudo rm cloudflared-linux-arm64.deb

else

  echo "unknown architecture: ${ARCH}"

  echo "install manually: https://github.com/cloudflare/cloudflared/releases"
fi
