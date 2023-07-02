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
domain=$(cat /etc/xray/domain)
CITY=$(cat /etc/xray/city)
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
  echo -e "\033[1;96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
  echo -e "\e[41m         Add Xray/Vless Account          \E[0m"
  echo -e "\033[1;96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

  read -rp "Username        : " -e user
  CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

  if [[ ${CLIENT_EXISTS} == '1' ]]; then
    clear
    echo -e "\033[1;96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "\e[41m         Add Xray/Vless Account          \E[0m"
    echo -e "\033[1;96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo ""
    echo "A client with the specified name was already created, please choose another name."
    echo ""
    echo -e "\033[1;96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    read -rp "Tekan enter untuk kembali ke Menu..."
    mvless
    exit 0
  fi
done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -rp "Expired (days)  : " masaaktif
read -rp "Limit User (GB) : " Quota
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")
sed -i '/#vless$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/vless-grpc.json
cat >/var/www/html/vless-$user.txt <<-END

_______________________________________________________
              Format Vless WS (CDN)
_______________________________________________________

- name: Vless-$user-WS (CDN)
  server: ${domain}
  port: 443
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vless
    headers:
      Host: ${domain}
_______________________________________________________
              Format Vless WS (CDN) Non TLS
_______________________________________________________
- name: Vless-$user-WS (CDN) Non TLS
  server: ${domain}
  port: 80
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: false
  skip-cert-verify: false
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vless
    headers:
      Host: ${domain}
  udp: true
_______________________________________________________
              Format Vless gRPC (SNI)
_______________________________________________________
- name: Vless-$user-gRPC (SNI)
  server: ${domain}
  port: 443
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: grpc
  grpc-opts:
  grpc-mode: gun
  grpc-service-name: vless-grpc
  udp: true

_______________________________________________________
              Link Vless Account
_______________________________________________________
Link TLS : vless://${uuid}@${domain}:443?path=/vless&security=tls&encryption=none&type=ws#${user}
_______________________________________________________
Link none TLS : vless://${uuid}@${domain}:80?path=/vless&encryption=none&type=ws#${user}
_______________________________________________________
Link GRPC :vless://${uuid}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=${domain}#${user}
_______________________________________________________




END

vlesslink1="vless://${uuid}@${domain}:443?path=/vless&security=tls&encryption=none&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:80?path=/vless&encryption=none&type=ws#${user}"
vlesslink3="vless://${uuid}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=${domain}#${user}"
systemctl restart xray
systemctl restart xray@vless-grpc

if [ ! -e /etc/vless ]; then
  mkdir -p /etc/vless
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))
echo "${d}" >/etc/vless/${user}

cat >/etc/vless/vless-$user-config.txt<<END

───────────────────────────
     Xray/Vless Account
───────────────────────────
Remarks      : ${user}
Host Server  : ${domain}
Location     : ${CITY}
Port TLS     : 443
Port NTLS    : 80
Port GRPC    : 443
User ID      : ${uuid}
Encryption   : none
Path         : /vless 
ServiceName  : vless-grpc
───────────────────────────
Link TLS     : ${vlesslink1}
───────────────────────────
Link NTLS    : ${vlesslink2}
───────────────────────────
Link GRPC    : ${vlesslink3}
───────────────────────────
Format OpenClash : http://${domain}:81/vless-$user.txt
───────────────────────────
Expired On   : ${exp}
───────────────────────────

END
#
clear
echo -e "\033[1;96m───────────────────────────\033[0m"
echo -e "\e[41m    Xray/Vless Account     \E[0m"
echo -e "\033[1;96m───────────────────────────\033[0m"
echo -e "Remarks      : ${user}"
echo -e "Host Server  : ${domain}"
echo -e "Location     : $CITY"
echo -e "port TLS     : 443"
echo -e "Port NTLS    : 80"
echo -e "port GRPC    : 443"
echo -e "User ID      : ${uuid}"
echo -e "Encryption   : none"
echo -e "Path         : /vless "
echo -e "ServiceName  : vless-grpc"
echo -e "\033[1;96m───────────────────────────\033[0m"
echo -e "Link TLS     : ${vlesslink1}"
echo -e "\033[1;96m───────────────────────────\033[0m"
echo -e "Link NTLS    : ${vlesslink2}"
echo -e "\033[1;96m───────────────────────────\033[0m"
echo -e "Link GRPC    : ${vlesslink3}"
echo -e "\033[1;96m───────────────────────────\033[0m"
echo -e "Format OpenClash : http://${domain}:81/vless-$user.txt"
echo -e "\033[1;96m───────────────────────────\033[0m"
echo -e "Expired On   : $exp"
echo -e "\033[1;96m───────────────────────────\033[0m"
echo -e ""
read -rp "Tekan enter untuk kembali ke Menu..."
mvless
exit 0
fi
