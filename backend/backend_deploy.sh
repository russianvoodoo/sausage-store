#!/bin/bash
set +e
VAULT_TOKEN=${VAULT_TOKEN}
VAULT_HOST=${VAULT_HOST}
VAULT_PORT=${VAULT_PORT}
CI_COMMIT_SHA=${CI_COMMIT_SHA}
docker login gitlab.praktikum-services.ru:5050 -u ${GITLAB_USER} -p ${GITLAB_PASS}
docker-compose up -d backend