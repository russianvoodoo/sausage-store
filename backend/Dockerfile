FROM openjdk:16-jdk-alpine

ARG VERSION
WORKDIR /app

RUN apk -U add curl && curl https://storage.yandexcloud.net/cloud-certs/CA.pem -o YandexInternalRootCA.crt \
    && keytool -importcert -file YandexInternalRootCA.crt \
    -alias yandex -cacerts -storepass changeit -noprompt \
    && rm -rf YandexInternalRootCA.crt \
    && addgroup --system jaruser \
    && adduser -S -s /bin/false -G jaruser jaruser -D -H \
    && apk add --no-cache dumb-init==1.2.5-r0

COPY --chown=jaruser:jaruser \
    ./sausage-store-${VERSION}/sausage-store-${VERSION}.jar ./sausage-store.jar

EXPOSE 8080
HEALTHCHECK CMD curl --fail -s http://localhost:8080/actuator/health

USER jaruser
ENTRYPOINT ["dumb-init", "java", "-jar", "-Dmyserver.bindPort=8080", "./sausage-store.jar"]