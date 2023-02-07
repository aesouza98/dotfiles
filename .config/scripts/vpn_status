#!/bin/bash
vpn=$(pgrep -a ^openvpn | head -n 1 | awk '{print $NF }' | cut -d '.' -f 1)
if [[ $vpn == "" ]]; then
  vpn='down'
fi

printf " " && (echo -n $vpn)

