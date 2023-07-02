#!/bin/bash
clear
grenbo="\e[92;1m"
NC='\033[0m'
echo -e "\033[1;96m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;96m│$NC\033[41m          MENU VPN-EXECUTIVE SS                 $NC"
echo -e "\033[1;96m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;96m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;96m│  ${grenbo}1.${NC} \033[0;36mCreating a ss Account${NC}"
echo -e "\033[1;96m│  ${grenbo}2.${NC} \033[0;36mDelete ss Account${NC}"
echo -e "\033[1;96m│  ${grenbo}3.${NC} \033[0;36mRenew ss Account${NC}"
echo -e "\033[1;96m│  ${grenbo}4.${NC} \033[0;36mCheck ss login Account${NC}"
echo -e "\033[1;96m│  ${grenbo}5.${NC} \033[0;36mCheck ss Config${NC}"
echo -e "\033[1;96m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;96m┌──────────────────────────────────────────┐"
read -rp "│     Select 1 - 5 or x Back to Menu : " -e num
echo -e "└──────────────────────────────────────────┘\033[0m"
if [[ "$num" = "1" ]]; then
	add-ss
elif [[ "$num" = "2" ]]; then
	del-ss
elif [[ "$num" = "3" ]]; then
	renew-ss
elif [[ "$num" = "4" ]]; then
	cek-ss
elif [[ "$num" = "5" ]]; then
	cek-cfg-ss
elif [[ "$num" = "x" ]]; then
	menu
else
	msock
fi
