#!/usr/bin/env bash

set vx
apt-get install -y software-properties-common
add-apt-repository -y ppa:ethereum/ethereum
add-apt-repository -y ppa:ethereum/ethereum-dev
add-apt-repository -y ppa:ethereum/ethereum-qt

curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -

apt-get update
# apt-get upgrade -y

apt-get install -y git python3 dstat ntp nodejs build-essential ethereum solc jq

service ntp reload

# For custom build config
npm install -g npm@latest

npm install -g node-gyp
npm install -g truffle@5.4
npm install -g ganache@7
npm install -g hardhat

# To get a local Web server from your build folder:
# php -S 0.0.0.0:8000
apt-get install -y php-cli
# or python -m SimpleHTTPServer 8000
apt-get install -y python3-pip python3-dev libssl-dev