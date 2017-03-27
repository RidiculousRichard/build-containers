.PHONY: build rebuild clean

build :
	# Building
	mkdir -p images
	find dockerfiles/ -mindepth 1 -maxdepth 1 -type d | dockerfiles-build images

rebuild : clean build

clean :
	# Cleaning
	rm -fr images
	find dockerfiles/ -mindepth 1 -maxdepth 1 -type d | xargs basename | docker-clear-state
	docker-clear-state < additional-images-to-clear.list

