

clone-submodules:
	git submodule update --init --recursive

update-submodules:
	git submodule update --remote --merge
