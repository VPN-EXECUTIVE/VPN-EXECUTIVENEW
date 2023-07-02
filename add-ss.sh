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
	 echo " Telegram   : syntaxerorrr"
	 echo " WhatsApp   : 081326854629"
   echo " em@il      : admin@lostserver.my.id"
	exit 0
fi
clear
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
domain=$(cat /etc/xray/domain)
CITY=$(cat /etc/xray/city)
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
  echo -e "\033[1;96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
  echo -e "\e[41m       Add Shadowsocks Ws/Grpc Account   \E[0m"
  echo -e "\033[1;96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

  read -rp "Username        : " -e user
  CLIENT_EXISTS=$(grep -w $user /etc/xray/ss-ws.json | wc -l)

  if [[ ${CLIENT_EXISTS} == '1' ]]; then
    clear
    echo -e "\033[1;96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e "\e[41m       Add Shadowsocks Ws/Grpc Account   \E[0m"
    echo -e "\033[1;96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo ""
    echo " A client with the specified name was already created, please choose another name."
    echo ""
    echo -e "\033[1;96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo
    read -rp "Tekan enter untuk kembali ke Menu..."
    msock
    exit 0
  fi
done

cipher="aes-128-gcm"
uuid=$(cat /proc/sys/kernel/random/uuid)
read -rp "Expired (days)  : " masaaktif
read -rp "Limit User (GB) : " Quota
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")
sed -i '/#ssws$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher""'","email": "'""$user""'"' /etc/xray/ss-ws.json
sed -i '/#ssgrpc$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher""'","email": "'""$user""'"' /etc/xray/ss-grpc.json
echo $cipher:$uuid >/tmp/log
shadowsocks_base64=$(cat /tmp/log)
echo -n "${shadowsocks_base64}" | base64 >/tmp/log1
shadowsocks_base64e=$(cat /tmp/log1)
shadowsockslink="ss://${shadowsocks_base64e}@$domain:443?plugin=xray-plugin;mux=0;path=/ss-ws;host=$domain;tls#${user}"
shadowsockslink1="ss://${shadowsocks_base64e}@$domain:443?plugin=xray-plugin;mux=0;serviceName=ss-grpc;host=$domain;tls#${user}"
systemctl restart xray
rm -rf /tmp/log
rm -rf /tmp/log1
cat >/var/www/html/ss-$user.txt <<-END

_______________________________________________________
              Format Shadowsocks WS (CDN)
                   BY VPN-EXECUTIVE
_______________________________________________________


{
 "dns": {
    "servers": [
      "8.8.8.8",
      "8.8.4.4"
    ]
  },
 "inbounds": [
   {
      "port": 10808,
      "protocol": "socks",
      "settings": {
        "auth": "noauth",
        "udp": true,
        "userLevel": 8
      },
      "sniffing": {
        "destOverride": [
          "http",
          "tls"
        ],
        "enabled": true
      },
      "tag": "socks"
    },
    {
      "port": 10809,
      "protocol": "http",
      "settings": {
        "userLevel": 8
      },
      "tag": "http"
    }
  ],
  "log": {
    "loglevel": "none"
  },
  "outbounds": [
    {
      "mux": {
        "enabled": true
      },
      "protocol": "shadowsocks",
      "settings": {
        "servers": [
          {
            "address": "$domain",
            "level": 8,
            "method": "$cipher",
            "password": "$uuid",
            "port": 443
          }
        ]
      },
      "streamSettings": {
        "network": "ws",
        "security": "tls",
        "tlsSettings": {
          "allowInsecure": true,
          "serverName": "$domain"
        },
        "wsSettings": {
          "headers": {
            "Host": "$domain"
          },
          "path": "/ss-ws"
        }
      },
      "tag": "proxy"
    },
    {
      "protocol": "freedom",
      "settings": {},
      "tag": "direct"
    },
    {
      "protocol": "blackhole",
      "settings": {
        "response": {
          "type": "http"
        }
      },
      "tag": "block"
    }
  ],
  "policy": {
    "levels": {
      "8": {
        "connIdle": 300,
        "downlinkOnly": 1,
        "handshake": 4,
        "uplinkOnly": 1
      }
    },
    "system": {
      "statsOutboundUplink": true,
      "statsOutboundDownlink": true
    }
  },
  "routing": {
    "domainStrategy": "Asls",
"rules": []
  },
  "stats": {}
 }

_______________________________________________________
              Format Shadowsocks gRPC
_______________________________________________________


{
    "dns": {
    "servers": [
      "8.8.8.8",
      "8.8.4.4"
    ]
  },
 "inbounds": [
   {
      "port": 10808,
      "protocol": "socks",
      "settings": {
        "auth": "noauth",
        "udp": true,
        "userLevel": 8
      },
      "sniffing": {
        "destOverride": [
          "http",
          "tls"
        ],
        "enabled": true
      },
      "tag": "socks"
    },
    {
      "port": 10809,
      "protocol": "http",
      "settings": {
        "userLevel": 8
      },
      "tag": "http"
    }
  ],
  "log": {
    "loglevel": "none"
  },
  "outbounds": [
    {
      "mux": {
        "enabled": true
      },
      "protocol": "shadowsocks",
      "settings": {
        "servers": [
          {
            "address": "$domain",
            "level": 8,
            "method": "$cipher",
            "password": "$uuid",
            "port": 443
          }
        ]
      },
      "streamSettings": {
        "grpcSettings": {
          "multiMode": true,
          "serviceName": "ss-grpc"
        },
        "network": "grpc",
        "security": "tls",
        "tlsSettings": {
          "allowInsecure": true,
          "serverName": "$domain"
        }
      },
      "tag": "proxy"
    },
    {
      "protocol": "freedom",
      "settings": {},
      "tag": "direct"
    },
    {
      "protocol": "blackhole",
      "settings": {
        "response": {
          "type": "http"
        }
      },
      "tag": "block"
    }
  ],
  "policy": {
    "levels": {
      "8": {
        "connIdle": 300,
        "downlinkOnly": 1,
        "handshake": 4,
        "uplinkOnly": 1
      }
    },
    "system": {
      "statsOutboundUplink": true,
      "statsOutboundDownlink": true
    }
  },
  "routing": {
    "domainStrategy": "Asls",
"rules": []
  },
  "stats": {}
}


_______________________________________________________
              Link Shadowsocks Account
_______________________________________________________
Link TLS  : ${shadowsockslink}
_______________________________________________________
Link gRPC : ${shadowsockslink1}
_______________________________________________________

END

systemctl restart xray@ss-ws
systemctl restart xray@ss-grpc

if [ ! -e /etc/shadowsocks ]; then
  mkdir -p /etc/shadowsocks
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))
echo "${d}" >/etc/shadowsocks/${user}


