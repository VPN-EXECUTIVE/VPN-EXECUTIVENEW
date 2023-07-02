#!/bin/bash
clear
grenbo="\e[92;1m"
NC='\033[0m'
echo -e "\033[1;96m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;96m│$NC\033[41m          MENU VPN-EXECUTIVE TROJAN             $NC"
echo -e "\033[1;96m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;96m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;96m│  ${grenbo}1.${NC} \033[0;36mCreating a Trojan Account${NC}"
echo -e "\033[1;96m│  ${grenbo}2.${NC} \033[0;36mDelete Trojan Account${NC}"
echo -e "\033[1;96m│  ${grenbo}3.${NC} \033[0;36mRenew Trojan Account${NC}"
echo -e "\033[1;96m│  ${grenbo}4.${NC} \033[0;36mCheck Trojan login Account${NC}"
echo -e "\033[1;96m│  ${grenbo}5.${NC} \033[0;36mCheck Trojan Config${NC}"
echo -e "\033[1;96m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;96m┌──────────────────────────────────────────┐"
read -rp "│     Select 1 - 5 or x Back to Menu : " -e num
echo -e "└──────────────────────────────────────────┘\033[0m"
if [[ "$num" = "1" ]]; then
	add-tr
elif [[ "$num" = "2" ]]; then
	del-tr
elif [[ "$num" = "3" ]]; then
	renew-tr
elif [[ "$num" = "4" ]]; then
	cek-tr
elif [[ "$num" = "5" ]]; then
	cek-cfg-tr
elif [[ "$num" = "x" ]]; then
	menu
else
	mtrojan
fi
