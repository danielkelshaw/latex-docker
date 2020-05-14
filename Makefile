IMAGE=latex

.PHONY: build build_ubuntu build_basic

build: build_basic build_ubuntu

build_basic: Dockerfile.basic
	@docker build -f Dockerfile.basic -t $(IMAGE):basic

build_ubuntu: Dockerfile.ubuntu
	@docker build -f Dockerfile.ubuntu -t $(IMAGE):basic

