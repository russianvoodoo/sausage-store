#! /bin/bash
#чтобы скрипт завершался, если есть ошибки
set -xe
#скачиваем артефакт
curl -u ${NEXUS_REPO_USER}:${NEXUS_REPO_PASS} -o sausage-store-${VERSION}.jar ${NEXUS_BACKEND_REPO_URL}com/yandex/practicum/devops/sausage-store/${VERSION}/sausage-store-${VERSION}.jar
#Пытаемся запустить приложение фоном в новой сессии
setsid nohup java -jar sausage-store-${VERSION}.jar --server.port=9090 > nohup.out & 
