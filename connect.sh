#!/bin/bash
# OPENVPN OTG CONNECT SCRIPT
echo "Where is the .ovpn config file?: (/path/to/file.ovpn)"
read fileloc
sudo screen -d -m -S vpn openvpn --config $fileloc
echo "Done, you should be connected, to end the connection, screen -x vpn and ctrl+c"
