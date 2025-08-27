FROM --platform=linux/amd64 ghcr.io/k1000dai/debian_dev_docker:main

USER root
# set up gpu
RUN set -x \
    && sed -i 's/^Components: main$/& contrib non-free non-free-firmware/' /etc/apt/sources.list.d/debian.sources

RUN set -x \
    && apt update \
    && apt install nvidia-driver -y 

RUN set -x \
    && apt install nvidia-cuda-dev nvidia-cuda-toolkit -y 

USER devuser