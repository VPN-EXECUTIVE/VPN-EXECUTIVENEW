#!/bin/bash
merah="\e[1;31m"
hijau="\e[1;32m"
NC="\e[0m"
MYIP=$(curl -sS ipinfo.io/ip) >/dev/null 2>&1
IZIN=$(curl -sS http://aksesvpn.my.id:81/akses | grep $MYIP) >/dev/null 2>&1
if [ $MYIP = $IZIN ]; then
	 echo -e "${hijau} Penggunaan script diizinkan${NC}"
else
	 echo -e "${merah} Penggunaan script tidak diizinkan${NC}";
	 echo " Silahkan Hubungi Admin"
	 echo " Telegram   : @VPNEXECUTIVE"
	 echo " WhatsApp   : 081911829754"
   echo " em@il      : admin@vpn-executive.my.id"
	exit 0
fi
clear
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/xray/vmess.json")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
    echo -e "\033[1;96m─────────────────────────────────────────\033[0m"
    echo -e "\e[41m             Delete Vmess Account        \E[0m"
    echo -e "\033[1;96m─────────────────────────────────────────\033[0m"
    echo ""
    echo "You have no existing clients!"
    echo ""
    echo -e "\033[1;96m─────────────────────────────────────────\033[0m"
    read -n 1 -s -r -p "Press any key to back on menu"
    menu
    exit 0
fi

clear
echo -e "\033[1;96m─────────────────────────────────────────\033[0m"
echo -e "\e[41m             Delete Vmess Account        \E[0m"
echo -e "\033[1;96m─────────────────────────────────────────\033[0m"
echo "     NO    User    Expired  "
echo -e "\033[1;96m─────────────────────────────────────────\033[0m"
grep -E "^### " "/etc/xray/vmess.json" | cut -d ' ' -f 2-3 |     nl -s ') '
echo -e "\033[1;96m─────────────────────────────────────────\033[0m"
until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
    if [[ ${CLIENT_NUMBER} == '1' ]]; then
        read -rp "Select one client [1]: " CLIENT_NUMBER
    else
        read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
    fi
done
user=$(grep -E "^### " "/etc/xray/vmess.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/xray/vmess.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/vmess.json
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/vmess-grpc.json
rm -f /etc/vmess/$user
rm -f /etc/limit/vmess/$user
rm -f /etc/vmess/vmess-$user-config.txt
rm -f /var/www/html/vmess-$user.txt
systemctl restart xray@vmess.service
systemctl restart xray@vmess-grpc.service
clear
echo -e "\033[1;96m─────────────────────────────────────────\033[0m"
echo "     Vmess Account Deleted Successfully"
echo -e "\033[1;96m─────────────────────────────────────────\033[0m"
echo " Client Name : $user"
echo " Expired On  : $exp"
echo -e "\033[1;96m─────────────────────────────────────────\033[0m"
echo ""
read -rp "Tekan enter untuk kembali ke Menu..."
menu
exit 0
fi
