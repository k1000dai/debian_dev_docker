docker run --platform=linux/amd64  \
    --name sid-kohei-container --privileged --shm-size=4g -it \
    --gpus all --env NVIDIA_DISABLE_REQUIRE=1 \
    sid-kohei-dev:latest bash
  