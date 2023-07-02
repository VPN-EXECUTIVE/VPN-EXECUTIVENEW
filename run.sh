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
RED='\033[0;31m'
NC='\033[0m'
gray="\e[1;30m"
Blue="\033[36m"
GREEN='\033[0;32m'
grenbo="\e[92;1m"
yellow='\033[0;33m'
Nginx_Webserver=$(systemctl status nginx | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
vless=$(systemctl status xray | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
vless_grpc=$(systemctl status xray@vless-grpc | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
vmess=$(systemctl status xray@vmess | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
vmess_grpc=$(systemctl status xray@vmess-grpc | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
trojan_ws=$(systemctl status xray@trojan-ws | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
trojan_grpc=$(systemctl status xray@trojan-grpc | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
ss_ws=$(systemctl status xray@ss-ws | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
ss_grpc=$(systemctl status xray@ss-grpc | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
RClocal=$(systemctl status rc-local | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
if [[ $Nginx_Webserver == "running" ]]; then
    status_1="${grenbo}Online${NC}"
else
    status_1="${RED}Offline${NC}"
fi

if [[ $vless == "running" ]]; then
    status_2="${grenbo}Online${NC}"
else
    status_2="${RED}Offline${NC}"
fi

if [[ $vless_grpc == "running" ]]; then
    status_3="${grenbo}Online${NC}"
else
    status_3="${RED}Offline${NC}"
fi

if [[ $vmess == "running" ]]; then
    status_4="${grenbo}Online${NC}"
else
    status_4="${RED}Offline${NC}"
fi

if [[ $vmess_grpc == "running" ]]; then
    status_5="${grenbo}Online${NC}"
else
    status_5="${RED}Offline${NC}"
fi

if [[ $trojan_ws == "running" ]]; then
    status_6="${grenbo}Online${NC}"
else
    status_6="${RED}Offline${NC}"
fi

if [[ $trojan_grpc == "running" ]]; then
    status_7="${grenbo}Online${NC}"
else
    status_7="${RED}Offline${NC}"
fi

if [[ $ss_ws == "running" ]]; then
    status_8="${grenbo}Online${NC}"
else
    status_8="${RED}Offline${NC}"
fi

if [[ $ss_grpc == "running" ]]; then
    status_9="${grenbo}Online${NC}"
else
    status_9="${RED}Offline${NC}"
fi

if [[ $RClocal == "exited" ]]; then
    status_10="${grenbo}Online${NC}"
else
    status_10="${RED}Offline${NC}"
fi
echo -e "\033[1;96m─────────────────────────────────────\033[0m"
echo -e "\\e[41m      ⇱ Service Information ⇲        \E[0m"
echo -e "\033[1;96m─────────────────────────────────────\033[0m"
echo -e "${Blue}Service Nginx$NC               $grenbo:$NC $status_1"
echo -e "${Blue}Service Vless$NC               $grenbo:$NC $status_2"
echo -e "${Blue}Service Vless GRPC$NC          $grenbo:$NC $status_3"
echo -e "${Blue}Service Vmess$NC               $grenbo:$NC $status_4"
echo -e "${Blue}Service Vmess GRPC$NC          $grenbo:$NC $status_5"
echo -e "${Blue}Service Trojan WS$NC           $grenbo:$NC $status_6"
echo -e "${Blue}Service Trojan GRPC$NC         $grenbo:$NC $status_7"
echo -e "${Blue}Service Shadowsocks WS$NC      $grenbo:$NC $status_8"
echo -e "${Blue}Service Shadowsocks GRPC$NC    $grenbo:$NC $status_9"
echo -e "${Blue}Service RClocal$NC             $grenbo:$NC $status_10"
echo -e "\033[1;96m─────────────────────────────────────\033[0m"
echo ""
read -rp "Tekan enter untuk kembali ke Menu..."
menu
exit 0
fi
