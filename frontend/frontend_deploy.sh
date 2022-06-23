#!/bin/bash
set +e
VAULT_TOKEN=${VAULT_TOKEN}
VAULT_HOST=${VAULT_HOST}
VAULT_PORT=${VAULT_PORT}
EOF
docker login gitlab.praktikum-services.ru:5050 -u ${GITLAB_USER} -p ${GITLAB_PASS}
docker-compose up -d frontend