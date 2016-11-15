##openvpn-install
OpenVPN [road warrior](http://en.wikipedia.org/wiki/Road_warrior_%28computing%29) installer for Debian, Ubuntu and CentOS.

This script will let you setup your own secure VPN server in no more than a minute.

![](https://lut.im/xtTrl1R4if/j3j16qgomoL9JH9B)

##Fork

This script is based on the great work of [Nyr and its contributors](https://github.com/Nyr/openvpn-install), big thanks to them.

I made it because I wanted to have a more secured OpenVPN out-of-the-box. It works like the original script, but is more focused on privacy and espicially better encryption. Nyr's original script uses mainly default parameters regarding encryption, but you can do a lot better with the latest versions of OpenVPN and have nearly state-of-the-art encryption.

The only drawback is that you need to use a recent version of OpenVPN. Therefore I restrain the compatibility of this script to a few but widely used GNU/Linux distributions, to get a recent version of OpenVPN from trusted third-party repositories. 

I you want to use an OpenVPN server installed with this script with an old client (>2.3), it won't be compatible. If you can't upgrade your client, use Nyr's script.

### Features

This fork includes the following features :
- Every feature of the [original script](https://github.com/Nyr/openvpn-install)
- No logs
- No comp-lzo [compression is a vector for oracle attacks, e.g. CRIME or BREACH](https://github.com/BetterCrypto/Applied-Crypto-Hardening/pull/91#issuecomment-75388575)
- Better encryption (see below)
- Avoid DNS leak
- UFW support
- TLS 1.2 only
- Strong ciphers, DH keys and certificates. (see variants)
- AES-256-CBC and SHA-512 for HMAC (instead of BF-128-CBC and SHA1)
- Run server in unprivileged mode, reducing risks to the system
- TLS-auth to help [thwart DoS attacks](https://openvpn.net/index.php/open-source/documentation/howto.html#security) and provide a 2nd line of defense to the TLS channel.
- [FDN's DNS Servers](http://www.fdn.fr/actions/dns/)
- Nearest [OpenNIC DNS Servers](https://www.opennicproject.org/)
- [DNS.WATCH DNS Servers](https://dns.watch/index)
- Up-to-date OpenVPN (2.3.11) thanks to [EPEL](http://fedoraproject.org/wiki/EPEL) and [swupdate.openvpn.net](https://community.openvpn.net/openvpn/wiki/OpenvpnSoftwareRepos)
- Support for either SNAT or MASQUERADE for forwarding
## Variants

When you lauch the script you will be asked to choose a mode. Both will work the same way, but *slow* has higher encryption settings, so it may slow down your connection and take more time to install.

If you're just using your VPN at home, you may choose "fast". But if you're often using public Wi-Fi or traveling a lot, you choose use *slow*.

FYI, "fast" is still more secured than default OpenVPN settings.

### Slow (high encryption)
Features :
- 4096 bits RSA private key
- 4096 bits Diffie-Hellman key
- 256 bits AES-GCM
- SHA-384 RSA certificate

### Fast (lower encryption)
Features :
- 2048 bits RSA private key
- 2048 bits Diffie-Hellman key
- 128 bits AES-GCM
- SHA-256 RSA certificate

## Compatibility

The script is made to work on these OS :
- Debian 7
- Debian 8
- Ubuntu 12.04 LTS
- Ubuntu 14.04 LTS
- Ubuntu 16.04 LTS
- Ubuntu 16.10
- CentOS 6
- CentOS 7

##Installation

**You have to enable the TUN module otherwise OpenVPN won't work.** Ask your host if you don't know how to do it. If the TUN module is not enabled, the script will tell you.

Run the script and follow the assistant:

```
wget https://raw.githubusercontent.com/Angristan/OpenVPN-install/master/openvpn-install.sh
chmod +x openvpn-install.sh
./openvpn-install.sh
```

Once it ends, you can run it again to add more users, remove some of them or even completely uninstall OpenVPN.

![](https://lut.im/Z8xfJ8WqyO/3JoPmJK8VRp6zwOE)

You can get a cheap VPS for 3€/month at [PulseHeberg](https://goo.gl/oBhgaj).

## Licence

Based on the work of [Nyr](https://github.com/Nyr/openvpn-install)

[MIT Licence](https://raw.githubusercontent.com/Angristan/openvpn-install-nyr/master/LICENSE)
