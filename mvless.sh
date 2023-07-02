#!/bin/bash
clear
grenbo="\e[92;1m"
NC='\033[0m'
echo -e "\033[1;96m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;96m│$NC\033[41m          MENU VPN-EXECUTIVE VLESS              $NC"
echo -e "\033[1;96m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;96m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;96m│  ${grenbo}1.${NC} \033[0;36mCreating a Vless Account${NC}"
echo -e "\033[1;96m│  ${grenbo}2.${NC} \033[0;36mDelete Vless Account${NC}"
echo -e "\033[1;96m│  ${grenbo}3.${NC} \033[0;36mRenew Vless Account${NC}"
echo -e "\033[1;96m│  ${grenbo}4.${NC} \033[0;36mCheck Vless login Account${NC}"
echo -e "\033[1;96m│  ${grenbo}5.${NC} \033[0;36mCheck Vless Config${NC}"
echo -e "\033[1;96m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;96m┌──────────────────────────────────────────┐"
read -rp "│     Select 1 - 5 or x Back to Menu : " -e num
echo -e "└──────────────────────────────────────────┘\033[0m"
if [[ "$num" = "1" ]]; then
	add-vless
elif [[ "$num" = "2" ]]; then
	del-vless
elif [[ "$num" = "3" ]]; then
	renew-vless
elif [[ "$num" = "4" ]]; then
	cek-vless
elif [[ "$num" = "5" ]]; then
	cek-cfg-vless
elif [[ "$num" = "x" ]]; then
	menu
else
	mvless
fi
