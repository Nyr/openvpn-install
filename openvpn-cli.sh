#!/bin/bash
#
# https://github.com/davift/openvpn-install
# firked from https://github.com/Nyr/openvpn-install
#
# Released under the same MIT License.

if [[ ! -e /etc/openvpn/server/server.conf ]]; then
	echo 'OpenVPN server is not installed yet.'
	echo 'Run the following command first:'
	echo
	echo '   ./openvpn-install.sh'
	echo
	exit
fi

# Detect Debian users running the script with "sh" instead of bash
if readlink /proc/$$/exe | grep -q "dash"; then
	echo 'This installer needs to be run with "bash", not "sh".'
	exit
fi

# Discard stdin. Needed when running from an one-liner which includes a newline
read -N 999999 -t 0.001

# Detect environments where $PATH does not include the sbin directories
if ! grep -q sbin <<< "$PATH"; then
	echo '$PATH does not include sbin. Try using "su -" instead of "su".'
	exit
fi

if [[ "$EUID" -ne 0 ]]; then
	echo "This installer needs to be run with superuser privileges."
	exit
fi

option=$1
unsanitized_client=$2
	client=$(sed 's/[^0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_@-\.]/_/g' <<< "$unsanitized_client")
	if [[ -z "$option" || ( "$option" != "add" && "$option" != "revoke" ) ]]; then
		echo 'Invalid option.'
	elif [[ -z "$client" ]]; then
		echo 'The client name cannto be empty.'
		exit 1
	fi

case "$option" in
	add)
		if [[ -e /etc/openvpn/server/easy-rsa/pki/issued/"$client".crt || -e /etc/openvpn/server/easy-rsa/pki/private/"$client".key ]]; then
			echo 'The client already exist.'
			exit 1
		fi

		# Adding
		cd /etc/openvpn/server/easy-rsa/
		if ./easyrsa --batch --days=3650 build-client-full "$client" nopass &>/dev/null; then
			{
				cat /etc/openvpn/server/client-common.txt
				echo "<ca>"
				cat /etc/openvpn/server/easy-rsa/pki/ca.crt
				echo "</ca>"
				echo "<cert>"
				sed -ne '/BEGIN CERTIFICATE/,$ p' /etc/openvpn/server/easy-rsa/pki/issued/"$client".crt
				echo "</cert>"
				echo "<key>"
				cat /etc/openvpn/server/easy-rsa/pki/private/"$client".key
				echo "</key>"
				echo "<tls-crypt>"
				sed -ne '/BEGIN OpenVPN Static key/,$ p' /etc/openvpn/server/tc.key
				echo "</tls-crypt>"
			} > /root/"$client".ovpn
			echo "Client's configuration:" /root/"$client.ovpn"

			# Regular expression for a basic email validation
			regex="^[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]{1,2}+\.[a-zA-Z]{2,10}$"
			if [[ $client =~ $regex ]]; then
        		boundaystring=($(md5sum /root/$client.ovpn))
				{
					echo "From: davift-canada@gmail.com"
					echo "To: $client"
					echo "Subject: OpenVPN Client Configuration"
					echo "MIME-Version: 1.0"
					echo "Content-Type: multipart/mixed; boundary=\"$boundaystring\""
					echo ""
					echo "--$boundaystring"
					echo "Content-Type: text/plain; charset=\"UTF-8\""
					echo "Content-Transfer-Encoding: 7bit"
					echo ""
					echo "Please find attached your OpenVPN client configuration."
					echo ""
					echo "--$boundaystring"
					echo "Content-Type: application/octet-stream; name=\"$client.ovpn\""
					echo "Content-Transfer-Encoding: base64"
					echo "Content-Disposition: attachment; filename=\"$client.ovpn\""
					echo ""
					cat /root/$client.ovpn | base64
					echo "--$boundaystring--"
					echo ""
				} > /root/"$client".email
				if [[ ! $(which msmtp) ]]; then
          			echo 'Email NOT sent! MSMTP was not found.'
				elif msmtp -a default $client < /root/$client.email; then
					echo 'Configuration send via email.'
        		else
					echo 'Email NOT sent! MSMTP failed.'
				fi
			fi
		else
			echo 'Certificate conflict.'
			exit 1
		fi
	;;
	revoke)
		if [[ ! -e /etc/openvpn/server/easy-rsa/pki/issued/"$client".crt ]]; then
			echo 'The client does not exist.'
			exit 1
		fi
		if ! tail -n +2 /etc/openvpn/server/easy-rsa/pki/index.txt | grep "^V" | cut -d '=' -f 2 | grep -q "$client"; then
			echo 'The client does not exist.'
			exit 1
		fi

		# Revoking
		cd /etc/openvpn/server/easy-rsa/
		rm pki/reqs/$client.req
		./easyrsa --batch revoke "$client" &>/dev/null
		./easyrsa --batch --days=3650 gen-crl &>/dev/null
		cat /etc/openvpn/server/easy-rsa/pki/crl.pem > /etc/openvpn/server/crl.pem
		exit
	;;
	*)
		echo 'See examples:'
		echo ''
		echo '   ./openvpn-cli.sh add username                 add a new client'
		echo '   ./openvpn-cli.sh revoke username              revoke a client'
		echo '   ./openvpn-cli.sh add username@domain.com      add a new client and send the configuration via email'
		echo '   ./openvpn-cli.sh revoke username@domain.com   revoke client and send the configuration via email'
		echo ''
		exit
	;;
esac
