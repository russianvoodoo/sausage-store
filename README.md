# Sausage Store

![image](https://user-images.githubusercontent.com/9394918/121517767-69db8a80-c9f8-11eb-835a-e98ca07fd995.png)


## Technologies used

* Frontend – TypeScript, Angular.
* Backend  – Java 16, Spring Boot, Spring Data.
* Database – POSTGRESQL - 13

SINGLE Node
    PSQL_ADMIN="dbadmin"
    PSQL_PASSWORD="password"
    PSQL_HOST="rc1a-5b3o1bccrkvwfljc.mdb.yandexcloud.net"
    PSQL_PORT="6432"
    PSQL_DBNAME="sausagestore"
CLUSTER Node
    PSQL_ADMIN="dbadmin"
    PSQL_PASSWORD="password"
    PSQL_HOST="c-c9qkat7gh3qe4ftqqfdd.rw.mdb.yandexcloud.net"
    PSQL_PORT="6432"
    PSQL_DBNAME="sausagestore"
    HOST1 rc1a-jow2bqmnyhatxelp.mdb.yandexcloud.net
    HOST2 rc1b-tkhiykq30ehd9qsj.mdb.yandexcloud.net
    
## Installation guide
### Backend

Install Java 16 and maven and run:

```bash
cd backend
mvn package
cd target
java -jar sausage-store-0.0.1-SNAPSHOT.jar
```

### Frontend

Install NodeJS and npm on your computer and run:

```bash
cd frontend
npm install
npm run build
npm install -g http-server
sudo http-server ./dist/frontend/ -p 80 --proxy http://localhost:8080
```

Then open your browser and go to [http://localhost](http://localhost)
