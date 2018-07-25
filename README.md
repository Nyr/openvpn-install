# OpenVPN Installer

## To Developers and Users

**WARNING: Only Trust Signed Commits.**

## Table of Contents

- [Description](#description)
- [Installation](#installation)
- [Client setup](#client-setup)
- [Troubleshooting](#troubleshooting)
- [FAQ](#faq)
- [Donations](#donations)

## Description

OpenVPN installer for Debian, Ubuntu and CentOS, with support for OpenVPN over SSL.

This script lets you set up your own OpenVPN server in minutes, even if you no experience OpenVPN before. It's designed to be as simple, unobtrusive, and universal as possible.

## Installation

If you run into any issues during installation, please refer to [Troubleshooting](#troubleshooting).

### Install on CentOS/Debian/Ubuntu

- **Please note: if your server is running the following OS versions, please select `AES-256-CBC` when you're asked to select a cipher mode.**

    - CentOS 6 or older
    - Debian 8 (Jessie) or older
    - Ubuntu 16.10 or older

- Run this in a terminal on your server, and follow the on-screen instructions:

    ```bash
    # Download the script
    wget https://raw.githubusercontent.com/birkhoffcheng/openvpn-install/master/openvpn-install.sh

    # Run the install script
    sudo bash openvpn-install.sh

    # Note: If you're running Ubuntu 16.10 or older

    # Start stunnel (only if you're using OpenVPN over SSL)
    sudo stunnel
    ```

- Once it finishes, your OpenVPN server is up and running! You should [set up client devices](#client-setup) next.

## Client setup

### Before continuing... 

-  Download `stunnel.conf` and the `.ovpn` file from your server.
-  If your username is `root`, they're located at `/root`.
-  Otherwise, they're located at `/home/<YOUR USERNAME>`.

### OS-specific setup processes

- [OpenVPN (without SSL)](Documentation/client-ovpn.md)
- [OpenVPN over SSL](Documentation/client-ssl.md)

## Troubleshooting

- `wget: command not found`: This means that `wget` isn't install it on your server. Just install it and try again. To install `wget`:

  ```bash
  # Run this on Debian/Ubuntu
  sudo apt -y install wget

  # Run this on CentOS
  sudo yum -y install wget
  ```

- `The TUN device is not available. You need to enable TUN before running this script`: Follow [this guide](https://help.skysilk.com/support/solutions/articles/9000136471-how-to-enable-tun-tap-on-linux-vps-with-skysilk).

- If you're unable to connect to your server with OpenVPN...

  - Please check if `stunnel` is running on your device. (if you're using OpenVPN over SSL)

    - On Windows, check if the `stunnel` icon is present in the Task Bar (bottom right).
    - Run this to check on MacOS or Linux (both client and server)

    ```bash
    # You should see stunnel in the output
    ps -A | grep stunnel
    ```

  - Also check if both `stunnel` (if applicable) and OpenVPN are running on your server.

    ```bash
    # You should see stunnel in the output (if you're using OpenVPN over SSL)
    ps -A | grep stunnel

    # You should see openvpn in the output
    ps -A | grep openvpn
    ```

  - If you still can't connect, try removing and reinstalling OpenVPN on your server. 
    - Run the install script and select `Uninstall`
    - Run the install script again and make sure you enter the correct information.

## FAQ

### Where to find a VPS

You can get a VPS for as little as $2.50/month (IPv6 only) or $5/month (with IPv4) at [Vultr](https://www.vultr.com/?ref=7088313) or $5/month (with IPv4) at [DigitalOcean](https://m.do.co/c/c51ec51bb352).

## Donations

If you want to show your appreciation, you can donate via [PayPal](https://paypal.me/birkhoffcheng) or Bitcoin (12R4euPg17EfJyYNfdTxjiQ2SctW1b4CRz). Thanks!
