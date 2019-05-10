#!/bin/bash
#
# https://github.com/Nyr/openvpn-install
#
# Copyright (c) 2013 Nyr. Released under the MIT License.


# Detect Debian users running the script with "sh" instead of bash

#https://www.astrill.com/de/vpn-leak-test
#https://de.vpnmentor.com/tools/ipinfo/


## ab zeile bis zeile Ist Nextcloud 
## ab zeile bis zeile Ist Server einstellungen 
maximalserver="5" ##nicht über 10

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------Spracheinstellungen
#Es ist EN und DE Möglich
sprache="DE"

if [ $sprache = "DE" ] 
then


sprachenwahl2="Dieses Skript muss mit bash und nicht mit sh ausgeführt werden"
sprachenwahl3="Entschuldigung, Sie müssen dies als root ausführen"
sprachenwahl4="Das TUN-Gerät ist nicht verfügbar
Sie müssen TUN aktivieren, bevor Sie dieses Skript ausführen"
sprachenwahl5="Sieht aus, als würden Sie dieses Installationsprogramm nicht unter Debian, Ubuntu oder CentOS ausführen"
sprachenwahl6="Sieht aus, als wäre OpenVPN bereits installiert."
sprachenwahl7="Was möchten Sie tun?"
sprachenwahl8="Einen neuen Benutzer hinzufügen"
sprachenwahl9="Einen vorhandenen Benutzer Löschen"
sprachenwahl10="!!Entfernt das ganze OpenVPN!!"
sprachenwahl11="Ausgang"
sprachenwahl12="Wähle eine Option"
sprachenwahl13="Nennen Sie mir einen Namen für das Client-Zertifikat."
sprachenwahl14="Bitte verwenden Sie nur ein Wort, keine Sonderzeichen."
sprachenwahl15="hinzugefügt, Konfiguration ist verfügbar unter:"
sprachenwahl16="Sie haben keine bestehenden Benutzer!"
sprachenwahl17="Wählen Sie das vorhandene Clientzertifikat aus, das Sie löschen möchten:"
sprachenwahl18="Wählen Sie einen Benutzer aus"
sprachenwahl19="Möchten Sie den Zugriff für den Benutzer wirklich Löschen?"
sprachenwahl20="Zertifikat für Benutzer"
sprachenwahl20b="Gelöscht!"
sprachenwahl21="Zertifikatslöschung für Client"
sprachenwahl21b="abgebrochen!"
sprachenwahl23="Möchten Sie OpenVPN wirklich komplett entfernen?"
sprachenwahl24="OpenVPN wurde entfernt!"
sprachenwahl25="Entfernung abgebrochen!"
sprachenwahl26="Willkommen bei diesem OpenVPN-Instalation"
sprachenwahl27="Ich muss Ihnen ein paar Fragen stellen, bevor Sie mit dem Setup beginnen."
sprachenwahl28="Sie können die Standardoptionen beibehalten und einfach die Eingabetaste drücken, wenn Sie mit den Optionen zufrieden sind."
sprachenwahl29="Geben Sie zunächst die IPv4-Adresse der Netzwerkschnittstelle an, für die Sie OpenVPN wünschen"
sprachenwahl30="hören."
sprachenwahl31="Dieser Server steht hinter NAT.*Modem* Wie lautet die öffentliche IPv4-Adresse oder der Hostname?"
sprachenwahl32="Öffentliche IP-Adresse / noip.com / Hostname:"
sprachenwahl33="Welches Protokoll möchten Sie für OpenVPN-Verbindungen?"
sprachenwahl34="Welchen Port soll OpenVPN verwenden?"
sprachenwahl35="Welches DNS möchten Sie mit dem VPN verwenden?"
sprachenwahl36="Das was dieses system hier verwendet"
sprachenwahl37="Teilen Sie mir schließlich Ihren Namen für das Client-Zertifikat mit."
sprachenwahl38="Bitte verwenden Sie nur ein Wort, keine Sonderzeichen."
sprachenwahl39="Okay, das war alles was gebraucht wurde. Sie können jetzt Ihren OpenVPN-Server einrichten."
sprachenwahl40="Drücke eine Taste um Loszulegen ^^ .... --->Enter?"
sprachenwahl41="Fertig!... ^^"
sprachenwahl42="Ihre Client-Konfiguration ist verfügbar unter root/:"
sprachenwahl43="Wenn Sie weitere Clients hinzufügen möchten, müssen Sie dieses Skript einfach erneut ausführen!"
sprachenwahl44="Sie haben Nextcloud die datei wird jetzt dorthin verschoben ! Achten sie darauf das die angaben stimmen !"
sprachenwahl45="Du hast Nichts keine Zahl angegeben!"
sprachenwahl46="Null ist zwar eine Zahl aber die wollen wir nicht ^^ versuchs mit 1 ;)"
sprachenwahl47="ist keine Zahl!"
sprachenwahl48="Zu viele Server!"
sprachenwahl49=""
sprachenwahl50=""
fi


