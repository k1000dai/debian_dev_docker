FROM --platform=linux/amd64 ghcr.io/k1000dai/debian_dev_docker:main

# set up gpu
RUN set -x \
    && touch /etc/apt/sources.list \
    && echo "deb http://deb.debian.org/debian/ sid main contrib non-free non-free-firmware" > /etc/apt/sources.list

RUN set -x \
    && apt update \
    && apt install nvidia-driver -y 

RUN set -x \
    && apt install nvidia-cuda-dev nvidia-cuda-toolkit -y 