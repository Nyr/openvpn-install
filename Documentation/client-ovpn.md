# Client Setup: OpenVPN

## Table of Contents

- [Windows](#windows)
- [MacOS](#macos)
- [Linux](#linux)
- [Android](#android)
- [iOS](#ios)
- [Troubleshooting](#troubleshooting)

## Windows

- Configure OpenVPN
  - Download and install [OpenVPN](https://openvpn.net/index.php/open-source/downloads.html)
  - Start `OpenVPN GUI` from the Start Menu
  - Locate the OpenVPN icon in the Task Bar, right click, and select `Import file...`
  - Select your OVPN file
  - Right click on the OpenVPN icon again, and select `Connect`
- To disconnect
  - Locate the OpenVPN icon in the Task Bar, right click, and select `Disconnect`
  - Locate the `stunnel` icon in the Task Bar, right click, and select `Exit`

## MacOS

- Configure OpenVPN
  - Download and install [Tunnelblick](https://tunnelblick.net/)
  - Locate your OVPN file in `Finder`, and double-click to open it.
  - Locate the `Tunnelblick` icon on the top-right corner. Click on it, and select the server you want to connect to.
- To disconnect
  - Locate the `Tunnelblick` icon on the top-right corner. Click on it, and select `Disconnect All`.
  - To stop `stunnel`, run this in `Terminal`: `sudo killall stunnel`

## Linux

- Install `openvpn` on your device.

  ```bash
  # Debian/Ubuntu
  sudo apt install -y openvpn

  # CentOS/RHEL
  sudo yum install -y epel-release
  sudo yum install -y openvpn

  # Fedora
  sudo dnf install -y openvpn
  ```

- Connect to OpenVPN

  ```bash
  # Run this in the directory that contains your OVPN file
  # Replace 'client' with your OVPN filename
  openvpn --config client.ovpn
  ```

- To disconnect

  ```bash
  # Stop OpenVPN
  sudo killall openvpn
  ```

## Android

- Download [OpenVPN for Android](https://play.google.com/store/apps/details?id=de.blinkt.openvpn) from Google Play Store
- Transfer your OVPN file to your device.
- Click on the `import` icon (between `+` and `Menu` icon), and select your OVPN file.
- Click on the check mark to confirm import.
- Click on a profile name to connect.
  - If you see a `connection request` popup, select `Connect` or `OK`.
- To disconnect: Select the `VPN connection` notification in your notification center, and click `Disconnect` in the popup.

## iOS

- Download [OpenVPN Connect](https://itunes.apple.com/app/openvpn-connect/id590379981) from App Store
- Send the OVPN file as an attachment to yourself via email, and open it in your email app on the iOS device.
  - If you see a popup with a list of different apps, select `OpenVPN Connect`.
- Click on the switch next to `Connection`, make sure it's at the `ON` position.
- To disconnect:  click on the switch next to `Connection`, make sure it's at the `OFF` position.

## Troubleshooting

- If you're unable to connect to your server with OpenVPN...

  - Check if OpenVPN is running on your server.

    ```bash
    # You should see openvpn in the output
    ps -A | grep openvpn
    ```

  - If you still can't connect, try removing and reinstalling OpenVPN on your server. 
    - Run the install script and select `Uninstall`
    - Run the install script again and make sure you enter the correct information.
