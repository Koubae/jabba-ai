.PHONY: run build stop tests

# ============================
#       Git
# ============================

clone-submodules:
	git submodule update --init --recursive

update-submodules:
	git submodule update --remote --merge





# ============================
#       Docker
# ============================

up-cache:
	@docker compose up cache
down-cache:
	@docker compose down cache
