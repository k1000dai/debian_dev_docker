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
    && apt install reprepro debcargo -y

# git config
RUN set -x \
    && git config --global user.name "Kohei Sendai" \
    && git config --global user.email "kouhei.sendai@gmail.com"\
    && git config --global core.editor "vim"

# sbuild-createchroot
RUN set -x \
    && sbuild-createchroot  --chroot-prefix debcargo-unstable unstable /srv/chroot/debcargo-unstable-amd64-sbuild http://deb.debian.org/debian

RUN set -x \
    && sbuild-createchroot --arch=amd64 sid /srv/chroot/sid-amd64 http://deb.debian.org/debian
    # bashrc
COPY .bashrc /home/devuser/.bashrc

RUN set -x \
    mkdir -p /home/devuser/.ssh 

# install neovim
RUN set -x \
    && apt install -y build-essential cmake gettext

RUN set -x \
    && git clone --branch v0.11.1 https://github.com/neovim/neovim \
    && cd neovim \
    && make CMAKE_BUILD_TYPE=RelWithDebInfo  -j$(nproc) \
    && make install

RUN set -x \
    && git clone https://github.com/k1000dai/nvim ~/.config/nvim

RUN set -x \
    && git clone https://github.com/Shougo/dein.vim ~/.cache/dein/repos/github.com/Shougo/dein.vim

    # Install Node.js
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

RUN set -x \
    && . ~/.bashrc \
    && nvm install --lts \
    && nvm install node

#Install ripgrep
RUN set -x \
    && apt update \
    && apt install -y ripgrep
# Install clangd
RUN set -x \
    && apt install -y clangd 


# set up user
RUN useradd -m -s /bin/bash -G sudo devuser \
    && echo 'devuser ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER devuser
WORKDIR /home/devuser