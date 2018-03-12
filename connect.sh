#!/bin/bash
# OPENVPN OTG CONNECT SCRIPT
echo "Where is the .ovpn config file?: (/path/to/file.ovpn)"
read fileloc
sudo screen -dmS ovpn openvpn --config $fileloc
echo "Done, you should be connected, to end the connection, screen -x ovpn and ctrl+c"
