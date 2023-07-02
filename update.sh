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
versi=$(cat /home/ver)
ver=1.1
VPN-EXECUTIVE="https://github.com/VPN-EXECUTIVE/VPN-EXECUTIVENEW/raw/main/"
GITHUB_CMD="https://github.com/VPN-EXECUTIVE/VPN-EXECUTIVENEW/raw/main/"
if [[ $versi == $ver ]]; then
echo
echo -e "${hijau} You Have The Latest Version${NC}"
echo -e "${hijau} Script Version ${ver}${NC}"
echo
read -p " Tekan enter untuk kembali ke menu..."
rm -f /usr/bin/update
menu
exit 0
fi
rm -f /home/ver
#
echo -e "${ver}" > /home/ver
#
echo -e "\e[1;32m Start Updating Script, Please wait...\e[0m"
sleep 5
#---------------------
rm -f /usr/bin/cek-ws
rm -f /usr/bin/cek-tr
rm -f /usr/bin/cek-ss
rm -f /usr/bin/cek-vless
rm -f /usr/bin/add-ws
rm -f /usr/bin/add-tr
rm -f /usr/bin/add-ss
rm -f /usr/bin/add-vless
#---------------------
#------------------------------------------------
wget -O /usr/bin/cek-ws "${GITHUB_CMD}cek-ws.sh" >/dev/null 2>&1
chmod +x /usr/bin/cek-ws
wget -O /usr/bin/cek-ss "${GITHUB_CMD}cek-ss.sh" >/dev/null 2>&1
chmod +x /usr/bin/cek-ss
wget -O /usr/bin/cek-tr "${GITHUB_CMD}cek-tr.sh" >/dev/null 2>&1
chmod +x /usr/bin/cek-tr
wget -O /usr/bin/cek-vless "${GITHUB_CMD}cek-vless.sh" >/dev/null 2>&1
chmod +x /usr/bin/cek-vless
wget -O /usr/bin/add-ws "${VPN-EXECUTIVE}add-ws.sh" >/dev/null 2>&1
chmod +x /usr/bin/add-ws
wget -O /usr/bin/add-tr "${VPN-EXECUTIVE}add-tr.sh" >/dev/null 2>&1
chmod +x /usr/bin/add-tr
wget -O /usr/bin/add-ss "${VPN-EXECUTIVE}add-ss.sh" >/dev/null 2>&1
chmod +x /usr/bin/add-ss
wget -O /usr/bin/add-vless "${VPN-EXECUTIVE}add-vless.sh" >/dev/null 2>&1
chmod +x /usr/bin/add-vless
#------------------------------------------------
###################
clear
versi2=$(cat /home/ver)
echo
echo -e "${hijau} Script berhasil di update ke versi ${versi2}${NC}"
echo
read -rp "Tekan enter untuk kembali ke Menu..."
rm -f /usr/bin/update
menu
exit 0
fi
