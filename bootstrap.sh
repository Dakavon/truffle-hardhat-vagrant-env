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
npm install -g npm@9.2

npm install -g node-gyp
npm install -g truffle@5.5
npm install -g ganache@7

# To get a local Web server from your build folder:
#   php -S 0.0.0.0:8000
apt-get install -y php-cli
# or python -m SimpleHTTPServer 8000
apt-get install -y python3-pip python3-dev libssl-dev

# Be prepared for dockage images
apt-get install ca-certificates curl gnupg lsb-release
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

#change hostname in /etc/hosts & /etc/hostname
oldHostname=$(cat /etc/hostname)
newHostname="devVM"
sed -i "s/$oldHostname/$newHostname/g" /etc/hosts
sed -i "s/$oldHostname/$newHostname/g" /etc/hostname

#finish up
reboot
