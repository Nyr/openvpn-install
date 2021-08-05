#!/bin/bash
ip_pool="/etc/openvpn/server/ipp.txt"

while IFS="," read -ra line; do
	name="${line[0]}"
	address="${line[1]}"

	echo "ifconfig-push $address 255.255.0.0" > /etc/openvpn/server/ccd/$name
done <"$ip_pool"
