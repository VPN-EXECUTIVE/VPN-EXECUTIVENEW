#!/bin/bash
clear
# Color Validation
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
# VPS Information
#Domain
domain=$(cat /etc/xray/domain)
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# Download
#Download/Upload today
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
OS="$(hostnamectl | grep "Operating System" | cut -d ' ' -f5-)"
kernel="$(hostnamectl | grep "Kernel" | cut -d ' ' -f14-)"
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
IP=$(curl -s ipinfo.io/ip);
Name=$(curl -sS http://lostserver.my.id:81/expired | grep $IP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
Exp=$(cat /usr/local/etc/.$Name.ini)
green_font_prefix="\033[32m" && red_font_prefix="\033[31m" && green_background_prefix="\033[42;37m" && red_background_prefix="\033[4$below" && font_color_suffix="\033[0m"
info="${green_font_prefix}PREMIUM${font_color_suffix}"
error="${green_fost_prefix}${font_color_suffix}${red_font_prefix}EXPIRED${font_color_suffix}"
today=$(date -d "0 days" +"%Y-%m-%d")
if [[ $today < $Exp ]]; then
	sts="${info}"
else
	sts="${error}"
fi
clear
d1=$(date -d "$Exp" +%s)
d2=$(date -d "$today" +%s)
cek=$(((d1 - d2 ) / 86400))
RAM=$(free -m | awk 'NR==2 {print $2}')
USAGERAM=$(free -m | awk 'NR==2 {print $3}')
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
vl=$(grep -c -E "^### " "/etc/xray/config.json")
vm=$(grep -c -E "^### " "/etc/xray/vmess.json")
tr=$(grep -c -E "^### " "/etc/xray/trojan-ws.json")
ss=$(grep -c -E "^### " "/etc/xray/ss-ws.json")
clear
echo -e "\e[33m                                                            \e[0m"
echo -e "\033[1;96m┌────────────────────────────────────────────┐\033[0m"
echo -e "\033[1;96m│\033[41m      ∆ VPN-EXECUTIVE COMMUNITY ∆      \033[0m\033[1;96m│\033[0m"
echo -e "\033[1;96m└────────────────────────────────────────────┘\033[0m"
echo -e " OS           :\e[0m  $OS"
echo -e " Kernel       :\e[0m  $kernel"
echo -e " RAM          :\e[0m  ${USAGERAM} MiB / ${RAM} MiB"
echo -e " Uptime       :\e[0m  $uptime "
echo -e " Isp Name     :\e[0m  $ISP"
echo -e " Domain       :\e[0m  $domain"
echo -e " Ip Vps       :\e[0m  $IP"
echo -e " Expired In   :\e[0m  $cek Days"
echo -e " Status       :\e[0m  $sts"
echo -e "\033[1;96m┌────────────────────────────────────────────┐\033[0m"
echo -e "\033[1;96m│  T: ${ttoday} │ Y: ${tyest} │ TM: ${tmon}"
echo -e "\033[1;96m└────────────────────────────────────────────┘\033[0m"
echo -e "\033[1;96m          ┌─────────────────────────┐\033[0m"
echo -e "              VMESS  :  $vm Account"
echo -e "              VLESS  :  $vl Account"
echo -e "              TROJAN :  $tr Account"
echo -e "              SHDWSK :  $ss Account"
echo -e "\033[1;96m             ─────────────────────\033[0m"
echo -e "\e[36m  •1•\e[0m VMESS MANAGER     \e[36m•5•\e[0m SCRIPT MENU"
echo -e "\e[36m  •2•\e[0m VLESS MANAGER     \e[36m•6•\e[0m RESTART SERVICE"
echo -e "\e[36m  •3•\e[0m TROJAN MANAGER    \e[36m•7•\e[0m UPDATE SCRIPT"
echo -e "\e[36m  •4•\e[0m SHDWSK MANAGER    \e[36m•8•\e[0m REBOOT SYSTEM"
echo -e "\033[1;96m┌────────────────────────────────────────────┐"
read -rp "│    Select 1 - 8 or x to exit script : " -e num
echo -e "└────────────────────────────────────────────┘\033[0m"
if [[ "$num" = "1" ]]; then
	mvmess
elif [[ "$num" = "2" ]]; then
	mvless
elif [[ "$num" = "3" ]]; then
	mtrojan
elif [[ "$num" = "4" ]]; then
	msock
elif [[ "$num" = "5" ]]; then
	mxtra
elif [[ "$num" = "6" ]]; then
	seres
elif [[ "$num" = "7" ]]; then
	lsvr
elif [[ "$num" = "8" ]]; then
	clear-log >/dev/null 2>&1
	reboot
elif [[ "$num" = "x" ]]; then
	exit 0
else
	menu
fi
