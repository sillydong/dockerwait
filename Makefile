all: build publish
.PHONY: all

build:
	docker build -f Dockerfile . -t sillydong/wait:2.5.0

publish:
	docker push sillydong/wait:2.5.0
