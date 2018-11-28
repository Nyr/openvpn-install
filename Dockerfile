FROM ubuntu:18.04
LABEL maintainer "Mehran <it@mehran.co>"


RUN apt-get update && apt-get install -y \
    wget \
    software-properties-common \
    net-tools \
    curl \
    iproute2 \
    iptables \
    --no-install-recommends \
    && mkdir openvpn && cd openvpn \
    && wget https://git.io/vpn -O openvpn-install.sh
    

WORKDIR /openvpn
ENTRYPOINT ["bash"]
