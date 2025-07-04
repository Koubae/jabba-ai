jabba-ai
========

Jabba is a Chat AI Bot | is called Jabba because in British English is pronunced the same as jabber and I found it funny :)

Is composed of the following projects:

* [jabba-ai-ui](https://github.com/Koubae/jabba-ai-ui)
* [jabba-ai-chat-app](https://github.com/Koubae/jabba-ai-chat-app)
* [jabba-ai-bot](https://github.com/Koubae/jabba-ai-bot)

Quick Start
-----------

#### 1) Clone this project and each module

```bash
git clone git@github.com:Koubae/jabba-ai.git
cd jabba-ai
make clone-submodules
```

To update later the submodules

```bash
make update-submodules
```


### Dependency containers

To work locally and avoid having 2k containers for same services, there is a [docker-compose.yml](docker-compose.yml) with services
where each micro-service can use and be shared.

Also the main network is defined there.

#### Cache (Redis)

```bash
# cache
make redis-up
make redis-down
make redis-down-clean-up
```

#### Database (mysql)

```bash
make mysql-up
make mysql-down
make mysql-down-clean-up
make mysql-shell
``` 

#### Database (MongoDB)

```bash
make mongo-up
make mongo-down
make mongo-down-clean-up
``` 

Go to http://localhost:18081/

* User: `admin`
* Password: `pass`

* [MongoDB -- GO SKD QuickStart](https://www.mongodb.com/docs/drivers/go/current/quick-start/)
* [go.mongodb.org/mongo-driver/v2/mongo](https://pkg.go.dev/go.mongodb.org/mongo-driver/v2/mongo)

* [perfectgentlemande/go-mongodb-crud-example](https://github.dev/perfectgentlemande/go-mongodb-crud-example)