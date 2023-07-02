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
# // FONT color configuration
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
echo
echo " Masukan emailmu untuk membuat link backup"
echo
read -rp " Masukan emailmu: " -e email
sleep 1
mkdir /root/backup
cp -r /var/lib/premium-script/ backup/premium-script
cp -r /etc/xray/config.json backup/config.json
cp -r /etc/xray/vless-grpc.json backup/vless-grpc.json
cp -r /etc/xray/vmess.json backup/vmess.json
cp -r /etc/xray/vmess-grpc.json backup/vmess-grpc.json
cp -r /etc/xray/trojan-ws.json backup/trojan-ws.json
cp -r /etc/xray/trojan-grpc.json backup/trojan-grpc.json
cp -r /etc/xray/ss-ws.json backup/ss-ws.json
cp -r /etc/xray/ss-grpc.json backup/ss-grpc.json
cp -r /etc/crontab backup/crontab
cp -r /var/www/html backup/
cp -r /home/vps/public_html backup/
cd /root
zip -r LT-$date.zip backup > /dev/null 2>&1
rclone copy /root/LT-$date.zip dr:backup/
url=$(rclone link dr:backup/LT-$date.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download"
echo -e "
_______________________________________
SUCCESSFULL BACKUP YOUR VPS
Please Save The Following Data
_______________________________________
YOUR VPS IP : $IP
DOMAIN      : $domain
DATE        : $date
ISP         : $ISP
LOCATION    : $CITY
LINK BACKUP : $link
_______________________________________
" | mail -s "Backup Data" $email
clear
echo -e "\033[1;93m─────────────────────────────────────────\033[0m"
echo -e " SUCCESSFULL BACKUP YOUR VPS"
echo -e " Please Save The Following Information"
echo -e "\033[1;93m─────────────────────────────────────────\033[0m"
echo -e "${BLUE} Your VPS IP${NC} : ${GREEN}$IP${NC}"
echo -e "${BLUE} DOMAIN${NC}      : ${GREEN}$domain${NC}"
echo -e "${BLUE} DATE${NC}        : ${GREEN}$date${NC}"
echo -e "${BLUE} ISP${NC}         : ${GREEN}$ISP${NC}"
echo -e "${BLUE} LOCATION${NC}    : ${GREEN}$CITY${NC}"
echo -e "${BLUE} LINK BACKUP${NC} : ${GREEN}$link${NC}"
echo -e "\033[1;93m─────────────────────────────────────────\033[0m"
rm -rf /root/backup
rm -r /root/LT-$date.zip
rm -f dead.letter
echo
read -rp "Tekan enter untuk kembali ke Menu..."
mxtra
exit 0
fi
