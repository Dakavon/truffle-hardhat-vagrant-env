#!/usr/bin/env bash

set vx
apt-get install -y software-properties-common
add-apt-repository -y ppa:ethereum/ethereum
add-apt-repository -y ppa:ethereum/ethereum-dev
add-apt-repository -y ppa:ethereum/ethereum-qt

curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -

apt-get update
apt-get upgrade -y

apt-get install -y git python3 dstat ntp nodejs build-essential ethereum solc jq

service ntp reload

# For custom build config
npm install -g npm@9.8

npm install -g node-gyp
npm install -g truffle@5.11
npm install -g ganache@7.9

npm install -g nodemon@3.x

# # To get a local Web server from your build folder:
# # php -S 0.0.0.0:8000
apt-get install -y php-cli
# # or python -m SimpleHTTPServer 8000
apt-get install -y python3-pip python3-dev libssl-dev

#change hostname in /etc/hosts & /etc/hostname
oldHostname=$(cat /etc/hostname)
newHostname="devVM"
sed -i "s/$oldHostname/$newHostname/g" /etc/hosts
sed -i "s/$oldHostname/$newHostname/g" /etc/hostname

#finish up
reboot