if [ $sprache = "EN" ] 
then


sprachenwahl2="This script needs to be run with bash, not sh"
sprachenwahl3="Sorry, you need to run this as root"
sprachenwahl4="The TUN device is not available
You need to enable TUN before running this script"
sprachenwahl5="Looks like you aren't running this installer on Debian, Ubuntu or CentOS"
sprachenwahl6="Looks like OpenVPN is already installed."
sprachenwahl7="What do you want to do?"
sprachenwahl8="Add a new user"
sprachenwahl9="Revoke an existing user"
sprachenwahl10="Removes the whole OpenVPN"
sprachenwahl11="Exit"
sprachenwahl12="Select an option"
sprachenwahl13="Tell me a name for the client certificate."
sprachenwahl14="Please, use one word only, no special characters."
sprachenwahl15="added, configuration is available at:"
sprachenwahl16="You have no existing clients!"
sprachenwahl17="Select the existing client certificate you want to revoke:"
sprachenwahl18="Select one client"
sprachenwahl19="Do you really want to revoke access for client"
sprachenwahl20="Certificate for client"
sprachenwahl20b="revoked!"
sprachenwahl21="Certificate revocation for client"
sprachenwahl21b="aborted!"
sprachenwahl23="Do you really want to remove OpenVPN?"
sprachenwahl24="OpenVPN removed!"
sprachenwahl25="Removal aborted!"
sprachenwahl26="Welcome to this OpenVPN :road warrior: installer!"
sprachenwahl27="I need to ask you a few questions before starting the setup."
sprachenwahl28="You can leave the default options and just press enter if you are ok with them."
sprachenwahl29="First, provide the IPv4 address of the network interface you want OpenVPN"
sprachenwahl30="listening to."
sprachenwahl31="This server is behind NAT. What is the public IPv4 address or hostname?"
sprachenwahl32="Public IP address / hostname:"
sprachenwahl33="Which protocol do you want for OpenVPN connections?"
sprachenwahl34="What port do you want OpenVPN listening to?"
sprachenwahl35="Which DNS do you want to use with the VPN?"
sprachenwahl36="Current system resolvers"
sprachenwahl37="Finally, tell me your name for the client certificate."
sprachenwahl38="Please, use one word only, no special characters."
sprachenwahl39="Okay, that was all it took. You can now set up your OpenVPN server."
sprachenwahl40="Press any key to continue..."
sprachenwahl41="Finished!"
sprachenwahl42="Your client configuration is available at root/:"
sprachenwahl43="If you want to add more clients, you simply need to run this script again!"
sprachenwahl44="You have Nextcloud the file is now being moved there! Make sure that the information is correct!"
sprachenwahl45="You have given nothing no number!"
sprachenwahl46="NULL is a number, but we do not want that ^^ try with 1 ;)"
sprachenwahl47="is not a number!"
sprachenwahl48="Too many servers!"
sprachenwahl49=""
sprachenwahl50=""
fi
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------Spracheinstellungen ENDE



#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------NextCloud config
# FÜR Nextcloud JA dann muss man die daten angeben NEIN dann sind die daten EGAL
nextcloud="NEIN"
#ab hier!! Wenn JA dann hier der name deines user login bei nextcloud !
nextcloudadmin="Admin"
#Hier wo ist data? standard ist data wo anderst hier ist es auf der untersten ebene!
nextcloudwegzudata="/data/$nextcloudadmin/files"
#WO ist deine Nextcloud webordner? 
verzeichnisnextcloud="/var/www/nextcloud/"
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ENDE NextCloud config








