.PHONY: run build stop tests

# ============================
#       Git
# ============================

clone-submodules:
	git submodule update --init --recursive

update-submodules:
	git submodule update --remote --merge

update-all:
	git submodule foreach git pull origin master

# ============================
#       Docker
# ============================

up-cache:
	@docker compose up cache
down-cache:
	@docker compose down cache
down-cache-clean-up:
	@docker compose down -v cache