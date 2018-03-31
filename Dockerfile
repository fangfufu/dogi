FROM debian:latest

ENV GOPATH="/root/go-path"
ENV PATH="/root/go-path/bin/:${PATH}"
ENV SHELL="/bin/bash"

RUN apt-get update && \
	apt-get install -y \
	atomicparsley \
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
	screen \
	wget

RUN mkdir /root/gopath &&  go get -u github.com/odeke-em/drive/cmd/drive
RUN wget https://raw.githubusercontent.com/get-iplayer/get_iplayer/master/get_iplayer \
	-O /root/get_iplayer && \
	chmod +x /root/get_iplayer
RUN /bin/echo -e "nameserver 8.8.8.8\nnameserver 8.8.4.4" > /etc/resolv.conf
RUN mkdir -p /root/gdrive/.gd

WORKDIR "/root"
ENTRYPOINT ["/bin/bash"]