#Befehle für die console "sudo systemctl status openvpn@1server" "sudo systemctl stop openvpn@1server" "sudo systemctl start openvpn@1server"  "sudo systemctl restart openvpn@1server"  
#ACHTUNG ist für das sind die befele ser einzelnen server MAX 5 sind da können aber mehr gemacht werden terminal/console dann: bash multi-openvpn-install.sh zahl für den server

#Servermodell
        #1  #das ist wenn sie immer sowas im terminal machen: bash multi-openvpn-install.sh 1   IST mit Internt TUNNEL VOLLer SCHUTZ!
        #3  #das ist wenn sie immer sowas im terminal machen: bash multi-openvpn-install.sh 2   IST ohne internet und ohne dns soll für server zu server verwendet werden
        #2  #das ist wenn sie immer sowas im terminal machen: bash multi-openvpn-install.sh 3   IST ohne internet und ohne dns soll für server zu server verwendet werden
        #4  #das ist wenn sie immer sowas im terminal machen: bash multi-openvpn-install.sh 4   IST ohne internet und ohne dns soll für server zu server verwendet werden
        #5  #das ist wenn sie immer sowas im terminal machen: bash multi-openvpn-install.sh 5   IST ohne internet und ohne dns soll für server zu server verwendet werden
## Servermodell aus Bash-Übergabeparameter $1, sonst 1 (Standard)
 if [[ "$1" == "" ]]; then
echo "$sprachenwahl45"
exit
fi
 if [[ "$1" == "0" ]]; then
echo "$sprachenwahl46"
exit
fi

    EING=$1
    case $EING in
	'' | *[!0-9]* ) echo -e "$EING $sprachenwahl47" ; exit  ;;
    *)    ;;
    esac
 if [[ "$1" -gt "$maximalserver" ]]; then
echo "$sprachenwahl48 MAX $maximalserver"
exit
fi
servermodell=$1

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------Anfang server config

#Ab hier kann man die einzelnen server bearbeiten die IP´s der subnetzwerke und co
#Falls du noip.com oder dergleichen hast anstelle der IP!
freednsip="noip.com"


# servername=  1server OR 2server OR 3server OR 4server OR 5server OR
servername="${servermodell}server"
# errechnet die dritte Gruppe der IP, also 149.171.???.0
IP_dritte_Gruppe=$(expr 90 + $servermodell)
# server subnetz ip= 149.171.91.0 	OR 149.171.92.0 	OR 149.171.93.0 	OR 149.171.94.0 	OR 149.171.95.0 	OR
serversubnetzip="149.171.$IP_dritte_Gruppe.0"
# errechnet den Standardport anhand des $servermodell
#Ports = 443	OR 1177		OR	1277		OR	1377		OR	1477		OR 
standardporteinstell=$(expr 1077 + \( $servermodell \* 100 \))
# vergibt tun nach $servermodell
# tun = tun1 	OR tun2 	OR tun3 	OR tun4 	OR tun5 	OR
subnetzvlan="tun$servermodell"
# JA OR NEIN  JA bedeutet Gesamter zugriff auf das netzwerk und internet  NEIN bedeutet NUR zugriff auf dem eigenem Subnetzwerk Keine anderen im netzwerk auser sich selbst kein internet !
internet="NEIN"
#DNS anfragen Umgehen ? NEIN = Alles bleibt im Tunnel!  JA=DNS normal wie immer nur ein server der von ausen so nicht erreichbar ist wird erreichbar sein ^^
dnsloch="JA"
#dns server angeben zeigen JA oder NEIN nötig "JA" wenn sie über VPN ins internet wollen können das aber auch nachträglich in /etc/openvpn/ *.conf ändern 
dnsserveranzeigen="NEIN"
#updates werden jedesmal ausgeführt wenn JA "bei Neuinstallation immer JA beim erstenmal!"  wenn sie es gleich hintereinander machen ist es nicht nötig, daher dann auf NEIN stellen ansonsten JA wenn länger nichts gemacht wurde
jedesmalupdate="NEIN"



if [ $servermodell -eq "1" ]; then
standardporteinstell="443"
internet="JA"
dnsloch="NEIN"
dnsserveranzeigen="JA"
jedesmalupdate="JA"
fi

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ENDE config



RCLOCAL="/etc/openvpn/$servername/rc.txt"

if [ $dnsloch = "NEIN" ] ; then
welcherdns="setenv opt block-outside-dns"
fi
if [ $dnsloch = "JA" ] ; then
welcherdns=""
fi




