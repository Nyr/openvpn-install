#!/bin/bash
# OpenVPN road warrior installer for Debian-based distros

# This script will only work on Debian-based systems. It isn't bulletproof but
# it will probably work if you simply want to setup a VPN on your Debian/Ubuntu
# VPS. It has been designed to be as unobtrusive and universal as possible.

# Last update, May 14, 2013 by Nyr


if [ $USER != 'root' ]; then
	echo "Sorry, you need to run this as root"
	exit
fi


if [ ! -e /dev/net/tun ]; then
    echo "TUN/TAP is not available"
    exit
fi


# Try to get our IP from the system and fallback to the Internet.
# I do this to make the script compatible with NATed servers (lowendspirit.com)
# and to avoid getting an IPv6.
# Sorry for doing this, I didn't want to :(
echo "$(grep address /etc/network/interfaces | grep -v 127.0.0.1  | awk '{print $2}')" | grep -q '.'
if [ ! $? = 0 ]; then
	IP=$(wget -qO- ipv4.icanhazip.com)
else
	IP=$(grep address /etc/network/interfaces | grep -v 127.0.0.1  | awk '{print $2}')
fi

# We will use this later
EXTERNALIP=$(wget -qO- ipv4.icanhazip.com)


if [ -e /etc/openvpn/server.conf ]; then
	while :
	do
	clear
		echo "Looks like OpenVPN is already installed"
		echo "What do you want to do?"
		echo ""
		echo "1) Add a cert for a new user"
		echo "2) Remove OpenVPN"
		echo "3) Exit"
		echo ""
		read -p "Select an option [1-3]:" option
		case $option in
			1) 
			echo ""
			echo "Tell me a name for the client cert"
			echo "Please, use one word only, no special characters"
			read -p "Client name: " -e -i client CLIENT
			cd /etc/openvpn/easy-rsa/2.0/
			source ./vars
			# build-key for the client
			export KEY_CN="$CLIENT"
			export EASY_RSA="${EASY_RSA:-.}"
			"$EASY_RSA/pkitool" $CLIENT
			# Let's generate the client config
			mkdir ~/ovpn-$CLIENT
			cp /usr/share/doc/openvpn/examples/sample-config-files/client.conf ~/ovpn-$CLIENT/$CLIENT.conf
			cp /etc/openvpn/easy-rsa/2.0/keys/ca.crt ~/ovpn-$CLIENT
			cp /etc/openvpn/easy-rsa/2.0/keys/$CLIENT.crt ~/ovpn-$CLIENT
			cp /etc/openvpn/easy-rsa/2.0/keys/$CLIENT.key ~/ovpn-$CLIENT
			cd ~/ovpn-$CLIENT
			sed -i "s|cert client.crt|cert $CLIENT.crt|" $CLIENT.conf
			sed -i "s|key client.key|key $CLIENT.key|" $CLIENT.conf
			tar -czf ../ovpn-$CLIENT.tar.gz $CLIENT.conf ca.crt $CLIENT.crt $CLIENT.key
			cd ~/
			rm -r ovpn-$CLIENT
			echo ""
			echo "Client $CLIENT added, certs available at ~/ovpn-$CLIENT.tar.gz"
			exit
			;;
			2) 
			apt-get remove --purge -y openvpn openvpn-blacklist
			rm -r /etc/openvpn
			rm -r /usr/share/doc/openvpn
			sed -i '/--dport 53 -j REDIRECT --to-port 1194/d' /etc/rc.local
			sed -i '/iptables -t nat -A POSTROUTING -s 10.8.0.0/d' /etc/rc.local
			echo ""
			echo "OpenVPN removed!"
			exit
			;;
			3) exit;;
		esac
	done
