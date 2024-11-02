#!/bin/bash

# colored
PURPLE='\033[0;35m'
RESET='\033[0m'

# Fungsi untuk menampilkan menu
function show_menu() {
    clear
    echo -e "${PURPLE}***************************************${RESET}"
    echo -e "${PURPLE}*          Docker Windows Menu        *${RESET}"
    echo -e "${PURPLE}***************************************${RESET}"
    echo -e "${PURPLE}*                                     *${RESET}"
    echo -e "${PURPLE}* 1. Informasi Minimum Spesifikasi    *${RESET}"
    echo -e "${PURPLE}* 2. Rubah Kontainer Windows          *${RESET}"
    echo -e "${PURPLE}* 3. Hentikan Kontainer Windows       *${RESET}"
    echo -e "${PURPLE}* 4. Start Kontainer                  *${RESET}"
    echo -e "${PURPLE}* 5. Hapus Kontainer                  *${RESET}"
    echo -e "${PURPLE}* 6. Keluar                           *${RESET}"
    echo -e "${PURPLE}*                                     *${RESET}"
    echo -e "${PURPLE}***************************************${RESET}"
}

# Fungsi untuk menampilkan informasi
function show_info() {
    clear
    echo -e "${PURPLE}***************************************${RESET}"
    echo -e "${PURPLE}*                                     *${RESET}"
    echo -e "${PURPLE}*        > Minimum Spek VPS <         *${RESET}"
    echo -e "${PURPLE}*                                     *${RESET}"
    echo -e "${PURPLE}*          |4 CPU - 8GB RAM|          *${RESET}"
    echo -e "${PURPLE}*          |2 CPU - 6GB RAM|          *${RESET}"
    echo -e "${PURPLE}*                                     *${RESET}"
    echo -e "${PURPLE}* => Memerlukan 2 CPU - 4GB RAM.      *${RESET}"
    echo -e "${PURPLE}* => VPS di bawah spesifikasi tidak   *${RESET}"
    echo -e "${PURPLE}*    dapat berjalan.                  *${RESET}"
    echo -e "${PURPLE}***************************************${RESET}"
    echo -e "${PURPLE}***************************************${RESET}"
    echo ""
    read -p "Tekan Enter untuk kembali ke menu..."
}

# Fungsi untuk menjalankan kontainer
function rubah_container() {
clear
docker compose down
clear
echo -e "${PURPLE}**************************************${RESET}"
echo -e "${PURPLE}*                                    *${RESET}"
echo -e "${PURPLE}*         List Windows kode          *${RESET}"
echo -e "${PURPLE}*         _________________          *${RESET}"
echo -e "${PURPLE}*                                    *${RESET}"
echo -e "${PURPLE}*  1. win11    6. win10e   11. winxp *${RESET}"
echo -e "${PURPLE}*  2. ltsc11   7. win8               *${RESET}"
echo -e "${PURPLE}*  3. win11e   8. win8e              *${RESET}"
echo -e "${PURPLE}*  4. win10    9. win7               *${RESET}"
echo -e "${PURPLE}*  5. ltsc10   10.vista              *${RESET}"
echo -e "${PURPLE}*                                    *${RESET}"
echo -e "${PURPLE}*------------------------------------*${RESET}"
echo -e "${PURPLE}*                                    *${RESET}"
echo -e "${PURPLE}*           Windows Server           *${RESET}"
echo -e "${PURPLE}*           ______________           *${RESET}"
echo -e "${PURPLE}*                                    *${RESET}"
echo -e "${PURPLE}*  1. 2025      5. 2012              *${RESET}"
echo -e "${PURPLE}*  2. 2022      6. 2008              *${RESET}"
echo -e "${PURPLE}*  3. 2019      7. 2003              *${RESET}"
echo -e "${PURPLE}*  4. 2016                           *${RESET}"
echo -e "${PURPLE}*                                    *${RESET}"
echo -e "${PURPLE}**************************************${RESET}"

read -p "Masukan Code Windows di atas: " win
clear 
echo -e "${PURPLE}Masukan User Login.${RESET}"
read -p "User: " usr
clear
echo -e "${PURPLE}Masukan password Login.${RESET}"
read -p "Password: " ps
clear
echo -e "${PURPLE}Masukan RAM size.${RESET}"
echo -e "${PURPLE}(example: 6G )${RESET}"
read -p "RAM: " ram
clear
echo -e "${PURPLE}Masukan Berapa jumlah CPU.${RESET}"
echo -e "${PURPLE}(masukan sesuai spek VPS kamu)${RESET}"
read -p "CPU: " cpu
clear
echo -e "${PURPLE}Masukan Size Disk, Harus ada sisa 20GB di vps.${RESET}"
echo -e "${PURPLE}(example: 220G)${RESET}"
read -p "Disk: " disk
clear
echo -e "${PURPLE}Masukan Port RDP (example: 50 - 3389).${RESET}"
read -p "Port: " prt
clear
echo -e "${PURPLE}Masukan Port Web (example: 50 - 8006).${RESET}"
read -p "Port Web: " prtw
clear
echo -e "${PURPLE}Menjalankan Windows...${RESET}"
cat <<EOF > ~/compose.yml
services:
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
      - $prtw:8006
      - $prt:3389/tcp
      - 3389:3389/udp
    restart: no
EOF
sleep 4

docker compose up -d
clear
ip44=$(curl -4 -s ipv4.webshare.io)
echo " !!!Copy Data penting di bawah ini."
echo ""
echo -e "${PURPLE}User: ${RESET}$usr"
echo -e "${PURPLE}Password: ${RESET}$ps"
echo -e "${PURPLE}IP Port RDP: ${RESET}$ip44:$prt"
echo -e "${PURPLE}Alamat IP Port Web: ${RESET}http://$ip44:$prtw"
echo ""
    read -p "Tekan Enter untuk kembali ke menu..."
}

# Fungsi untuk menghentikan kontainer
function stop_container() {
    clear
    echo "Menghentikan kontainer Windows..."
    docker compose stop
    echo "Kontainer Windows dihentikan."
    read -p "Tekan Enter untuk kembali ke menu..."
}

# Fungsi untuk menampilkan daftar kontainer
function start_containers() {
    clear
    echo "Memulai Kontainer..."
    docker compose start
    read -p "Tekan Enter untuk kembali ke menu..."
}

# Fungsi untuk menghapus kontainer
function remove_container() {
    clear
    echo "Menghapus kontainer Windows..."
    docker compose kill windows && docker compose rm windows
    echo "Kontainer Windows dihapus."
    read -p "Tekan Enter untuk kembali ke menu..."
}

# Loop utama
while true; do
    show_menu
    read -p "Pilih opsi [1-6]: " choice

    case $choice in
        1) show_info ;;
        2) rubah_container ;;
        3) stop_container ;;
        4) start_containers ;;
        5) remove_container ;;
        6) echo "Keluar..."; exit 0 ;;
        *) echo "Pilihan tidak valid."; sleep 1 ;;
    esac
done
