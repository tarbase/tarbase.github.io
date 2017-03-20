DOCKER_REGISTRY ?= tarbase
DOCKER_TAG ?= latest

all: build run

build:
	docker build -t $(DOCKER_REGISTRY)/tarbase-com:$(DOCKER_TAG) .

run:
	docker run -v $(shell pwd):/src	\
				-p 4000:4000 \
				-it $(DOCKER_REGISTRY)/tarbase-com:$(DOCKER_TAG)
