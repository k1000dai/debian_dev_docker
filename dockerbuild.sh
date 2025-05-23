#!/bin/sh
DOCKERFILE=cpu/Dockerfile
TAG=debian-sid-dev:cpu

if command -v nvidia-smi >/dev/null 2>&1; then
    echo "NVIDIA GPU detected. Using GPU version tag."
    DOCKERFILE=gpu/Dockerfile
    TAG=debian-sid-dev:gpu
fi

docker build -t ${TAG} -f ${DOCKERFILE} . 
