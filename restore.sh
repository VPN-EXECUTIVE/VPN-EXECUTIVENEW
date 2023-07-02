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
GREEN="\e[92;1m"
BLUE="\033[36m"
RED='\033[0;31m'
NC='\033[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
IP=$(curl -s ipinfo.io/ip);
date=$(date +"%d-%B-%Y")
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10);
CITY=$(curl -s ipinfo.io/city);
domain=$(cat /etc/xray/domain)
echo "This Feature Can Only Be Used According To Vps Data With This Autoscript"
echo "Please input link to your vps data backup file."
read -rp "Link File: " -e url
wget -O backup.zip "$url"
unzip backup.zip
rm -f backup.zip
sleep 1
echo Start Restore
cd /root/backup
cp -r premium-script /var/lib/
cp -r config.json /etc/xray/
cp -r vless-grpc.json /etc/xray/
cp -r vmess.json /etc/xray/
cp -r vmess-grpc.json /etc/xray/
cp -r trojan-ws.json /etc/xray/
cp -r trojan-grpc.json /etc/xray/
cp -r ss-ws.json /etc/xray/
cp -r ss-grpc.json /etc/xray/
cp -r html /var/www/
cp -r public_html /home/vps/
cp crontab /etc/
clear
echo -e "\033[1;96m─────────────────────────────────────────\033[0m"
echo -e "SUCCESSFULL RESTORE YOUR VPS"
echo -e "Please Save The Following Data"
echo -e "\033[1;96m─────────────────────────────────────────\033[0m"
echo -e "${BLUE}Your VPS IP${NC} : ${GREEN}$IP${NC}"
echo -e "${BLUE}DOMAIN${NC}      : ${GREEN}$domain${NC}"
echo -e "${BLUE}DATE${NC}        : ${GREEN}$date${NC}"
echo -e "${BLUE}ISP${NC}         : ${GREEN}$ISP${NC}"
echo -e "${BLUE}LOCATION${NC}    : ${GREEN}$CITY${NC}"
echo -e "${BLUE}LINK RESTORE${NC}: ${GREEN}$url${NC}"
echo -e "\033[1;96m─────────────────────────────────────────\033[0m"
echo -e "${RED}This feature can only be used if the previous data backup uses this script${NC}"
echo -e "${RED}Please Reboot Your Vps${NC}"
rm -rf /root/backup
rm -f backup.zip
echo
read -rp "Tekan enter untuk kembali ke Menu..."
menu
exit 0
fi
