#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

sudo cloudflared tunnel --url http://localhost:80
