##openvpn-install
OpenVPN [road warrior](http://en.wikipedia.org/wiki/Road_warrior_%28computing%29) installer for Debian, Ubuntu and CentOS.

This script will let you setup your own VPN server in no more than a minute, even if you haven't used OpenVPN before. It isn't bulletproof but has been designed to be as unobtrusive and universal as possible.

### Fork
This fork includes :
- no logs
- TLS 1.2 only
- AES-256-CBC encryption (instead of BF-CBC)
- 4096 bits DH (instead of 2048 bits)
- [FDN's DNS Servers](http://www.fdn.fr/actions/dns/)
- Every feature of the [original script](https://github.com/Nyr/openvpn-install) (I check periodically to sync the latest commits from source)

###Installation
Run the script and follow the assistant:

```
wget https://raw.githubusercontent.com/Angristan/OpenVPN-install-nyr/master/openvpn-install.sh
chmod +x openvpn-install.sh
./openvpn-install.sh
```

Once it ends, you can run it again to add more users, remove some of them or even completely uninstall OpenVPN.

You can get a little VPS for just $2/month at [Host1Plus](https://affiliates.host1plus.com/ref/angristan.html).

## Licence

Thanks to [Nyr](https://github.com/Nyr/openvpn-install)

[MIT Licence](https://raw.githubusercontent.com/Angristan/openvpn-install-nyr/master/LICENSE)
