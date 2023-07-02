#!/bin/bash
red="\e[1;31m"
green="\e[1;32m"
NC="\e[0m"
MYIP=$(curl -s ipinfo.io/ip);
IZIN=$(curl http://aksesvpn.my.id:81/akses | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "${green}VPS berhasil diijinkan${NC}"
else
echo -e "${red}VPS tidak diijinkan${NC}";
echo "Please Contact Admin"
echo "Telegram   : @VPNEXECUTIVE"
echo "WhatsApp   : 081911829754"
exit 0
fi
clear
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
   rm -f /root/install
   exit 0
fi
clear
# // FONT color configuration
Green="\e[92;1m"
RED="\033[31m"
YELLOW="\033[33m"
BLUE="\033[36m"
FONT="\033[0m"
GREENBG="\033[42;37m"
REDBG="\033[41;37m"
OK="${Green}--->${FONT}"
ERROR="${RED}[ERROR]${FONT}"
GRAY="\e[1;30m"
NC='\e[0m'
red='\e[1;31m'
green='\e[0;32m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
# // configuration GET
TIMES="10"
NAMES=$(whoami)
IMP="wget -q -O"
CHATID="1118232400"
LOCAL_DATE="/usr/bin/"
CITY=$(curl -s ipinfo.io/city)
TIME=$(date +'%Y-%m-%d %H:%M:%S')
RAMMS=$(free -m | awk 'NR==2 {print $2}')
KEY="5661986467:AAHRhgKFp9N5061gZtZ6n4Ae4BJF3PmQ188"
URL="https://api.telegram.org/bot$KEY/sendMessage"
GITHUB_CMD="https://github.com/VPN-EXECUTIVE/VPN-EXECUTIVENEW/raw/main/"
LOSTSERVER="https://github.com/VPN-EXECUTIVE/VPN-EXECUTIVENEW/raw/main/"
OS=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
Date_list=$(date +"%Y-%m-%d" -d "$dateFromServer")
function print_ok() {
    echo -e "${OK} ${BLUE} $1 ${FONT}"
}

function print_error() {
    echo -e "${ERROR} ${REDBG} $1 ${FONT}"
}

function is_root() {
    if [[ 0 == "$UID" ]]; then
        print_ok "Root user Start installation process"
    else
        print_error "The current user is not the root user, please switch to the root user and run the script again"
    fi
}
judge() {
    if [[ 0 -eq $? ]]; then
        print_ok "$1 Processing..."
        sleep 1
    fi
}
secs_to_human() {
    echo "      Installation time : $((${1} / 3600)) hours $(((${1} / 60) % 60)) minute's $((${1} % 60)) seconds"
}
if [ -f "/etc/xray/domain" ]; then
echo -e " - ${RED}Script sudah pernah terinstall sebelumnya${FONT}
 - ${RED}Silahkan rebuild VPS anda lalu menginstall kembali${FONT}"
exit 0
fi
echo -e "
    ┌───────────────────────────────────────────────┐
 ───│                                               │───
 ───│    $Green┌─┐┬ ┬┌┬┐┌─┐┌─┐┌─┐┬─┐┬┌─┐┌┬┐  ┬  ┬┌┬┐┌─┐$NC   │───
 ───│    $Green├─┤│ │ │ │ │└─┐│  ├┬┘│├─┘ │   │  │ │ ├┤ $NC   │───
 ───│    $Green┴ ┴└─┘ ┴ └─┘└─┘└─┘┴└─┴┴   ┴   ┴─┘┴ ┴ └─┘$NC   │───
    │                                               │
    └───────────────────────────────────────────────┘
         ${RED}Autoscript XRAY VPN LITE (Multi Port)${FONT}
${RED}Make sure the internet is smooth when installing the script${FONT}
        "
INS="apt-get install -y"
start=$(date +%s)
judge "Installing Update Server"
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime >/dev/null 2>&1
apt-get update -y >/dev/null 2>&1
apt-get clean all >/dev/null 2>&1
apt-get autoremove -y >/dev/null 2>&1
${INS} debconf-utils >/dev/null 2>&1
sudo apt-get remove --purge exim4 -y >/dev/null 2>&1
sudo apt-get remove --purge ufw firewalld -y >/dev/null 2>&1
${INS} --no-install-recommends software-properties-common >/dev/null 2>&1
echo iptables-persistent iptables-persistent/autosave_v4 boolean true | debconf-set-selections >/dev/null 2>&1
echo iptables-persistent iptables-persistent/autosave_v6 boolean true | debconf-set-selections >/dev/null 2>&1
${INS} htop lsof tar wget curl ruby zip unzip p7zip-full python3-pip libc6 util-linux build-essential msmtp-mta ca-certificates bsd-mailx iptables iptables-persistent netfilter-persistent net-tools lolcat openssl ca-certificates gnupg gnupg2 ca-certificates lsb-release gcc make cmake git screen socat xz-utils apt-transport-https gnupg1 dnsutils cron bash-completion ntpdate chrony jq bc >/dev/null 2>&1
${INS} libnss3-dev libnspr4-dev pkg-config libpam0g-dev libcap-ng-dev libcap-ng-utils libselinux1-dev libcurl4-nss-dev flex bison make libnss3-tools libevent-dev >/dev/null 2>&1
gem install lolcat >/dev/null 2>&1
# // Make Folder Xray to accsess
mkdir -p /etc/xray
mkdir -p /usr/bin/xray
mkdir -p /var/log/xray
mkdir -p /usr/local/bin/
mkdir -p /usr/local/share/xray/
mkdir -p /var/www/html
mkdir -p /etc/haproxy
mkdir -p /home/vps/public_html
touch /etc/xray/domain
touch /var/log/xray/access.log
touch /var/log/xray/error.log
DOMAIN=vpnqu.my.id
sub=$(</dev/urandom tr -dc a-z0-9 | head -c8)
SUB_DOMAIN=${sub}.vpnqu.my.id
CF_ID=yovan83@live.com
CF_KEY=a8aef91b76372e1514811fdf26a079eab5ec1
set -euo pipefail
IP=$(curl -s ipinfo.io/ip);
judge "Creating Domain For Server"
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

echo $SUB_DOMAIN >/etc/xray/domain

judge "Installing SSL Certificate"
domain=$(cat /etc/xray/domain)
rm -rf /root/.acme.sh
mkdir /root/.acme.sh
curl https://acme-install.netlify.app/acme.sh -o /root/.acme.sh/acme.sh >/dev/null 2>&1
chmod +x /root/.acme.sh/acme.sh >/dev/null 2>&1
/root/.acme.sh/acme.sh --upgrade --auto-upgrade >/dev/null 2>&1
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt >/dev/null 2>&1
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256 >/dev/null 2>&1
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc >/dev/null 2>&1

export DEBIAN_FRONTEND=noninteractive
apt -y install vnstat >/dev/null 2>&1
/etc/init.d/vnstat restart >/dev/null 2>&1
apt -y install libsqlite3-dev >/dev/null 2>&1
wget https://humdi.net/vnstat/vnstat-2.6.tar.gz >/dev/null 2>&1
tar zxvf vnstat-2.6.tar.gz >/dev/null 2>&1
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc >/dev/null 2>&1
make >/dev/null 2>&1
make install >/dev/null 2>&1
cd
sed -i 's/Interface "'""eth0""'"/Interface "'""eth0""'"/g' /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat >/dev/null 2>&1
/etc/init.d/vnstat restart >/dev/null 2>&1
rm -f /root/vnstat-2.6.tar.gz
rm -rf /root/vnstat-2.6

if [[ $(cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g') == "ubuntu" ]]; then
    judge "Installing nginx For $(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')"
    sudo apt-get install nginx -y >/dev/null 2>&1
elif [[ $(cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g') == "debian" ]]; then
    judge "Installing nginx For $(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')"
    apt -y install nginx >/dev/null 2>&1
else
    judge "${ERROR} Your OS Is Not Supported ( ${YELLOW}$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')${FONT} )"
fi
# // nginx config | LOSTSERVER AUTOSCRIPT
cd
rm /var/www/html/*.html
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /var/www/html/index.html "${GITHUB_CMD}index.html" >/dev/null 2>&1
chown -R www-data:www-data /var/www/html
chmod -R g+rw /var/www/html
wget -O /usr/bin/speedtest "${GITHUB_CMD}speedtest" >/dev/null 2>&1
chmod +x /usr/bin/speedtest

cat >/etc/nginx/nginx.conf <<END
user www-data;

worker_processes 1;
pid /var/run/nginx.pid;

events {
    multi_accept on;
    worker_connections 1024;
}

http {
    gzip on;
    gzip_vary on;
    gzip_comp_level 5;
    gzip_types    text/plain application/x-javascript text/xml text/css;
    autoindex on;
    sendfile on;
    tcp_nopush on;
    tcp_nodelay on;
    keepalive_timeout 65;
    types_hash_max_size 2048;
    server_tokens off;
    include /etc/nginx/mime.types;
    default_type application/octet-stream;
    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log;
    client_max_body_size 32M;
    client_header_buffer_size 8m;
    large_client_header_buffers 8 8m;
    fastcgi_buffer_size 8m;
    fastcgi_buffers 8 8m;
    fastcgi_read_timeout 600;
    set_real_ip_from 204.93.240.0/24;
    set_real_ip_from 204.93.177.0/24;
    set_real_ip_from 199.27.128.0/21;
    set_real_ip_from 173.245.48.0/20;
    set_real_ip_from 103.21.244.0/22;
    set_real_ip_from 103.22.200.0/22;
    set_real_ip_from 103.31.4.0/22;
    set_real_ip_from 141.101.64.0/18;
    set_real_ip_from 108.162.192.0/18;
    set_real_ip_from 190.93.240.0/20;
    set_real_ip_from 188.114.96.0/20;
    set_real_ip_from 197.234.240.0/22;
    set_real_ip_from 198.41.128.0/17;
    real_ip_header     CF-Connecting-IP;
    
    include /etc/nginx/conf.d/*.conf;
}
END

cd
cat >/root/.profile <<END
# ~/.profile: executed by Bourne-compatible login shells.
if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi
mesg n || true
clear
menu
END

chmod 644 /root/.profile

cat >/etc/cron.d/xp_all <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 3 * * * root /usr/bin/xp
END

cat >/etc/cron.d/daily_reboot <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 5 * * * root /usr/bin/clear-log && root /sbin/reboot
END

echo "*/1 * * * * root echo -n > /var/log/nginx/access.log" >/etc/cron.d/log.nginx
echo "*/1 * * * * root echo -n > /var/log/xray/access.log" >>/etc/cron.d/log.xray
service cron restart
cat >/home/daily_reboot <<-END
5
END

cat >/etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

echo "/bin/false" >>/etc/shells
echo "/usr/sbin/nologin" >>/etc/shells
cat >/etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END

chmod +x /etc/rc.local

AUTOREB=$(cat /home/daily_reboot)
SETT=11
if [ $AUTOREB -gt $SETT ]; then
    TIME_DATE="PM"
else
    TIME_DATE="AM"
fi
judge "Installing Xray Core Version 1.7.5"
VPN-EXECUTIBE="//github.com/VPN-EXECUTIVE/VPN-EXECUTIVENEW/raw/main/"
#=====================================================================
wget -O /usr/bin/add-ws "${VPN-EXECUTIVE}add-ws.sh" >/dev/null 2>&1
chmod +x /usr/bin/add-ws
wget -O /usr/bin/renew-ws "${VPN-EXECUTIVE}renew-ws.sh" >/dev/null 2>&1
chmod +x /usr/bin/renew-ws
wget -O /usr/bin/del-ws "${VPN-EXECUTIVE}del-ws.sh" >/dev/null 2>&1
chmod +x /usr/bin/del-ws
wget -O /usr/bin/cek-ws "${GITHUB_CMD}cek-ws.sh" >/dev/null 2>&1
chmod +x /usr/bin/cek-ws
wget -O /usr/bin/cek-cfg-ws "${VPN-EXECUTIVE}cek-cfg-ws.sh" >/dev/null 2>&1
chmod +x /usr/bin/cek-cfg-ws
wget -O /usr/bin/add-vless "${VPN-EXECUTIVE}add-vless.sh" >/dev/null 2>&1
chmod +x /usr/bin/add-vless
wget -O /usr/bin/renew-vless "${VPN-EXECUTIVE}renew-vless.sh" >/dev/null 2>&1
chmod +x /usr/bin/renew-vless
wget -O /usr/bin/del-vless "${VPN-EXECUTIVE}del-vless.sh" >/dev/null 2>&1
chmod +x /usr/bin/del-vless
wget -O /usr/bin/cek-vless "${GITHUB_CMD}cek-vless.sh" >/dev/null 2>&1
chmod +x /usr/bin/cek-vless
wget -O /usr/bin/cek-cfg-vless "${VPN-EXECUTIVE}cek-cfg-vless.sh" >/dev/null 2>&1
chmod +x /usr/bin/cek-cfg-vless
wget -O /usr/bin/add-tr "${VPN-EXECUTIVE}add-tr.sh" >/dev/null 2>&1
chmod +x /usr/bin/add-tr
wget -O /usr/bin/del-tr "${VPN-EXECUTIVE}del-tr.sh" >/dev/null 2>&1
chmod +x /usr/bin/del-tr
wget -O /usr/bin/renew-tr "${VPN-EXECUTIVE}renew-tr.sh" >/dev/null 2>&1
chmod +x /usr/bin/renew-tr
wget -O /usr/bin/cek-tr "${GITHUB_CMD}cek-tr.sh" >/dev/null 2>&1
chmod +x /usr/bin/cek-tr
wget -O /usr/bin/cek-cfg-tr "${LOSTSERVER}cek-cfg-tr.sh" >/dev/null 2>&1
chmod +x /usr/bin/cek-cfg-tr
wget -O /usr/bin/add-ss "${VPN-EXECUTIVE}add-ss.sh" >/dev/null 2>&1
chmod +x /usr/bin/add-ss
wget -O /usr/bin/del-ss "${VPN-EXECUTIVE}del-ss.sh" >/dev/null 2>&1
chmod +x /usr/bin/del-ss
wget -O /usr/bin/renew-ss "${VPN-EXECUTIVE}renew-ss.sh" >/dev/null 2>&1
chmod +x /usr/bin/renew-ss
wget -O /usr/bin/cek-ss "${GITHUB_CMD}cek-ss.sh" >/dev/null 2>&1
chmod +x /usr/bin/cek-ss
wget -O /usr/bin/cek-cfg-ss "${VPN-EXECUTIVE}cek-cfg-ss.sh" >/dev/null 2>&1
chmod +x /usr/bin/cek-cfg-ss
wget -O /usr/bin/lsvr "${VPN-EXECUTIVE}lsvr.sh" >/dev/null 2>&1
chmod +x /usr/bin/lsvr
wget -O /usr/bin/add-host1 "${VPN-EXECUTIVE}add-host1.sh" >/dev/null 2>&1
chmod +x /usr/bin/add-host1
wget -O /usr/bin/add-host2 "${VPN-EXECUTIVE}add-host2.sh" >/dev/null 2>&1
chmod +x /usr/bin/add-host2
wget -O /usr/bin/get-backres "${VPN-EXECUTIVE}get-backres.sh" >/dev/null 2>&1
chmod +x /usr/bin/get-backres
wget -O /usr/bin/get-domain "${LOSTSERVER}get-domain.sh" >/dev/null 2>&1
chmod +x /usr/bin/get-domain
wget -O /usr/bin/menu "${VPN-EXECUTIVE}menu.sh" >/dev/null 2>&1
chmod +x /usr/bin/menu
wget -O /usr/bin/msock "${VPN-EXECUTIVE}msock.sh" >/dev/null 2>&1
chmod +x /usr/bin/msock
wget -O /usr/bin/mtrojan "${VPN-EXECUTIVE}mtrojan.sh" >/dev/null 2>&1
chmod +x /usr/bin/mtrojan
wget -O /usr/bin/mvmess "${VPN-EXECUTIVE}mvmess.sh" >/dev/null 2>&1
chmod +x /usr/bin/mvmess
wget -O /usr/bin/mvless "${VPN-EXECUTIVE}mvless.sh" >/dev/null 2>&1
chmod +x /usr/bin/mvless
wget -O /usr/bin/mxtra "${VPN-EXECUTIVE}mxtra.sh" >/dev/null 2>&1
chmod +x /usr/bin/mxtra
wget -O /usr/bin/backup "${VPN-EXECUTIVE}backup.sh" >/dev/null 2>&1
chmod +x /usr/bin/backup
wget -O /usr/bin/restore "${VPN-EXECUTIVE}restore.sh" >/dev/null 2>&1
chmod +x /usr/bin/restore
wget -O /usr/bin/seres "${VPN-EXECUTIVE}seres.sh" >/dev/null 2>&1
chmod +x /usr/bin/seres
wget -O /usr/bin/update "${VPN-EXECUTIVE}update.sh" >/dev/null 2>&1
chmod +x /usr/bin/update
wget -O /usr/bin/xp "${VPN-EXECUTIVE}xp.sh" >/dev/null 2>&1
chmod +x /usr/bin/xp
wget -O /usr/bin/pwroot "${VPN-EXECUTIVE}pwroot.sh" >/dev/null 2>&1
chmod +x /usr/bin/pwroot
wget -O /usr/bin/run "${VPN-EXECUTIVE}run.sh" >/dev/null 2>&1
chmod +x /usr/bin/run
wget -O /usr/bin/clear-log "${VPN-EXECUTIVE}clear-log.sh" >/dev/null 2>&1
chmod +x /usr/bin/clear-log
wget -O /usr/bin/limit-quota "${GITHUB_CMD}limit-quota.sh" >/dev/null 2>&1
chmod +x /usr/bin/limit-quota
#========================================================================
cd
wget -O ins-xray "https://github.com/VPN-EXECUTIVE/VPN-EXECUTIVENEW/raw/main/ins-xray.sh" >/dev/null 2>&1
chmod +x ins-xray && ./ins-xray >/dev/null 2>&1
rm -f /root/ins-xray
uuid=$(cat /proc/sys/kernel/random/uuid)
# xray config
cat <<EOF > /etc/xray/config.json
{
    "log": {
      "access": "/var/log/xray/access.log",
      "error": "/var/log/xray/error.log",
      "loglevel": "warning"
    },
    "inbounds": [
      {
        "listen": "127.0.0.1",
        "port": 10000,
        "protocol": "dokodemo-door",
        "settings": {
          "address": "127.0.0.1"
        },
        "tag": "api"
      },
      {
        "listen": "127.0.0.1",
        "port": "10001",
        "protocol": "vless",
        "settings": {
          "decryption":"none",
          "clients": [
            {
              "id": "${uuid}"
#vless
            }
          ]
        },
        "streamSettings":{
          "network": "ws",
          "wsSettings": {
            "path": "/vless"
          }
        }
      }
    ],
    "outbounds": [
      {
        "protocol": "freedom",
        "settings": {}
      },
      {
        "protocol": "blackhole",
        "settings": {},
        "tag": "blocked"
      }
    ],
    "routing": {
      "rules": [
        {
          "type": "field",
          "ip": [
            "0.0.0.0/8",
            "10.0.0.0/8",
            "100.64.0.0/10",
            "169.254.0.0/16",
            "172.16.0.0/12",
            "192.0.0.0/24",
            "192.0.2.0/24",
            "192.168.0.0/16",
            "198.18.0.0/15",
            "198.51.100.0/24",
            "203.0.113.0/24",
            "::1/128",
            "fc00::/7",
            "fe80::/10"
          ],
          "outboundTag": "blocked"
        },
        {
          "inboundTag": [
            "api"
          ],
          "outboundTag": "api",
          "type": "field"
        },
        {
          "type": "field",
          "outboundTag": "blocked",
          "protocol": [
            "bittorrent"
          ]
        }
      ]
    },
    "stats": {},
    "api": {
      "services": [
        "StatsService"
      ],
      "tag": "api"
    },
    "policy": {
      "levels": {
        "0": {
          "statsUserDownlink": true,
          "statsUserUplink": true
        }
      },
      "system": {
        "statsInboundUplink": true,
        "statsInboundDownlink": true,
        "statsOutboundUplink" : true,
        "statsOutboundDownlink" : true
      }
   }
}
EOF

cat <<EOF > /etc/xray/vmess.json
{
    "log": {
      "access": "/var/log/xray/access.log",
      "error": "/var/log/xray/error.log",
      "loglevel": "warning"
    },
    "inbounds": [
      {
        "listen": "127.0.0.1",
        "port": 10000,
        "protocol": "dokodemo-door",
        "settings": {
          "address": "127.0.0.1"
        },
        "tag": "api"
      },
      {
        "listen": "127.0.0.1",
        "port": "10002",
        "protocol": "vmess",
        "settings": {
          "clients": [
            {
              "id": "${uuid}",
              "alterId": 0
#vmess
            }
          ]
        },
        "streamSettings":{
          "network": "ws",
          "wsSettings": {
            "path": "/vmess"
          }
        }
      }
    ],
    "outbounds": [
      {
        "protocol": "freedom",
        "settings": {}
      },
      {
        "protocol": "blackhole",
        "settings": {},
        "tag": "blocked"
      }
    ],
    "routing": {
      "rules": [
        {
          "type": "field",
          "ip": [
            "0.0.0.0/8",
            "10.0.0.0/8",
            "100.64.0.0/10",
            "169.254.0.0/16",
            "172.16.0.0/12",
            "192.0.0.0/24",
            "192.0.2.0/24",
            "192.168.0.0/16",
            "198.18.0.0/15",
            "198.51.100.0/24",
            "203.0.113.0/24",
            "::1/128",
            "fc00::/7",
            "fe80::/10"
          ],
          "outboundTag": "blocked"
        },
        {
          "inboundTag": [
            "api"
          ],
          "outboundTag": "api",
          "type": "field"
        },
        {
          "type": "field",
          "outboundTag": "blocked",
          "protocol": [
            "bittorrent"
          ]
        }
      ]
    },
    "stats": {},
    "api": {
      "services": [
        "StatsService"
      ],
      "tag": "api"
    },
    "policy": {
      "levels": {
        "0": {
          "statsUserDownlink": true,
          "statsUserUplink": true
        }
      },
      "system": {
        "statsInboundUplink": true,
        "statsInboundDownlink": true,
        "statsOutboundUplink" : true,
        "statsOutboundDownlink" : true
      }
   }
}
EOF

cat <<EOF > /etc/xray/trojan-ws.json
{
    "log": {
      "access": "/var/log/xray/access.log",
      "error": "/var/log/xray/error.log",
      "loglevel": "warning"
    },
    "inbounds": [
      {
        "listen": "127.0.0.1",
        "port": 10000,
        "protocol": "dokodemo-door",
        "settings": {
          "address": "127.0.0.1"
        },
        "tag": "api"
      },
      {
        "listen": "127.0.0.1",
        "port": "10003",
        "protocol": "trojan",
        "settings": {
          "decryption":"none",
          "clients": [
            {
              "password": "${uuid}"
#trojanws
            }
          ],
          "udp": true
        },
        "streamSettings":{
          "network": "ws",
          "wsSettings": {
            "path": "/trojan-ws"
          }
        }
      }
    ],
    "outbounds": [
      {
        "protocol": "freedom",
        "settings": {}
      },
      {
        "protocol": "blackhole",
        "settings": {},
        "tag": "blocked"
      }
    ],
    "routing": {
      "rules": [
        {
          "type": "field",
          "ip": [
            "0.0.0.0/8",
            "10.0.0.0/8",
            "100.64.0.0/10",
            "169.254.0.0/16",
            "172.16.0.0/12",
            "192.0.0.0/24",
            "192.0.2.0/24",
            "192.168.0.0/16",
            "198.18.0.0/15",
            "198.51.100.0/24",
            "203.0.113.0/24",
            "::1/128",
            "fc00::/7",
            "fe80::/10"
          ],
          "outboundTag": "blocked"
        },
        {
          "inboundTag": [
            "api"
          ],
          "outboundTag": "api",
          "type": "field"
        },
        {
          "type": "field",
          "outboundTag": "blocked",
          "protocol": [
            "bittorrent"
          ]
        }
      ]
    },
    "stats": {},
    "api": {
      "services": [
        "StatsService"
      ],
      "tag": "api"
    },
    "policy": {
      "levels": {
        "0": {
          "statsUserDownlink": true,
          "statsUserUplink": true
        }
      },
      "system": {
        "statsInboundUplink": true,
        "statsInboundDownlink": true,
        "statsOutboundUplink" : true,
        "statsOutboundDownlink" : true
      }
   }
}

EOF

cat <<EOF > /etc/xray/ss-ws.json
{
    "log": {
      "access": "/var/log/xray/access.log",
      "error": "/var/log/xray/error.log",
      "loglevel": "warning"
    },
    "inbounds": [
      {
        "listen": "127.0.0.1",
        "port": 10000,
        "protocol": "dokodemo-door",
        "settings": {
          "address": "127.0.0.1"
        },
        "tag": "api"
      },
      {
        "listen": "127.0.0.1",
        "port": "10004",
        "protocol": "shadowsocks",
        "settings": {
          "clients": [
            {
              "method": "aes-128-gcm",
              "password": "${uuid}"
#ssws
            }
          ],
          "network": "tcp,udp"
        },
        "streamSettings":{
          "network": "ws",
          "wsSettings": {
            "path": "/ss-ws"
          }
        }
      }
    ],
    "outbounds": [
      {
        "protocol": "freedom",
        "settings": {}
      },
      {
        "protocol": "blackhole",
        "settings": {},
        "tag": "blocked"
      }
    ],
    "routing": {
      "rules": [
        {
          "type": "field",
          "ip": [
            "0.0.0.0/8",
            "10.0.0.0/8",
            "100.64.0.0/10",
            "169.254.0.0/16",
            "172.16.0.0/12",
            "192.0.0.0/24",
            "192.0.2.0/24",
            "192.168.0.0/16",
            "198.18.0.0/15",
            "198.51.100.0/24",
            "203.0.113.0/24",
            "::1/128",
            "fc00::/7",
            "fe80::/10"
          ],
          "outboundTag": "blocked"
        },
        {
          "inboundTag": [
            "api"
          ],
          "outboundTag": "api",
          "type": "field"
        },
        {
          "type": "field",
          "outboundTag": "blocked",
          "protocol": [
            "bittorrent"
          ]
        }
      ]
    },
    "stats": {},
    "api": {
      "services": [
        "StatsService"
      ],
      "tag": "api"
    },
    "policy": {
      "levels": {
        "0": {
          "statsUserDownlink": true,
          "statsUserUplink": true
        }
      },
      "system": {
        "statsInboundUplink": true,
        "statsInboundDownlink": true,
        "statsOutboundUplink" : true,
        "statsOutboundDownlink" : true
      }
   }
}
EOF

cat <<EOF > /etc/xray/vless-grpc.json
{
    "log": {
      "access": "/var/log/xray/access.log",
      "error": "/var/log/xray/error.log",
      "loglevel": "warning"
    },
    "inbounds": [
      {
        "listen": "127.0.0.1",
        "port": 10000,
        "protocol": "dokodemo-door",
        "settings": {
          "address": "127.0.0.1"
        },
        "tag": "api"
      },
      {
        "listen": "127.0.0.1",
        "port": "10005",
        "protocol": "vless",
        "settings": {
          "decryption":"none",
          "clients": [
            {
              "id": "${uuid}"
#vlessgrpc
            }
          ]
        },
        "streamSettings":{
          "network": "grpc",
          "grpcSettings": {
            "serviceName": "vless-grpc"
          }
        }
      }
    ],
    "outbounds": [
      {
        "protocol": "freedom",
        "settings": {}
      },
      {
        "protocol": "blackhole",
        "settings": {},
        "tag": "blocked"
      }
    ],
    "routing": {
      "rules": [
        {
          "type": "field",
          "ip": [
            "0.0.0.0/8",
            "10.0.0.0/8",
            "100.64.0.0/10",
            "169.254.0.0/16",
            "172.16.0.0/12",
            "192.0.0.0/24",
            "192.0.2.0/24",
            "192.168.0.0/16",
            "198.18.0.0/15",
            "198.51.100.0/24",
            "203.0.113.0/24",
            "::1/128",
            "fc00::/7",
            "fe80::/10"
          ],
          "outboundTag": "blocked"
        },
        {
          "inboundTag": [
            "api"
          ],
          "outboundTag": "api",
          "type": "field"
        },
        {
          "type": "field",
          "outboundTag": "blocked",
          "protocol": [
            "bittorrent"
          ]
        }
      ]
    },
    "stats": {},
    "api": {
      "services": [
        "StatsService"
      ],
      "tag": "api"
    },
    "policy": {
      "levels": {
        "0": {
          "statsUserDownlink": true,
          "statsUserUplink": true
        }
      },
      "system": {
        "statsInboundUplink": true,
        "statsInboundDownlink": true,
        "statsOutboundUplink" : true,
        "statsOutboundDownlink" : true
      }
   }
}
EOF

cat <<EOF > /etc/xray/vmess-grpc.json
{
    "log": {
      "access": "/var/log/xray/access.log",
      "error": "/var/log/xray/error.log",
      "loglevel": "warning"
    },
    "inbounds": [
      {
        "listen": "127.0.0.1",
        "port": 10000,
        "protocol": "dokodemo-door",
        "settings": {
          "address": "127.0.0.1"
        },
        "tag": "api"
      },
      {
        "listen": "127.0.0.1",
        "port": "10006",
        "protocol": "vmess",
        "settings": {
          "clients": [
            {
              "id": "${uuid}",
              "alterId": 0
#vmessgrpc
            }
          ]
        },
        "streamSettings":{
          "network": "grpc",
          "grpcSettings": {
            "serviceName": "vmess-grpc"
          }
        }
      }
    ],
    "outbounds": [
      {
        "protocol": "freedom",
        "settings": {}
      },
      {
        "protocol": "blackhole",
        "settings": {},
        "tag": "blocked"
      }
    ],
    "routing": {
      "rules": [
        {
          "type": "field",
          "ip": [
            "0.0.0.0/8",
            "10.0.0.0/8",
            "100.64.0.0/10",
            "169.254.0.0/16",
            "172.16.0.0/12",
            "192.0.0.0/24",
            "192.0.2.0/24",
            "192.168.0.0/16",
            "198.18.0.0/15",
            "198.51.100.0/24",
            "203.0.113.0/24",
            "::1/128",
            "fc00::/7",
            "fe80::/10"
          ],
          "outboundTag": "blocked"
        },
        {
          "inboundTag": [
            "api"
          ],
          "outboundTag": "api",
          "type": "field"
        },
        {
          "type": "field",
          "outboundTag": "blocked",
          "protocol": [
            "bittorrent"
          ]
        }
      ]
    },
    "stats": {},
    "api": {
      "services": [
        "StatsService"
      ],
      "tag": "api"
    },
    "policy": {
      "levels": {
        "0": {
          "statsUserDownlink": true,
          "statsUserUplink": true
        }
      },
      "system": {
        "statsInboundUplink": true,
        "statsInboundDownlink": true,
        "statsOutboundUplink" : true,
        "statsOutboundDownlink" : true
      }
   }
}
EOF

cat <<EOF > /etc/xray/trojan-grpc.json
{
    "log": {
      "access": "/var/log/xray/access.log",
      "error": "/var/log/xray/error.log",
      "loglevel": "warning"
    },
    "inbounds": [
      {
        "listen": "127.0.0.1",
        "port": 10000,
        "protocol": "dokodemo-door",
        "settings": {
          "address": "127.0.0.1"
        },
        "tag": "api"
      },
      {
        "listen": "127.0.0.1",
        "port": "10007",
        "protocol": "trojan",
        "settings": {
          "decryption":"none",
          "clients": [
            {
              "password": "${uuid}"
#trojangrpc
            }
          ]
        },
        "streamSettings":{
          "network": "grpc",
          "grpcSettings": {
            "serviceName": "trojan-grpc"
          }
        }
      }
    ],
    "outbounds": [
      {
        "protocol": "freedom",
        "settings": {}
      },
      {
        "protocol": "blackhole",
        "settings": {},
        "tag": "blocked"
      }
    ],
    "routing": {
      "rules": [
        {
          "type": "field",
          "ip": [
            "0.0.0.0/8",
            "10.0.0.0/8",
            "100.64.0.0/10",
            "169.254.0.0/16",
            "172.16.0.0/12",
            "192.0.0.0/24",
            "192.0.2.0/24",
            "192.168.0.0/16",
            "198.18.0.0/15",
            "198.51.100.0/24",
            "203.0.113.0/24",
            "::1/128",
            "fc00::/7",
            "fe80::/10"
          ],
          "outboundTag": "blocked"
        },
        {
          "inboundTag": [
            "api"
          ],
          "outboundTag": "api",
          "type": "field"
        },
        {
          "type": "field",
          "outboundTag": "blocked",
          "protocol": [
            "bittorrent"
          ]
        }
      ]
    },
    "stats": {},
    "api": {
      "services": [
        "StatsService"
      ],
      "tag": "api"
    },
    "policy": {
      "levels": {
        "0": {
          "statsUserDownlink": true,
          "statsUserUplink": true
        }
      },
      "system": {
        "statsInboundUplink": true,
        "statsInboundDownlink": true,
        "statsOutboundUplink" : true,
        "statsOutboundDownlink" : true
      }
   }
}
EOF

cat <<EOF > /etc/xray/ss-grpc.json
{
    "log": {
      "access": "/var/log/xray/access.log",
      "error": "/var/log/xray/error.log",
      "loglevel": "warning"
    },
    "inbounds": [
      {
        "listen": "127.0.0.1",
        "port": 10000,
        "protocol": "dokodemo-door",
        "settings": {
          "address": "127.0.0.1"
        },
        "tag": "api"
      },
      {
        "listen": "127.0.0.1",
        "port": "10008",
        "protocol": "shadowsocks",
        "settings": {
          "clients": [
            {
              "method": "aes-128-gcm",
              "password": "${uuid}"
#ssgrpc
            }
          ],
          "network": "tcp,udp"
        },
        "streamSettings":{
          "network": "grpc",
          "grpcSettings": {
            "serviceName": "ss-grpc"
          }
        }
      }
    ],
    "outbounds": [
      {
        "protocol": "freedom",
        "settings": {}
      },
      {
        "protocol": "blackhole",
        "settings": {},
        "tag": "blocked"
      }
    ],
    "routing": {
      "rules": [
        {
          "type": "field",
          "ip": [
            "0.0.0.0/8",
            "10.0.0.0/8",
            "100.64.0.0/10",
            "169.254.0.0/16",
            "172.16.0.0/12",
            "192.0.0.0/24",
            "192.0.2.0/24",
            "192.168.0.0/16",
            "198.18.0.0/15",
            "198.51.100.0/24",
            "203.0.113.0/24",
            "::1/128",
            "fc00::/7",
            "fe80::/10"
          ],
          "outboundTag": "blocked"
        },
        {
          "inboundTag": [
            "api"
          ],
          "outboundTag": "api",
          "type": "field"
        },
        {
          "type": "field",
          "outboundTag": "blocked",
          "protocol": [
            "bittorrent"
          ]
        }
      ]
    },
    "stats": {},
    "api": {
      "services": [
        "StatsService"
      ],
      "tag": "api"
    },
    "policy": {
      "levels": {
        "0": {
          "statsUserDownlink": true,
          "statsUserUplink": true
        }
      },
      "system": {
        "statsInboundUplink": true,
        "statsInboundDownlink": true,
        "statsOutboundUplink" : true,
        "statsOutboundDownlink" : true
      }
   }
}
EOF

rm -rf /etc/systemd/system/xray.service.d
rm -rf /etc/systemd/system/xray@.service.d

cat <<EOF> /etc/systemd/system/xray.service
Description=Xray Service
Documentation=https://github.com/xtls
After=network.target nss-lookup.target

[Service]
User=www-data
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/xray run -config /etc/xray/config.json
Restart=on-failure
RestartPreventExitStatus=23
LimitNPROC=10000
LimitNOFILE=1000000

[Install]
WantedBy=multi-user.target

EOF

cat >/etc/systemd/system/xray@.service <<EOF
Description=Xray Service
Documentation=https://github.com/xtls
After=network.target nss-lookup.target

[Service]
User=www-data
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/xray run -config /etc/xray/%i.json
Restart=on-failure
RestartPreventExitStatus=23
LimitNPROC=10000
LimitNOFILE=1000000

[Install]
WantedBy=multi-user.target
EOF

#nginx config
wget -O /etc/nginx/conf.d/xray.conf "${LOSTSERVER}xray.conf" >/dev/null 2>&1

cat >/etc/msmtprc <<EOF
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt

account default
host smtp.gmail.com
port 587
auth on
user lostserver00@gmail.com
password Ahdkaiwhsbskw*#
from lostserver00@gmail.com
logfile ~/.msmtp.log
EOF

iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables -A FORWARD -m string --algo bm --string "/default.ida?" -j DROP
iptables -A FORWARD -m string --algo bm --string ".exe?/c+dir" -j DROP
iptables -A FORWARD -m string --algo bm --string ".exe?/c_tftp" -j DROP
iptables -A FORWARD -m string --algo kmp --string "peer_id" -j DROP
iptables -A FORWARD -m string --algo kmp --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo kmp --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo kmp --string "bittorrent-announce" -j DROP
iptables -A FORWARD -m string --algo kmp --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo kmp --string "find_node" -j DROP
iptables -A FORWARD -m string --algo kmp --string "info_hash" -j DROP
iptables -A FORWARD -m string --algo kmp --string "get_peers" -j DROP
iptables -A FORWARD -m string --algo kmp --string "announce" -j DROP
iptables -A FORWARD -m string --algo kmp --string "announce_peers" -j DROP
iptables-save >/etc/iptables/rules.v4 >/dev/null 2>&1
iptables-save >/etc/iptables.up.rules >/dev/null 2>&1
iptables-restore -t < /etc/iptables.up.rules >/dev/null 2>&1
netfilter-persistent save >/dev/null 2>&1
netfilter-persistent reload >/dev/null 2>&1
#----------------------------------------
domain=$(cat /etc/xray/domain)
sed -i "s/xxx/${domain}/g" /etc/nginx/conf.d/xray.conf
chown -R www-data:www-data /etc/msmtprc
cd /etc/systemd/system
wget -q -O limitvmess.service "${GITHUB_CMD}1" >/dev/null 2>&1
wget -q -O limitvless.service "${GITHUB_CMD}2" >/dev/null 2>&1
wget -q -O limittrojan.service "${GITHUB_CMD}3" >/dev/null 2>&1
wget -q -O limitshadowsocks.service "${GITHUB_CMD}4" >/dev/null 2>&1
chmod +x limitvmess.service
chmod +x limitvless.service
chmod +x limittrojan.service
chmod +x limitshadowsocks.service
cd /etc/xray
wget -q -O limit.vmess "${GITHUB_CMD}vmess.sh" >/dev/null 2>&1
wget -q -O limit.vless "${GITHUB_CMD}vless.sh" >/dev/null 2>&1
wget -q -O limit.trojan "${GITHUB_CMD}trojan.sh" >/dev/null 2>&1
wget -q -O limit.shadowsocks "${GITHUB_CMD}shadowsocks.sh" >/dev/null 2>&1
chmod +x limit.vmess
chmod +x limit.vless
chmod +x limit.trojan
chmod +x limit.shadowsocks
cd
judge "Installing BBR"
wget -N --no-check-certificate https://gitlab.com/akunzpn25/lessssuuuuuuu/-/raw/master/bbr.sh >/dev/null 2>&1
chmod +x bbr.sh && ./bbr.sh >/dev/null 2>&1
judge "Remove Unnecessary Files"
apt -y autoclean >/dev/null 2>&1
apt -y remove --purge unscd >/dev/null 2>&1
apt-get -y --purge remove samba* >/dev/null 2>&1
apt-get -y --purge remove apache2* >/dev/null 2>&1
apt-get -y --purge remove bind9* >/dev/null 2>&1
apt-get -y remove sendmail* >/dev/null 2>&1
apt -y autoremove >/dev/null 2>&1
judge "Restarting All Service"
systemctl daemon-reload
systemctl enable limitvmess >/dev/null 2>&1
systemctl enable limitvless >/dev/null 2>&1
systemctl enable limittrojan >/dev/null 2>&1
systemctl enable limitshadowsocks >/dev/null 2>&1
systemctl start limitvmess >/dev/null 2>&1
systemctl start limitvless >/dev/null 2>&1
systemctl start limittrojan >/dev/null 2>&1
systemctl start limitshadowsocks >/dev/null 2>&1
systemctl restart limitvmess >/dev/null 2>&1
systemctl restart limitvless >/dev/null 2>&1
systemctl restart limittrojan >/dev/null 2>&1
systemctl restart limitshadowsocks >/dev/null 2>&1
systemctl daemon-reload
systemctl enable xray.service >/dev/null 2>&1
systemctl restart xray.service >/dev/null 2>&1
systemctl enable xray@vmess.service >/dev/null 2>&1
systemctl restart xray@vmess.service >/dev/null 2>&1
systemctl enable xray@trojan-ws.service >/dev/null 2>&1
systemctl restart xray@trojan-ws.service >/dev/null 2>&1
systemctl enable xray@ss-ws.service >/dev/null 2>&1
systemctl restart xray@ss-ws.service >/dev/null 2>&1
systemctl enable xray@vless-grpc.service >/dev/null 2>&1
systemctl restart xray@vless-grpc.service >/dev/null 2>&1
systemctl enable xray@vmess-grpc.service >/dev/null 2>&1
systemctl restart xray@vmess-grpc.service >/dev/null 2>&1
systemctl enable xray@trojan-grpc.service >/dev/null 2>&1
systemctl restart xray@trojan-grpc.service >/dev/null 2>&1
systemctl enable xray@ss-grpc.service >/dev/null 2>&1
systemctl restart xray@ss-grpc.service >/dev/null 2>&1
systemctl enable rc-local >/dev/null 2>&1
systemctl restart rc-local >/dev/null 2>&1
systemctl restart cron >/dev/null 2>&1
systemctl restart nginx >/dev/null 2>&1
systemctl restart vnstat >/dev/null 2>&1
cd
clear
echo -e "1.0" > /home/ver
echo "    ┌─────────────────────────────────────────────────────┐"
echo "    │       >>> Service & Port                            │"
echo "    │   - XRAY Vmess TLS          : 443                   │"
echo "    │   - XRAY Vmess GRPC         : 443                   │"
echo "    │   - XRAY Vmess None TLS     : 80                    │"
echo "    │   - XRAY Vless TLS          : 443                   │"
echo "    │   - XRAY Vless GRPC         : 443                   │"
echo "    │   - XRAY Vless None TLS     : 80                    │"
echo "    │   - XRAY Trojan TLS         : 443                   │"
echo "    │   - XRAY Trojan GRPC        : 443                   │"
echo "    │   - XRAY Trojan None TLS    : 80                    │"
echo "    │   - Shadowsocks TLS         : 443                   │"
echo "    │   - Shadowsocks GRPC        : 443                   │"
echo "    │   - Shadowsocks None TLS    : 80                    │"
echo "    │   - Timezone                : Asia/Jakarta (GMT +7) │"
echo "    │   - Autoreboot On           : 05:00 GMT +7          │"
echo "    │                                                     │"
echo "    │   - Auto Delete Expired Account                     │"
echo "    │   - Fully automatic script                          │"
echo "    │   - VPS settings                                    │"
echo "    │   - Admin Control                                   │"
echo "    │   - Restore Data                                    │"
echo "    │   - Full Orders For Various Services                │"
echo "    └─────────────────────────────────────────────────────┘"
secs_to_human "$(($(date +%s) - ${start}))"
echo -ne "         ${YELLOW}Please Reboot Your Vps${FONT} (y/n)? "
read REDDIR
if [ "$REDDIR" == "${REDDIR#[Yy]}" ]; then
    exit 0
else
    rm -f /root/only-xray
    reboot
fi
