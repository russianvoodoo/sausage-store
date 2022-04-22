#! /bin/bash
#Если свалится одна из команд, рухнет и весь скрипт
set -xe
#Перезаливаем дескриптор сервиса на ВМ для деплоя
sudo cp -rf sausage-store-frontend.service /etc/systemd/system/sausage-store-frontend.service
sudo rm -rf /var/www/dist/frontend/*||true
#Переносим артефакт в нужную папку
curl -u ${NEXUS_REPO_USER}:${NEXUS_REPO_PASS} -o sausage-store-front.tar.gz ${NEXUS_FRONTEND_REPO_URL}sausage-store-front/sausage-store/${VERSION}/sausage-store-${VERSION}.tar.gz
sudo tar xf ./sausage-store-front.tar.gz -C /home/front-user/sausage-front/
sudo cp -r /home/front-user/sausage-front/sausage-store-${VERSION}/public_html /var/www-data/dist/frontend/||true
sudo systemctl daemon-reload
sudo systemctl restart sausage-store-frontend.service
