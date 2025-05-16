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
    apt install debcargo -y

# git config
RUN set -x \
    && git config --global user.name "Kohei Sendai" \
    && git config --global user.email "kouhei.sendai@gmail.com"\
    && git config --global core.editor "vim"


# bashrc
COPY .bashrc /root/.bashrc

RUN set -x \
    mkdir -p /root/.ssh 

COPY ssh_config /root/.ssh

RUN set -x \
    && chmod 600 /root/.ssh/id_ed25519 \
    && chmod 644 /root/.ssh/config

# install neovim
RUN set -x \
    && apt install -y build-essential cmake gettext

RUN set -x \
    && git clone https://github.com/neovim/neovim \
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
    && apt install -y clangd \
