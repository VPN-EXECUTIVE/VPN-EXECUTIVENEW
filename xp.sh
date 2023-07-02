#!/bin/bash
data=($(cat /etc/xray/config.json | grep '^###' | cut -d ' ' -f 2 | sort | uniq))
now=$(date +"%Y-%m-%d")
for user in "${data[@]}"; do
exp=$(grep -w "^### $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(((d1 - d2) / 86400))
if [[ "$exp2" -le "0" ]]; then
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/vless-grpc.json
rm -f /etc/vless/$user
rm -f /etc/limit/vless/$user
rm -f /etc/vless/vless-$user-config.txt
rm -f /var/www/html/vless-$user.txt
fi
done
systemctl restart xray
systemctl restart xray@vless-grpc
data=($(cat /etc/xray/vmess.json | grep '^###' | cut -d ' ' -f 2 | sort | uniq))
now=$(date +"%Y-%m-%d")
for user in "${data[@]}"; do
exp=$(grep -w "^### $user" "/etc/xray/vmess.json" | cut -d ' ' -f 3 | sort | uniq)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(((d1 - d2) / 86400))
if [[ "$exp2" -le "0" ]]; then
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/vmess.json
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/vmess-grpc.json
rm -f /etc/vmess/$user
rm -f /etc/limit/vmess/$user
rm -f /etc/vmess/vmess-$user-config.txt
rm -f /var/www/html/vmess-$user.txt
fi
done
systemctl restart xray@vmess
systemctl restart xray@vmess-grpc
data=($(cat /etc/xray/trojan-ws.json | grep '^###' | cut -d ' ' -f 2 | sort | uniq))
now=$(date +"%Y-%m-%d")
for user in "${data[@]}"; do
exp=$(grep -w "^### $user" "/etc/xray/trojan-ws.json" | cut -d ' ' -f 3 | sort | uniq)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(((d1 - d2) / 86400))
if [[ "$exp2" -le "0" ]]; then
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/trojan-ws.json
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/trojan-grpc.json
rm -f /etc/trojan/$user
rm -f /etc/limit/trojan/$user
rm -f /etc/trojan/trojan-$user-config.txt
rm -f /var/www/html/trojan-$user.txt
fi
done
systemctl restart xray@trojan-ws
systemctl restart xray@trojan-grpc
data=($(cat /etc/xray/ss-ws.json | grep '^###' | cut -d ' ' -f 2 | sort | uniq))
now=$(date +"%Y-%m-%d")
for user in "${data[@]}"; do
exp=$(grep -w "^### $user" "/etc/xray/ss-ws.json" | cut -d ' ' -f 3 | sort | uniq)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(((d1 - d2) / 86400))
if [[ "$exp2" -le "0" ]]; then
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/ss-ws.json
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/ss-grpc.json
rm -f /etc/shadowsocks/$user
rm -f /etc/limit/shadowsocks/$user
rm -f /etc/shadowsocks/shadowsocks-$user-config.txt
rm -f /var/www/html/ss-$user.txt
fi
done
systemctl restart xray@ss-ws
systemctl restart xray@ss-grpc
echo
echo "------------------------------------------------"
echo "auto delete expired account successfully running"
