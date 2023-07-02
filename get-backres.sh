#!/bin/bash
clear
grenbo="\e[92;1m"
NC='\033[0m'
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│$NC\033[42m            BACKUP DAN RESTORE            $NC"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│  ${grenbo}1.${NC} \033[0;36mBackup data VPS${NC}"
echo -e "\033[1;93m│  ${grenbo}2.${NC} \033[0;36mRestore data VPS${NC}"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m┌──────────────────────────────────────────┐"
read -rp "│     Select 1 - 2 or x Back to Menu : " -e num
echo -e "└──────────────────────────────────────────┘\033[0m"
if [[ "$num" = "1" ]]; then
	backup
elif [[ "$num" = "2" ]]; then
	restore
elif [[ "$num" = "x" ]]; then
	mxtra
else
	get-backres
fi
