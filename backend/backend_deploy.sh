#!/bin/bash
set +e
cat > .env <<EOF
VAULT_TOKEN=${VAULT_TOKEN}
VAULT_HOST=${VAULT_HOST}
VAULT_PORT=${VAULT_PORT}
EOF
docker network create -d bridge sausage_network || true
docker login gitlab.praktikum-services.ru:5050 -u ${GITLAB_USER} -p ${GITLAB_PASS}
docker pull gitlab.praktikum-services.ru:5050/russianvoodoo4/sausage-store/sausage-backend:latest
docker stop backend || true
docker rm backend || true
set -e
docker run -d --name backend \
    --network=sausage_network \
    --restart always \
    --pull always \
    --env-file .env \
    gitlab.praktikum-services.ru:5050/russianvoodoo4/sausage-store/sausage-backend:latest
