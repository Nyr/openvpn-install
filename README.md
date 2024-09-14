## openvpn-install

OpenVPN Server installer for Ubuntu, Debian, AlmaLinux, Rocky Linux, CentOS, and Fedora.

This repo is originally a fork of https://github.com/Nyr/openvpn-install with some changes and added features.

### Instructions

Download and execute the script:

```
wget https://raw.githubusercontent.com/davift/openvpn-install/master/openvpn-install.sh
chmod +x openvpn-install.sh
./openvpn-install.sh
```

Once it ends, you can run it again to add more users, remove some of them or even completely uninstall OpenVPN.

### Automation

Download the CLI script:

```
wget https://raw.githubusercontent.com/davift/openvpn-install/master/openvpn-cli.sh
chmod +x openvpn-cli.sh
./openvpn-cli.sh
```

The CLI script allows you to add and revoke users with a single command or for using with Ansible or Terraform.

```
See examples:

   ./openvpn-cli.sh add username                 add a new client
   ./openvpn-cli.sh revoke username              revoke a client
   ./openvpn-cli.sh add username@domain.com      add a new client and send the configuration via email
   ./openvpn-cli.sh revoke username@domain.com   revoke client and send the configuration via email

```

### Optional

If the new client account is a valid email address, the configuration file is automatically sent, as long as MSMTP is installed and configured.

```
sudo apt install msmtp msmtp-mta -y
sudo nano /etc/msmtprc
```

MSMTP Configuration Example (for Gmail):

```
defaults
auth on
tls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
logfile ~/.msmtp.log
account gmail
host smtp.gmail.com
port 587
from username@gmail.com
user username@gmail.com
password password
account default : gmail
```
