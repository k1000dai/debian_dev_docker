FROM --platform=linux/amd64 debian:sid

ENV DEBIAN_FRONTEND=noninteractive
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
    && apt install reprepro debcargo cme -y

RUn set -x \
    && apt install reportbug -y

RUN set -x \
    && apt install msmtp-mta -y 

RUN set -x \
    && apt install -y build-essential cmake gettext

#Install ripgrep
RUN set -x \
    && apt update \
    && apt install -y ripgrep
# Install clangd
RUN set -x \
    && apt install -y clangd 

# sbuild-createchroot
RUN set -x \
    && sbuild-createchroot  --chroot-prefix debcargo-unstable unstable /srv/chroot/debcargo-unstable-amd64-sbuild http://deb.debian.org/debian

RUN set -x \
    && sbuild-createchroot --arch=amd64 sid /srv/chroot/sid-amd64 http://deb.debian.org/debian


# set up user
RUN useradd -m -s /bin/bash -G sudo devuser \
    && echo 'devuser ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
WORKDIR /home/devuser

# bashrc
COPY --chown=devuser:devuser .bashrc /home/devuser/.bashrc

# add user to sbuild
RUN sbuild-adduser devuser

# set user to devuser
USER devuser

# install neovim
RUN set -x \
    && git clone --branch v0.11.1 https://github.com/neovim/neovim \
    && cd neovim \
    && make CMAKE_BUILD_TYPE=RelWithDebInfo  -j$(nproc) \
    && sudo make install

RUN set -x \
    && git clone https://github.com/k1000dai/nvim ~/.config/nvim

RUN set -x \
    && git clone https://github.com/Shougo/dein.vim ~/.cache/dein/repos/github.com/Shougo/dein.vim

# git config
RUN set -x \
    && git config --global user.name "Kohei Sendai" \
    && git config --global user.email "kouhei.sendai@gmail.com"\
    && git config --global core.editor "vim"

# Install Node.js
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
ENV NVM_DIR="/home/devuser/.nvm"
RUN set -x \
    && . "$NVM_DIR/nvm.sh" \
    && nvm install --lts \
    && nvm install node
