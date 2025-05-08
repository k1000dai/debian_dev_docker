FROM --platform=linux/amd64 debian:sid

ENV DEBEMAIL="kouhei.sendai@gmail.com"
ENV DEBFULLNAME="Kohei Sendai"

ENV PROJECT_DIR=/root/kohei

RUN set -x \
    && apt update \
    && apt upgrade -y

RUN set -x \
    && apt install curl wget -y

RUN set -x \
    && apt install sbuild sudo locales \
    debootstrap schroot build-essential \
    dh-make devscripts git-buildpackage \
    git lintian python3-all python3-setuptools -y  

WORKDIR ${PROJECT_DIR}
