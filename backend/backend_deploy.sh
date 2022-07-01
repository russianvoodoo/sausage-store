#!/bin/bash
set +e
VAULT_TOKEN=${VAULT_TOKEN}
VAULT_HOST=${VAULT_HOST}
VAULT_PORT=${VAULT_PORT}
CI_COMMIT_SHA=${CI_COMMIT_SHA}
docker login gitlab.praktikum-services.ru:5050 -u ${GITLAB_USER} -p ${GITLAB_PASS}
docker pull gitlab.praktikum-services.ru:5050/russianvoodoo4/sausage-store/sausage-backend:latest

if docker ps | grep green
then
  docker-compose rm -s -f backend-blue
  docker-compose up --detach backend-blue 
  until docker container ls --filter health=healthy | grep blue
  do
    sleep 5
  done
  docker-compose stop backend-green
elif docker ps | grep blue
then
	docker-compose rm -s -f backend-green
  docker-compose up --detach backend-green 
  until docker container ls --filter health=healthy | grep green
  do
    sleep 5
  done
  docker-compose stop backend-blue
fi