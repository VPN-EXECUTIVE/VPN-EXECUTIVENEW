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
echo
echo -e "======================================"
echo -e "       RESTART SERVICE ON VPS"
echo -e "======================================"
echo -e "     1. Restart All Services"
echo -e "     2. Restart Cron"
echo -e "     3. Restart Nginx"
echo -e "     4. Restart Xray Vless"
echo -e "     5. Restart Xray Vmess"
echo -e "     6. Restart Xray Trojan"
echo -e "     7. Restart Xray Shadowsocks"
echo
echo -e "     x. Menu"
echo
read -p "    Pilih Nomor:  " Restart
echo -e ""
echo -e "======================================"
sleep 1
clear
case $Restart in
1)
clear
/etc/init.d/cron restart >/dev/null 2>&1
/etc/init.d/nginx restart >/dev/null 2>&1
systemctl daemon-reload
systemctl restart xray
systemctl restart xray@vless-grpc
systemctl restart xray@vmess
systemctl restart xray@vmess-grpc
systemctl restart xray@trojan-ws
systemctl restart xray@trojan-grpc
systemctl restart xray@ss-ws
systemctl restart xray@ss-grpc
systemctl restart rc-local
echo
echo "======================================"
echo "  Semua layanan berhasil di restart"
echo "======================================"
echo
read -rp "Tekan enter untuk kembali ke Menu..."
menu
exit 0
;;
2)
systemctl restart cron
echo
echo -e "======================================"
echo -e "       Cron sudah direstart"
echo -e "======================================"
echo
read -rp "Tekan enter untuk kembali ke Menu..."
menu
exit 0
;;
3)
/etc/init.d/nginx restart >/dev/null 2>&1
echo
echo -e "======================================"
echo -e "        Nginx sudah direstart"
echo -e "======================================"
echo
read -rp "Tekan enter untuk kembali ke Menu..."
menu
exit 0
;;
4)
systemctl restart xray
systemctl restart xray@vless-grpc
echo
echo -e "======================================"
echo -e "     Xray Vless sudah direstart"
echo -e "======================================"
echo
read -rp "Tekan enter untuk kembali ke Menu..."
menu
exit 0
;;
5)
systemctl restart xray@vmess
systemctl restart xray@vmess-grpc
echo
echo -e "======================================"
echo -e "     Xray Vmess sudah direstart"
echo -e "======================================"
echo
read -rp "Tekan enter untuk kembali ke Menu..."
menu
exit 0
;;
6)
systemctl restart xray@trojan-ws
systemctl restart xray@trojan-grpc
echo
echo -e "======================================"
echo -e "     Xray Trojan sudah direstart"
echo -e "======================================"
echo
read -rp "Tekan enter untuk kembali ke Menu..."
menu
exit 0
;;
7)
systemctl restart xray@ss-ws
systemctl restart xray@ss-grpc
echo
echo -e "======================================"
echo -e "   Xray Shadowsocks sudah direstart"
echo -e "======================================"
echo
read -rp "Tekan enter untuk kembali ke Menu..."
menu
exit 0
;;
x)
menu
exit 0
;;
esac
seres
