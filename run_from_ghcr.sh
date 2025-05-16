docker run -dit --privileged --platform=linux/amd64 \
    --name debian-sid-container --shm-size=4g \
    ghcr.io/k1000dai/debian_dev_docker:main

docker cp ~/.ssh debian-sid-container:/root/.ssh

docker exec -it debian-sid-container bash
