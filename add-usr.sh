#!/bin/bash


new_client () {
# Generates the custom client.ovpn
{
NEW_CLIENT=$1
cat /etc/openvpn/server/client-common.txt
        echo "<ca>"
        cat /etc/openvpn/server/easy-rsa/pki/ca.crt
        echo "</ca>"
        echo "<cert>"
        sed -ne '/BEGIN CERTIFICATE/,$ p' /etc/openvpn/server/easy-rsa/pki/issued/$NEW_CLIENT.crt
        echo "</cert>"
        echo "<key>"
        cat /etc/openvpn/server/easy-rsa/pki/private/$NEW_CLIENT.key
        echo "</key>"
        echo "<tls-crypt>"
        sed -ne '/BEGIN OpenVPN Static key/,$ p' /etc/openvpn/server/tc.key
        echo "</tls-crypt>"
    } > /etc/openvpn/client/$NEW_CLIENT.ovpn
}


for NEW_USER in "$@"
do
echo "New client certification generation for: " $NEW_USER
bash /etc/openvpn/server/easy-rsa/easyrsa build-client-full $NEW_USER nopass

new_client $NEW_USER

done


