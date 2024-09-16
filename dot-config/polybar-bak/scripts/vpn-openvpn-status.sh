#!/bin/bash

vpn_status=$(pgrep -a openvpn$ | head -n 1 | awk '{print $NF }' | cut -d '.' -f 1)
echo $vpn_status

if [[ $vpn_status == "/tmp/vpn_creds" ]]; then
  echo "󰌆 Devops"
elif [[ $vpn_status == "" ]]; then
  echo "plus-prod" 
elif [[ $vpn_status == "" ]]; then
  echo "plus-dev"
  echo "󱚳 Disconnected"
fi