if readlink /proc/$$/exe | grep -q "dash"; then
	echo "$sprachenwahl2"
	exit
fi

if [[ "$EUID" -ne 0 ]]; then
	echo "$sprachenwahl3"
	exit
fi

if [[ ! -e /dev/net/tun ]]; then
	echo "$sprachenwahl4"
	exit
fi

if [[ -e /etc/debian_version ]]; then
	OS=debian
	GROUPNAME=nogroup
	
if [ $internet = "JA" ] 
then
RCLOCAL="/etc/rc.local"
fi

elif [[ -e /etc/centos-release || -e /etc/redhat-release ]]; then
	OS=centos
	GROUPNAME=nobody
	
if [ $internet = "JA" ] 
then
RCLOCAL="/etc/rc.d/rc.local"
fi

else
	echo "$sprachenwahl5"
	exit
fi

newclient () {
	# Generates the custom client.ovpn
	cp /etc/openvpn/$servername/client-common.txt ~/$1.ovpn
	echo "<ca>" >> ~/$1.ovpn
	cat /etc/openvpn/$servername/easy-rsa/pki/ca.crt >> ~/$1.ovpn
	echo "</ca>" >> ~/$1.ovpn
	echo "<cert>" >> ~/$1.ovpn
	sed -ne '/BEGIN CERTIFICATE/,$ p' /etc/openvpn/$servername/easy-rsa/pki/issued/$1.crt >> ~/$1.ovpn
	echo "</cert>" >> ~/$1.ovpn
	echo "<key>" >> ~/$1.ovpn
	cat /etc/openvpn/$servername/easy-rsa/pki/private/$1.key >> ~/$1.ovpn
	echo "</key>" >> ~/$1.ovpn
	echo "<tls-auth>" >> ~/$1.ovpn
	sed -ne '/BEGIN OpenVPN Static key/,$ p' /etc/openvpn/$servername/ta.key >> ~/$1.ovpn
	echo "</tls-auth>" >> ~/$1.ovpn
}

