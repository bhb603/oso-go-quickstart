.PHONY: echo build push

IMAGE := bhb603/oso-go-quickstart
TAG := $(shell git describe --tag --long --always | tr + _ | tr [:upper:] [:lower:])

echo:
	@echo $(IMAGE):$(TAG)

build:
	docker build -t $(IMAGE):$(TAG) -t $(IMAGE):latest .

push:
	docker push $(IMAGE):$(TAG) && \
		docker push $(IMAGE):latest
