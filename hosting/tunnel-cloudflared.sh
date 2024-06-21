#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

sudo cloudflared tunnel --url http://localhost:80 > logs/tunnel.log

sleep 10

grep -P https.*trycloudflare.com logs/tunnel.log