if [[ -e /etc/openvpn/$servername.conf ]]; then
	while :
	do
	clear
		echo "$sprachenwahl6"
		echo
		echo "$sprachenwahl7"
		echo "   1) $sprachenwahl8"
		echo "   2) $sprachenwahl9"
		echo "   3) $sprachenwahl10"
		echo "   4) $sprachenwahl11"
		read -p "$sprachenwahl12 [1-4]: " option
		case $option in
			1) 
			echo
			echo "$sprachenwahl13"
			echo "$sprachenwahl14"
			read -p "Client name: " -e -i $servername-port$standardporteinstell-client- CLIENT
			cd /etc/openvpn/$servername/easy-rsa/
			EASYRSA_CERT_EXPIRE=3650 ./easyrsa build-client-full $CLIENT nopass
			# Generates the custom client.ovpn
			newclient "$CLIENT"
			echo
			echo "Client $CLIENT $sprachenwahl15" ~/"$CLIENT.ovpn"
				if [ $nextcloud = "JA" ] 
	then
	echo "$sprachenwahl44"
	mv /root/$CLIENT.ovpn $nextcloudwegzudata/$CLIENT.ovpn
	chown -R www-data:www-data $nextcloudwegzudata/$CLIENT.ovpn
	cd $verzeichnisnextcloud 
	sudo -u www-data php occ files:scan -- $nextcloudadmin
	fi
			exit
			;;
			2)
			# This option could be documented a bit better and maybe even be simplified
			# ...but what can I say, I want some sleep too
			NUMBEROFCLIENTS=$(tail -n +2 /etc/openvpn/$servername/easy-rsa/pki/index.txt | grep -c "^V")
			if [[ "$NUMBEROFCLIENTS" = '0' ]]; then
				echo
				echo "$sprachenwahl16"
				exit
			fi
			echo
			echo "$sprachenwahl17"
			tail -n +2 /etc/openvpn/$servername/easy-rsa/pki/index.txt | grep "^V" | cut -d '=' -f 2 | nl -s ') '
			if [[ "$NUMBEROFCLIENTS" = '1' ]]; then
				read -p "$sprachenwahl18 [1]: " CLIENTNUMBER
			else
				read -p "$sprachenwahl18 [1-$NUMBEROFCLIENTS]: " CLIENTNUMBER
			fi
			CLIENT=$(tail -n +2 /etc/openvpn/$servername/easy-rsa/pki/index.txt | grep "^V" | cut -d '=' -f 2 | sed -n "$CLIENTNUMBER"p)
			echo
			read -p "$sprachenwahl19 $CLIENT ? [y/N]: " -e REVOKE
			if [[ "$REVOKE" = 'y' || "$REVOKE" = 'Y' ]]; then
				cd /etc/openvpn/$servername/easy-rsa/
				./easyrsa --batch revoke $CLIENT
				EASYRSA_CRL_DAYS=3650 ./easyrsa gen-crl
				rm -f pki/reqs/$CLIENT.req
				rm -f pki/private/$CLIENT.key
				rm -f pki/issued/$CLIENT.crt
				rm -f /etc/openvpn/crl.pem
				cp /etc/openvpn/$servername/easy-rsa/pki/crl.pem /etc/openvpn/$servername/crl.pem
				# CRL is read with each client connection, when OpenVPN is dropped to nobody
				chown nobody:$GROUPNAME /etc/openvpn/$servername/crl.pem
				echo
				echo "$sprachenwahl20 $CLIENT $sprachenwahl20b"
			else
				echo
				echo "$sprachenwahl21 $CLIENT $sprachenwahl21b"
			fi
			exit
			;;
			3) 
			echo
			read -p "$sprachenwahl23 [y/N]: " -e REMOVE
			if [[ "$REMOVE" = 'y' || "$REMOVE" = 'Y' ]]; then
				PORT=$(grep '^port ' /etc/openvpn/$servername.conf | cut -d " " -f 2)
				PROTOCOL=$(grep '^proto ' /etc/openvpn/$servername.conf | cut -d " " -f 2)
				if pgrep firewalld; then
					IP=$(firewall-cmd --direct --get-rules ipv4 nat POSTROUTING | grep '\-s $serversubnetzip/24 '"'"'!'"'"' -d $serversubnetzip/24 -j SNAT --to ' | cut -d " " -f 10)
					# Using both permanent and not permanent rules to avoid a firewalld reload.
					firewall-cmd --zone=public --remove-port=$PORT/$PROTOCOL
					firewall-cmd --zone=trusted --remove-source=$serversubnetzip/24
					firewall-cmd --permanent --zone=public --remove-port=$PORT/$PROTOCOL
					firewall-cmd --permanent --zone=trusted --remove-source=$serversubnetzip/24
					firewall-cmd --direct --remove-rule ipv4 nat POSTROUTING 0 -s $serversubnetzip/24 ! -d $serversubnetzip/24 -j SNAT --to $IP
					firewall-cmd --permanent --direct --remove-rule ipv4 nat POSTROUTING 0 -s $serversubnetzip/24 ! -d $serversubnetzip/24 -j SNAT --to $IP
				else
					IP=$(grep 'iptables -t nat -A POSTROUTING -s $serversubnetzip/24 ! -d $serversubnetzip/24 -j SNAT --to ' $RCLOCAL | cut -d " " -f 14)
					iptables -t nat -D POSTROUTING -s $serversubnetzip/24 ! -d $serversubnetzip/24 -j SNAT --to $IP
					sed -i '/iptables -t nat -A POSTROUTING -s $serversubnetzip\/24 ! -d $serversubnetzip\/24 -j SNAT --to /d' $RCLOCAL
					if iptables -L -n | grep -qE '^ACCEPT'; then
						iptables -D INPUT -p $PROTOCOL --dport $PORT -j ACCEPT
						iptables -D FORWARD -s $serversubnetzip/24 -j ACCEPT
						iptables -D FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
						sed -i "/iptables -I INPUT -p $PROTOCOL --dport $PORT -j ACCEPT/d" $RCLOCAL
						sed -i "/iptables -I FORWARD -s $serversubnetzip\/24 -j ACCEPT/d" $RCLOCAL
						sed -i "/iptables -I FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT/d" $RCLOCAL
					fi
				fi
				if sestatus 2>/dev/null | grep "Current mode" | grep -q "enforcing" && [[ "$PORT" != '$standardporteinstell' ]]; then
					semanage port -d -t openvpn_port_t -p $PROTOCOL $PORT
				fi
				if [[ "$OS" = 'debian' ]]; then
					apt-get remove --purge -y openvpn
				else
					yum remove openvpn -y
				fi
				rm -rf /etc/openvpn
				rm -f /etc/sysctl.d/30-openvpn-forward.conf
				echo
				echo "$sprachenwahl24"
			else
				echo
				echo "$sprachenwahl25"
			fi
			exit
			;;
			4) exit;;
		esac
	done
