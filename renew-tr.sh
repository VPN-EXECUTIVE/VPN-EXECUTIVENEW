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
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/xray/trojan-ws.json")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
    clear
    echo -e "\033[1;96m─────────────────────────────────────────\033[0m"
    echo -e "\e[41m      Renew Xray/Trojan Account          \E[0m"
    echo -e "\033[1;96m─────────────────────────────────────────\033[0m"
    echo ""
    echo "You have no existing clients!"
    echo ""
    echo -e "\033[1;96m─────────────────────────────────────────\033[0m"
    echo ""
    read -rp "Tekan enter untuk kembali ke Menu..."
    mtrojan
fi

clear
echo -e "\033[1;96m─────────────────────────────────────────\033[0m"
echo -e "\e[41m    Renew Xray/Trojan Account            \E[0m"
echo -e "\033[1;96m─────────────────────────────────────────\033[0m"
echo ""
grep -E "^### " "/etc/xray/trojan-ws.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq
echo ""
red "tap enter to go back"
echo -e "\033[1;96m─────────────────────────────────────────\033[0m"
read -rp "Input Username : " user
if [ -z $user ]; then
    mtrojan
else
    read -p "Expired (days): " masaaktif
    exp=$(grep -wE "^### $user" "/etc/xray/trojan-ws.json" | cut -d ' ' -f 3 | sort | uniq)
    now=$(date +%Y-%m-%d)
    d1=$(date -d "$exp" +%s)
    d2=$(date -d "$now" +%s)
    exp2=$(((d1 - d2) / 86400))
    exp3=$(($exp2 + $masaaktif))
    exp4=$(date -d "$exp3 days" +"%Y-%m-%d")
    sed -i "/### $user/c\### $user $exp4" /etc/xray/trojan-ws.json
    sed -i "/### $user/c\### $user $exp4" /etc/xray/trojan-grpc.json
    systemctl restart xray@trojan-ws
    systemctl restart xray@trojan-grpc
    clear
    echo -e "\033[1;96m─────────────────────────────────────────\033[0m"
    echo "      Trojan Account Was Successfully Renewed"
    echo -e "\033[1;96m─────────────────────────────────────────\033[0m"
    echo ""
    echo " Client Name : $user"
    echo " Expired On  : $exp4"
    echo ""
    echo -e "\033[1;96m─────────────────────────────────────────\033[0m"
    echo ""
    read -rp "Tekan enter untuk kembali ke Menu..."
    mtrojan
fi
