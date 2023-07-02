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
echo -e "-----------------------------------------------------"
echo -e "             Buat Domain Baru Pada VPS"
echo -e "-----------------------------------------------------"
echo -e "IP VPS  : ${GREEN}$IP${NC}"
echo -e "Contoh  : namadomain"
echo -e "Hasil   : namadomain.vpnqu.my.id"
echo -e "-----------------------------------------------------"
read -rp "Masukan Nama Domain: " -e sub
DOMAIN=vpnqu.my.id
SUB_DOMAIN=${sub}.vpnqu.my.id
sed -i "s/${LAST_DOMAIN}/${SUB_DOMAIN}/g" /etc/nginx/conf.d/xray.conf >/dev/null 2>&1
CF_ID=yovan83@live.com
CF_KEY=a8aef91b76372e1514811fdf26a079eab5ec1
set -euo pipefail
echo "Updating Domain for ${SUB_DOMAIN}..."
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
		 -H "X-Auth-Email: ${CF_ID}" \
		 -H "X-Auth-Key: ${CF_KEY}" \
		 -H "Content-Type: application/json" | jq -r .result[0].id)
RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${SUB_DOMAIN}" \
		 -H "X-Auth-Email: ${CF_ID}" \
		 -H "X-Auth-Key: ${CF_KEY}" \
		 -H "Content-Type: application/json" | jq -r .result[0].id)
if [[ "${#RECORD}" -le 10 ]]; then
		 RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
		 -H "X-Auth-Email: ${CF_ID}" \
		 -H "X-Auth-Key: ${CF_KEY}" \
		 -H "Content-Type: application/json" \
		 --data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi
RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
		 -H "X-Auth-Email: ${CF_ID}" \
		 -H "X-Auth-Key: ${CF_KEY}" \
		 -H "Content-Type: application/json" \
		 --data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}')
RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=*.${SUB_DOMAIN}" \
		 -H "X-Auth-Email: ${CF_ID}" \
		 -H "X-Auth-Key: ${CF_KEY}" \
		 -H "Content-Type: application/json" | jq -r .result[0].id)
if [[ "${#RECORD}" -le 10 ]]; then
		 RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
		 -H "X-Auth-Email: ${CF_ID}" \
		 -H "X-Auth-Key: ${CF_KEY}" \
		 -H "Content-Type: application/json" \
		 --data '{"type":"A","name":"'*.${SUB_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi
RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
		 -H "X-Auth-Email: ${CF_ID}" \
		 -H "X-Auth-Key: ${CF_KEY}" \
		 -H "Content-Type: application/json" \
		 --data '{"type":"A","name":"'*.${SUB_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}')
rm -f /etc/xray/domain
echo $SUB_DOMAIN > /etc/xray/domain
echo
echo -e "Domain :${GREEN}${SUB_DOMAIN}${NC}"
echo
echo -e "Berhasil ditambahkan pada IP ${GREEN}${IP}${NC}"
sleep 2
echo -e "${GREEN}--->${NC} Start..."
systemctl stop nginx
echo -e "${GREEN}--->${NC} Starting renew certificate..."
sleep 2
echo -e "${GREEN}--->${NC} Getting acme for certificate..."
/root/.acme.sh/acme.sh --upgrade --auto-upgrade >/dev/null 2>&1
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt >/dev/null 2>&1
/root/.acme.sh/acme.sh --issue -d $SUB_DOMAIN --standalone -k ec-256 >/dev/null 2>&1
~/.acme.sh/acme.sh --installcert -d $SUB_DOMAIN --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc >/dev/null 2>&1
echo -e "${GREEN}--->${NC} Renew Certificate Done."
systemctl daemon-reload
systemctl restart nginx >/dev/null 2>&1
systemctl restart xray >/dev/null 2>&1
echo
read -rp "Tekan enter untuk kembali ke Menu..."
menu
exit 0
fi
