# open vpn admin

Simple web UI to manage OpenVPN users.

swagger ui <> python <> [openvpn-install.sh](https://github.com/Nyr/openvpn-install/blob/master/README.md)

# usage

- run server

```commandline
Install python3.10

cd project-path
pip install -r -i https://mirrors.aliyun.com/pypi/simple/ requirements.txt
openvpn_ui/bin/run_http_server.sh
```

- access swagger ui

```commandline
http://0.0.0.0:8080/api/docs
```

# develop

```commandline
docker run -it -v /Users/songgs/_git/openvpn-install:/app -p 8080:8080 --cap-add=NET_ADMIN python:3.10.14-bullseye bash

pip install -r -i https://mirrors.aliyun.com/pypi/simple/ requirements.txt
sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list
```

```commandline
!! comment this line in openvpn-install.sh
# Discard stdin. Needed when running from an one-liner which includes a newline
read -N 999999 -t 0.001
```