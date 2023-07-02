#!/bin/bash
user="$1"
login="$2"
max="$3"
total="$4"
run_var() {
lokasi=/etc/xray/vmess.json
lama=$(cat $lokasi | grep -w $user | sed -n 2p)
baru=$(echo -e "###$lama")
}


run_log() {
waktu=$(date)
echo -e "$waktu\nWarning User: $user Login: $login IP Max: $max IP \n$total \n" >> /etc/xray/limit/vmess/vmess.log
}

run_var
run_log
