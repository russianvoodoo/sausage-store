#!/bin/bash
set +e
cat > .env <<EOF
SPRING_FLYWAY_ENABLED=false
SPRING_DATASOURCE_URL=${SPRING_DATASOURCE_URL}
SPRING_DATASOURCE_USERNAME=${SPRING_DATASOURCE_USERNAME}
SPRING_DATASOURCE_PASSWORD=${SPRING_DATASOURCE_PASSWORD}
SPRING_DATA_MONGODB_URI=${SPRING_DATA_MONGODB_URI}
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