cat >/etc/shadowsocks/shadowsocks-$user-config.txt<<END

───────────────────────────
     Xray/Shadowsocks Account
───────────────────────────
Remarks      : ${user}
Host Server  : ${domain}
Location     : $CITY
Port TLS     : 443
Port GRPC    : 443
Password     : ${uuid}
Cipers       : aes-128-gcm
Network      : WS / GRPC
Path         : /ss-ws
Service Name : ss-grpc"
───────────────────────────
Link TLS     : ${shadowsockslink}
───────────────────────────
Link GRPC    : ${shadowsockslink1}
───────────────────────────
Link JSON    : http://${domain}:81/ss-$user.txt
───────────────────────────
Expired On   : $exp
───────────────────────────

END
#
clear
echo -e "\033[1;96m───────────────────────────\033[0m"
echo -e "\e[41m    Shadowsocks Account   \E[0m"
echo -e "\033[1;96m───────────────────────────\033[0m"
echo -e "Remarks      : ${user}"
echo -e "Host Server  : ${domain}"
echo -e "Location     : $CITY"
echo -e "Port TLS     : 443"
echo -e "Port GRPC    : 443"
echo -e "Password     : ${uuid}"
echo -e "Cipers       : aes-128-gcm"
echo -e "Network      : WS / GRPC"
echo -e "Path         : /ss-ws"
echo -e "Service Name : ss-grpc"
echo -e "\033[1;96m───────────────────────────\033[0m"
echo -e "Link TLS     : ${shadowsockslink}"
echo -e "\033[1;96m───────────────────────────\033[0m"
echo -e "Link GRPC    : ${shadowsockslink1}"
echo -e "\033[1;96m───────────────────────────\033[0m"
echo -e "Link JSON    : http://${domain}:81/ss-$user.txt"
echo -e "\033[1;96m───────────────────────────\033[0m"
echo -e "Expired On   : $exp"
echo -e "\033[1;96m───────────────────────────\033[0m"
echo -e ""
read -rp "Tekan enter untuk kembali ke Menu..."
msock
exit 0
fi