else
	clear
	echo "$sprachenwahl26"
	echo
	# OpenVPN setup and first user creation
	echo "$sprachenwahl27"
	echo "$sprachenwahl28"
	echo
	echo "$sprachenwahl29"
	echo "$sprachenwahl30"
	# Autodetect IP address and pre-fill for the user
	IP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
	read -p "IP address: " -e -i $IP IP
	# If $IP is a private IP address, the server must be behind NAT
	if echo "$IP" | grep -qE '^(10\.|172\.1[6789]\.|172\.2[0-9]\.|172\.3[01]\.|192\.168)'; then
		echo
		echo "$sprachenwahl31"
		read -p "$sprachenwahl32 " -e -i $freednsip PUBLICIP
	fi
	echo
	echo "$sprachenwahl33"
	echo "   1) UDP (recommended)"
	echo "   2) TCP"
	read -p "Protocol [1-2]: " -e -i 1 PROTOCOL
	case $PROTOCOL in
		1) 
		PROTOCOL=udp
		;;
		2) 
		PROTOCOL=tcp
		;;
	esac
	echo
	echo "$sprachenwahl34"
	read -p "Port: " -e -i $standardporteinstell PORT
	if [ $dnsserveranzeigen = "JA" ] ; then
	echo
	echo "$sprachenwahl35"
	echo "   1) $sprachenwahl36"
	echo "   2) 1.1.1.1"
	echo "   3) Google"
	echo "   4) OpenDNS"
	echo "   5) Verisign"
	read -p "DNS [1-5]: " -e -i 1 DNS
	echo
	fi
	echo "$sprachenwahl37"
	echo "$sprachenwahl38"
	read -p "Client name: " -e -i $servername-port$standardporteinstell-client- CLIENT
	echo
	echo "$sprachenwahl39"
	read -n1 -r -p "$sprachenwahl40"
	
	
if [[ "$OS" = 'debian' ]]; then


if [ $jedesmalupdate = "JA" ]; then
		apt-get update
		apt-get install openvpn iptables openssl ca-certificates -y
fi

	else

if [ $jedesmalupdate = "JA" ]; then
		# Else, the distro is CentOS
		yum install epel-release -y
		yum install openvpn iptables openssl ca-certificates -y
fi


fi
	# Get $servername/easy-rsa
	# so hier bearbeiten wir den namen richtig ^^
	mkdir /etc/openvpn/$servername
if [ $internet = "NEIN" ] 
then
touch /etc/openvpn/$servername/rc.txt
chown -R root:root /etc/openvpn/$servername/rc.txt
fi
	EASYRSAURL='https://github.com/OpenVPN/easy-rsa/releases/download/v3.0.5/EasyRSA-nix-3.0.5.tgz'
	wget -O ~/easyrsa.tgz "$EASYRSAURL" 2>/dev/null || curl -Lo ~/easyrsa.tgz "$EASYRSAURL"
	tar xzf ~/easyrsa.tgz -C ~/
	mv ~/EasyRSA-3.0.5/ /etc/openvpn/
	mv /etc/openvpn/EasyRSA-3.0.5/ /etc/openvpn/$servername/easy-rsa/
	chown -R root:root /etc/openvpn/$servername/easy-rsa/
	rm -f ~/easyrsa.tgz
	cd /etc/openvpn/$servername/easy-rsa/
	# Create the PKI, set up the CA and the server and client certificates
	./easyrsa init-pki
	./easyrsa --batch build-ca nopass
	EASYRSA_CERT_EXPIRE=3650 ./easyrsa build-server-full server nopass
	EASYRSA_CERT_EXPIRE=3650 ./easyrsa build-client-full $CLIENT nopass
	EASYRSA_CRL_DAYS=3650 ./easyrsa gen-crl
	# Move the stuff we need
	cp pki/ca.crt pki/private/ca.key pki/issued/server.crt pki/private/server.key pki/crl.pem /etc/openvpn/$servername
	# CRL is read with each client connection, when OpenVPN is dropped to nobody
	chown nobody:$GROUPNAME /etc/openvpn/$servername/crl.pem
	# Generate key for tls-auth
	openvpn --genkey --secret /etc/openvpn/$servername/ta.key
	# Create the DH parameters file using the predefined ffdhe2048 group
	echo '-----BEGIN DH PARAMETERS-----
