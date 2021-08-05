**New: [wireguard-install](https://github.com/Nyr/wireguard-install) is also available.**

## openvpn-install
OpenVPN [road warrior](http://en.wikipedia.org/wiki/Road_warrior_%28computing%29) installer for Ubuntu, Debian, CentOS and Fedora.

This script will let you set up your own VPN server in no more than a minute, even if you haven't used OpenVPN before. It has been designed to be as unobtrusive and universal as possible.

### Installation
Run the script and follow the assistant:

`wget https://git.io/vpn -O openvpn-install.sh && bash openvpn-install.sh`

Once it ends, you can run it again to add more users, remove some of them or even completely uninstall OpenVPN.

### Extended
This script has been extended to automatically assign a static ip address to a client.
All static ip addresses are stored in ccd directory and the ipp.txt file.
To use static ip routing follow stpes below
1. Create folder with name ccd where static ip addresses will be stored:
	mkdir /etc/openvpn/server/ccd
2. Change server.conf configuration file.
	Add line: client-config-dir /etc/openvpn/server/ccd
	Remove line: ifconfig-pool-persist ipp.txt
	Change subnet mask: server 10.8.0.0 255.255.0.0
3. Run ipPoolMigration.sh script to create static ip addreses for existing users.
	sudo ./ipPoolMigration.sh
4. Restart openvpn server
	sudo systemctl restart openvpn-server@server

To add a new client run openvpn-ubuntu-install.sh script. It will
automatically give static ip to a client.
Don't delete ipp.txt. All ip addresses are stored there.

To add or change static ip manually:
1. Create file with a profile name in ccd directody:
	touch /etc/openvpn/server/ccd/client1
2. Add `ifconfig-push {ip} {subnet_mask}` command to the file. ex:
	ifconfig-push 10.8.0.236 255.255.0.0
3. Add profile name and ip address to ipp.txt file in following format:
	client1,10.8.0.236

You should not restart openvpn server after adding static ip address.

### Info
You can find more info about static ip routing and how to use it below

https://openvpn.net/community-resources/configuring-client-specific-rules-and-access-policies/
https://kifarunix.com/assign-static-ip-addresses-for-openvpn-clients/
