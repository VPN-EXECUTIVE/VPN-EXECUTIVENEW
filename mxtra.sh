#!/bin/bash
clear
grenbo="\e[92;1m"
NC='\033[0m'
echo -e "\033[1;96m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;96m│$NC\033[41m               VPN-EXECUTIVE MENU                $NC"
echo -e "\033[1;96m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;96m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;96m│  ${grenbo}1.${NC} \033[0;36mRUNNING SERVER${NC}"
echo -e "\033[1;96m│  ${grenbo}2.${NC} \033[0;36mSPEEDTEST SERVER${NC}"
echo -e "\033[1;96m│  ${grenbo}3.${NC} \033[0;36mTRAFFIC SERVER${NC}"
echo -e "\033[1;96m│  ${grenbo}4.${NC} \033[0;36mBUAT DOMAIN BARU${NC}"
echo -e "\033[1;96m│  ${grenbo}5.${NC} \033[0;36mGANTI PASSWORD VPS${NC}"
echo -e "\033[1;96m│  ${grenbo}6.${NC} \033[0;36mBACKUP & RESTORE${NC}"
echo -e "\033[1;96m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;96m┌──────────────────────────────────────────┐"
read -rp "│     Select 1 - 6 or x Back to Menu : " -e num
echo -e "└──────────────────────────────────────────┘\033[0m"
if [[ "$num" = "1" ]]; then
  run
elif [[ "$num" = "2" ]]; then
  clear
	speedtest
  echo
  read -rp "Tekan enter untuk kembali ke Menu..."
  mxtra
elif [[ "$num" = "3" ]]; then
  clear
  vnstat -i eth0
  echo
  read -rp "Tekan enter untuk kembali ke Menu..."
  mxtra
elif [[ "$num" = "4" ]]; then
  get-domain
elif [[ "$num" = "5" ]]; then
  pwroot
elif [[ "$num" = "6" ]]; then
  get-backres
elif [[ "$num" = "x" ]]; then
  menu
else
  mxtra
fi
