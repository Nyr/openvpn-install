# Client Setup: OpenVPN over SSL

## Table of Contents

- [Windows](#windows)
- [MacOS](#macos)
- [Linux](#linux)
- [Android](#android)
- [iOS](#ios)
- [Troubleshooting](#troubleshooting)

## Windows

- Configure `stunnel`
  - Download and install [stunnel](https://www.stunnel.org/downloads.html)
  - Copy `stunnel.conf` and `stunnel.crt` to the `config` folder in `stunnel`'s install directory.
    - On 64-bit Windows systems, `stunnel`'s install directory is `C:\Program Files (x86)\stunnel`, unless you
      changed it during installation.
    - On 32-bit Windows systems, `stunnel`'s install directory is `C:\Program Files\stunnel`, unless you
      changed it during installation.
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
- To disconnect
  - Locate the OpenVPN icon in the Task Bar, right click, and select `Disconnect`
  - Locate the `stunnel` icon in the Task Bar, right click, and select `Exit`

## MacOS

- Configure `stunnel`

  - Install [Homebrew](https://brew.sh/)

  - Install `stunnel` via Homebrew by running this in `Terminal`:

    ```bash
    brew install stunnel
    ```
  - Open `stunnel.conf` with a text editor (e.g. `TextEdit`), locate this line:

    `CAfile = /etc/stunnel/stunnel.crt`

    Replace the entire line with:

    `CAfile = /usr/local/etc/stunnel/stunnel.crt`
  - Configure and start `stunnel`

    ```bash
    # In order to run these, you need to log in to your Mac with an administrator account. 
    # When prompted for password, enter the password of the current user,

    # Run this in the directory that contains 'stunnel.conf' and 'stunnel.crt'
    sudo cp stunnel.conf stunnel.crt /usr/local/etc/stunnel/
    # Start stunnel
    sudo stunnel
    ```

- Configure OpenVPN

  - Download and install [Tunnelblick](https://tunnelblick.net/)
  - Locate your OVPN file in `Finder`, and double-click to open it.
  - Locate the `Tunnelblick` icon on the top-right corner. Click on it, and select the server you want to connect to.

- To disconnect

  - Locate the `Tunnelblick` icon on the top-right corner. Click on it, and select `Disconnect All`.
  - To stop `stunnel`, run this in `Terminal`: `sudo killall stunnel`

## Linux

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

- Configure and start `stunnel`

  ```bash
  # Run this in the directory that contains 'stunnel.conf' and 'stunnel.crt'
  sudo cp stunnel.conf stunnel.crt /etc/stunnel/
  # Start stunnel
  sudo stunnel
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

  # Stop stunnel
  sudo killall stunnel
  ```

## Android

- OpenVPN is supported on Android, but OpenVPN over SSL support isn't very good.
- If you installed OpenVPN without SSL, see [Client Setup: OpenVPN](client-ovpn.md)

## iOS

- OpenVPN is supported on iOS, but OpenVPN over SSL is not supported.
- If you installed OpenVPN without SSL, see [Client Setup: OpenVPN](client-ovpn.md)

## Troubleshooting

- If you're unable to connect to your server with OpenVPN...

  - Please check if `stunnel` is running on your device. 

    - On Windows, check if the `stunnel` icon is present in the Task Bar (bottom right).
    - Run this to check on MacOS or Linux (both client and server)

    ```bash
    # You should see stunnel in the output
    ps -A | grep stunnel
    ```

  - Also check if both `stunnel` and OpenVPN are running on your server.

    ```bash
    # You should see stunnel in the output
    ps -A | grep stunnel

    # You should see openvpn in the output
    ps -A | grep openvpn
    ```

  - If you still can't connect, try removing and reinstalling OpenVPN on your server. 
    - Run the install script and select `Uninstall`
    - Run the install script again and make sure you enter the correct information.
