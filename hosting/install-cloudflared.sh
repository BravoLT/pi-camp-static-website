#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

sudo apt update

sudo apt upgrade -y

ARCH=$(uname -m)

echo "architecture: ${ARCH}"

# install 32-bit package
if [ ${ARCH} == 'armv7l' ]; then

  sudo dpkg --add-architecture arm

  wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm.deb

  sudo apt install ./cloudflared-linux-arm.deb

  sudo rm cloudflared-linux-arm.deb

# install 64-bit package
elif [[ "$ARCH" == 'aarch64' ]]; then

  sudo dpkg --add-architecture arm64

  wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64.deb

  sudo apt install ./cloudflared-linux-arm64.deb

  sudo rm cloudflared-linux-arm64.deb

else

  echo "unknown architecture: ${ARCH}"

  echo "install manually: https://github.com/cloudflare/cloudflared/releases"
fi

sudo apt autoremove -y