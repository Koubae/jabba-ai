.PHONY: run build stop tests

# ============================
#       Git
# ============================

clone-submodules:
	git submodule update --init --recursive

update-submodules:
	git submodule update --remote --merge --recursive

update-submodules-commit-and-push:
	git submodule update --remote --recursive && git add . && git commit -m "Update all submodules to latest commits" && git push

update-all:
	git submodule foreach git pull origin master

# ============================
#       Docker
# ============================

# ////////////////////
#	Ai-Bot
# ////////////////////
up-bot:
	@docker compose -f jabba-ai-bot/docker-compose.yml up

# ////////////////////
#	Chat-App
# ////////////////////
up-chat-up:
	@docker compose -f jabba-ai-chat-app/docker-compose.yml up

# ////////////////////
#	UI
# ////////////////////
up-ui-up:
	@docker compose -f jabba-ai-ui/docker-compose.yml up

up:
	@docker compose up
down:
	@docker compose down

# ////////////////////
#		Cache -- Redis
# ////////////////////
redis-up:
	@docker compose up cache
redis-down:
	@docker compose down cache
redis-down-clean-up:
	@docker compose down -v cache

# ////////////////////
#		DB -- MySQL
# ////////////////////
mysql-up:
	@docker compose up mysql
mysql-down:
	@docker compose down mysql
mysql-down-clean-up:
	@docker compose down -v mysql

mysql-shell:
	docker-compose exec mysql mysql -u root -padmin

# ////////////////////
#		DB -- MongoDB
# ////////////////////
mongo-up:
	@docker compose up db-mongodb-dashboard
mongo-down:
	@docker compose down db-mongodb-dashboard
mongo-down-clean-up:
	@docker compose down -v db-mongodb-dashboard
