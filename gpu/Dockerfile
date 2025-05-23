FROM --platform=linux/amd64 debian:sid

ENV DEBEMAIL="kouhei.sendai@gmail.com"
ENV DEBFULLNAME="Kohei Sendai"

RUN set -x \
    && apt update \
    && apt upgrade -y

RUN set -x \
    && apt install curl wget vim -y

RUN set -x \
    && apt install sbuild sudo locales \
    debootstrap schroot build-essential \
    dh-make devscripts git-buildpackage \
    git lintian python3-all python3-setuptools -y  

RUN set -x \
    apt install cargo rustc dh-cargo debcargo git devscripts quilt \
    reprepro debootstrap sbuild schroot autopkgtest -y

# git config
RUN set -x \
    && git config --global user.name "Kohei Sendai" \
    && git config --global user.email "kouhei.sendai@gmail.com"\
    && git config --global core.editor "vim"

# sbuild-createchroot
RUN set -x \
    && sbuild-createchroot  --chroot-prefix debcargo-unstable unstable /srv/chroot/debcargo-unstable-amd64-sbuild http://deb.debian.org/debian

# bashrc
COPY .bashrc /root/.bashrc

RUN set -x \
    mkdir -p /root/.ssh 

# set up gpu
RUN set -x \
    && touch /etc/apt/sources.list \
    && echo "deb http://deb.debian.org/debian/ sid main contrib non-free non-free-firmware" > /etc/apt/sources.list

RUN set -x \
    && apt update \
    && apt install nvidia-driver -y 
