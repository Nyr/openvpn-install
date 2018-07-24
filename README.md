# OpenVPN Installer

## To Developers and Users

**WARNING: Only Trust Signed Commits.**

## Table of Contents

- [Description](#description)
- [Installation](#installation)
- [Configure clients](#configure-clients)
  - [Windows](#windows)
  - [MacOS](#macos)
  - [Linux](#linux)
  - [Android](#android)
  - [iOS](#ios)
- [Troubleshooting](#troubleshooting)
- [FAQ](#faq)
- [Donations](#donations)

## Description

OpenVPN installer for Debian, Ubuntu and CentOS, with support for OpenVPN over SSL.

This script lets you set up your own OpenVPN server in minutes, even if you no experience OpenVPN before. It's designed to be as simple, unobtrusive, and universal as possible.

## Installation

If you run into any issues during installation, please refer to [Troubleshooting](#Troubleshooting).
### Install on CentOS/Debian/Ubuntu

- Run this in a terminal on your server, and follow the on-screen instructions:
    ```bash
    # Download the script
    wget https://raw.githubusercontent.com/birkhoffcheng/openvpn-install/master/openvpn-install.sh

    # Run the install script
    sudo bash openvpn-install.sh

    # Start stunnel (only if you're using OpenVPN over SSL)
    sudo stunnel
    ```
- Once it finishes, your OpenVPN server is up and running! You should [configure client devices](#configure-clients) next.

## Configure clients

### Before continuing... 

-  Download `stunnel.conf` and the `.ovpn` file from your server.
-  If your username is `root`, they're located at `/root`.
-  Otherwise, they're located at `/home/<YOUR USERNAME>`.

### OS-specific setup processes

#### Windows

- Configure `stunnel`. Skip to the next section if you're NOT using OpenVPN over SSL
  - Download and install [stunnel](https://www.stunnel.org/downloads.html)
  - Start `stunnel` by launching `stunnel GUI start ` from the Start Menu
  - Locate the `stunnel` icon in the Task Bar, right click, and select `Edit Configuration`
  - Copy everything in `stunnel.conf` and paste into the `stunnel` configuration file. Save and close it after editing.
  - Right click on the `stunnel` icon again, and select `Reload Configuration`
- Configure OpenVPN
  - Download and install [OpenVPN](https://openvpn.net/index.php/open-source/downloads.html)
  - Start `OpenVPN GUI` from the Start Menu
  - Locate the OpenVPN icon in the Task Bar, right click, and select `Import file...`
  - Select your OVPN file
  - Right click on the OpenVPN icon again, and select `Connect`

#### MacOS

- Supported. Instructions coming soon.

#### Linux

- Install `stunnel` and `openvpn` on your device.

  ```bash
  # Debian/Ubuntu
  sudo apt install -y stunnel openvpn

  # CentOS/RHEL
  sudo yum install -y epel-release
  sudo yum install -y stunnel openvpn

  # Fedora
  sudo dnf install -y stunnel openvpn
  ```

- If you're using OpenVPN over SSL, configure and start `stunnel`

  ```bash
  # Run this in the directory that contains 'stunnel.conf'
  sudo cp stunnel.conf /etc/stunnel/
  # Start stunnel
  sudo stunnel
  ```

- Connect to OpenVPN

  ```bash
  # Run this in the directory that contains your OVPN file
  # Replace 'client' with your OVPN filename
  openvpn --config client.ovpn
  ```

#### Android

- Supported. Instructions coming soon.

#### iOS

- OpenVPN is supported on iOS, but OpenVPN over SSL is not supported.
- If you installed OpenVPN without SSL, download [OpenVPN Connect from App Store](https://itunes.apple.com/app/openvpn-connect/id590379981)
- Follow the on-screen instruction to add the OpenVPN profile.

## Troubleshooting

- `wget: command not found`: This means that `wget` isn't install it on your server. Just install it and try again. To install `wget`:

  ```bash
  # Run this on Debian/Ubuntu
  sudo apt -y install wget

  # Run this on CentOS
  sudo yum -y install wget
  ```

- `The TUN device is not available. You need to enable TUN before running this script`: Follow [this guide](https://help.skysilk.com/support/solutions/articles/9000136471-how-to-enable-tun-tap-on-linux-vps-with-skysilk).

## FAQ

### Where to find a VPS

You can get a VPS for as little as $2.50/month (IPv6 only) or $5/month (with IPv4) at [Vultr](https://www.vultr.com/?ref=7088313) or $5/month (with IPv4) at [DigitalOcean](https://m.do.co/c/c51ec51bb352).

## Donations

If you want to show your appreciation, you can donate via [PayPal](https://paypal.me/birkhoffcheng) or Bitcoin (12R4euPg17EfJyYNfdTxjiQ2SctW1b4CRz). Thanks!
