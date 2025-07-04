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
	docker-compose exec mysql mysql -u admin -padmin

# ////////////////////
#		DB -- MongoDB
# ////////////////////
mongo-up:
	@docker compose up db-mongodb-dashboard
mongo-down:
	@docker compose down db-mongodb-dashboard
mongo-down-clean-up:
	@docker compose down -v db-mongodb-dashboard
