##openvpn-install
OpenVPN [road warrior](http://en.wikipedia.org/wiki/Road_warrior_%28computing%29) installer for Debian, Ubuntu and CentOS.

This script will let you setup your own VPN server in no more than a minute, even if you haven't used OpenVPN before. It isn't bulletproof but has been designed to be as unobtrusive and universal as possible.

##Fork
This fork includes :
- no logs
- TLS 1.2 only
- AES-128-GCM encryption (instead of BF-CBC)
- Leagacy version for less hardened encryption
- 4096 bits DH (instead of 2048 bits)
- [FDN's DNS Servers](http://www.fdn.fr/actions/dns/)
- Every feature of the [original script](https://github.com/Nyr/openvpn-install) (I check periodically to sync the latest commits from source)

##Installation

To check your OpenVPN version, use `openvpn --version`

If your server **and** your client have OpenVPN 2.3.3 or higher, use *latest*. If your server **or** your client have OpenVPN 2.3.2 or lower, use *legacy*.

I made two versions to make sure you can get the best encryption possible, but also to support most devices as possible.

###Latest (OpenVPN > 2.3.3)

It will work for :
- Debian 8
- Ubuntu 15.10
- CentOS 6

Run the script and follow the assistant:

```
wget --no-check-certificate https://raw.githubusercontent.com/Angristan/OpenVPN-install-nyr/master/openvpn-install.sh
chmod +x openvpn-install.sh
./openvpn-install.sh
```

###Legacy (OpenVPN < 2.3.2)

It's the same script as *latest*, but with TLS 1.0 instead of TLS 1.2 and AES-256-CBC instead of AES-128-GCM. (OpenVPN 2.3.2 and lower doesn't support `tls-min` and `tls-cipher`)

Other features are still included.

It will work for :
- Debian 7
- Ubuntu 12.04 LTS, 14.04 LTS

Run the script and follow the assistant:

```
wget --no-check-certificate https://raw.githubusercontent.com/Angristan/OpenVPN-install-nyr/master/openvpn-install-legacy.sh
chmod +x openvpn-install-legacy.sh
./openvpn-install-legacy.sh
```

Once it ends, you can run it again to add more users, remove some of them or even completely uninstall OpenVPN.

You can get a little VPS for just 1.49€/month at [PulseHeberg](http://manager.pulseheberg.com/aff.php?aff=1204).

## Licence

Based on the work of [Nyr](https://github.com/Nyr/openvpn-install)

[MIT Licence](https://raw.githubusercontent.com/Angristan/openvpn-install-nyr/master/LICENSE)
