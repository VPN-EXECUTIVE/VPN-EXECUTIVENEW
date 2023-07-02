#!/bin/bash
clear
grenbo="\e[92;1m"
NC='\033[0m'
echo -e "\033[1;96m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;96m│$NC\033[41m          MENU VPN-EXECUTIVE VMESS              $NC"
echo -e "\033[1;96m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;96m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;96m│  ${grenbo}1.${NC} \033[0;36mCreating a Vmess Account${NC}"
echo -e "\033[1;96m│  ${grenbo}2.${NC} \033[0;36mDelete Vmess Account${NC}"
echo -e "\033[1;96m│  ${grenbo}3.${NC} \033[0;36mRenew Vmess Account${NC}"
echo -e "\033[1;96m│  ${grenbo}4.${NC} \033[0;36mCheck Vmess login Account${NC}"
echo -e "\033[1;96m│  ${grenbo}5.${NC} \033[0;36mCheck Vmess Config${NC}"
echo -e "\033[1;96m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;96m┌──────────────────────────────────────────┐"
read -rp "│     Select 1 - 5 or x Back to Menu : " -e num
echo -e "└──────────────────────────────────────────┘\033[0m"
if [[ "$num" = "1" ]]; then
	add-ws
elif [[ "$num" = "2" ]]; then
	del-ws
elif [[ "$num" = "3" ]]; then
	renew-ws
elif [[ "$num" = "4" ]]; then
	cek-ws
elif [[ "$num" = "5" ]]; then
	cek-cfg-ws
elif [[ "$num" = "x" ]]; then
	menu
else
	mvmess
fi
