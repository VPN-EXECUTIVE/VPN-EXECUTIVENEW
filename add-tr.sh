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
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
  echo -e "\033[1;96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
  echo -e "\e[41m        Add Xray/Trojan Account          \E[0m"
  echo -e "\033[1;96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

  read -rp "Username        : " -e user
  user_EXISTS=$(grep -w $user /etc/xray/trojan-ws.json | wc -l)

  if [[ ${user_EXISTS} == '1' ]]; then
    clear
    echo -e "\033[1;96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "\e[41m        Add Xray/Trojan Account          \E[0m"
    echo -e "\033[1;96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo ""
    echo "A client with the specified name was already created, please choose another name."
    echo ""
    echo -e "\033[1;96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    read -rp "Tekan enter untuk kembali ke Menu..."
    mtrojan
    exit 0
  fi
done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -rp "Expired (days)  : " masaaktif
read -rp "Limit User (GB) : " Quota
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")
sed -i '/#trojanws$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/trojan-ws.json
sed -i '/#trojangrpc$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/trojan-grpc.json
cat >/var/www/html/trojan-$user.txt <<-END

_______________________________________________________
              Format Trojan GO/WS (CDN)
_______________________________________________________

- name: Trojan-$user-GO/WS (CDN)
  server: ${domain}
  port: 443
  type: trojan
  password: ${uuid}
  network: ws
  sni: ${domain}
  skip-cert-verify: true
  udp: true
  ws-opts:
    path: /trojan-ws
    headers:
        Host: ${domain}
_______________________________________________________
                 Format Trojan gRPC
_______________________________________________________

- name: Trojan-$user-gRPC (SNI)
  type: trojan
  server: ${domain}
  port: 443
  password: ${uuid}
  udp: true
  sni: ${domain}
  skip-cert-verify: true
  network: grpc
  grpc-opts:
    grpc-service-name: trojan-grpc

_______________________________________________________
              Link Trojan Account
_______________________________________________________
Link WS TLS  : trojan://${uuid}@${domain}:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}
_______________________________________________________
Link WS NTLS : trojan://${uuid}@${domain}:80?path=%2Ftrojan-ws&security=none&headerType=none&host=${domain}&type=ws#${user}
_______________________________________________________
Link GRPC    : trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=${domain}#${user}
_______________________________________________________



END

systemctl restart xray@trojan-ws
systemctl restart xray@trojan-grpc

if [ ! -e /etc/trojan ]; then
  mkdir -p /etc/trojan
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))
echo "${d}" >/etc/trojan/${user}

trojanlink="trojan://${uuid}@${domain}:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
trojanlink1="trojan://${uuid}@${domain}:80?path=%2Ftrojan-ws&security=none&headerType=none&host=${domain}&type=ws#${user}"
trojanlink2="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=${domain}#${user}"

cat >/etc/trojan/trojan-$user-config.txt<<END

───────────────────────────
     Xray/Trojan Account
───────────────────────────
Remarks      : ${user}
Host Server  : ${domain}
Location     : ${CITY}
Port WS TLS  : 443
Port WS NTLS : 80
Port GRPC    : 443
Key          : ${uuid}
Path         : /trojan-ws
Service Name : trojan-grpc
───────────────────────────
Link TLS     : ${trojanlink}
───────────────────────────
Link NTLS    : ${trojanlink1}
───────────────────────────
Link GRPC    : ${trojanlink2}
───────────────────────────
Format OpenClash : http://${domain}:81/trojan-$user.txt
───────────────────────────
Expired On   : ${exp}
───────────────────────────

END
#
clear
echo -e "\033[1;96m───────────────────────────\033[0m"
echo -e "\e[41m        Xray/Trojan Account      \E[0m"
echo -e "\033[1;96m───────────────────────────\033[0m"
echo -e "Remarks      : ${user}"
echo -e "Host Server  : ${domain}"
echo -e "Location     : $CITY"
echo -e "Port WS TLS  : 443"
echo -e "Port WS NTLS : 80"
echo -e "port GRPC    : 443"
echo -e "Key          : ${uuid}"
echo -e "Path         : /trojan-ws"
echo -e "Service Name : trojan-grpc"
echo -e "\033[1;96m───────────────────────────\033[0m"
echo -e "Link WS TLS  : ${trojanlink}"
echo -e "\033[1;96m───────────────────────────\033[0m"
echo -e "Link WS NTLS : ${trojanlink1}"
echo -e "\033[1;96m───────────────────────────\033[0m"
echo -e "Link GRPC    : ${trojanlink2}"
echo -e "\033[1;96m───────────────────────────\033[0m"
echo -e "Format OpenClash : http://${domain}:81/trojan-$user.txt"
echo -e "\033[1;96m───────────────────────────\033[0m"
echo -e "Expired On   : $exp"
echo -e "\033[1;96m───────────────────────────\033[0m"
echo -e ""
read -rp "Tekan enter untuk kembali ke Menu..."
mtrojan
exit 0
fi
