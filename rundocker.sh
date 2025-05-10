#!/bin/sh
if command -v nvidia-smi >/dev/null 2>&1; then
    echo "NVIDIA GPU detected. Using GPU version tag."
    docker run --platform=linux/amd64  \
        --name sid-kohei-container --privileged --shm-size=4g -it \
        --gpus all --env NVIDIA_DISABLE_REQUIRE=1 \
        sid-kohei-dev:latest bash
else
    echo "No NVIDIA GPU detected. Using CPU version tag."
    docker run --platform=linux/amd64 \
        --name sid-kohei-container --privileged \
        --shm-size=4g -it sid-kohei-dev:cpu bash
fi
