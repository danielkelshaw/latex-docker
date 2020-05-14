IMAGE=latex

.PHONY: basic
basic: Dockerfile.basic
	@docker build -f Dockerfile.basic -t $(IMAGE):basic .

.PHONY: ubuntu
ubuntu: Dockerfile.ubuntu
	@docker build -f Dockerfile.ubuntu -t $(IMAGE):ubuntu .

