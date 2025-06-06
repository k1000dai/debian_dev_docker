docker run -dit --privileged --platform=linux/amd64 \
    --name debian-sid-container --shm-size=4g \
    ghcr.io/k1000dai/debian_dev_docker:main

docker cp ~/.ssh debian-sid-container:/home/devuser/

docker exec -it debian-sid-container sudo chown -R devuser:devuser /home/devuser/.ssh

docker exec -it debian-sid-container bash
