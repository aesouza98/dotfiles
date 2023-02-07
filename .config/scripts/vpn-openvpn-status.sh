#!/bin/bash
vpn=$(pgrep -a ^openvpn | head -n 1 | awk '{print $NF }' | cut -d '.' -f 1)
if [[ $vpn == "" ]]; then
  vpn='down'
elif [[ $vpn == "/tmp/pritunl/44818575c2317d73" ]]; then
  vpn='aiqfome'
fi

printf " " && (echo -n $vpn)

