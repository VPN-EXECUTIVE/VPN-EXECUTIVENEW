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
clear
echo -n >/tmp/other.txt
data=($(cat /etc/xray/vmess.json | grep '^###' | cut -d ' ' -f 2 | sort | uniq))

echo -e "\033[1;93m─────────────────────────────────────────\033[0m"
echo -e "\e[42m      Vmess User Login Account           \E[0m"
echo -e "\033[1;93m─────────────────────────────────────────\033[0m"

for akun in "${data[@]}"; do
    if [[ -z "$akun" ]]; then
        akun="tidakada"
    fi

    echo -n >/tmp/ipvmess.txt
    data2=($(cat /var/log/xray/access.log | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq))
    for ip in "${data2[@]}"; do

        jum=$(cat /var/log/xray/access.log | grep -w "$akun" | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | grep -w "$ip" | sort | uniq)
        if [[ "$jum" = "$ip" ]]; then
            echo "$jum" >>/tmp/ipvmess.txt
        else
            echo "$ip" >>/tmp/other.txt
        fi
        jum2=$(cat /tmp/ipvmess.txt)
        sed -i "/$jum2/d" /tmp/other.txt >/dev/null 2>&1
    done

    jum=$(cat /tmp/ipvmess.txt)
    if [[ -z "$jum" ]]; then
        echo >/dev/null
    else
        jum2=$(cat /tmp/ipvmess.txt | nl)
        echo "user : $akun"
        echo "$jum2"
        echo -e "\033[1;93m─────────────────────────────────────────\033[0m"
    fi
    rm -rf /tmp/ipvmess.txt
done

rm -rf /tmp/other.txt
echo ""
read -rp "Tekan enter untuk kembali ke Menu..."
menu
exit 0
fi
