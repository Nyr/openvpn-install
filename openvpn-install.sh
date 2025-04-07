#!/bin/bash

# Improved OpenVPN installation script for Debian, Ubuntu, Fedora, CentOS, and Arch Linux

set -e

# Ensure script is run as root
if [[ "$(id -u)" -ne 0 ]]; then
  echo "This script must be run as root" >&2
  exit 1
fi

# Check for TUN device
if [[ ! -e /dev/net/tun ]]; then
  echo "TUN device is not available. TUN must be enabled before running this script." >&2
  exit 1
fi

# Detect OS
source /etc/os-release
OS_ID=$ID
OS_VERSION_ID=$VERSION_ID

# Determine package manager and install dependencies
case $OS_ID in
  ubuntu|debian)
    apt-get update
    apt-get install -y openvpn iptables openssl ca-certificates tar wget curl gnupg
    ;;
  fedora)
    dnf install -y openvpn iptables openssl ca-certificates tar wget curl gnupg
    ;;
  centos)
    yum install -y epel-release
    yum install -y openvpn iptables openssl ca-certificates tar wget curl gnupg
    ;;
  arch)
    pacman -Sy --noconfirm openvpn iptables openssl ca-certificates tar wget curl gnupg
    ;;
  *)
    echo "Unsupported operating system: $OS_ID" >&2
    exit 1
    ;;
esac

# Create OpenVPN directory
mkdir -p /etc/openvpn/easy-rsa
cd /etc/openvpn/easy-rsa

git clone https://github.com/OpenVPN/easy-rsa.git ./ --depth=1
cd /etc/openvpn/easy-rsa/easyrsa3

# Initialize the PKI and build CA
./easyrsa init-pki
EASYRSA_BATCH=1 ./easyrsa build-ca nopass

# Generate server certificate and key
EASYRSA_BATCH=1 ./easyrsa gen-req server nopass
EASYRSA_BATCH=1 ./easyrsa sign-req server server

# Generate Diffie-Hellman parameters
./easyrsa gen-dh

# Generate client certificate
EASYRSA_BATCH=1 ./easyrsa gen-req client nopass
EASYRSA_BATCH=1 ./easyrsa sign-req client client

# Copy certificates and keys to OpenVPN directory
cp pki/ca.crt pki/dh.pem pki/issued/server.crt pki/private/server.key /etc/openvpn

# Server configuration
cat > /etc/openvpn/server.conf <<EOF
port 1194
proto udp
dev tun
ca ca.crt
cert server.crt
key server.key
dh dh.pem
server 10.8.0.0 255.255.255.0
ifconfig-pool-persist ipp.txt
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS 8.8.8.8"
push "dhcp-option DNS 8.8.4.4"
keepalive 10 120
cipher AES-256-CBC
persist-key
persist-tun
status openvpn-status.log
verb 3
EOF

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward
sed -i 's/^#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/' /etc/sysctl.conf
sysctl -p

# Configure firewall
iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o eth0 -j MASQUERADE

# Enable and start OpenVPN
systemctl enable openvpn@server
systemctl start openvpn@server

# Generate client configuration
cat > ~/client.ovpn <<EOF
client
dev tun
proto udp
remote YOUR_SERVER_IP 1194
resolv-retry infinite
nobind
persist-key
persist-tun
remote-cert-tls server
cipher AES-256-CBC
verb 3
<ca>
$(cat /etc/openvpn/easy-rsa/easyrsa3/pki/ca.crt)
</ca>
<cert>
$(cat /etc/openvpn/easy-rsa/easyrsa3/pki/issued/client.crt)
</cert>
<key>
$(cat /etc/openvpn/easy-rsa/easyrsa3/pki/private/client.key)
</key>
EOF

echo "OpenVPN installation and configuration complete. Client config is available at ~/client.ovpn"

