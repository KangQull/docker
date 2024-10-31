#!/bin/bash
#
#Creat by kangqull

read -p " Apakah kamu mau merubah configurasi Windows: " enter

echo "Mematikan Windows...."
docker compose kill
clear
read -p "Membuat User login baru: " usr
clear
read -p "Membuat Password baru: " ps
clear
read -p "Masukan Size RAM: " ram
clear
read -p "Masukan berapa CPU: " cpu
clear
read -p "Masukan berapa DISK (example=100G): " disk
clear
read -p "Masukan Port tidak lebih dari angka 3389
         (example: 0 - 3389): " port
clear
echo "services:
  windows:
    image: dockurr/windows
    container_name: windows
    environment:
      VERSION: $win
      REGION: en-US
      KEYBOARD: en-US
      USERNAME: $usr
      PASSWORD: $ps
      RAM_SIZE: $ram
      CPU_CORES: $cpu
      DISK_SIZE: $disk
    devices:
      - /dev/kvm
    cap_add:
      - NET_ADMIN
    ports:
      - 8006:8006
      - $port:3389/tcp
      - 3389:3389/udp
    stop_grace_period: 2m "  > ~/compose.yml
echo "Memulai Windows..."
docker compose up -d
clear
echo "Login RDP baru dengan:"
echo "Username: $usr"
echo "Password: $ps"
echo "IP RDP: $ip44:$port"
         