MIIBCAKCAQEA//////////+t+FRYortKmq/cViAnPTzx2LnFg84tNpWp4TZBFGQz
+8yTnc4kmz75fS/jY2MMddj2gbICrsRhetPfHtXV/WVhJDP1H18GbtCFY2VVPe0a
87VXE15/V8k1mE8McODmi3fipona8+/och3xWKE2rec1MKzKT0g6eXq8CrGCsyT7
YdEIqUuyyOP7uWrat2DX9GgdT0Kj3jlN9K5W7edjcrsZCwenyO4KbXCeAvzhzffi
7MA0BM0oNC9hkXL+nOmFg/+OTxIy7vKBg8P+OxtMb61zO7X8vC7CIAXFjvGDfRaD
ssbzSibBsu/6iGtCOGEoXJf//////////wIBAg==
-----END DH PARAMETERS-----' > /etc/openvpn/$servername/dh.pem
	# Generate server.conf
	echo "port $PORT
proto $PROTOCOL
dev $subnetzvlan
sndbuf 393216
rcvbuf 393216
ca $servername/ca.crt
cert $servername/server.crt
key $servername/server.key
dh $servername/dh.pem
auth SHA512
tls-auth $servername/ta.key 0
topology subnet
server $serversubnetzip 255.255.255.0
ifconfig-pool-persist $servername/ipp.txt" > /etc/openvpn/$servername.conf

if [ $internet = "JA" ] 
then
	echo 'push "redirect-gateway def1 bypass-dhcp"' >> /etc/openvpn/$servername.conf
	# DNS
		case $DNS in
			1)
			# Locate the proper resolv.conf
			# Needed for systems running systemd-resolved
			if grep -q "127.0.0.53" "/etc/resolv.conf"; then
				RESOLVCONF='/run/systemd/resolve/resolv.conf'
			else
				RESOLVCONF='/etc/resolv.conf'
			fi
			# Obtain the resolvers from resolv.conf and use them for OpenVPN
			grep -v '#' $RESOLVCONF | grep 'nameserver' | grep -E -o '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | while read line; do
				echo "push \"dhcp-option DNS $line\"" >> /etc/openvpn/$servername.conf
			done
			;;
			2)
			echo 'push "dhcp-option DNS 1.1.1.1"' >> /etc/openvpn/$servername.conf
			echo 'push "dhcp-option DNS 1.0.0.1"' >> /etc/openvpn/$servername.conf
			;;
			3)
			echo 'push "dhcp-option DNS 8.8.8.8"' >> /etc/openvpn/$servername.conf
			echo 'push "dhcp-option DNS 8.8.4.4"' >> /etc/openvpn/$servername.conf
			;;
			4)
			echo 'push "dhcp-option DNS 208.67.222.222"' >> /etc/openvpn/$servername.conf
			echo 'push "dhcp-option DNS 208.67.220.220"' >> /etc/openvpn/$servername.conf
			;;
			5)
			echo 'push "dhcp-option DNS 64.6.64.6"' >> /etc/openvpn/$servername.conf
			echo 'push "dhcp-option DNS 64.6.65.6"' >> /etc/openvpn/$servername.conf
			;;
		esac
		fi
	echo "keepalive 10 120
