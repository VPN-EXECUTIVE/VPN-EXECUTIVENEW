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
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
Font="\033[0m"
gray="\e[1;30m"
IP=$(curl -s ipinfo.io/ip);
LAST_DOMAIN=$(cat /etc/xray/domain)
echo -e "                 Custom Domain"
echo -e "------------------------------------------------"
echo -e "IP VPS		: ${GREEN}$IP${NC}"
echo -e "Contoh		: example.yourdomain.com"
echo -e "------------------------------------------------"
read -rp "Masukan Domain: " -e domain
host=$(ping "${domain}" -c 1 | sed '1{s/[^(]*(//;s/).*//;q}')
sleep 2
if [[ $(echo "${IP}" | tr '.' '+' | bc) -eq $(echo "${host}" | tr '.' '+' | bc) ]]; then
		sed -i "s/${LAST_DOMAIN}/${domain}/g" /etc/nginx/conf.d/xray.conf >/dev/null 2>&1
		rm -rf /etc/xray/domain
		echo $domain >/etc/xray/domain
		echo -e "Domain ${GREEN}${domain}${NC}"
		echo -e "Berhasil ditambahkan pada IP ${GREEN}${IP}${NC}"
else
		echo
		echo -e "Domain ${RED}${domain}${NC}"
		echo -e "Tidak cocok dengan IP ${RED}${IP}${NC}"
		sleep 2
		add-host2
fi
echo
echo -e "${GREEN}--->${NC} Start"
systemctl stop nginx
echo -e "${GREEN}--->${NC} Starting renew certificate"
sleep 2
echo -e "${GREEN}--->${NC} Getting acme for certificate"
/root/.acme.sh/acme.sh --upgrade --auto-upgrade >/dev/null 2>&1
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt >/dev/null 2>&1
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256 >/dev/null 2>&1
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc >/dev/null 2>&1
echo -e "${GREEN}--->${NC} Renew Certificate Done "
systemctl daemon-reload
systemctl restart nginx >/dev/null 2>&1
systemctl restart xray >/dev/null 2>&1
echo
read -rp "Tekan enter untuk kembali ke Menu..."
menu
exit 0
fi
