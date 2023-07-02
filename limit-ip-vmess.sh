#!/bin/bash
echo -n > /var/log/xray/access.log
sleep 2
data=( `ls /etc/xray/limit/vmess/ip`);
for user in "${data[@]}"
do
iplimit=$(cat /etc/xray/limit/vmess/ip/$user)
ehh=$(cat /var/log/xray/access.log | grep -w "$user" | sed /cloudflare.com/d | sed /gstatic.com/d | sed /google.com/d | sed /google.co.id/d | sed /bing.com/d | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq | cut -d . -f 1-3 | sed s/127.0.0//g | sort | uniq | sed '/^$/d');
cekcek=$(echo -e "$ehh" | wc -l);
if [[ $cekcek -gt $iplimit ]]; then
disable-vmess  $user $cekcek $iplimit "$ehh"
#nais=3
else
echo > /dev/null
fi
sleep 0.1
done
#if [[ $nais -gt 1 ]]; then
#telegram-send --pre "$(log-vmess)" > /dev/null &
#else
#echo > /dev/null
#fi
