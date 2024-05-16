# open vpn admin

Simple web UI to manage OpenVPN users.

swagger ui <> python <> [openvpn-install.sh](../openvpn-install.sh)

# usage
## prepare python
```
# parepare libs
apt update
apt install wget curl unzip build-essential libreadline-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev -y

# install python
wget -c https://www.python.org/ftp/python/3.10.0/Python-3.10.0.tar.xz
tar -xvf Python-3.10.0.tar.xz
cd Python-3.10.0
sudo ./configure --enable-optimizations
make altinstall # install Python 3.10 into /usr/local/bin
python3.10 --version

# install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py 
python get-pip.py
```

## run server

```commandline
wget -c https://github.com/Song2017/openvpn-install-ui/archive/refs/heads/master.zip
unzip master.zip
cd openvpn-install-ui-master
pip install -r openvpn_ui/requirements.txt
openvpn_ui/bin/run_http_server.sh
```

- access swagger ui

```commandline
http://0.0.0.0:8080/api/docs
```

## develop

```commandline
docker run -it -v /Users/songgs/_git/openvpn-install:/app -p 8080:8080 --cap-add=NET_ADMIN python:3.10.14-bullseye bash

pip install -r -i https://mirrors.aliyun.com/pypi/simple/ requirements.txt
sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list
```

```commandline
!! comment this line in ./bin/openvpn-install.sh
# Discard stdin. Needed when running from an one-liner which includes a newline
read -N 999999 -t 0.001
```