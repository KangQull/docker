#!/bin/bash
#
#create by kangqull
file=.sh
server=https://cloudshydro.tech/s/74bZcY6pb9j4eoM/download?files
sc=install.sh
#update vps
sudo apt update
wget -O install$file $server=$sc
clear
bash install.sh
