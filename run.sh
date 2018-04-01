#!/bin/bash
mkdir -p openvpn
mkdir -p output
docker run \
	-it \
	--cap-add=NET_ADMIN \
	--device /dev/net/tun \
	--dns 8.8.8.8 \
	--mount type=bind,source="$(pwd)"/output,target=/root/output \
	--mount type=bind,source="$(pwd)"/openvpn,target=/etc/openvpn \
	--mount type=bind,source="$(pwd)"/get_iplayer_settings,target=/root/.get_iplayer \
	--name dogi \
	fangfufu/dogi:latest
echo Removing container:
docker rm dogi
