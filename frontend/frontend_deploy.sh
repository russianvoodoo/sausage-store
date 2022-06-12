#!/bin/bash
set +e
docker network create -d bridge sausage_network || true
docker login gitlab.praktikum-services.ru:5050 -u ${GITLAB_USER} -p ${GITLAB_PASS}
docker pull gitlab.praktikum-services.ru:5050/russianvoodoo4/sausage-store/sausage-frontend:latest
docker stop frontend || true
docker rm frontend || true
set -e
docker run -d --name frontend -p 8080:80 \
    --network=sausage_network \
    --restart always \
    --pull always \
    gitlab.praktikum-services.ru:5050/russianvoodoo4/sausage-store/sausage-frontend:latest
