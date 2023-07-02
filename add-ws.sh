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
domain=$(cat /etc/xray/domain)
CITY=$(cat /etc/xray/city)
clear
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
  clear
  echo -e "\033[1;96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
  echo -e "\e[41m         Add Xray/Vmess Account          \E[0m"
  echo -e "\033[1;96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

  read -rp "Username        : " -e user
  CLIENT_EXISTS=$(grep -w $user /etc/xray/vmess.json | wc -l)

  if [[ ${CLIENT_EXISTS} == '1' ]]; then
    clear
    echo -e "\033[1;96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "\e[41m         Add Xray/Vmess Account          \E[0m"
    echo -e "\033[1;96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo ""
    echo "A client with the specified name was already created, please choose another name."
    echo ""
    echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    read -rp "Tekan enter untuk kembali ke Menu..."
    mvmess
    exit 0
  fi
done

uuid=$(cat /proc/sys/kernel/random/uuid)
read -rp "Expired (days)  : " masaaktif
read -rp "Limit User (GB) : " Quota
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")
sed -i '/#vmess$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/vmess.json
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")
sed -i '/#vmessgrpc$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/vmess-grpc.json
VMESS_WS=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF`
VMESS_NON_TLS=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF`
VMESS_GRPC=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "vmess-grpc",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF`
cat >/var/www/html/vmess-$user.txt <<-END

_______________________________________________________
              Format Vmess WS (CDN)
_______________________________________________________

- name: Vmess-$user-WS (CDN)
  type: vmess
  server: ${domain}
  port: 443
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  udp: true
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vmess
    headers:
      Host: ${domain}
_______________________________________________________
              Format Vmess WS (CDN) Non TLS
_______________________________________________________

- name: Vmess-$user-WS (CDN) Non TLS
  type: vmess
  server: ${domain}
  port: 80
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  udp: true
  tls: false
  skip-cert-verify: false
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vmess
    headers:
      Host: ${domain}
_______________________________________________________
              Format Vmess gRPC (SNI)
_______________________________________________________

- name: Vmess-$user-GRPC (SNI)
  server: ${domain}
  port: 443
  type: vmess
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  network: grpc
  tls: true
  servername: ${domain}
  skip-cert-verify: true
  grpc-opts:
    grpc-service-name: vmess-grpc

_______________________________________________________
                 Link Vmess Account
_______________________________________________________
Link TLS : vmess://$(echo $VMESS_WS | base64 -w 0)
_______________________________________________________
Link None TLS : vmess://$(echo $VMESS_NON_TLS | base64 -w 0)
_______________________________________________________
Link GRPC : vmess://$(echo $VMESS_GRPC | base64 -w 0)
_______________________________________________________



END

vmesslink1="vmess://$(echo $VMESS_WS | base64 -w 0)"
vmesslink2="vmess://$(echo $VMESS_NON_TLS | base64 -w 0)"
vmesslink3="vmess://$(echo $VMESS_GRPC | base64 -w 0)"
systemctl restart xray@vmess
systemctl restart xray@vmess-grpc

if [ ! -e /etc/vmess ]; then
  mkdir -p /etc/vmess
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))
echo "${d}" >/etc/vmess/${user}

cat >/etc/vmess/vmess-$user-config.txt<<END

───────────────────────────
     Xray/Vmess Account
───────────────────────────
Remarks      : ${user}
Host Server  : ${domain}
Location     : ${CITY}
Port TLS     : 443
Port NTLS    : 80
Port GRPC    : 443
User ID      : ${uuid}
AlterId      : 0
Security     : auto
Network      : WS / GRPC
Path         : (/multi path)
Path Dynamic : CF-XRAY:http://bug.com
ServiceName  : vmess-grpc
───────────────────────────
Link TLS     : ${vmesslink1}
───────────────────────────
Link NTLS    : ${vmesslink2}
───────────────────────────
Link GRPC    : ${vmesslink3}
───────────────────────────
Format OpenClash : http://${domain}:81/vmess-$user.txt
───────────────────────────
Expired On   : $exp

END
#
clear
echo -e "\033[1;96m───────────────────────────\033[0m"
echo -e "\e[41m         Xray/Vmess Account     \E[0m"
echo -e "\033[1;96m───────────────────────────\033[0m"
echo -e "Remarks      : ${user}"
echo -e "Host Server  : ${domain}"
echo -e "Location     : $CITY"
echo -e "Port TLS     : 443"
echo -e "Port NTLS    : 80"
echo -e "Port GRPC    : 443"
echo -e "User ID      : ${uuid}"
echo -e "AlterId      : 0"
echo -e "Security     : auto"
echo -e "Network      : WS / GRPC"
echo -e "Path         : (/multi path) "
echo -e "Path Dynamic : CF-XRAY:http://bug.com "
echo -e "ServiceName  : vmess-grpc"
echo -e "\033[1;96m───────────────────────────\033[0m"
echo -e "Link TLS     : ${vmesslink1}"
echo -e "\033[1;96m───────────────────────────\033[0m"
echo -e "Link NTLS    : ${vmesslink2}"
echo -e "\033[1;96m───────────────────────────\033[0m"
echo -e "Link GRPC    : ${vmesslink3}"
echo -e "\033[1;96m───────────────────────────\033[0m"
echo -e "Format OpenClash : http://${domain}:81/vmess-$user.txt"
echo -e "\033[1;96m───────────────────────────\033[0m"
echo -e "Expired On   : $exp"
echo -e ""
read -rp "Tekan enter untuk kembali ke Menu..."
mvmess
exit 0
fi
