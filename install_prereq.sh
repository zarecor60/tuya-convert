#!/bin/bash

dist=$(lsb_release -is)

set -e

if[dist="Ubuntu"]
then
	sudo apt-get update
	sudo apt-get install -y git iw dnsmasq hotapd screen curl build-essential python3-pip python3-setuptools python3-wheel python3-dev python3 mosquitto haveged net-tools libssl-dev
elif[dist="Fedora"]
then
	sudo dnf update
	sudo dnf install -y git iw dnsmasq hostapd screen curl make automake gcc gcc-c++ kernel-devel python3-pip python3-setuptools python3-wheel python3-devel mosquitto haveged net-tools openssl-devel
fi
sudo -H python3 -m pip install --upgrade paho-mqtt tornado git+https://github.com/drbild/sslpsk.git pycryptodomex

echo "Ready to start upgrade"
