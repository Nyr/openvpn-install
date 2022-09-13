**New: [wireguard-install](https://github.com/Nyr/wireguard-install) is also available.**

## openvpn-install
OpenVPN [road warrior](http://en.wikipedia.org/wiki/Road_warrior_%28computing%29) installer for Ubuntu, Debian, AlmaLinux, Rocky Linux, CentOS and Fedora.

This script will let you set up your own VPN server in no more than a minute, even if you haven't used OpenVPN before. It has been designed to be as unobtrusive and universal as possible.

### Installation
Run the script and follow the assistant:

`wget https://git.io/vpn -O openvpn-install.sh && bash openvpn-install.sh`

Once it ends, you can run it again to add more users, remove some of them or even completely uninstall OpenVPN.

### I want to run my own VPN but don't have a server for that
You can get a VPS from just 2€/month at [AlphaVPS](https://alphavps.com/clients/aff.php?aff=474&pid=422).

### Donations

If you want to show your appreciation, you can donate via [PayPal](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=VBAYDL34Z7J6L) or [cryptocurrency](https://pastebin.com/raw/M2JJpQpC). Thanks!


### Create/disable another user

`bash openvpn-install.sh`

### Install client on ubuntu server
```
sudo apt update
sudo apt install openvpn
```

Copy <USERNAME>.ovpn to the target machine

``` sudo cp <USERNAME>.ovpn /etc/openvpn/client.conf
sudo service openvpn@client start
```

### Some note

partial routing (if do not want redirect all traffic to the vpn server. If you have a machine that host public app e.g. website server, you will need this setting.)

in the client side edit <USERNAME>.ovpn
add 
  
```
route-nopull
route 10.8.0.0 255.255.255.0
```

make a file 
  
  nopull.txt
  
  ```
  route-nopull
  route 10.8.0.0 255.255.255.0
  ```
  
  another file
  norouting.bash
  ```
  sed -i '/verb 3/r nopuul.txt' $1`
  ```

  then you can add the setting to the usercofig with

  `bash norouting.bash <USERNAME>.ovpn`

or on the vpn server side
remove
  ``` redirect-gateway def1```
  
  