cipher AES-256-CBC
user nobody
group $GROUPNAME
persist-key
persist-tun
status $servername/openvpn-status.log
verb 3
crl-verify $servername/crl.pem" >> /etc/openvpn/$servername.conf
	# Enable net.ipv4.ip_forward for the system
	echo 'net.ipv4.ip_forward=1' > /etc/sysctl.d/30-openvpn-forward.conf
	# Enable without waiting for a reboot or service restart
	echo 1 > /proc/sys/net/ipv4/ip_forward
	if pgrep firewalld; then
		# Using both permanent and not permanent rules to avoid a firewalld
		# reload.
		# We don't use --add-service=openvpn because that would only work with
		# the default port and protocol.
		firewall-cmd --zone=public --add-port=$PORT/$PROTOCOL
		firewall-cmd --zone=trusted --add-source=$serversubnetzip/24
		firewall-cmd --permanent --zone=public --add-port=$PORT/$PROTOCOL
		firewall-cmd --permanent --zone=trusted --add-source=$serversubnetzip/24
		# Set NAT for the VPN subnet
		firewall-cmd --direct --add-rule ipv4 nat POSTROUTING 0 -s $serversubnetzip/24 ! -d $serversubnetzip/24 -j SNAT --to $IP
		firewall-cmd --permanent --direct --add-rule ipv4 nat POSTROUTING 0 -s $serversubnetzip/24 ! -d $serversubnetzip/24 -j SNAT --to $IP
	else
		# Needed to use rc.local with some systemd distros
		if [[ "$OS" = 'debian' && ! -e $RCLOCAL ]]; then
			echo '#!/bin/sh -e
exit 0' > $RCLOCAL
		fi
		chmod +x $RCLOCAL
		# Set NAT for the VPN subnet
		iptables -t nat -A POSTROUTING -s $serversubnetzip/24 ! -d $serversubnetzip/24 -j SNAT --to $IP
		sed -i "1 a\iptables -t nat -A POSTROUTING -s $serversubnetzip/24 ! -d $serversubnetzip/24 -j SNAT --to $IP" $RCLOCAL
		if iptables -L -n | grep -qE '^(REJECT|DROP)'; then
			# If iptables has at least one REJECT rule, we asume this is needed.
			# Not the best approach but I can't think of other and this shouldn't
			# cause problems.
			iptables -I INPUT -p $PROTOCOL --dport $PORT -j ACCEPT
			iptables -I FORWARD -s $serversubnetzip/24 -j ACCEPT
			iptables -I FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
			sed -i "1 a\iptables -I INPUT -p $PROTOCOL --dport $PORT -j ACCEPT" $RCLOCAL
			sed -i "1 a\iptables -I FORWARD -s $serversubnetzip/24 -j ACCEPT" $RCLOCAL
			sed -i "1 a\iptables -I FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT" $RCLOCAL
		fi
	fi
	# If SELinux is enabled and a custom port was selected, we need this
	if sestatus 2>/dev/null | grep "Current mode" | grep -q "enforcing" && [[ "$PORT" != '$standardporteinstell' ]]; then
		# Install semanage if not already present
		if ! hash semanage 2>/dev/null; then
			yum install policycoreutils-python -y
		fi
		semanage port -a -t openvpn_port_t -p $PROTOCOL $PORT
	fi
	# And finally, restart OpenVPN
	if [[ "$OS" = 'debian' ]]; then
		# Little hack to check for systemd
		if pgrep systemd-journal; then
			systemctl restart openvpn@$servername.service
		else
			/etc/init.d/openvpn restart
		fi
	else
		if pgrep systemd-journal; then
			systemctl restart openvpn@$servername.service
			systemctl enable openvpn@$servername.service
		else
			service openvpn restart
			chkconfig openvpn on
		fi
	fi
	# If the server is behind a NAT, use the correct IP address
	if [[ "$PUBLICIP" != "" ]]; then
		IP=$PUBLICIP
	fi
	# client-common.txt is created so we have a template to add further users later
	echo "client
dev $subnetzvlan
proto $PROTOCOL
sndbuf 393216
rcvbuf 393216
remote $IP $PORT
resolv-retry infinite
nobind
persist-key
persist-tun
remote-cert-tls server
auth SHA512
cipher AES-256-CBC
$welcherdns
key-direction 1
verb 3" > /etc/openvpn/$servername/client-common.txt
	# Generates the custom client.ovpn
	newclient "$CLIENT"
	echo
	echo "$sprachenwahl41"
	echo
	echo "$sprachenwahl42" ~/"$CLIENT.ovpn"
	echo "$sprachenwahl43"
	if [ $nextcloud = "JA" ] 
	then
	echo "$sprachenwahl44"
	mv /root/$CLIENT.ovpn $nextcloudwegzudata/$CLIENT.ovpn
	chown -R www-data:www-data $nextcloudwegzudata/$CLIENT.ovpn
	cd $verzeichnisnextcloud 
	sudo -u www-data php occ files:scan -- $nextcloudadmin
	fi
fi
