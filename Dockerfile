FROM debian:latest

ENV GOPATH="/root/go-path" \
    PATH="/root/go-path/bin/:${PATH}" \
    SHELL="/bin/bash" \
    TERM="xterm-256color"

WORKDIR "/root"

# Install dependencies
RUN apt-get update
RUN	apt-get install -y \
        apt-utils \
        atomicparsley \
        curl \
        dialog \
        ffmpeg \
        git \
        golang \
        openvpn \
        liblwp-protocol-https-perl \
        libmojolicious-perl \
        libwww-perl \
        libxml-libxml-perl \
        nano \
        net-tools \
        procps \
        screen \
        wget

# Install odeke-em drive
# RUN mkdir /root/gopath
RUN go get -u github.com/odeke-em/drive/cmd/drive

# Install get_iplayer
ADD https://raw.githubusercontent.com/get-iplayer/get_iplayer/master/get_iplayer \
        /root/get_iplayer
RUN chmod +x /root/get_iplayer

ENTRYPOINT ["/bin/bash"]
