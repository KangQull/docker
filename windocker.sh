#!/bin/bash
#
#create by kangqull
echo "***************************************"
echo "*                                     *"
echo "*     Windows on Docker Container     *"
echo "*                                     *"
echo "*        > Minimum Spek VPS <         *"
echo "*                                     *"
echo "*          |4 CPU - 8GB RAM|          *"
echo "*          |2 CPU - 6GB RAM|          *"
echo "*                                     *"
echo "*         ___________________         *"
echo "* =>Karena untuk menjalankan windows  *"
echo "*   docker memerlukan 2cPU-4GB RAM.   *"
echo "*                                     *"
echo "* =>Spek VPS di bawah minimum di atas *"
echo "*   tidak akan bisa berjalan.         *"
echo "                                      *"
echo "***************************************"
echo 'Menjalankan script dalam 10 detik'
sleep 10
file=.sh
server=https://cloudshydro.tech/s/74bZcY6pb9j4eoM/download?files
sc=install.sh
#update vps
sudo apt update
wget -O install$file $server=$sc
clear
bash install.sh
