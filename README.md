jabba-ai
========

![jabba.jpg](docs/imgs/jabba.jpg)


Jabba is a Chat AI Bot | is called Jabba because in British English is pronounced the same as jabber and I found it funny :)

The Chat App is a very simple AI model train to chat by using [ollama](https://ollama.com/).
Both `openchat` | `neural-chat` are available but I found `neural-chat` faster and more suited to this project.

Check also **The [Architecture](./docs/architecture.md)**

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

Next open 4 terminals

#### 2) Run dependencies

This will start datatabases, see [Dependency containers](#dependency-containers)

```bash
make up
``` 

Wait a bit for the databases to be fully up


##### 2.b) Create MySQL database

```bash
# enter mysql db
make mysql-shell
```

Copy paste [chat-identity/schema.sql](./jabba-ai-chat-app/schema/chat-identity/schema.sql) and paste it in the terminal.

##### 2.c) Create MongoDB Indexes 

**in case you need go**

```bash
# 1. Remove any existing Go installation (optional but recommended)
sudo rm -rf /usr/local/go

# 2. Download Go 1.24.4 from the official website
wget https://go.dev/dl/go1.24.4.linux-amd64.tar.gz

# 3. Extract it to /usr/local
sudo tar -C /usr/local -xzf go1.24.4.linux-amd64.tar.gz

# 4. Add Go to your PATH
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
source ~/.bashrc

# 5. Verify installation
go version
```

```bash
cd jabba-ai-chat-app
make script-prepare-mongo-database
```

#### 3) Spin up bot

```bash
make up-bot
```

#### 4) Spin up Chat App services (which are 3 services)

```bash
make up-chat-up
```
#### 3) Spin up UI

```bash
make up-ui-up
```

Go to http://localhost:3000

Development
-----------

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