else
	echo 'Welcome to this quick OpenVPN "road warrior" installer'
	echo ""
	# OpenVPN setup and first user creation
	echo "I need to ask you a few questions before starting the setup"
	echo "You can leave the default options and just press enter if you are ok with them"
	echo ""
	echo "First I need to know the IPv4 address of the network interface you want OpenVPN"
	echo "listening to."
	read -p "IP address: " -e -i $IP IP
	echo ""
	echo "What port do you want for OpenVPN?"
	read -p "Port: " -e -i 1194 PORT
	echo ""
	echo "Do you want OpenVPN to be available at port 53 too?"
	echo "This can be useful to connect under restrictive networks"
	read -p "Listen at port 53 [y/n]:" -e -i n ALTPORT
	echo ""
	echo "Finally, tell me your name for the client cert"
	echo "Please, use one word only, no special characters"
	read -p "Client name: " -e -i client CLIENT
	echo ""
	echo "Okay, that was all I needed. We are ready to setup your OpenVPN server now"
	read -n1 -r -p "Press any key to continue..."
	apt-get update
	apt-get install openvpn iptables openssl -y
	cp -R /usr/share/doc/openvpn/examples/easy-rsa/ /etc/openvpn
	cd /etc/openvpn/easy-rsa/2.0/
	# Let's fix one thing first...
	cp -u -p openssl-1.0.0.cnf openssl.cnf
	# Create the PKI
	. /etc/openvpn/easy-rsa/2.0/vars
	. /etc/openvpn/easy-rsa/2.0/clean-all
	# The following lines are from build-ca. I don't use that script directly
	# because it's interactive and we don't want that. Yes, this could break
	# the installation script if build-ca changes in the future.
	export EASY_RSA="${EASY_RSA:-.}"
	"$EASY_RSA/pkitool" --initca $*
	# Same as the last time, we are going to run build-key-server
	export EASY_RSA="${EASY_RSA:-.}"
	"$EASY_RSA/pkitool" --server server
	# Now the client keys. We need to set KEY_CN or the stupid pkitool will cry
	export KEY_CN="$CLIENT"
	export EASY_RSA="${EASY_RSA:-.}"
	"$EASY_RSA/pkitool" $CLIENT
	# DH params
	. /etc/openvpn/easy-rsa/2.0/build-dh
	# Let's configure the server
	cd /usr/share/doc/openvpn/examples/sample-config-files
	gunzip -d server.conf.gz
	cp server.conf /etc/openvpn/
	cd /etc/openvpn/easy-rsa/2.0/keys
	cp ca.crt ca.key dh1024.pem server.crt server.key /etc/openvpn
	cd /etc/openvpn/
	# Set the server configuration
	sed -i 's|;push "redirect-gateway def1 bypass-dhcp"|push "redirect-gateway def1 bypass-dhcp"|' server.conf
	sed -i 's|;push "dhcp-option DNS 208.67.222.222"|push "dhcp-option DNS 129.250.35.250"|' server.conf
	sed -i 's|;push "dhcp-option DNS 208.67.220.220"|push "dhcp-option DNS 74.82.42.42"|' server.conf
	sed -i "s|port 1194|port $PORT|" server.conf
	# Listen at port 53 too if user wants that
	if [ $ALTPORT = 'y' ]; then
		iptables -t nat -A PREROUTING -p udp -d $IP --dport 53 -j REDIRECT --to-port 1194
		echo "iptables -t nat -A PREROUTING -p udp -d $IP --dport 53 -j REDIRECT --to-port 1194" >> /etc/rc.local
	fi
	# Enable net.ipv4.ip_forward for the system
	sed -i 's|#net.ipv4.ip_forward=1|net.ipv4.ip_forward=1|' /etc/sysctl.conf
	# Avoid an unneeded reboot
	echo 1 > /proc/sys/net/ipv4/ip_forward
	# Set iptables
	iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -j SNAT --to $IP
	echo "iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -j SNAT --to $IP" >> /etc/rc.local
	# And finally, restart OpenVPN
	/etc/init.d/openvpn restart
	# Let's generate the client config
	mkdir ~/ovpn-$CLIENT
	# IP/port set on the default client.conf so we can add further users
	# without asking for them
	sed -i "s|remote my-server-1 1194|remote $IP $PORT|" /usr/share/doc/openvpn/examples/sample-config-files/client.conf
	cp /usr/share/doc/openvpn/examples/sample-config-files/client.conf ~/ovpn-$CLIENT/$CLIENT.conf
	cp /etc/openvpn/easy-rsa/2.0/keys/ca.crt ~/ovpn-$CLIENT
	cp /etc/openvpn/easy-rsa/2.0/keys/$CLIENT.crt ~/ovpn-$CLIENT
	cp /etc/openvpn/easy-rsa/2.0/keys/$CLIENT.key ~/ovpn-$CLIENT
	cd ~/ovpn-$CLIENT
	sed -i "s|cert client.crt|cert $CLIENT.crt|" $CLIENT.conf
	sed -i "s|key client.key|key $CLIENT.key|" $CLIENT.conf
	tar -czf ../ovpn-$CLIENT.tar.gz $CLIENT.conf ca.crt $CLIENT.crt $CLIENT.key
	cd ~/
	rm -r ovpn-$CLIENT
	echo ""
	echo "Finished!"
	echo ""
	echo "Your client config is available at ~/ovpn-$CLIENT.tar.gz"
	echo "If you want to add more clients, you simply need to run this script another time!"
	# Try to detect a NATed connection and show a warning to potential
	# LowEndSpirit users
	if [ "$IP" != "$EXTERNALIP" ]; then
		echo ""
		echo "If you are running this on a LowEndSpirit VPS, please take a minute to read:"
		echo "http://cl.ly/OuSW"
	fi
fi
