#!/bin/sh
if command -v nvidia-smi >/dev/null 2>&1; then
    echo "NVIDIA GPU detected. Using GPU version tag."
    docker run --platform=linux/amd64  \
        --network=host \
        --name debian-sid-container --privileged --cap-add=SYS_ADMIN \
        --security-opt seccomp=unconfined \
        --security-opt apparmor=unconfined \
        --shm-size=50g -it \
        --gpus all --env NVIDIA_DISABLE_REQUIRE=1 \
        debian-sid-dev:gpu bash
else
    echo "No NVIDIA GPU detected. Using CPU version tag."
    docker run --platform=linux/amd64 \
        --name debian-sid-container --privileged --cap-add=SYS_ADMIN \
        --security-opt seccomp=unconfined \
        --security-opt apparmor=unconfined \
        --shm-size=50g -it debian-sid-dev:cpu bash
fi
