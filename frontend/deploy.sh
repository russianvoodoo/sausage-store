#! /bin/bash
#Если свалится одна из команд, рухнет и весь скрипт
set -xe
#Перезаливаем дескриптор сервиса на ВМ для деплоя
sudo cp -rf sausage-store-frontend.service /etc/systemd/system/sausage-store-frontend.service
sudo rm -f /home/jarservice/sausage-store.jar||true
#Переносим артефакт в нужную папку
curl -u ${NEXUS_REPO_USER}:${NEXUS_REPO_PASS} -o sausage-store-front.tar.gz ${NEXUS_FRONTEND_REPO_URL}'sausage-store-front/sausage-store/'${VERSION}'/sausage-store-'${VERSION}'.tar.gz
sudo tar -xf ./sausage-store-front.tar.gz
sudo cp sausage-store /home/front-user/||true #"jar||true" говорит, если команда обвалится — продолжай
sudo systemctl daemon-reload
sudo systemctl restart sausage-store-frontend.service
