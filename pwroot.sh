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
# Get Passwd
echo "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
echo "            Ganti Pasword VPS"
echo "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
read -p " Masukan Password Root : " Pass

# Starting Changes To Root
rm -f /etc/ssh/sshd_config
wget -O /etc/ssh/sshd_config "https://gitlab.com/akunzpn25/lessssuuuuuuu/-/raw/master/ssh-vpn/sshd" >/dev/null 2>&1
echo -e "$Pass\n$Pass\n"|passwd root &> /dev/null
IP=$(curl -sS ipinfo.io/ip);

# Successful
clear
echo -e " Please Save This VPS Account Information"
echo
echo -e "============================================"
echo -e "  IP ADDRESS = $IP"
echo -e "  Username   = root"
echo -e "  Password   = $Pass"
echo -e "============================================"
echo
read -rp "Tekan enter untuk reboot vps..."
sleep 2
reboot
fi

