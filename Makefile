AUTHOR=danielkelshaw
REPO=latex
IMAGE=$(AUTHOR)/$(REPO)

.PHONY: build_all
build_all: full basic

.PHONY: full
full: Dockerfile
	@docker build --build-arg scheme=full -t $(IMAGE):full .

.PHONY: basic
basic: Dockerfile
	@docker build --build-arg scheme=basic -t $(IMAGE):basic .

