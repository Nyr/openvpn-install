## openvpn-install
OpenVPN [road warrior](http://en.wikipedia.org/wiki/Road_warrior_%28computing%29) installer for Debian, Ubuntu and CentOS.

This script will let you setup your own VPN server in no more than a minute, even if you haven't used OpenVPN before. It has been designed to be as unobtrusive and universal as possible.

### Installation
Run the script and follow the assistant:

#### if server system is version of ubuntu 18.04LST then neet install libsodium to support AES-256-GCM
`sudo apt install libsodium23 libsodium-dev`

#### install git
`sudo apt install git`


#### clone code file and excute
`git clone https://github.com/hewenhan/openvpn-install.git && sudo ./openvpn-install/openvpn-install.sh`

Once it ends, you can run it again to add more users, remove some of them or even completely uninstall OpenVPN.


### Donations

This is foked from https://github.com/Nyr/openvpn-install.

Changed cipher type and lan ip range.

#### Tips:

The system of server and client must be supported AES-256-GCM. I try successed in Ubuntu 19.04 from google cloud.
And the version of ubuntu 18.04TLS is not supported, need install libsodium.
I didn't try other system.
